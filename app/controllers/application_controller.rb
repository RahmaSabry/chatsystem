class ApplicationController < ActionController::API

    private
    
    def authenticate_request
        @current_application ||= Application.where(authentication_token:http_auth_header).first

        render json: { error: 'Not Authorized' }, status: 401 unless @current_application
    end

    def http_auth_header
        request.headers["Authorization"]
    end
   
end
