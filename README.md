# Postgres-useful-queues-for-LT
Postgres useful queues for Load Testing (v9.5)

**Here is a list:**
1. the most CPU usage queues.sql - you can see what queues use more CPU then others. Often the problem is bad/empty index.
2. the longest queues.sql - you can see what queues are the logest. Is doesn't include waiting because of locks!
3. locks.sql - you can see the state of lock any queues.
4. Table disk size including indexes.sql - disk size usage of every table including indexes
