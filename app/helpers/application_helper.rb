module ApplicationHelper
  def datetime_format(datetime)
    return '-' if datetime.blank? || datetime.eql?('-')
    datetime.strftime(DEFAULT_DATETIME_FORMAT)
  end
end
