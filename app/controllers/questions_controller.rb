class QuestionsController < ApplicationController
    before_action :find_question, only: [:edit,:update,:show, :destroy]
    def new
        @question=Question.new
    end
    def create
        @question = Question.new question_params
        if @question.save # perform validation and if succesful it will save indb
            flash[:notice] = 'Question Created Successfully'
            redirect_to question_path(@question.id)
        else
            render :new
        end
    end
    def edit
        
    end
    def update
        
        if @question.update question_params
            flash[:notice] = 'Question updated Successfully'
            redirect_to question_path(@question.id)
        else
            render :edit
        end
    end
    def index 
        @questions=Question.all
    end
    def show
        # @question.view_count += 1
    # @question.save

    # The method `update_columns` works just like `update`. However,
    # it will skip validations, skip callbacks and not update `updated_at`.
    # Unless, you have a very good reason to use this DO NOT USE IT.

    @question.update_columns(view_count: @question.view_count + 1)
    end
    def destroy
        
        @question.destroy
        redirect_to questions_path
    end
    private
    def find_question
        @question=Question.find params[:id]
    end
    def question_params
        # Use the `require` on the params object to retrieve
    # the nested hash of a key usually corresponding the name-value
    # pairs of a form.

    # Then, use `permit` to specify all input names that are allowed
    # as symbols.
        params.require(:question).permit(:title, :body)
    end

end
