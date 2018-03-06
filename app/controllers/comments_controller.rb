class CommentsController < ApplicationController
before_action :set_comment, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  def index
  end

  def new
    @job = current_user.jobs.build
    @comment = @job.comments
  end

  def edit
  end

  def create
    @job = Job.find(params[:post_id])
    @comment = @jobs.comment.create(params[:comment].permit(:comment))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(job_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment)
    end

end
