ActiveAdmin.register Message do

  # Pour CanCan
  # controller.load_and_authorize_resource # Ne fonctionne pas pour index
  controller.authorize_resource
end
