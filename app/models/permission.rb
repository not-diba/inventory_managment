# frozen_string_literal: true

class Permission
  def initialize(administrator)
    allow :sessions, %i[new create destroy]
    allow :departments, %i[index]
    allow :labs, %i[index]
    allow :equipment, %i[index]
    allow :departments_table, %i[index]
    allow :rooms, %i[index new create]

    if administrator && administrator.role_id == 3 # admin
      allow_all
    elsif administrator && administrator.role_id == 4 # technician

      allow :departments, %i[show new create edit update] do |department|
        department.id.to_s == administrator.department_id.to_s
      end

      allow :labs, %i[show new create edit update] do |lab|
        lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :rooms, %i[show edit update] do |room|
        room.department_id.to_s == administrator.department_id.to_s
      end

      allow :equipment, %i[new create update edit show destroy] do |equipment|
        equipment.lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :show_labs, %i[show] do |lab|
        lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :departments_table, %i[show] do |departments_table|
        departments_table.id.to_s == administrator.department_id.to_s
      end

      allow :administrators, %i[update edit show] do |admin|
        admin.id.to_s == administrator.id.to_s
      end

    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end
end
