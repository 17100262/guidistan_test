class ForumController < ApplicationController
    def index
        @disciplines = Discipline.all
    end
end
