Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlug-0008Q9-O1
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlue-0008NZ-C2; Tue, 08 Dec 2020 17:56:52 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlub-0004FJ-Dc; Tue, 08 Dec 2020 17:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468209; x=1639004209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JMww/svmL0oTF9pRnVLLvHikryNyiwgYJTj9VRwXqXU=;
 b=fTtAkrCodu64rWlK2nSpjrqlCW4ETheEAB7orT6SEjjW8+gUyMQOcmVW
 zF8OB5667/0eIvNBjQDoIHt/jReib3EOGv9xZhEawgrw3QhFafXNFQb/m
 l0He1LXtC4JKsEKiOlQ6rKveHPi8OmoWdX8FhoONgWHO0/8pYu3kp9hvi
 V1yPKw1O3+Z/nx53wZQII4FW1s9X5ROREuFSBGKS4HHwxZuIyWhK5Ly8f
 H8660gaXKD2ObzLFydJNuMw1i0Yd272IG88CR2MiL3ohXdoXlars1Dx1Q
 5yRGlFn8mSP9ZALxtAzxVPP5u2FmW92TgT8jDRMpfdUngEgC6K4NgnAlu A==;
IronPort-SDR: RpbMCIDAfEwto8K3YGPwwpA7s5iUiUPelPQEdNCB22x2U9u9xurgHRAwpcKt3FqkNrcW13aqJo
 KRtBM2pVB4wXKxRlhW8e9tGo8hUm25PahCo9aAFIn2Nfk4xyJUk1dNaS94ORDHkOIrG5Te8Nus
 vTkwDdp/DWWTWt1fzSijGHQzL3XKzYFmS6drq3bHffhzbyK9aX4lCPa4pNN30CqjPcQZgFZNZo
 ejTMP3auFpwBL1M4s7oqcrdK/aNdzZbI+FAGPJsZ4LIOzC0ji7+EkY7RHatfE72dC7LvnQ6U+3
 0XY=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713845"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:47 +0800
IronPort-SDR: kVLLekclpnzDLx52BBoUuyrvb+p51RLZgMJegRWJooU7Tea1GKEDlKK9LCkwOTxwmpJW//TlC/
 R5UKwauH1UIu72ZXc7/53j3UR7oubL0kA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:15 -0800
IronPort-SDR: +12HgHNO5AuP/jMfgg4jK9kcZYfPCB+g2UEweNsfRahUMx/dHvTeYvKPx+b8pjY9phWdCfx8PB
 NSzWuUVuCWaQ==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:48 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 14/15] target/riscv: csr: Remove compile time XLEN checks
Date: Tue,  8 Dec 2020 14:56:47 -0800
Message-Id: <7d7d148b9d4a3bcc86387d7b0d8005f114ade8be.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:53 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |   4 +-
 target/riscv/csr.c      | 182 +++++++++++++++++++++-------------------
 2 files changed, 97 insertions(+), 89 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24b24c69c5..1337269ae8 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -437,9 +437,7 @@
 #define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTSR         0x00400000
-#if defined(TARGET_RISCV64)
-#define HSTATUS_VSXL        0x300000000
-#endif
+#define HSTATUS_VSXL         0x300000000
 
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 93263f8e06..2ffaa926a7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -102,44 +102,65 @@ static int ctr(CPURISCVState *env, int csrno)
                 return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
-#if defined(TARGET_RISCV32)
-        case CSR_CYCLEH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIMEH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRETH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
+                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
+                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
+                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
+                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
             }
-            break;
-#endif
         }
     }
 #endif
     return 0;
 }
 
+static int ctr32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return ctr(env, csrno);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static int any(CPURISCVState *env, int csrno)
 {
     return 0;
 }
 
+static int any32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+
+}
+
 static int smode(CPURISCVState *env, int csrno)
 {
     return -!riscv_has_ext(env, RVS);
@@ -161,6 +182,16 @@ static int hmode(CPURISCVState *env, int csrno)
     return -RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int hmode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return 0;
+    }
+
+    return hmode(env, csrno);
+
+}
+
 static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
@@ -310,7 +341,6 @@ static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -324,7 +354,6 @@ static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     return 0;
 }
-#endif /* TARGET_RISCV32 */
 
 #if defined(CONFIG_USER_ONLY)
 static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
@@ -333,13 +362,11 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = cpu_get_host_ticks() >> 32;
     return 0;
 }
-#endif
 
 #else /* CONFIG_USER_ONLY */
 
@@ -355,7 +382,6 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
     uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
@@ -367,7 +393,6 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
     *val = (env->rdtime_fn(env->rdtime_fn_arg) + delta) >> 32;
     return 0;
 }
-#endif
 
 /* Machine constants */
 
@@ -406,19 +431,17 @@ static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-#if defined(TARGET_RISCV32)
-static const char valid_vm_1_10[16] = {
+static const char valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV32] = 1
 };
-#elif defined(TARGET_RISCV64)
-static const char valid_vm_1_10[16] = {
+
+static const char valid_vm_1_10_64[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV39] = 1,
     [VM_1_10_SV48] = 1,
     [VM_1_10_SV57] = 1
 };
-#endif /* CONFIG_USER_ONLY */
 
 /* Machine Information Registers */
 static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
@@ -441,7 +464,11 @@ static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    return valid_vm_1_10[vm & 0xf];
+    if (riscv_cpu_is_32bit(env)) {
+        return valid_vm_1_10_32[vm & 0xf];
+    } else {
+        return valid_vm_1_10_64[vm & 0xf];
+    }
 }
 
 static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
@@ -459,13 +486,14 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW;
-#if defined(TARGET_RISCV64)
-    /*
-     * RV32: MPV and GVA are not in mstatus. The current plan is to
-     * add them to mstatush. For now, we just don't support it.
-     */
-    mask |= MSTATUS_MPV | MSTATUS_GVA;
-#endif
+
+    if (!riscv_cpu_is_32bit(env)) {
+        /*
+         * RV32: MPV and GVA are not in mstatus. The current plan is to
+         * add them to mstatush. For now, we just don't support it.
+         */
+        mask |= MSTATUS_MPV | MSTATUS_GVA;
+    }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
@@ -477,7 +505,6 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-#ifdef TARGET_RISCV32
 static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->mstatus >> 32;
@@ -497,7 +524,6 @@ static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
 
     return 0;
 }
-#endif
 
 static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -895,10 +921,10 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
 static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->hstatus;
-#ifdef TARGET_RISCV64
-    /* We only support 64-bit VSXL */
-    *val = set_field(*val, HSTATUS_VSXL, 2);
-#endif
+    if (!riscv_cpu_is_32bit(env)) {
+        /* We only support 64-bit VSXL */
+        *val = set_field(*val, HSTATUS_VSXL, 2);
+    }
     /* We only support little endian */
     *val = set_field(*val, HSTATUS_VSBE, 0);
     return 0;
@@ -907,11 +933,9 @@ static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
     env->hstatus = val;
-#ifdef TARGET_RISCV64
-    if (get_field(val, HSTATUS_VSXL) != 2) {
+    if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
     }
-#endif
     if (get_field(val, HSTATUS_VSBE) != 0) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
     }
@@ -1053,11 +1077,11 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
-#if defined(TARGET_RISCV32)
-    *val = env->htimedelta & 0xffffffff;
-#else
-    *val = env->htimedelta;
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        *val = env->htimedelta & 0xffffffff;
+    } else {
+        *val = env->htimedelta;
+    }
     return 0;
 }
 
@@ -1067,15 +1091,14 @@ static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
-#if defined(TARGET_RISCV32)
-    env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
-#else
-    env->htimedelta = val;
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
+    } else {
+        env->htimedelta = val;
+    }
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (!env->rdtime_fn) {
@@ -1095,7 +1118,6 @@ static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
     return 0;
 }
-#endif
 
 /* Virtual CSR Registers */
 static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
@@ -1374,26 +1396,20 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-#if defined(TARGET_RISCV32)
-    [CSR_CYCLEH] =              { ctr,  read_instreth                       },
-    [CSR_INSTRETH] =            { ctr,  read_instreth                       },
-#endif
+    [CSR_CYCLEH] =              { ctr32,  read_instreth                       },
+    [CSR_INSTRETH] =            { ctr32,  read_instreth                       },
 
     /* In privileged mode, the monitor will have to emulate TIME CSRs only if
      * rdtime callback is not provided by machine/platform emulation */
     [CSR_TIME] =                { ctr,  read_time                           },
-#if defined(TARGET_RISCV32)
-    [CSR_TIMEH] =               { ctr,  read_timeh                          },
-#endif
+    [CSR_TIMEH] =               { ctr32,  read_timeh                          },
 
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE] =              { any,  read_instret                        },
     [CSR_MINSTRET] =            { any,  read_instret                        },
-#if defined(TARGET_RISCV32)
-    [CSR_MCYCLEH] =             { any,  read_instreth                       },
-    [CSR_MINSTRETH] =           { any,  read_instreth                       },
-#endif
+    [CSR_MCYCLEH] =             { any32,  read_instreth                       },
+    [CSR_MINSTRETH] =           { any32,  read_instreth                       },
 
     /* Machine Information Registers */
     [CSR_MVENDORID] =           { any,  read_zero                           },
@@ -1410,9 +1426,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
 
-#if defined(TARGET_RISCV32)
-    [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
-#endif
+    [CSR_MSTATUSH] =            { any32,  read_mstatush,    write_mstatush    },
 
     [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
 
@@ -1452,9 +1466,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HGEIP] =               { hmode,   read_hgeip,       write_hgeip      },
     [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
     [CSR_HTIMEDELTA] =          { hmode,   read_htimedelta,  write_htimedelta },
-#if defined(TARGET_RISCV32)
-    [CSR_HTIMEDELTAH] =         { hmode,   read_htimedeltah, write_htimedeltah},
-#endif
+    [CSR_HTIMEDELTAH] =         { hmode32,   read_htimedeltah, write_htimedeltah},
 
     [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
     [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
@@ -1477,9 +1489,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =    { ctr,  read_zero          },
     [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =   { any,  read_zero          },
     [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =     { any,  read_zero          },
-#if defined(TARGET_RISCV32)
-    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr,  read_zero          },
-    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any,  read_zero          },
-#endif
+    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr32,  read_zero          },
+    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any32,  read_zero          },
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.29.2


