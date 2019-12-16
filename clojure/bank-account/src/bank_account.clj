(ns bank-account)

(defn open-account []
  (atom 0))

(defn close-account [a]
  (reset! a nil))

(defn get-balance [a]
  (deref a))

(defn update-balance [a n]
  (swap! a + n))
