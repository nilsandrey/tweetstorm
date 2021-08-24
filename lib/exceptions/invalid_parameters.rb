module Exceptions
  class InvalidParameters < StandardError
    def message
      <<~DOC
       Please, specify only one string parameter between double quoted as in:
       
       > `tweetstormgenerator "Magna eros augue tellus leo. Nisl massa auctor..."`'

      DOC
    end
  end
end
