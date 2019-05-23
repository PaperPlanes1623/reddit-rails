class SubsController < ApplicationController
#M -> all logic on the table or record, restraints, associations
#V -> user interaction, logic at minimum
#C /routes -> directs traffic, actions

#CRUD       HTTP VERBS
#Create --> POST
#Read --> GET
#Update --> PATCH / PUT
#Destroy --> DELETE

#All actions must return a response
  #HTML, JSON, XML, or redirect to another action that does it
#READ GET
  #user sees
  #show all records inside of the table
  #index action
    #@model_names = Model_name.all

  #single record - id
    #show action
      #@model_name = Model_name.find(params[:id])

  #new - show the new record form, create the record in memory
    #new action
      #@model_name = Model_name.new

  #edit - show the update form, id
    #edit action
      #@model_name = Model_name.find(params[:id])

#Create / POST
  #create a record, must have a new action/form
    #create action
      #@model_name = Model_name.new(model_name_params)
      #if @model_name.save
       #do something
      #else
       #render :new
      #end

#Update / PUT PATCH
  #edit or update a record, must have a edit action / form, id
    #update action
      #@model_name = Model_name.find(params[:id])
      #if @model_name.update(model_name_params)
        #do something
      #else
        #render :edit
      #end

  #Destroy / DELETE
    #delete a record, id
      #destroy action
        #Model_name.find(params[:id]).destroy

  #model_name_params
    #pass certain attr
      #private
       #def model_name_params
         #params.require(:model_name).permit(:attr, :everything the table has, :columns)
       #end

  #CALLBACKS
    #perform logic at a event /action
    #before_action
    #after_action
    #skip_before_action
    #skip_after_action
   
    #before_action :method_to_call, only: [:index, :show]

  #partials are common views page

  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def index
    #render index.html.erb by default
    @subs = Sub.all
  end

  def show
    # @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    #relative to the layouts folder
    render partial: 'form'
    # will no longer render new.html.erb, will render form
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    # @sub = Sub.find(params[:id])
    render partial: 'form'
    #will no longer render edit.html.erb, will render form
  end

  def update
    # @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    # Sub.find(params[:id]).destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

  def set_sub
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:name)
  end

end
