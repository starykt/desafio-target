import { Router } from "express"
import { generateRevenue } from "../controllers/revenue"

const router: Router = Router()

router.get("/revenue", generateRevenue);

export default router;