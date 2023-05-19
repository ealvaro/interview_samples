require 'redis'
redis = Redis.new(host: "localhost")

# String type
redis.set("a", 1)
redis.set("ab", 2)
redis.set("abc", 3)
redis.get("abc")
#3

# ZSet type
redis.zadd("popular_fruit", 10, "apple")
redis.zadd("popular_fruit", 20, "banana")
redis.zadd("popular_fruit", 30, "orange")
redis.zrevrange("popular_fruit", 0, -1)
#1) "orange"
#2) "banana"
#3) "apple"

# List type
redis.lpush("my_list", "one")
redis.lpush("my_list", "two")
redis.lpush("my_list", "three")
redis.lpush("my_list", "four")
redis.lrange("my_list", 0, 100)
#1) "four"
#2) "three"
#3) "two"
#4) "one"

# Hash type
redis.hset("my_hash", "key_1", "value_1")
redis.hset("my_hash", "key_4", "value_4")
redis.hmset("my_hash", "key_3", "value_3", "key_2", "value_2")
redis.hkeys("my_hash")
#1) "key_1"
#2) "key_4"
#3) "key_3"
#4) "key_2"
redis.hvals("my_hash")
#1) "value_1"
#2) "value_4"
#3) "value_3"
#4) "value_2"
redis.hmget("my_hash", "key_1", "key_4")
#1) "value_1"
#2) "value_4"

