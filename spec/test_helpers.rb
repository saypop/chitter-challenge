def wait_for_1_second
  sleep(1)
end

def create_peep
  Peep.create(post: 'dis a peep', timestamp: (Time.now))
end
