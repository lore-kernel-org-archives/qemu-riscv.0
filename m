Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW90I-0005z9-8s
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90G-0005xe-TN; Mon, 12 Apr 2021 22:42:12 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:19807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90E-0007w1-SS; Mon, 12 Apr 2021 22:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281736; x=1649817736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Ok+tcjiS+FZn/FXu1Fpq+gKJ8dmBUMypcJItbhVtUk=;
 b=mecVyWQaA+YNP2iQtsHmwxMyfuv6TDxYNuq+nf9kUZHo5aWccMpq6VY9
 K69w62YzPhGJGiNdAHFr/l2ai94Qup+tDDI7neFyVx5QgdNmkVtilWwnq
 8Zka2n6fVv2V5PDZcSaTXral+rXkXjFhglXXc0AKWwgFxzY8yHJr3SwlP
 /Rp/i0MAMngxrir1AYDGruvIYC1/AsEYEz4Z42AZlXEo2lmFXhWd6c+nc
 sQCHVYFexhs85uuE5chil5odHqLxO/p5MH/aOlwzXV8lA+p3XFrG59gkQ
 uWjV9C+eQnJkFTTuMG9EwEkBudjARe5rfUiVG+eg/iDal1k4iymOWaqsE Q==;
IronPort-SDR: V266+8jq/jrlOirTRuJs7TGih+jupAn/iR6kN14XD39hav4Iry/RyeIPyr2hZhRP4zA7lkPlkC
 GRwmC4FmLYn7mUrXNeI6Pj49idb5te87QZIjn9fWlFAi5+hhh5fB5ObQnan55unIajW8WVajmv
 Tc79OaMEhhNZRQi7NRhyltHJUr48yrv3uyay/4ldYV6U8YL24jd3mYiLjanwbhOoirVfjPSwGW
 2MRbMOZPhxneZtvxM/r1Naxq22UjUg9kZQ8nHoRCJvj3k1P/5MZt+7bUlHfJovHjM+fJvAGsH4
 xZU=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="268800698"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:41:57 +0800
IronPort-SDR: UMMmOXmpBY3kVmI/qF4eTAt9qksWhGUXum9b+E/cjQ5uVYjNwCq9xMI6V3CAOjuIMnn7JU1peF
 sxtaYZEaGEOfk2Bd/30zTFSJh190P/zbH0w3HeKdkxolw18zdT76xYLv+Yay5tTFYWy1tRC7P9
 YB9Y+MrsjDSJnqBEizqeg7iU+NRHE3khjNYqFv5FcHUwOyAS3MeFzXVOQpBc7eo1mpq7jWkfrH
 mqD2CCew4GCGAUUNM/ANENjkBOfPzGnEo6s02yKIT70hO9oIYk2TQmw1eSmmlEsO9qBeqpybn/
 SM2KqbKFZDISScl2SzzkLN17
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:21:20 -0700
IronPort-SDR: 4ROzS0BIe6NtWejGR4AiAoa7gUPRPpjLO+qj5UCcsMdQ+ZHny1kFGlCwqyN6xHzzH3TWW+i6WQ
 jugYaXrQy2g+b3kWtrAq8YnZfwALDykPtdZx/CV5PvUc7yqrV+Cmdf6rAPTRfOyflkouG0j80l
 Tag27yQIU5lspOseiGLCOvwzwYWcyCR0pme2CSzuEberwIVPSn0VDwjZit26WIvdvlqTqkabgS
 ib9r3+JCuKLx1MDDyHS4LLe69EOh1pNFdgbWHT3ZXozWbdKkRhgrR8jS3IN+ojg0kgK35+8NkR
 DR0=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:41:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 1/8] target/riscv: Fix the PMP is locked check when using
 TOR
Date: Tue, 13 Apr 2021 12:41:43 +1000
Message-Id: <358acc99b748a2099f460fb01d7f0727bdf1432e.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Apr 2021 02:42:13 -0000

The RISC-V spec says:
    if PMP entry i is locked and pmpicfg.A is set to TOR, writes to
    pmpaddri-1 are ignored.

The current QEMU code ignores accesses to pmpaddri-1 and pmpcfgi-1 which
is incorrect.

Update the pmp_is_locked() function to not check the supporting fields
and instead enforce the lock functionality in the pmpaddr write operation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/pmp.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index cff020122a..a3b253bb15 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -59,16 +59,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
         return 0;
     }
 
-    /* In TOR mode, need to check the lock bit of the next pmp
-     * (if there is a next)
-     */
-    const uint8_t a_field =
-        pmp_get_a_field(env->pmp_state.pmp[pmp_index + 1].cfg_reg);
-    if ((env->pmp_state.pmp[pmp_index + 1u].cfg_reg & PMP_LOCK) &&
-         (PMP_AMATCH_TOR == a_field)) {
-        return 1;
-    }
-
     return 0;
 }
 
@@ -380,7 +370,23 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
 {
     trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
+
     if (addr_index < MAX_RISCV_PMPS) {
+        /*
+         * In TOR mode, need to check the lock bit of the next pmp
+         * (if there is a next).
+         */
+        if (addr_index + 1 < MAX_RISCV_PMPS) {
+            uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
+
+            if (pmp_cfg & PMP_LOCK &&
+                PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "ignoring pmpaddr write - pmpcfg + 1 locked\n");
+                return;
+            }
+        }
+
         if (!pmp_is_locked(env, addr_index)) {
             env->pmp_state.pmp[addr_index].addr_reg = val;
             pmp_update_rule(env, addr_index);
-- 
2.31.1


