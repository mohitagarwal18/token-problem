namespace :token_life_cycle do
    desc "Start LIFE CYCLE OF TOKEN"
    task start: :environment do
        TokenPool.where("last_access < ?",5.minutes.ago).destroy_all
        TokenPool.where("last_access < ?",1.minutes.ago).update_all(is_locked: false)

    end
  end
