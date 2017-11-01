json.array! @issues do |issue|
  date_format = issue.all_day_issue? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id issue.id
  json.title issue.title
  json.start issue.start.strftime(date_format)
  json.end issue.end.strftime(date_format)
  json.color issue.color unless issue.color.blank?
  json.allDay issue.all_day_issue? ? true : false
  json.update_url issue_path(issue, method: :patch)
  json.edit_url edit_issue_path(issue)
end
