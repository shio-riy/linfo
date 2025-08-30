class LinksController < ApplicationController

 before_action :authenticate_user!, only: [:new, :create]

  def index
     @links = Link.all
    if params[:search] == nil
        @links = Link.all
      elsif params[:search] == ''
       @links = Link.all
      else
        #部分検索
        @links = Link.where("title LIKE ? ",'%' + params[:search] + '%')
        @links = Link.where("memo LIKE ? ",'%' + params[:search] + '%')
    end

    if params[:tag_ids] 
      @links = [] 
      params[:tag_ids].each do |key, value| 
        if value == "1" 
         tag_links = Tag.find_by(tname: key).links 
         @links = @links.empty? ? tag_links : @links & tag_links 
        end 
      end 
    end

   if params[:tag]
     Tag.create(tname: params[:tag]) 
   end 
  end 


  def new
    @link = Link.new
  end

  def create
    link = Link.new(link_params)
    if link.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      redirect_to :action => "show", :id => link.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to action: :index
  end

  private
  def link_params
    params.require(:link).permit(:folder_id, :url, :title, :memo)
  end

end