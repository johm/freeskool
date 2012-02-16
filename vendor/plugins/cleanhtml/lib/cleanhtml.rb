# Cleanhtml
require 'sanitize'

module CleanUpHtml
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def clean_up_html(field_names = [:description])
      before_save {|r| r.sanitize_html(field_names)}
    end
  end

  module InstanceMethods
    
    def sanitize_html(field_names)
      field_names.each do |x|
        write_attribute(x,Sanitize.clean(send(x),Sanitize::Config::BASIC))
      end  
    end
  end
end

ActiveRecord::Base.send :include, CleanUpHtml
