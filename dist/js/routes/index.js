"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const revenue_1 = require("../controllers/revenue");
const router = (0, express_1.Router)();
router.get("/revenue", revenue_1.generateRevenue);
exports.default = router;
