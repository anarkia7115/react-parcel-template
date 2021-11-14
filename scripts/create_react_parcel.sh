set -e

yarn init --yes

yarn add react react-dom
yarn add -D parcel

mkdir src

cat << EOF > src/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>My Parcel App</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="index.tsx"></script>
  </body>
</html>
EOF

cat << EOF > src/index.tsx
import ReactDOM from "react-dom";
import { App } from "./App";

const app = document.getElementById("app");
ReactDOM.render(<App />, app);
EOF

cat << EOF > src/App.tsx
export function App() {
  return <h1>Hello world!</h1>;
}
EOF

# append to package.json
script_line1="\ \ \ \ \"dev\": \"parcel src/index.html\""
script_line="\ \ \"scripts\": \{ \n$script_line1\n\ \ \},"
sed -i "/license/a $script_line" package.json
