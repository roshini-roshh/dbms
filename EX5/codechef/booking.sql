SELECT customer_id,
COUNT(booking_id) AS total_bookings
FROM CabBookings
GROUP BY customer_id
ORDER BY total_bookings DESC;
