"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateRevenue = void 0;
const revenueService_1 = require("../../services/revenueService");
const revenueService = new revenueService_1.RevenueService();
const generateRevenue = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const revenueVector = revenueService.generateVector(365, 0, 5000); // Número de dias, mínimo a gerar, máximo a gerar
        const result = revenueService.calculateRevenueStats(revenueVector);
        res.status(200).json(result);
    }
    catch (error) {
        res.status(500).json({ message: 'An error occurred while generating revenue data.' });
    }
});
exports.generateRevenue = generateRevenue;
