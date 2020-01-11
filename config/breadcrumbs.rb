crumb :root do
  link "トップページ", root_path
end

# 動物ページ
crumb :animals_index do
  link "募集一覧", animals_path
end

# 詳細ページ
crumb :animal_show do
  link "詳細", animal_path(params[:id])
  parent :animals_index
end

# 検索結果ページ
crumb :animals_search do
  link "検索結果", search_animals_path
  parent :animals_index
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).