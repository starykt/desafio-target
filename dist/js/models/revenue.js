"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const revenueSchema = new mongoose_1.Schema({
    maxRevenue: {
        type: Number,
        required: true,
    },
    daysAboveAverage: {
        type: Number,
        required: true,
    },
    minRevenue: {
        type: Number,
        required: true,
    },
    revenue: {
        type: Array,
        required: false,
    }
});
exports.default = (0, mongoose_1.model)("Revenue", revenueSchema);
