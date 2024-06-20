PL/SQL TRIGGERS:

1) Trigger to update driver rating: 

CREATE OR REPLACE TRIGGER UPDATE_DRIVER_RATING
AFTER INSERT  ON FEEDBACK
FOR EACH ROW
WHEN (NEW.Message like '%Bad Driver%' )
DECLARE
  v_driver_id INT;
BEGIN
  select driver_id into v_driver_id from TRIP_DETAILS where trip_id = :NEW.Trip_id;
  update DRIVER set Rating = Rating -1 where   driver_id = v_driver_id;
END;
/
