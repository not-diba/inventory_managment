# frozen_string_literal: true

class Permission
  def initialize(administrator)
    allow :sessions, %i[new create destroy]
    allow :departments, %i[index]
    allow :labs, %i[index create]
    allow :equipment, %i[index create]
    allow :components, %i[index create]
    allow :items, %i[index create]
    allow :departments_table, %i[index]
    allow :rooms, %i[index new create]
    allow :units, %i[index new create edit update show destroy]

    if administrator && administrator.role_id == 3 # super administrator 
      allow_all
    elsif administrator && administrator.role_id == 4 # technologist

      allow :departments, %i[show new create edit update] do |department|
        department.id.to_s == administrator.department_id.to_s
      end

      allow :labs, %i[show new edit update destroy] do |lab|
        lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :assign, %i[show] do |lab|
        lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :rooms, %i[show edit update destroy] do |room|
        room.department_id.to_s == administrator.department_id.to_s
      end

      allow :equipment, %i[new update edit show destroy] do |equipment|
        equipment.lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :components, %i[new update edit show destroy] do |component|
        component.lab.department_id.to_s == administrator.department_id.to_s
      end

      allow :items, %i[new update edit show destroy] do |item|
        item.lab.department_id.to_s == administrator.department_id.to_s
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
