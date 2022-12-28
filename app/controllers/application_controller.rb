class ApplicationController < ActionController::API
    #load error handler for global use
    include Error::ErrorHandler
end
