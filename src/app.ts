import cors from "cors";
import router from "./routes";
import express, { Express, Request, Response } from "express";

const app: Express = express();
const routers = router;

const PORT: string | number = process.env.PORT || 4000;

// Middlewares
app.use(cors());
app.use(express.json());

app.use('/api', routers);

app.listen(PORT, () =>
  console.log(`Working on http://localhost:${PORT}`)
);