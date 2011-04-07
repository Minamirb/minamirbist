module ApplicationHelper
  # ページタイトルを取得します
  # デフォルトではcontroller名からmodel名を推測します
  def page_title(controller = controller_name, action = action_name)
    I18n.t("titles.#{action}",
      :title => modelize(controller).try(:model_name).try(:human))
  end

  # カラム名称を取得します
  # modelクラスを省略した場合はcontroller_nameからmodelクラスを推測します
  def column_attr(column_name, model = nil)
    model_clazz = modelize(model)
    if model_clazz.respond_to?(:human_attribute_name)
      model_clazz.human_attribute_name column_name
    end
  end

  private
  # model名からmodelクラスを取得します
  def modelize(model_name)
    model_clazz = case model_name
    when String, Symbol
      model_name.to_s.classify.constantize if defined?(model_name.to_s.classify.constantize.class)
    when ActiveRecord::Base
      model_name.class
    when Class
      model_name
    else
      modelize controller_name
    end

    model_clazz if model_clazz.ancestors.include?(ActiveRecord::Base)
  end
end
