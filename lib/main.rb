require 'exceptions/invalid_parameters'
require 'exceptions/empty_parameters'
require 'twitter_client/storm'

##
# Used as a simple entry point to the CLI app.
class Main
  attr_reader :output, :parameters

  def initialize(output)
    @output = output
  end

  def run
    read_parameter
    storm = TwitterClient::Storm.new
    storm.content = parameters[0]
    output.puts(storm.to_s)
  rescue StandardError => e
    output.puts("ERROR: #{e.message}")
  end

  private

  attr_reader :output

  ##
  # TODO: This should be replaced by refactoring all this part with rails/thor.
  def read_parameter
    @parameters = []
    ARGV.each { |option| parameters.push(option) }
    raise Exceptions::InvalidParameters if parameters.length > 1
    raise Exceptions::EmptyParameters if parameters.length.zero?
  end
end
