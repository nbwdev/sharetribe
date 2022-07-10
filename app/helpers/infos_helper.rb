module InfosHelper

  # Class is selected if conversation type is currently selected
  def get_infos_tab_class(tab_name)
    current_tab_name = action_name || "about"
    "inbox_tab_#{current_tab_name.eql?(tab_name) ? 'selected' : 'unselected'}"
  end

  # Pages and last update for the sitemap
  def self.get_infos_pages_for_sitemap(community)
    [
      { :path => about_infos_path, :modified => Date(2022,3,31)},
      { :path => how_to_use_infos_path, :modified => Date(2022,3,31)},
      { :path => privacy_infos_path, :modified => Date(2022,3,31)},
      { :path => terms_infos_path, :modified => Date(2022,3,31)},
      { :path => cookie_policy_infos_path, :modified => Date(2022,3,31)},
      { :path => code_of_conduct_infos_path, :modified => Date(2022,3,31)},
    ]
  end

end
