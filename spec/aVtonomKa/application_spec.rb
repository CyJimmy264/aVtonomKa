require 'spec_helper'

describe AVtonomKa::Application do
  describe "#run" do
    context "with no arguments given to the application" do
      it "should print usage page to stdout" do
        usage_page = File.read('pages/usage.txt')
        expect { AVtonomKa::Application.new.run }.to output(usage_page).to_stdout
      end
    end
  end
end
