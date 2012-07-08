
#"Date and Time","Date and Time","Short Course Description","Body","Title"

namespace :site_migration do 
  task :read => :environment do 
    FasterCSV.foreach("data.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto, :headers => true) do |row|
      c=Course.new(
                   :name => row[4],
                   :short_description => row[2],
                   :long_description => row[3]
                   )
      
      course_date_from=DateTime.parse(row[0])
      course_date_to=DateTime.parse(row[1])	
      
      c.is_approved=true
      c.created_at=course_date_from
      c.save!
      

      c.course_sessions << CourseSession.new(:course_session_start=>course_date_from,:course_session_end=>course_date_to)
 end
  end   	  
end
