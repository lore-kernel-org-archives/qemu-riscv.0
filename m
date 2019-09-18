Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbrw-0006Lw-K1
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrs-0006GD-Cp
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrq-0006OF-NA
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:44 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:37911)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrq-0006Nm-H6
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:42 -0400
Received: by mail-pf1-f172.google.com with SMTP id h195so205517pfe.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=f1obdWZEdYPCxiLjAjjERigqaNazFElY8RAjlYJpnb0=;
 b=HgzHYoIFliYL5EyKr6PhWtcNPRxeUdGoeGN6Oumec+1AsR1zj1DSkj6/0wd18lUo93
 Z9eK+tHvUJNjq1SeSreHMjWgXhiSU3kL1M6hlED4y1n31GgOUn/Hp/y/nOkhqBPUHJU9
 QCJc/3/XliSoPuHJkbd2/KUVfTeZB4uq+2J3T3kDp2hsWKFprSAKj8eUIxo6qqzgGTuH
 4RSDDcnjulkDKWe1Wk0QFxdqupCf+nSNIVtojE1UqBnGRC0LhDPgyci66UukU3fdr0Z1
 RFwzNX+aQvQbCYNlykgwryczd9TtDe4CF3gl6bq22NnlHftNk76toG+DSzwD4xVr61sb
 J0Xg==
X-Gm-Message-State: APjAAAWC6etjAgfESHwxnapSsE7/049MXqIw0KFP7CQRnH0DeEZJOBPJ
 10ifJJH4aNGKqs1ux6m1YBLpM7aSFQY=
X-Google-Smtp-Source: APXvYqxBmOLMiSXvAbPyBQVyamacL3ckHMPw/M7GdknH4/zWxzNFxduhaEoEjFtP/RTqUjGgZgmlBw==
X-Received: by 2002:aa7:953c:: with SMTP id c28mr4864554pfp.106.1568820461176; 
 Wed, 18 Sep 2019 08:27:41 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k3sm6468471pgl.9.2019.09.18.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:40 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:57 -0700
Message-Id: <20190918145640.17349-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.172
Subject: [Qemu-riscv] [PULL 05/48] target/riscv/pmp: Convert
 qemu_log_mask(LOG_TRACE) to trace events
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:47 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use the always-compiled trace events, remove the now unused
RISCV_DEBUG_PMP definition.

Note pmpaddr_csr_read() could previously do out-of-bound accesses
passing addr_index >= MAX_RISCV_PMPS.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c        | 31 ++++++++++---------------------
 target/riscv/trace-events |  6 ++++++
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d836288cb4..d4f1007109 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -27,14 +27,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
-
-#define RISCV_DEBUG_PMP 0
-#define PMP_DEBUG(fmt, ...)                                                    \
-    do {                                                                       \
-        if (RISCV_DEBUG_PMP) {                                                 \
-            qemu_log_mask(LOG_TRACE, "%s: " fmt "\n", __func__, ##__VA_ARGS__);\
-        }                                                                      \
-    } while (0)
+#include "trace.h"
 
 static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
     uint8_t val);
@@ -302,8 +295,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     int i;
     uint8_t cfg_val;
 
-    PMP_DEBUG("hart " TARGET_FMT_ld ": reg%d, val: 0x" TARGET_FMT_lx,
-        env->mhartid, reg_index, val);
+    trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
     if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -332,9 +324,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
         val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
         cfg_val |= (val << (i * 8));
     }
-
-    PMP_DEBUG("hart " TARGET_FMT_ld ": reg%d, val: 0x" TARGET_FMT_lx,
-        env->mhartid, reg_index, cfg_val);
+    trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
 
     return cfg_val;
 }
@@ -346,9 +336,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
 {
-    PMP_DEBUG("hart " TARGET_FMT_ld ": addr%d, val: 0x" TARGET_FMT_lx,
-        env->mhartid, addr_index, val);
-
+    trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
     if (addr_index < MAX_RISCV_PMPS) {
         if (!pmp_is_locked(env, addr_index)) {
             env->pmp_state.pmp[addr_index].addr_reg = val;
@@ -369,14 +357,15 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
  */
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
 {
-    PMP_DEBUG("hart " TARGET_FMT_ld ": addr%d, val: 0x" TARGET_FMT_lx,
-        env->mhartid, addr_index,
-        env->pmp_state.pmp[addr_index].addr_reg);
+    target_ulong val = 0;
+
     if (addr_index < MAX_RISCV_PMPS) {
-        return env->pmp_state.pmp[addr_index].addr_reg;
+        val = env->pmp_state.pmp[addr_index].addr_reg;
+        trace_pmpaddr_csr_read(env->mhartid, addr_index, val);
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ignoring pmpaddr read - out of bounds\n");
-        return 0;
     }
+
+    return val;
 }
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
index 48af0373df..4b6c652ae9 100644
--- a/target/riscv/trace-events
+++ b/target/riscv/trace-events
@@ -1,2 +1,8 @@
 # target/riscv/cpu_helper.c
 riscv_trap(uint64_t hartid, bool async, uint64_t cause, uint64_t epc, uint64_t tval, const char *desc) "hart:%"PRId64", async:%d, cause:%"PRId64", epc:0x%"PRIx64", tval:0x%"PRIx64", desc=%s"
+
+# pmp.c
+pmpcfg_csr_read(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRIu64 ": read reg%" PRIu32", val: 0x%" PRIx64
+pmpcfg_csr_write(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRIu64 ": write reg%" PRIu32", val: 0x%" PRIx64
+pmpaddr_csr_read(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": read addr%" PRIu32", val: 0x%" PRIx64
+pmpaddr_csr_write(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": write addr%" PRIu32", val: 0x%" PRIx64
-- 
2.21.0


