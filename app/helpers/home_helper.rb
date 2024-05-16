module HomeHelper
  def format_date date
    time_object = Time.parse(date)
    time_object.strftime("%B %d, %Y")
  end
end
