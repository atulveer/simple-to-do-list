class TodosController < ApplicationController
  # GET /todos
  # GET /todos.xml
  def index
      @todos = Todo.find :all, :order => 'created_at DESC' 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.xml
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.xml
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.js {
        render :update do  |page|
          page.replace 'new_todo_popup_holder', :partial => 'new_todo'
        end
        
      }
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.xml
  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
    
        
        format.html { redirect_to(@todo) }
        format.js {
          render :update do  |page|
            page.hide('new_todo_popup_holder') 
            page.insert_html :after ,'new_todo_holder', :partial => 'todo_row' , :locals => {:todo => @todo}
            page.visual_effect :highlight, "todo_#{@todo.id}" , :speed => '1500'
          end
        }
        format.xml  { render :xml => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => "new" }
         format.js {
            render :update do  |page|
              page.replace 'new_todo_popup_holder', :partial => 'new_todo'
            end

          }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.xml
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'Todo was successfully updated.'
        format.html { redirect_to(@todo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.xml
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(todos_url) }
      format.xml  { head :ok }
    end
  end
end
