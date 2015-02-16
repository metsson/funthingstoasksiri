class QuestionsController < ApplicationController
    before_filter :get_next_question, :check_seen
    after_filter :add_to_seen

    def index
        get_question_by_id
    end

    def question
        get_question_by_id
    end

private
    def get_next_question        
        @next = Question.offset(rand(Question.count)).first 
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

    # Add question to seen
    def add_to_seen
        session[:seen] << params[:id]
    end

    # Initialize or reset session
    def check_seen
        if session[:seen].nil? or session[:seen].size == Question.count
            session[:seen] = []
        end
    end
end