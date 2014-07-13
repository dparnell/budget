# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def formatted_dollar_value(v)
    sprintf("%0.2f",v)
  end

  def dollar_value(v)
    if v<0
      style = "negative"
    else
      style = "positive"
    end

    raw("<span class=\"#{style}\">#{formatted_dollar_value(v)}</span>")
  end
end
