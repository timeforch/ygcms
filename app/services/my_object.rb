class MyObject
  def method_missing(name, *args)
    if name[-1] == '='
      nam = name.to_s[0...-1]
      if instance_variables.map{|x|x.to_s}.include? "@#{nam.to_s}"
        raise "undefined method `#{name}' for #<#{self.class}:#{self.object_id}>"
      else
        instance_variable_set("@#{nam}", args[0])
      end
    else
      if instance_variables.map{|x|x.to_s}.include? "@#{name.to_s}"
        instance_variable_get("@#{name}".to_s)
      else
        raise "undefined method `#{name}' for #<#{self.class}:#{self.object_id}>"
      end
    end
  end
end