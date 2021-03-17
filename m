Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMaAS-0007xQ-CS
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 13:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAP-0007up-Ug; Wed, 17 Mar 2021 13:41:09 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:50477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAM-0006sn-HF; Wed, 17 Mar 2021 13:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616002870; x=1647538870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ehe+Z0MOh9y3MksWGIoz60oE2KX6z159jeYn8/Jaqdg=;
 b=MNGyYpvX8wR1my2orelBWtCfLr5YeoMnoWV1tkzgPBvsvLTX0QCrBPOf
 xT3qISKJQcFjGvaLFgAlTVFNHZ2QMKLCQB88X7atQNUlcQ4C7SKhkteA2
 Ik2304jjS4gXdSXdHMTgU0qUZWZRecDVw7LZ3KkQIyhv02KaDDl3oCCyC
 jN95xrk/nHoYn6ywvfDX8jTYLP5IqqSmXGDf4XXuCpANDLtmtBDyTlBKp
 rR9SfXAKOD7cn9cUCL8Z0JlZ6Z7VQ0p/Ne0h1Uz+huRUXfzkJwjrqZY34
 eV6GxHcrUHQrrQQX0bNweQWpJj6U8Zhh58slGGw7/FuAYXCXTVbDjegnP w==;
IronPort-SDR: 2fW1tsaiXarUZL2gpzKj2JQIA53kq16qYK4GyxS7Oczmd7u+VScKsjWBCFspcY1lx2GrPzq1M3
 137VGXhvFTcG4/1FhEevpcTIgc/X/BsOShOYKmfv98oqa7s9ID0Ra1I+jikfE69fEUpP99rrfK
 PMsBw+VQl10TX7xEEnjzNIEnuNaVH28MoIkT5P03vDqFuNyfFq0EqDb21HOdUmOdZOShQsTS6w
 y0CCgcN8mI3xkJIFXDfOLE/PWS9OtQ1RB5gtoKL/xW29/DYfDjRb1jUGDJiedHHBnf6SdmLVeG
 Eno=
X-IronPort-AV: E=Sophos;i="5.81,257,1610380800"; d="scan'208";a="266778849"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Mar 2021 01:41:08 +0800
IronPort-SDR: X/ZRz6jIob9OnKfBDYWOkyF4iEYyJ0aEIR34k4Ev8lATTPdwbze/W/lMQVr5Za0r+WN2PtHelK
 0PB94WDw9MvgW6Q1QWU8IAl7y9U2SQxoQaajhyKeFfTY59I2ZYJ/n/KTDCt0Z5bapTMQV7vpvt
 C+mloXJEwx/r/7Mi36B1HKAnIZ7EjhVEkjds9XdqJQpZQgsfmb1dFnOVffvh9U6Q4Gugq92uYn
 CXJc/qwXJp83mZQaMxizP/w0exUoVxD3bfsEXDej6b1N6WkrKS+kGWz4/uFC4KBVOmtUpHXMxk
 q7d96C5AGDmEI4r8Wjs4CEz6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 10:23:24 -0700
IronPort-SDR: dyPSCbQrXbeGjhmjhGLqcOnyRzrb70+seRzF19vqTD3k2Pn+OukAIpybstuqot/VvB5k7UqKC2
 9bfHm2wVD/SjBWSjlWobZs62tW1ZRgkfoDIv9t9gmvovHpBqTRKlhnSFS+JPjLQWXZMoQjtkHT
 t19ZGZZDUCZzknTCd7NqkPInRqafOar88TQMWQMQ6z4w2Rl5VFL6/eTqQGCGDosNW8Ep/eAFXB
 OuLniI1egCtPJjsNoxEeVPgYSTxFU+iyfXuu8EFYD4ptcgfGK4TmbSyHsQjSzyE2MQ7X4L2L7D
 YmM=
WDCIronportException: Internal
Received: from fvwlp12.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.223])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Mar 2021 10:41:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/5] target/riscv: Use the RiscVException enum for CSR
 predicates
Date: Wed, 17 Mar 2021 13:39:52 -0400
Message-Id: <9c0fa7d4f191d83ac2e70e830d141f4f4105e061.1616002766.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Wed, 17 Mar 2021 17:41:10 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  3 +-
 target/riscv/csr.c | 80 +++++++++++++++++++++++++---------------------
 2 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..073a994d13 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -469,7 +469,8 @@ static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
     return val;
 }
 
-typedef int (*riscv_csr_predicate_fn)(CPURISCVState *env, int csrno);
+typedef RiscVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
+                                                 int csrno);
 typedef int (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
     target_ulong *ret_value);
 typedef int (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f3..da9baff6fb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -35,29 +35,29 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
-static int fs(CPURISCVState *env, int csrno)
+static RiscVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* loose check condition for fcsr in vector extension */
     if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return 0;
+        return RISCV_EXCP_INST_ACCESS_FAULT;
     }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int vs(CPURISCVState *env, int csrno)
+static RiscVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
-    return -1;
+    return RISCV_EXCP_INST_ACCESS_FAULT;
 }
 
-static int ctr(CPURISCVState *env, int csrno)
+static RiscVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
@@ -65,7 +65,7 @@ static int ctr(CPURISCVState *env, int csrno)
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -73,25 +73,25 @@ static int ctr(CPURISCVState *env, int csrno)
         case CSR_CYCLE:
             if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
                 get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_TIME:
             if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
                 get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_INSTRET:
             if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
                 get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
             if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
                 get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         }
@@ -100,93 +100,101 @@ static int ctr(CPURISCVState *env, int csrno)
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
                     get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_TIMEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
                     get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_INSTRETH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
                     get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
                 if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
                     get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             }
         }
     }
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int ctr32(CPURISCVState *env, int csrno)
+static RiscVException ctr32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return ctr(env, csrno);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static int any(CPURISCVState *env, int csrno)
+static RiscVException any(CPURISCVState *env, int csrno)
 {
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int any32(CPURISCVState *env, int csrno)
+static RiscVException any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return any(env, csrno);
 
 }
 
-static int smode(CPURISCVState *env, int csrno)
+static RiscVException smode(CPURISCVState *env, int csrno)
 {
-    return -!riscv_has_ext(env, RVS);
+    if (riscv_has_ext(env, RVS)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int hmode(CPURISCVState *env, int csrno)
+static RiscVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS) &&
         riscv_has_ext(env, RVH)) {
         /* Hypervisor extension is supported */
         if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
             env->priv == PRV_M) {
-            return 0;
+            return RISCV_EXCP_NONE;
         } else {
-            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 
-    return -RISCV_EXCP_ILLEGAL_INST;
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int hmode32(CPURISCVState *env, int csrno)
+static RiscVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     return hmode(env, csrno);
 
 }
 
-static int pmp(CPURISCVState *env, int csrno)
+static RiscVException pmp(CPURISCVState *env, int csrno)
 {
-    return -!riscv_feature(env, RISCV_FEATURE_PMP);
+    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 #endif
 
@@ -1312,8 +1320,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     ret = csr_ops[csrno].predicate(env, csrno);
-    if (ret < 0) {
-        return ret;
+    if (ret > 0) {
+        return -ret;
     }
 
     /* execute combined read/write operation if it exists */
-- 
2.30.1


