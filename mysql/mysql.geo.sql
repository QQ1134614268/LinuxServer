#     `longitude` double(50, 6) NOT NULL COMMENT '经度',
#     `latitude`  double(50, 6) NOT NULL COMMENT '纬度',
create table test_geo
(
    ID    int auto_increment primary key,
    NAME  varchar(64),
    SHAPE geometry
);
INSERT INTO test_geo
VALUES (1, 'A1', POINT(100, 30)),
       (2, 'A2', ST_GeomFromText('POINT(100.01, 31.01)'));

SELECT st_distance_sphere(POINT(100, 30), SHAPE) AS distance FROM test_geo;

SELECT st_distance_sphere(POINT(100, 30), POINT(100, 30));
