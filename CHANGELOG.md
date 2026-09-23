# Changelog

## 3.1.0 - 2026-09-23

- Add a `Geo.merge_polygons/2` to merge polygons that share vertices. This function may change signature and behaviour to allow other kinds of merging, eg. based on polygon unions.

## 3.0.2 - 2026-07-26

- Fix OTP 27 warning
- Fix dialyzer warnings
- Add dialyzer to CI/CD and other housekeeping
- Increase coverage

## 3.0.1 - 2025-03-31

- Fix dialyzer warnings

## 3.0.0 - 2025-03-31

- Change API of `Polygon.intersects?` to return boolean instead of intersection details. Callers should migrate by either checking boolean return or call `Polygon.intersects` instead. The latter has API similar to the v2 of `Polygon.intersects?`.
- Add typesepecs to all files.
- Improve exdoc documentation.

## 2.0.0 - 2023-03-16

- Change API of `PolygonMap.nearest_point` to take point (tuple) and not line.

## 1.0.1 - 2023-03-13

- Documentation fixes only to force hexdocs to link to the right doc.

## 1.0 -  2023-03-13

- Initial release
