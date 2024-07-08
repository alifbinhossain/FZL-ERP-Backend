import { Router } from "express";
import { validateUuidParam } from "../../lib/validator.js";
import * as orderDescriptionOperations from "./query/order_description.js";
import * as orderEntryOperations from "./query/order_entry.js";
import * as orderInfoOperations from "./query/order_info.js";
import * as sfgOperations from "./query/sfg.js";
import * as sfgProductionOperations from "./query/sfg_production.js";
import * as sfgTransactionOperations from "./query/sfg_transaction.js";

const zipperRouter = Router();

// --------------------- ORDER ---------------------
// --------------------- ORDER INFO ROUTES ---------------------
zipperRouter.get("/order-info", orderInfoOperations.selectAll);
zipperRouter.get(
	"/order-info/:uuid",
	validateUuidParam(),
	orderInfoOperations.select
);
zipperRouter.post("/order-info", orderInfoOperations.insert);
zipperRouter.put("/order-info/:uuid", orderInfoOperations.update);
zipperRouter.delete(
	"/order-info/:uuid",
	validateUuidParam(),
	orderInfoOperations.remove
);

// --------------------- ORDER DESCRIPTION ROUTES ---------------------
zipperRouter.get("/order-description", orderDescriptionOperations.selectAll);
zipperRouter.get(
	"/order-description/:uuid",
	validateUuidParam(),
	orderDescriptionOperations.select
);
zipperRouter.post("/order-description", orderDescriptionOperations.insert);
zipperRouter.put("/order-description/:uuid", orderDescriptionOperations.update);
zipperRouter.delete(
	"/order-description/:uuid",
	validateUuidParam(),
	orderDescriptionOperations.remove
);

// --------------------- ORDER ENTRY ROUTES ---------------------
zipperRouter.get("/order-entry", orderEntryOperations.selectAll);
zipperRouter.get(
	"/order-entry/:uuid",
	validateUuidParam(),
	orderEntryOperations.select
);
zipperRouter.post("/order-entry", orderEntryOperations.insert);
zipperRouter.put("/order-entry/:uuid", orderEntryOperations.update);
zipperRouter.delete(
	"/order-entry/:uuid",
	validateUuidParam(),
	orderEntryOperations.remove
);

// --------------------- SFG ---------------------
// --------------------- SFG ROUTES ---------------------
zipperRouter.get("/sfg", sfgOperations.selectAll);
zipperRouter.get("/sfg/:uuid", validateUuidParam(), sfgOperations.select);
zipperRouter.post("/sfg", sfgOperations.insert);
zipperRouter.put("/sfg/:uuid", sfgOperations.update);
zipperRouter.delete("/sfg/:uuid", validateUuidParam(), sfgOperations.remove);

// --------------------- SFG PRODUCTION ROUTES ---------------------
zipperRouter.get("/sfg-production", sfgProductionOperations.selectAll);
zipperRouter.get(
	"/sfg_production/:uuid",
	validateUuidParam(),
	sfgProductionOperations.select
);
zipperRouter.post("/sfg-production", sfgProductionOperations.insert);
zipperRouter.put("/sfg-production/:uuid", sfgProductionOperations.update);
zipperRouter.delete(
	"/sfg-production/:uuid",
	validateUuidParam(),
	sfgProductionOperations.remove
);

// --------------------- SFG TRANSACTION ROUTES ---------------------
zipperRouter.get("/sfg-transaction", sfgTransactionOperations.selectAll);
zipperRouter.get(
	"/sfg-transaction/:uuid",
	validateUuidParam(),
	sfgTransactionOperations.select
);
zipperRouter.post("/sfg-transaction", sfgTransactionOperations.insert);
zipperRouter.put("/sfg-transaction/:uuid", sfgTransactionOperations.update);
zipperRouter.delete(
	"/sfg-transaction/:uuid",
	validateUuidParam(),
	sfgTransactionOperations.remove
);

export { zipperRouter };
