class QuestionsController < ApplicationController
    before_filter :get_next_question

    def index
        get_question_by_id
    end

    def question
        get_question_by_id
    end

private
    def get_next_question        
        questions ||= Question.count
        @next = Question.offset(rand(questions)).first 
    end

    def get_question_by_id
        if params[:id]
            begin
                @question = Question.find(params[:id])
            rescue
                @question = Question.first
            end
        else
            @question = Question.first
        end            
    end
end