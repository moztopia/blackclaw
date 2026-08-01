import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { statusApi } from "./api/statusApi";
import "./styles.css";

const root = document.getElementById("root");

if (!root) {
  throw new Error("The root element is missing from index.html");
}

ReactDOM.createRoot(root).render(
  <React.StrictMode>
    <App statusApi={statusApi} />
  </React.StrictMode>,
);
