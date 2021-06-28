# frozen_string_literal: true

class ApplicationService

  def self.get_applications(user)
    case user.role
    when 'admin'
      Application.all
    when 'professional'
      Professional.find(Session.user.id).applications
    else
      { error: 'Role not supported' }
    end
  end

  def self.belongs_to_professional?(application)
    application.user_id == Session.user.id
  end
end
