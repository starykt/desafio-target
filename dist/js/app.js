"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const cors_1 = __importDefault(require("cors"));
const routes_1 = __importDefault(require("./routes"));
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const routers = routes_1.default;
const PORT = process.env.PORT || 4000;
// Middlewares
app.use((0, cors_1.default)());
app.use(express_1.default.json());
app.use('/api', routers);
app.listen(PORT, () => console.log(`Working on http://localhost:${PORT}`));
