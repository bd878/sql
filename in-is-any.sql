SELECT count(*) FROM airports
  WHERE timezone IN
    ( 'Asia/Krasnoyarsk', 'Asia/Novokuznetsk' );

SELECT count(*) FROM airports
  WHERE timezone = ANY
    ( VALUES ( 'Asia/Krasnoyarsk' ),
             ( 'Asia/Novokuznetsk' )
    );
