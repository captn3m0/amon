require 'google'
require 'gmail'

class GoogleController < ApplicationController

  before_action :set_token
  before_action :set_gmail, only: [:gmail, :gmail_thread]

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

  private

  def set_gmail
    @gmail = Gmail.new @token.token
  end

  def set_token
    @token = Token.find(params['id'])
    @google = Google.new @token
  end

end