# class ApplicationController < ActionController::Base
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception
#   before_action :authenticate_user
#
#   private
#
#     def authenticate_user
#       redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT']}&scope=repo" if !logged_in?
#     end
#
#     def logged_in?
#       !!session[:token]
#     end
# end


class RepositoriesController < ApplicationController
  def index
    gh = GithubService.new({"access_token" => session[:token]})
    @repos_array = gh.get_repos
  end

  def create
    gh = GithubService.new({"access_token" => session[:token]})
    gh.create_repo(params[:name])
    redirect_to '/'
  end
end
