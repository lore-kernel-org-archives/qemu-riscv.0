Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7wDc-00074i-38
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 02:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i7wDY-0006yX-06
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 02:35:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i7wDV-0007oe-VT
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 02:35:03 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46051)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1i7wDS-0007iy-IE; Wed, 11 Sep 2019 02:34:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.03712995|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.6613-0.00789933-0.3308; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03307; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=11; RT=11; SR=0;
 TI=SMTPD_---.FSRJyb1_1568183691; 
Received: from localhost(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FSRJyb1_1568183691)
 by smtp.aliyun-inc.com(10.147.44.129);
 Wed, 11 Sep 2019 14:34:51 +0800
From: liuzhiwei <zhiwei_liu@c-sky.com>
To: Alistair.Francis@wdc.com, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 wenmeng_zhang@c-sky.com
Cc: wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Date: Wed, 11 Sep 2019 14:25:27 +0800
Message-Id: <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: [Qemu-riscv] [PATCH v2 03/17] RISC-V: support vector extension csr
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
X-List-Received-Date: Wed, 11 Sep 2019 06:35:07 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_bits.h | 15 ++++++++++++
 target/riscv/csr.c      | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 11f971a..9eb43ec 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -29,6 +29,14 @@
 #define FSR_NXA             (FPEXC_NX << FSR_AEXC_SHIFT)
 #define FSR_AEXC            (FSR_NVA | FSR_OFA | FSR_UFA | FSR_DZA | FSR_NXA)
 
+/* Vector Fixed-Point round model */
+#define FSR_VXRM_SHIFT      9
+#define FSR_VXRM            (0x3 << FSR_VXRM_SHIFT)
+
+/* Vector Fixed-Point saturation flag */
+#define FSR_VXSAT_SHIFT     8
+#define FSR_VXSAT           (0x1 << FSR_VXSAT_SHIFT)
+
 /* Control and Status Registers */
 
 /* User Trap Setup */
@@ -48,6 +56,13 @@
 #define CSR_FRM             0x002
 #define CSR_FCSR            0x003
 
+/* User Vector CSRs */
+#define CSR_VSTART          0x008
+#define CSR_VXSAT           0x009
+#define CSR_VXRM            0x00a
+#define CSR_VL              0xc20
+#define CSR_VTYPE           0xc21
+
 /* User Timers and Counters */
 #define CSR_CYCLE           0xc00
 #define CSR_TIME            0xc01
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0d4586..a6131ff 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -87,12 +87,12 @@ static int ctr(CPURISCVState *env, int csrno)
     return 0;
 }
 
-#if !defined(CONFIG_USER_ONLY)
 static int any(CPURISCVState *env, int csrno)
 {
     return 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static int smode(CPURISCVState *env, int csrno)
 {
     return -!riscv_has_ext(env, RVS);
@@ -158,8 +158,10 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
         return -1;
     }
 #endif
-    *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
-        | (env->frm << FSR_RD_SHIFT);
+    *val = (env->vfp.vxrm << FSR_VXRM_SHIFT)
+            | (env->vfp.vxsat << FSR_VXSAT_SHIFT)
+            | (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
+            | (env->frm << FSR_RD_SHIFT);
     return 0;
 }
 
@@ -172,10 +174,60 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
+    env->vfp.vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
+    env->vfp.vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
 
+static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vfp.vtype;
+    return 0;
+}
+
+static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vfp.vl;
+    return 0;
+}
+
+static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vfp.vxrm;
+    return 0;
+}
+
+static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vfp.vxsat;
+    return 0;
+}
+
+static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vfp.vstart;
+    return 0;
+}
+
+static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vfp.vxrm = val;
+    return 0;
+}
+
+static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vfp.vxsat = val;
+    return 0;
+}
+
+static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vfp.vstart = val;
+    return 0;
+}
+
 /* User Timers and Counters */
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -873,7 +925,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
     [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
     [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
-
+    /* Vector CSRs */
+    [CSR_VSTART] =              { any,   read_vstart,     write_vstart      },
+    [CSR_VXSAT] =               { any,   read_vxsat,      write_vxsat       },
+    [CSR_VXRM] =                { any,   read_vxrm,       write_vxrm        },
+    [CSR_VL] =                  { any,   read_vl                            },
+    [CSR_VTYPE] =               { any,   read_vtype                         },
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-- 
2.7.4


