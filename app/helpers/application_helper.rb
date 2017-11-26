module ApplicationHelper
  def page_title(*parts)
    unless parts.empty?
      content_for :custom_page_title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end
