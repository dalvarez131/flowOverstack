class SearchController < ApplicationController
  def search
  	@keyword = params[:keyword]
  	@result = Question.where("title LIKE ? OR description LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
  end
end
