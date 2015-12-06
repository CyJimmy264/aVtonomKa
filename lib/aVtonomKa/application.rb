module AVtonomKa
  class Application
    def initialize

    end

    def run
      usage_page = <<-PAGE
aVtonomKa - Command line utility to manage data at VK social network.
Usage:  avtonomka [--version] [--help]
        <command> [<args>]
PAGE
      print usage_page
    end
  end
end
