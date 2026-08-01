import importlib.util
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).parents[1] / "scripts" / "census_snapshot.py"
SPEC = importlib.util.spec_from_file_location("census_snapshot", MODULE_PATH)
snapshot = importlib.util.module_from_spec(SPEC)
assert SPEC.loader
SPEC.loader.exec_module(snapshot)


class SnapshotTest(unittest.TestCase):
    def test_normalize_sorts_object_keys_recursively(self):
        self.assertEqual(
            snapshot.normalize({"z": {"b": 1, "a": 2}, "a": 0}),
            {"a": 0, "z": {"a": 2, "b": 1}},
        )

    def test_inference_preserves_conflicting_observed_types(self):
        value = snapshot.merge_observations(
            snapshot.observed_type({"level": 1}),
            snapshot.observed_type({"level": "unknown", "name": None}),
        )
        self.assertEqual(value["properties"]["level"]["types"], ["integer", "string"])
        self.assertEqual(value["properties"]["name"]["types"], ["null"])

    def test_dynamic_collection_envelope_is_extracted(self):
        response = {"character_list": [{"id": 1}], "returned": 1}
        self.assertEqual(snapshot.records_from_response("character", response), [{"id": 1}])


if __name__ == "__main__":
    unittest.main()
