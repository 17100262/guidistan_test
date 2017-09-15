class HomeController < ApplicationController
    def index
        @meta_title = meta_title 'Browse Information for all universities of Pakistan'
        @meta_description = "Browse Information for all universities of Pakistan"
    end
end
