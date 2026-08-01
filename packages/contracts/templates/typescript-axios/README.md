# typescript-axios template overrides

`common.mustache` gives `createRequestFunction` an explicit public return type. Without it,
TypeScript declaration generation exposes Axios's inaccessible unique-symbol type and
fails with TS2527. Remove this override when the pinned generator emits a stable type.
