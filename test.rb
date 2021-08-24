$:<<'test'  # add to load path
$:<<'lib' 
files = Dir.glob('test/**/*.rb') 
files.each{|file| require file.gsub(/^test\/|.rb$/,'')}  