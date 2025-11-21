(define-fungible-token flocoin)

(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-BALANCE (err u101))

;; The contract deployer is treated as the owner/admin
(define-constant CONTRACT-OWNER tx-sender)

;; Public functions

(define-public (transfer (amount uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) ERR-NOT-AUTHORIZED)
    (ft-transfer? flocoin amount sender recipient)))

(define-public (mint (amount uint) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-NOT-AUTHORIZED)
    (ft-mint? flocoin amount recipient)))

(define-public (burn (amount uint) (owner principal))
  (begin
    (asserts! (is-eq tx-sender owner) ERR-NOT-AUTHORIZED)
    (ft-burn? flocoin amount owner)))

;; Read-only views

(define-read-only (get-total-supply)
  (ft-get-supply flocoin))

(define-read-only (get-balance (owner principal))
  (ft-get-balance flocoin owner))
