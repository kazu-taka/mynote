class NotesController < ApplicationController
  before_action :authenticate_user!
  def index
    @note = Note.new
    #昇順だったら :asc
    @notes = Note.new_order.page(params[:page])
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path, notice: "メモを登録しました"
    else
      render :index
    end
  end
  
  def edit
    @note = Note.find(params[:id])
    @notes = Note.new_order
    render action: :index
  end
  
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path, notice: "メモを更新しました"
    else
      render :index
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, notice: "メモを削除しました"
  end
  
  private
  
  def note_params
    # ストロングパラメータはフォームで入力した内容を受け取る
    params.require(:note).permit(:title, :body, :user_id)
  end
end
