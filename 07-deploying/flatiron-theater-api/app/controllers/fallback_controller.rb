class FallbackController < ApplicationController

    # Add Index Action
    def index
        render file: 'public/index.html'
    end
end
