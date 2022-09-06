# frozen_string_literal: true

# A hash of expected output generated
module Output
	@eventsEnabled = true
	
	@eventsListeners = [ "jboss-logging" ]
	
	@enabledEventTypes = [ "SEND_RESET_PASSWORD", "UPDATE_CONSENT_ERROR", "GRANT_CONSENT", "VERIFY_PROFILE_ERROR",
                         "REMOVE_TOTP", "REVOKE_GRANT", "UPDATE_TOTP", "LOGIN_ERROR", "CLIENT_LOGIN",
                         "RESET_PASSWORD_ERROR", "IMPERSONATE_ERROR", "CODE_TO_TOKEN_ERROR", "CUSTOM_REQUIRED_ACTION",
                         "OAUTH2_DEVICE_CODE_TO_TOKEN_ERROR", "RESTART_AUTHENTICATION", "IMPERSONATE",
                         "UPDATE_PROFILE_ERROR", "LOGIN", "OAUTH2_DEVICE_VERIFY_USER_CODE", "UPDATE_PASSWORD_ERROR",
                         "CLIENT_INITIATED_ACCOUNT_LINKING", "TOKEN_EXCHANGE", "AUTHREQID_TO_TOKEN", "LOGOUT",
                         "REGISTER", "DELETE_ACCOUNT_ERROR", "CLIENT_REGISTER", "IDENTITY_PROVIDER_LINK_ACCOUNT",
                         "DELETE_ACCOUNT", "UPDATE_PASSWORD", "CLIENT_DELETE", "FEDERATED_IDENTITY_LINK_ERROR",
                         "IDENTITY_PROVIDER_FIRST_LOGIN", "CLIENT_DELETE_ERROR", "VERIFY_EMAIL", "CLIENT_LOGIN_ERROR",
                         "RESTART_AUTHENTICATION_ERROR", "EXECUTE_ACTIONS", "REMOVE_FEDERATED_IDENTITY_ERROR",
                         "TOKEN_EXCHANGE_ERROR", "PERMISSION_TOKEN", "SEND_IDENTITY_PROVIDER_LINK_ERROR",
                         "EXECUTE_ACTION_TOKEN_ERROR", "SEND_VERIFY_EMAIL", "OAUTH2_DEVICE_AUTH",
                         "EXECUTE_ACTIONS_ERROR", "REMOVE_FEDERATED_IDENTITY", "OAUTH2_DEVICE_CODE_TO_TOKEN",
                         "IDENTITY_PROVIDER_POST_LOGIN", "IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR",
                         "OAUTH2_DEVICE_VERIFY_USER_CODE_ERROR", "UPDATE_EMAIL", "REGISTER_ERROR", "REVOKE_GRANT_ERROR",
                         "EXECUTE_ACTION_TOKEN", "LOGOUT_ERROR", "UPDATE_EMAIL_ERROR", "CLIENT_UPDATE_ERROR",
                         "AUTHREQID_TO_TOKEN_ERROR", "UPDATE_PROFILE", "CLIENT_REGISTER_ERROR",
                         "FEDERATED_IDENTITY_LINK", "SEND_IDENTITY_PROVIDER_LINK", "SEND_VERIFY_EMAIL_ERROR",
                         "RESET_PASSWORD", "CLIENT_INITIATED_ACCOUNT_LINKING_ERROR", "OAUTH2_DEVICE_AUTH_ERROR",
                         "UPDATE_CONSENT", "REMOVE_TOTP_ERROR", "VERIFY_EMAIL_ERROR", "SEND_RESET_PASSWORD_ERROR",
                         "CLIENT_UPDATE", "CUSTOM_REQUIRED_ACTION_ERROR", "IDENTITY_PROVIDER_POST_LOGIN_ERROR",
                         "UPDATE_TOTP_ERROR", "CODE_TO_TOKEN", "VERIFY_PROFILE", "GRANT_CONSENT_ERROR",
                         "IDENTITY_PROVIDER_FIRST_LOGIN_ERROR" ]
	
	@adminEventsEnabled = true
	
	@adminEventsDetailsEnabled = true
	
  def self.eventsEnabled
	  @eventsEnabled
  end
	
  def self.eventsListeners
	  @eventsListeners
  end
	
	def self.enabledEventTypes
		@enabledEventTypes
	end
	
	def self.adminEventsEnabled
		@adminEventsEnabled
	end
	
	def self.adminEventsDetailsEnabled
		@adminEventsDetailsEnabled
	end
end
