# require File.expand_path('../../../config/environment', __FILE__)
require 'sequel'


class RobotWorldApp < Sinatra::Base

  get "/" do
    erb :template, :layouts => false do
      erb :dashboard
    end
  end

  get "/robots" do
    @robots = robot_repo.all
    erb :template, :layouts => false do
      erb :all
    end
  end

  get "/robots/new" do
    erb :template, :layouts => false do
      erb :new
    end
  end

  post "/robots/new" do
    robot_repo.create(params['robot'])
    redirect :robots
  end

  get "/robots/:id" do |id|
    @robot = robot_repo.find(id.to_i)
    erb :template, :layouts => false do
      erb :show
    end
  end

  get "/robots/:id/edit" do |id|
    @robot = robot_repo.find(id.to_i)
    erb :template, :layouts => false do
      erb :edit
    end
  end

  put "/robots/:id/edit" do |id|
    robot_repo.update(id.to_i, params['robot'])
    redirect "robots/#{id}"
  end

  delete "/robots/:id" do |id|
    robot_repo.delete(id.to_i)
    redirect :robots
  end

end


def robot_repo
  if ENV['RACK_ENV'] == 'test'
    @robot_repo ||= RobotRepository.new(Sequel.sqlite("db/robot_world_test.sqlite3"))
  else
    @robot_repo ||= RobotRepository.new(Sequel.sqlite("db/robot_world_dev.sqlite3"))
  end
end
