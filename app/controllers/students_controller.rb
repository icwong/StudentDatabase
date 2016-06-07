class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy,]
  def index
  	@students = Student.all.order("created_at DESC") #New post is added to the top
  end

  def new
  	@student = Student.new
  end

  def create
  	@student = Student.new(post_params)
  	if @student.save
  		redirect_to @student
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def destroy
  	@student.destroy
  	redirect_to :action => :index
  end

  def update
  	@student = Student.find(params[:id])
  	if @student.update(post_params)
  		redirect_to @student
  	else
  		render 'edit'
  	end
  end

  private

  def find_student
  	@student = Student.find(params[:id])
  end

  def post_params
  	params.require(:student).permit(:Name, :Height, :Weight, :Color, :GPA)
  end
end