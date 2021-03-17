Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMaAe-00087W-DT
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 13:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAb-00083U-I5; Wed, 17 Mar 2021 13:41:21 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:50478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAX-0006uT-Bf; Wed, 17 Mar 2021 13:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616002887; x=1647538887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTAmcgrCK5mxb86vl4p0tkm8GAMdAaL4hoje7fOGs9E=;
 b=Ei1IjbIfFVDcW8ArW8PY6SBN8iM7oErecIx10w5NTwbLCbJU4P7vh/65
 +h7ABDfEbozTLhT06DNmKSoQdAd2rMt4x8BoVPYwtx9pU7i88Ev4mYgeV
 4NMmbnoq7rvs4w2HD1qnLjHV6wIbagD09ArdHwKFUgx+XMKPxTXH4w5Jf
 5v/Np9eQ4wLsAWsmjn8kWllbbhnHh8aob9aHzJ14BuxNw/jvWv4RZdIZG
 sM1pzI0HN4DjjFx4yJbiVbk+q61blAmGZzbpbcy7m2CQ9QvQk74Hq3Yin
 NzZcBRKgvAPH2lpnOu+UfoKgYOAdSeIQBZlZnZIemkvoqmqEKli2WY6zA A==;
IronPort-SDR: PdoduPwdoxzjQI4Y73T/hFv2DWTGqU8Qc5JhkfGq7dRhdBpJJCRFgLwD7RTDMCP1MrGkdX+7Vh
 VNdv4AMhqtotf4TlJpeDVA5wsplDpkhCYOFUkkWUQGmYRuDaPiMO5Z40ZkjfEO/ImLDuZCK8oY
 HcOLRxVRNI5OSnzzLos7L9etBOpzqoiMZUa/JnSbFHjNGBL6bYembILfXvfbUvdloaBWzWHBj3
 LqdnaiBbDkIU97k+iXGJxqit9yBcjKNoVDB+nQdymw7hZelHpv7DaFElivsbrwpDfmCM21D1be
 AcE=
X-IronPort-AV: E=Sophos;i="5.81,257,1610380800"; d="scan'208";a="266778868"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Mar 2021 01:41:25 +0800
IronPort-SDR: wDL280sxM9YKtNaBZ1jyM1EN06c1Uaj3PnjU40cuKfceIuUHj/oSuqVtQFgNO5aDFvbzTxd1vk
 uQqC53k+UO5ItKRff5n+ski09HbwwL93MrsbDv215/OVpRVgxmWUURMAqcFTKqqNDFEK57BYKH
 epKyT7rRLgNcdKm7SS0OyoILdYYvbS6ELTiztwEKE9kwDCgyNi/gO/56IDcr8yok/k4wiOMuFn
 XL2htjXhIMRyBEars/5bwmHPt6CJmKgGpwQZcq6xCAaKU10XWAiWBAFnaABePYthNA+3M0ntw1
 i/+ALzkbmIzjd1YUQKyKIgLl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 10:23:35 -0700
IronPort-SDR: oNA4YPL1nx+/LsU/9H2cqSla0uP1lDky/Mjt1rrdudSBchtXlzE4Sep5OOhPv05urscZK6LO/7
 oXeRHFiSieUdnkrRQCroyqFY/+ejYNZ1Bf/a7ESPhhzbD2QDcbwnDDCpX7oATxX6j+zYavedoi
 hoZgnvkwt1MaHJBJwl5Jexr0y0RG9y+mCREFIMQq+IKo8XHDkL+xDJr0WnSl6QCvKBTwkMeJot
 qqugpKO6fXo236zcL7Enf0J4b55eVDQoMQL4R86ET9/mnm7qLAw1Z97x9W//r6fhKS4xN+L4SU
 FIY=
WDCIronportException: Internal
Received: from fvwlp12.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.223])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Mar 2021 10:41:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 5/5] target/riscv: Use RiscVException enum for CSR access
Date: Wed, 17 Mar 2021 13:40:03 -0400
Message-Id: <6834cb79431f394b05b06a26317799c9066ccd4f.1616002766.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1616002766.git.alistair.francis@wdc.com>
References: <cover.1616002766.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=703660e7d=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 17 Mar 2021 17:41:22 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 11 +++++++----
 target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
 target/riscv/gdbstub.c   |  8 ++++----
 target/riscv/op_helper.c | 18 +++++++++---------
 4 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7af9fff776..179685d07b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -451,10 +451,13 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask);
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                      target_ulong new_value, target_ulong write_mask);
+RiscVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask);
+RiscVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask);
 
 static inline void riscv_csr_write(CPURISCVState *env, int csrno,
                                    target_ulong val)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 61b2abdc14..fbe38dd261 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1404,10 +1404,11 @@ static RiscVException write_pmpaddr(CPURISCVState *env, int csrno,
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RiscVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask)
 {
-    int ret;
+    RiscVException ret;
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
+RiscVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask)
 {
-    int ret;
+    RiscVException ret;
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = true;
 #endif
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5f96b7ea2a..fdc51ea165 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -71,7 +71,7 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, &val,
                                    0, 0);
-        if (result == 0) {
+        if (result != RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -94,7 +94,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, NULL,
                                    val, -1);
-        if (result == 0) {
+        if (result != RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
@@ -108,7 +108,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, &val, 0, 0);
-        if (result == 0) {
+        if (result != RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -122,7 +122,7 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, NULL, val, -1);
-        if (result == 0) {
+        if (result != RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de..c84b9f8557 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -42,10 +42,10 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
         target_ulong csr)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, src, -1);
+    RiscVException ret = riscv_csrrw(env, csr, &val, src, -1);
 
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
+    RiscVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
 
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
+    RiscVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
-- 
2.30.1


