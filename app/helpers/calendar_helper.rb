module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  # custom options for this calendar
  def event_calendar_options
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :event_height=>100
    }
  end

  def event_calendar
    calendar event_calendar_options do |args|
      event = args[:event]
      if event.course.is_private?
        if current_user.has_role? :admin 
          stuff=%(<p><a href="/courses/#{event.course.id}" title="#{h(event.course.name)}">(PRIVATE) #{h(event.course.name)}</a></p>)
        else
          stuff=%(<p>Private meeting</p>)
        end
      else
        stuff=%(<p><a href="/courses/#{event.course.id}" title="#{h(event.course.name)}">#{h(event.course.name)}</a></p>)
      end
      stuff=stuff+%(<small>#{h(event.location.name)}</small><br /><small>#{h(event.course_session_start.strftime("%l:%M%p"))}-#{h(event.course_session_end.strftime("%l:%M%p"))}</small>)
      stuff
      end
  end
end
