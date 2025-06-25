;; Allocation Management Contract v1
;; Manages space allocation and assignments

(define-constant ERR_UNAUTHORIZED (err u400))
(define-constant ERR_SPACE_UNAVAILABLE (err u401))
(define-constant ERR_ALLOCATION_NOT_FOUND (err u402))
(define-constant ERR_INSUFFICIENT_CAPACITY (err u403))

;; Data variables
(define-data-var next-allocation-id uint u1)

;; Data maps
(define-map allocations uint {
    space-id: uint,
    tenant: principal,
    allocated-capacity: uint,
    start-date: uint,
    end-date: uint,
    status: (string-ascii 20)
})

(define-map space-allocations uint (list 50 uint))

;; Read-only functions
(define-read-only (get-allocation (allocation-id uint))
    (map-get? allocations allocation-id)
)

(define-read-only (get-space-allocations (space-id uint))
    (default-to (list) (map-get? space-allocations space-id))
)

(define-read-only (get-allocated-capacity (space-id uint))
    (fold calculate-total-allocation (get-space-allocations space-id) u0)
)

;; Public functions
(define-public (allocate-space
    (space-id uint)
    (tenant principal)
    (capacity uint)
    (duration uint))
    (let ((allocation-id (var-get next-allocation-id))
          (current-allocations (get-space-allocations space-id)))
        (asserts! (>= (- u100 (get-allocated-capacity space-id)) capacity) ERR_INSUFFICIENT_CAPACITY)
        (map-set allocations allocation-id {
            space-id: space-id,
            tenant: tenant,
            allocated-capacity: capacity,
            start-date: block-height,
            end-date: (+ block-height duration),
            status: "active"
        })
        (map-set space-allocations space-id
            (unwrap-panic (as-max-len? (append current-allocations allocation-id) u50)))
        (var-set next-allocation-id (+ allocation-id u1))
        (ok allocation-id)
    )
)

(define-public (release-allocation (allocation-id uint))
    (match (map-get? allocations allocation-id)
        allocation (begin
            (asserts! (is-eq (get tenant allocation) tx-sender) ERR_UNAUTHORIZED)
            (map-set allocations allocation-id (merge allocation {status: "released"}))
            (ok true)
        )
        ERR_ALLOCATION_NOT_FOUND
    )
)

;; Private functions
(define-private (calculate-total-allocation (allocation-id uint) (total uint))
    (match (map-get? allocations allocation-id)
        allocation (if (is-eq (get status allocation) "active")
            (+ total (get allocated-capacity allocation))
            total)
        total
    )
)
