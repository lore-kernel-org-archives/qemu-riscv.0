Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRz7b-0007wg-MD
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 11:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz7Z-0007t3-Td; Thu, 01 Apr 2021 11:20:33 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:49467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz7X-0005Lp-L0; Thu, 01 Apr 2021 11:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617290484; x=1648826484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvIACZsNCOtHYoAOlNCAlMIPm+x7eeAHMHw8T6QdPbE=;
 b=g8WqXl411VBg6CDmy6M9YPQjlSXvEFdNUYv55H97fBmcUOyQaeEIGXS7
 8TlqgQa7kNQlYddxDpBTl0iBD1T4k8L1uwiMNPCp/R0YudVrLF70spQ3I
 LDRvN0RN3hqtn49PjGUbTTJD0x+t6e/haT68C54Qx/i+T6cTnnkLe3mrx
 6FTDuyicHYA/zUuTV2M3gB+vN1O/Flpv1RKRB5Slfx1nLehigHZ5PtiTX
 QnEu0g/fUyHk7M9wqoRqU8jYaAxKiRGWfLEJzP1QkBEYOzMr3KN0ua/AK
 03Ao8AmSwOawE/RaJI0zTbtOObeAFafopeJ0L3K7J0mAIOUGTazI21P1f g==;
IronPort-SDR: hx/MqSebwali7UAcDoX/FvbOCSK1w1BLI+MazwS+i9OJVTfCbbyhaIAMQbi5N3zqqrAd51H5D3
 jvVqeTuRxOe6jNU9/sO9hSzM3wMYuJE+bXZszo5QU8zep67dC7r3xMEG7lGBKRRBp7tb4DBWkI
 SIkjM2/6FycXIG4vevjfPyUYUDXvSZSbl+dy96WkH6uv4f02ikh39DkGM+VNhT8GxW76smM3u4
 OhjS3XZCtJgvYov1tOSGD61TFjt6gBZ35OiVM9pCkRSyO0qu0N0sTgGMN2kAjwuiptogFPwlPx
 ePg=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="267973424"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 23:20:49 +0800
IronPort-SDR: UAHJcIGZfHeM8iD1zmyR9ixqRiPsw3RpAIKWTTluYsmKdB158maOJi4MEdxpRMB7v4I/QQVi+A
 9m291CJ8Fk55AC4z1Ilb7VAfMUQCL8FIyMrAPIShJ2XtxGf+FV2rP5js3oXuoB7rTBUEYntWFZ
 jZpM/inNCsyWfs9iLrStDKgkScTszjGFUGiGLF1jygkGNNdfEBxaO1pF8dyxX/pTeO5t++bAW9
 z0r2MQNHRU5YMVklSZNNuOx1CO9/Rg7E/FS9pdzCddFYT5RHVHLx7kHusdl7ls/HwUkLwqdUtW
 /Z+CybV9J9nK9e9V5v7RCcSI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 08:01:39 -0700
IronPort-SDR: ekHuxOxRrswirCdMx8ck1GsqE6E1LKXjvEllLEQSE09/z4qalA37YnpLdcPcL+D4PxMcIsQStU
 1OVmeWtJPrv/IIxMt0rzLZotin7DK3e3ICvQezieOrOI8ePim/+JHuLcJcsuwHvSb3C/GU5Bc2
 L5/dSPAqkjOwuZ3ksndE8Fpk1h3Jb+zjvdsv0iOY/mJTxYw+FmABhBKFIXOD1E/whbrZAlMV9G
 h4SBXg9BXFsTYn9SR/1kM2jCn5xPR2qjBKrLJRpOjKhMNtb9Y5Hb4tsNAFdzEbeJPCxzCz2n1l
 HSU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Apr 2021 08:19:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 5/5] target/riscv: Use RISCVException enum for CSR access
Date: Thu,  1 Apr 2021 11:18:07 -0400
Message-Id: <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617290165.git.alistair.francis@wdc.com>
References: <cover.1617290165.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=718ae7c5e=alistair.francis@wdc.com;
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
X-List-Received-Date: Thu, 01 Apr 2021 15:20:34 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 11 +++++++----
 target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
 target/riscv/gdbstub.c   |  8 ++++----
 target/riscv/op_helper.c | 18 +++++++++---------
 4 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7b9b9da6b7..d3df8b9292 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -455,10 +455,13 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask);
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                      target_ulong new_value, target_ulong write_mask);
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask);
+RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask);
 
 static inline void riscv_csr_write(CPURISCVState *env, int csrno,
                                    target_ulong val)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9df65a609c..459db93c83 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1404,10 +1404,11 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask)
 {
-    int ret;
+    RISCVException ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1429,41 +1430,37 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     if ((write_mask && read_only) ||
         (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
 
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     /* check predicate */
     if (!csr_ops[csrno].predicate) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
-        return -ret;
+        return ret;
     }
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
-        ret = csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
-        if (ret != RISCV_EXCP_NONE) {
-            return -ret;
-        }
-        return 0;
+        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
     }
 
     /* if no accessor exists then return failure */
     if (!csr_ops[csrno].read) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     /* read old value */
     ret = csr_ops[csrno].read(env, csrno, &old_value);
     if (ret != RISCV_EXCP_NONE) {
-        return -ret;
+        return ret;
     }
 
     /* write value if writable and write mask set, otherwise drop writes */
@@ -1472,7 +1469,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
             if (ret != RISCV_EXCP_NONE) {
-                return -ret;
+                return ret;
             }
         }
     }
@@ -1482,17 +1479,19 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         *ret_value = old_value;
     }
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
  */
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask)
 {
-    int ret;
+    RISCVException ret;
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = true;
 #endif
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5f96b7ea2a..ca78682cf4 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -71,7 +71,7 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, &val,
                                    0, 0);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -94,7 +94,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, NULL,
                                    val, -1);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
@@ -108,7 +108,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, &val, 0, 0);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -122,7 +122,7 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, NULL, val, -1);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de..3fc5e0505d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -42,10 +42,10 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
         target_ulong csr)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, src, -1);
+    RISCVException ret = riscv_csrrw(env, csr, &val, src, -1);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
@@ -54,10 +54,10 @@ target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
         target_ulong csr, target_ulong rs1_pass)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
@@ -66,10 +66,10 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
         target_ulong csr, target_ulong rs1_pass)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
-- 
2.31.0


