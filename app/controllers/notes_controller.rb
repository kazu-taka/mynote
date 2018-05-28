class NotesController < ApplicationController
  before_action :authenticate_user!
  def index
    @note = Note.new
    @notes = Note.all
  end
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path, notice: "メモを登録しました"
    else
      render :index
    end
  end
  
  private
  
  def note_params
    # ストロングパラメータはフォームで入力した内容を受け取る
    params.require(:note).permit(:title, :body, :user_id)
  end
end
