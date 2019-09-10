Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvl-0007TI-FV
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvg-0007Mg-RY
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvf-0006Ol-Ee
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:44 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:42551)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvf-0006OB-8r
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:43 -0400
Received: by mail-wr1-f47.google.com with SMTP id q14so23413633wrm.9
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=f1obdWZEdYPCxiLjAjjERigqaNazFElY8RAjlYJpnb0=;
 b=PFCeTFJ/XT9nBV4PFZ3SwyFenZew2AVvMJmqtHTA5hM/i64AQ3xh3g6w+PhaS3+1OQ
 m42jCHPotsEA16U8xq462/xBI6XLxD/jlNiVh9tdIPXJRMwRPsZ3/6bms4T4eFuAdB8B
 9hhMnYn7VS6N5UoaTl7+3nEFRZAz54NLQClK2UyOs4okcGB9jH361QYl7N4kx6F132NY
 jW5Y99sO/goLMtpd+FPE5y0mzzXWzKKo8cM4mgegyxnKVu08aW/bV1AxUuRyNBQd81iJ
 gJvcKbVoibO54R4uPGIxu/rkyf3AX1c+iHatk02GlhEqqJGai/nQ6QU2xfaH1HyY9m6Z
 mMqg==
X-Gm-Message-State: APjAAAXy4PHmsS6T1SPbAgfBTIroggk4Sgxg4V797wMaNlxWeVCU5Hsf
 td2wkvJ0a1VPd4yknVvpSJ9hiDlVuxUn7w==
X-Google-Smtp-Source: APXvYqwfxJA10l2JPfMvWpbDoyBjq9brs2mEPhVoL3ZKvV5/oxBamdaBYZY3/Ba+xCWjGN9BjynvrA==
X-Received: by 2002:adf:f801:: with SMTP id s1mr15287wrp.320.1568190281754;
 Wed, 11 Sep 2019 01:24:41 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id s1sm30209117wrg.80.2019.09.11.01.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:41 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:31 -0700
Message-Id: <20190910190513.21160-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
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
X-Received-From: 209.85.221.47
Subject: [Qemu-riscv] [PULL 05/47] target/riscv/pmp: Convert
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:47 -0000

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


