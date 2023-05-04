# frozen_string_literal: true

class Permission < Struct.new(:administrator)
  def allow?(controller, action)
    return true if controller == 'sessions'
    if administrator && administrator.role_id == 3
      return true
    elsif administrator && administrator.role_id == 4
      return true if controller == 'departments' && action.in?(%w[index show])
      return true if controller == 'labs'
      return true if controller == 'equipment'
    else
        return false
    end
  end
end
