require 'active_support/concern'

module SafeDestroy
  extend ActiveSupport::Concern
  included do
    default_scope { where(deleted_at: nil) }
  end

  def destroy
    run_callbacks(:destroy) { delete }
  end

  def delete
    self.touch(:deleted_at)
  end

  module ClassMethods
    def with_deleted
      unscoped
    end
  end
end
