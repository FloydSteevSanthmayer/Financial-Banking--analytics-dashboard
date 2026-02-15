"""Helper utilities for data loading and validation (examples)."""
import pandas as pd

def load_sample(path):
    return pd.read_csv(path)
