
require 'bundler/setup'
Bundler.require

class MainApplication
  attr_accessor :user_data, :data_path

  def initialize(user_data, data_path)
    @user_data = user_data
    @data_path = data_path
  end
end