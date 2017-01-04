module ApplicationHelper
  def data_gov_link(options = {})
    link_to "https://catalog.data.gov/dataset/#{options[:value][0]}", "https://catalog.data.gov/dataset/#{options[:value][0]}"
  end
end
