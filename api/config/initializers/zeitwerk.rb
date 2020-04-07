class WithProtocolBufferInflector < Zeitwerk::Inflector
  def camelize(basename, abspath)
    if basename =~ /\A.*_pb$/
      basename.gsub("_pb", "").camelize
    else
      super
    end
  end
end

Rails.autoloaders.each do |autoloader|
  autoloader.inflector = WithProtocolBufferInflector.new
end
