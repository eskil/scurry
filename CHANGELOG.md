# Changelog

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
