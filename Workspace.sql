-- Package Specification
CREATE OR REPLACE PACKAGE metric_pkg IS
  cup_to_liter CONSTANT NUMBER := .24;
  pint_to_liter CONSTANT NUMBER := .47;
  qrt_to_liter CONSTANT NUMBER := .95;
END;

