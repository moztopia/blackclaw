# EQ2 upstream snapshots

These files are deterministic observations of the live `eq2` namespace. Collection counts
and capture timestamps are retained for provenance but ignored by structural drift checks.
Observed schemas are sample-based and require human review before contract changes.

Capture with `make snapshot-eq2`; check collection and observed-schema drift with
`make snapshot-eq2-check`. Set `CENSUS_SERVICE_ID` to use a registered service ID without
committing it.
