module CacheHelper
    def recache_session_info
        Session.all.find_each do |session|
            session.update_cached_values
        end
    end
end
