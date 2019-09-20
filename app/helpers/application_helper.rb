module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
      end
  
      def logged_in?
        !!session[:user_id]
      end

      def current_user_accounts
        accounts = Account.all
        current_user.accounts
        
      end
end
