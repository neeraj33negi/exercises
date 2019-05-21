require 'time'
def sum_times(t1, t2)
  pattern = /^(2[0-3]|[01]?[0-9]):([0-5]?[0-9]):([0-5]?[0-9])$/
  if t1 =~ pattern && t2 =~ pattern
    t1 = Time.parse(t1)
    t2 = Time.parse(t2)
    outtime = ""
    t3 = (t1.hour + t2.hour)*3600 + (t1.min + t2.min)*60 + (t1.sec + t2.sec)
    days = t3 / (24 * 3600)
    outtime = "#{days}day & " if days > 0
    t3 = t3 % (24 * 3600)
    hours = t3 / 3600
    outtime += "#{hours}:"
    t3 = t3 % 3600
    mins = t3 / 60
    outtime += "#{mins}:"
    t3 =  t3 % 60
    secs = t3
    outtime += "#{secs}"
    return outtime
  else
    return "Invalid 24-hour time value"
  end
end

puts sum_times("00:45:34","0:15:58")
puts sum_times("11:23:07","22:53:45")
