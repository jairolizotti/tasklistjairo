class TasksController < ApplicationController  
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @tasks = Task.order("status DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end
 
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end
 
  def new
    @task = Task.new
    @authors = Author.all
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end
 
  def edit
    @task = Task.find(params[:id])
    @authors = Author.all
    @categories = Category.all
  end
 
  def create
    @task = Task.new(params[:task])
	
    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Tarefa criada com sucesso.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def update
    @task = Task.find(params[:id])
 
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Tarefa alterada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
end