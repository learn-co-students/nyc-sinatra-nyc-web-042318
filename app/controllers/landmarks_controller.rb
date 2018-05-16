class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.find_or_create_by(params[:landmark])
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end

end
