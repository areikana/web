class MemoryController < ApplicationController

    def index
        @dirly = Dirly.new
    end
end
