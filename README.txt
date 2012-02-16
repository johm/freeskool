A rails-based application for managing a "free school"---basically
booking a classroom in an open way and getting access to minimal
course support (mailing lists, per-session info).

For use at the Baltimore Free School: http://freeschool.redemmas.org

GOALS:

1) Easy to use and intuitive.  Should be able to schedule or signup for
a course either by creating an account first, or by simply entering an
email address when it's time to "check out".  Design of front end should
prominently indicate how to teach or take a course.

2) Needs too support private events, which appear on calendar to admins,
but with details hidden to learners.

3) Needs to support the automatic creation of a mailing list for each
course.

4) Needs to support a private space to share materials on a per course
basis.

5) Needs to support automatic generation of printable calendar and pdf
poster advertising a course.

6) Separate sessions of a multi-day course should be objects in
themselves, so that they can have a discussion thread attached to them,
and so that instructors can specify schedules/syllabi in such a way that
it is reflected on the calendar.

7) Should support ical export on a per-user basis according to signed up
courses.

8) Needs to allow instructors to easily indicate which days/times/rooms
they want for each session, and needs to calculate whether or not, for
each session, there's a conflict with previously scheduled classes.
  Requested instructor dates should be placed on hold pending admin
approval, and possibly expire if not approved after a certain period of
time.