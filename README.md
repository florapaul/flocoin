# flocoin

A simple fungible token smart contract (`flocoin`) implemented in [Clarity](https://docs.hiro.so/clarity) and managed with [Clarinet](https://docs.hiro.so/clarinet).

## Project layout

- Root repo: high-level metadata (LICENSE, this README)
- Clarinet project: `flocoin-clarinet/`
  - `Clarinet.toml` – Clarinet configuration
  - `contracts/flocoin.clar` – flocoin fungible token contract
  - `tests/flocoin.test.ts` – placeholder for unit tests

## Prerequisites

- Node.js and npm (for running tests, optional at this stage)
- Clarinet (already installed; check with `clarinet --version`)

## Getting started

From the repository root:

```bash
cd flocoin-clarinet
clarinet check
```

This will parse and type-check all contracts under `contracts/`.

## flocoin contract

The `flocoin` contract defines a basic fungible token with:

- `mint` – mint new tokens (restricted to the contract deployer)
- `transfer` – transfer tokens between principals
- `burn` – burn tokens from the caller’s balance
- `get-total-supply` – read-only view returning the total supply
- `get-balance` – read-only view returning an account’s balance

### Security model

- Only the contract deployer (the transaction sender at deployment time) is allowed to call `mint`.
- `transfer` requires that `tx-sender` matches the `sender` argument.
- `burn` requires that `tx-sender` matches the `owner` argument.

## Running tests (optional)

Inside `flocoin-clarinet/`:

```bash
npm install
npm test
```

Tests live under `tests/` and are written in TypeScript using the Clarinet JS testing tools.
