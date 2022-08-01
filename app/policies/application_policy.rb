# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def update?
    edit?
  end

  def edit?
    current_user_can_edit?
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
