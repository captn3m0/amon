require 'google'
require 'gmail'

class GoogleController < ApplicationController

  before_action :set_token
  before_action :set_gmail, only: [:gmail, :gmail_thread, :gmail_message, :gmail_search]

  def index
    render 'index'
  end

  def gmail
    @threads = @gmail.threads.fetch['threads']
    render 'gmail_inbox'
  end

  def gmail_thread
    @messages = @gmail.thread(params['thread_id']).fetch['messages']
    #render json: @messages
    render 'gmail_thread'
  end

  def gmail_message
    @message = @gmail.message(params['message_id']).fetch
    render 'gmail_message'
  end

  def gmail_search
    @messages = @gmail.query(params['q']).fetch['messages']
    #render json: @messages
    render 'gmail_messages'
  end

  private

  def set_gmail
    @gmail = Gmail.new @token.token
  end

  def set_token
    @token = Token.find(params['id'])
    @google = Google.new @token
  end

end