module ApplicationHelper
  # ページタイトルを取得します
  # modelクラス名を省略した場合はcontroller名からmodelクラスを推測します
  def page_title(action = action_name, model = controller_name)
    I18n.t("titles.#{action}", :title => modelize(model).model_name.human)
  end

  # カラム名称を取得します
  # modelクラス名を省略した場合はcontroller名からmodelクラスを推測します
  def column_attr(column_name, model = controller_name)
    modelize(model).human_attribute_name column_name
  end

  private
  # model名からmodelクラスを取得します
  def modelize(model_name)
    model_name.to_s.classify.constantize
  end
end
