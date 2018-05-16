class FiguresController < ApplicationController

get '/figures' do
  @figures = Figure.all
  erb :'figures/index'
end

get '/figures/new' do
  erb :'figures/new'
end

get '/figures/:id' do
  @figure =Figure.find_by_id(params[:id])

  erb :'figures/show'
end

post '/figures' do
  @figure = Figure.find_or_create_by(name: params[:figure][:name])
  if params["figure"]["landmark_ids"]
    params["figure"]["landmark_ids"].each do |landmark_id|
      @figure.landmarks << Landmark.find(landmark_id)
    end
  end
  if !params["figure"]["landmark_ids"]
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  end
  if params["figure"]["title_ids"]
    params["figure"]["title_ids"].each do |title_id|
      @figure.titles << Title.find(title_id)
    end
  end
  if !params["figure"]["title_ids"]
    @title = Title.create(params[:title])
    @figure.titles << @title
  end
end

get '/figures/:id/edit' do
  @figure = Figure.find_by_id(params[:id])

  erb :'figures/edit'
end

post '/figures/:id' do
  @figure =Figure.find_by_id(params[:id])
  if @figure.name != params["figure"]["name"]
    @figure.update(name: params["figure"]["name"])
  end
  if params["figure"]["landmark_ids"]
    @landmark = Landmark.find(params["figure"]["landmark_ids"])
    if !@figure.landmarks.include?(@landmark)
      @figure.landmarks << @landmark
    end
  end
  if params["landmark"]
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  end
  if params["figure"]["title_ids"]
    @title = Title.find(params["figure"]["title_ids"])
    if !@figure.titles.include?(@title)
      @figure.titles << @title
    end
  end
  if params["title"]
    @title = Title.create(params[:title])
    @figure.titles << @title
  end

  # binding.pry

  redirect "/figures/#{@figure.id}"
end

end
