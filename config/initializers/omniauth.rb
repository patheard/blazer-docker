# Disable CSRF validation as this is handled by Google Sign-in
OmniAuth.config.before_request_phase = nil
OmniAuth.config.request_validation_phase = nil
