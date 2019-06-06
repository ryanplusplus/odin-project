class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    p params
    @tag = Tag.find(params[:id])
    @tag.taggings.each { |tagging| tagging.destroy }
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Deleted!"
    redirect_to Tag
  end
end
