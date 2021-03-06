class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # if !params[:title][:name].empty?
    #   @landmark.titles = Title.create(name: params[:title][:name])
    # end
    # @landmark.save
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(name: params[:figure][:name])
    end
    @landmark.save

    redirect to '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(name: params[:figure][:name])
    end
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end






end