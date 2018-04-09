class CommentsController < ApplicationController
  before_action :find_job
  before_action :find_comment, only: [:destroy, :edit, :update]

  def create
    @comment = @job.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to job_path(@job)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to job_path(@job)
  end

  def edit

  end

  def update
    if @comment.update(params[:comment].permit(:comment))
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end

  private

  def find_job
    @job = Job.find(params[:job_id])
  end

  def find_comment
    @comment = @job.comments.find(params[:id])
  end

end
