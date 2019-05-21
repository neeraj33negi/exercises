require 'time'
def sum_times(t1, t2)
  pattern = /^(2[0-3]|[01]?[0-9]):([0-5]?[0-9]):([0-5]?[0-9])$/
  if t1 =~ pattern && t2 =~ pattern
    t1 = Time.parse(t1)
    t2 = Time.parse(t2)
    outtime = ""
    t3 = (t1.hour + t2.hour) * 3600 + (t1.min + t2.min) * 60 + (t1.sec + t2.sec)
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

def generic_sum_times(*args)
  pattern = /^(2[0-3]|[01]?[0-9]):([0-5]?[0-9]):([0-5]?[0-9])$/
  args.each do |date|
    return "Invalid 24-hour time value" unless date =~ pattern
  end
  if args.length == 1
    return args[0]
  end
  outtime = ""
  args = args.map {|t| Time.parse(t)}
  total_hours = args.reduce(0) {|sum,curr| sum + curr.hour}
  total_mins = args.reduce(0) {|sum,curr| sum + curr.min}
  total_secs = args.reduce(0) {|sum,curr| sum + curr.sec}
  absolute_sec_sum = total_hours * 3600 + total_mins * 60 + total_secs
  total_days = absolute_sec_sum / (24 * 3600)
  days = total_days
  years = total_days / 365
  outtime = "#{years} year & " if years > 0
  total_days = total_days % 365
  months = total_days / 30
  outtime = "#{months} month & " if months > 0
  total_days = total_days % 30
  outtime = "#{total_days} day & " if total_days > 0
  remaining_secs = absolute_sec_sum - days * 24 * 3600
  hours = remaining_secs / 3600
  outtime += "#{hours}:"
  remaining_secs = remaining_secs % 3600
  mins = remaining_secs / 60
  outtime += "#{mins}:"
  remaining_secs =  remaining_secs % 60
  secs = remaining_secs
  outtime += "#{secs}"
  return outtime
end

puts generic_sum_times("00:45:34","0:15:58")
puts generic_sum_times("11:23:07","22:53:45")
puts generic_sum_times("12:45:2", "10:15:58")
