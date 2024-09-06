import { IRevenue } from './../types/index';
import { model, Schema } from "mongoose"



const revenueSchema: Schema = new Schema({
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
})

export default model<IRevenue>("Revenue", revenueSchema)