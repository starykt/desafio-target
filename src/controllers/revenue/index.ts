import { IRevenue } from "../../types"
import { Response, Request } from "express";
import { RevenueService } from "../../services/revenueService"

const revenueService = new RevenueService();

export const generateRevenue = async (req: Request, res: Response): Promise<void> => {
	try {
		const revenueVector = revenueService.generateVector(365, 0, 5000); // Número de dias, mínimo a gerar, máximo a gerar
		const result: IRevenue = revenueService.calculateRevenueStats(revenueVector);

		res.status(200).json(result);
	} catch (error) {
		res.status(500).json({ message: 'An error occurred while generating revenue data.' });
	}
}