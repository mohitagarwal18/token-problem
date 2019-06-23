class TokensController < ApplicationController
  def genrate_token
    token  =  TokenPool.create()
    if token.errors.messages.empty?
      respond_to do |format|
        format.json { render json: { message: "Token Create Successfully"}, status: 200 }
      end
    else
      respond_to do |format|
        format.json { render json: { message: "Token Creation Failed!"}, status: 500 }
      end
    end
    
  end
  def get_token
    token = TokenPool.find_by_is_locked(false) rescue nil
    if token
      token.update(is_locked: true, last_access: Time.now())
      respond_to do |format|
        format.json { render json: { token: token.token}, status: 200 }
      end
    else
      respond_to do |format|
        format.json { render json: { message: "No Free Token Available!"}, status: 404 }
      end
    end
  end
  def unlock_token
    token_to_free = params[:token]
    token = TokenPool.find_by_token(token_to_free) rescue nil
    if token
      token.update(is_locked: false)
      respond_to do |format|
        format.json { render json: { token: "token: #{token_to_free} unlocked successfully"}, status: 200 }
      end
    else
      respond_to do |format|
        format.json { render json: { message: "No Valid Token Found"}, status: 404 }
      end
    end
  end

  def delete_token
    token_to_delete = params[:token]
    token = TokenPool.find_by_token(token_to_delete) rescue nil
    if token
      token.destroy
      respond_to do |format|
        format.json { render json: { token: "token: #{token_to_delete} destroyed successfully"}, status: 200 }
      end
    else
      respond_to do |format|
        format.json { render json: { message: "No Valid Token Found"}, status: 404 }
      end
    end
  end
end
