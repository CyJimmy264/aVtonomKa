#Then(/^the stdout should contain the content of "([^"]*)"$/) do |file_name|
#  expect(stdout).to eq(File.read(file_name))
#end

Then(/^(?:the )?(output|stderr|stdout)(?: from "([^"]*)")? should( not)? contain( exactly)? the content of "([^"]*)"$/) do |channel, cmd, negated, exactly, file_name|
  matcher = case channel.to_sym
            when :output
              :have_output
            when :stderr
              :have_output_on_stderr
            when :stdout
              :have_output_on_stdout
            end

  commands = if cmd
               [aruba.command_monitor.find(Aruba.platform.detect_ruby(cmd))]
             else
               all_commands
             end

  output_string_matcher = if exactly
                            :an_output_string_being_eq
                          else
                            :an_output_string_including
                          end

  expected = File.read(file_name)

  if Aruba::VERSION < '1.0'
    combined_output = commands.map do |c|
      c.stop
      c.send(channel.to_sym).chomp
    end.join("\n")

    if negated
      expect(combined_output).not_to send(output_string_matcher, expected)
    else
      expect(combined_output).to send(output_string_matcher, expected)
    end
  else
    if negated
      expect(commands).not_to include_an_object send(matcher, send(output_string_matcher, expected))
    else
      expect(commands).to include_an_object send(matcher, send(output_string_matcher, expected))
    end
  end
end

