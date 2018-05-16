class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    # binding.pry
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @fig = Figure.find(params["id"])
    erb :"figures/show"

  end

  post '/figures' do
    # binding.pry

    @fig = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      @fig.titles << Title.create(params["title"])
    end
    if !params["landmark"]["name"].empty?
      @fig.landmarks << Landmark.create(params["landmark"])
    end

    redirect "/figures/#{@fig.id}"
  end

end




# allows you to view form to create a new figure (FAILED - 1)
# allows you to create a new figure with a title (FAILED - 2)
# allows you to create a new figure with a landmark (FAILED - 3)
# allows you to create a new figure with a new title (FAILED - 4)
# allows you to create a new figure with a new landmark (FAILED - 5)
# allows you to see a single Figure (FAILED - 6)
# allows you to view form to edit a single figure (FAILED - 7)
# allows you to edit a single figure (FAILED - 8)
