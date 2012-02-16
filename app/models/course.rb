class Course < ActiveRecord::Base
  attr_protected :is_approved
  clean_up_html [:short_description,:long_description]


end
