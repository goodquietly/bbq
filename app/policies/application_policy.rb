# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record, :cookies

  def initialize(user_context, record)
    @user = user_context.user
    @cookies = user_context.cookies
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def new?
    false
  end

  def create?
    true
  end

  def update?
    edit?
  end

  def edit?
    false
  end

  def destroy?
    current_user_can_edit?
  end

  private

  def current_user_can_edit?
    user.present? && (
      record.user == user ||
      (record.try(:event).present? && record.event.user == user)
    )
  end
end
