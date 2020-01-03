Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inDo3-0002Cq-Pm
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jan 2020 22:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDnz-000298-TR
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 22:39:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDny-0002rO-Ga
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 22:39:19 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:33031)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1inDny-0002ni-78
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 22:39:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.637094-0.00976433-0.353142;
 DS=CONTINUE|ham_system_inform|0.275118-0.000104362-0.724777;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GV9YvOJ_1578022440; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GV9YvOJ_1578022440)
 by smtp.aliyun-inc.com(10.147.42.16); Fri, 03 Jan 2020 11:34:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: alistair23@gmail.com, richard.henderson@linaro.org,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 3/4] RISC-V: support vector extension csr
Date: Fri,  3 Jan 2020 11:33:46 +0800
Message-Id: <20200103033347.20909-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Fri, 03 Jan 2020 03:39:21 -0000

Until v0.7.1 specification, vector status is still not defined for
mstatus.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_bits.h | 15 +++++++
 target/riscv/csr.c      | 92 +++++++++++++++++++++++++++++------------
 2 files changed, 80 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 11f971ad5d..9eb43ecc1e 100644
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
index e0d4586760..506ad7b590 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -53,6 +53,11 @@ static int fs(CPURISCVState *env, int csrno)
     return 0;
 }
 
+static int vs(CPURISCVState *env, int csrno)
+{
+    return 0;
+}
+
 static int ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -107,11 +112,6 @@ static int pmp(CPURISCVState *env, int csrno)
 /* User Floating-Point CSRs */
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
-        return -1;
-    }
-#endif
     *val = riscv_cpu_get_fflags(env);
     return 0;
 }
@@ -119,9 +119,6 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
-        return -1;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
@@ -130,11 +127,6 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
-        return -1;
-    }
-#endif
     *val = env->frm;
     return 0;
 }
@@ -142,9 +134,6 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
-        return -1;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
@@ -153,29 +142,73 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
-        return -1;
-    }
-#endif
-    *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
-        | (env->frm << FSR_RD_SHIFT);
+    *val = (env->vext.vxrm << FSR_VXRM_SHIFT)
+            | (env->vext.vxsat << FSR_VXSAT_SHIFT)
+            | (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
+            | (env->frm << FSR_RD_SHIFT);
     return 0;
 }
 
 static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
-        return -1;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
+    env->vext.vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
+    env->vext.vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
 
+static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vext.vtype;
+    return 0;
+}
+
+static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vext.vl;
+    return 0;
+}
+
+static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vext.vxrm;
+    return 0;
+}
+
+static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vext.vxsat;
+    return 0;
+}
+
+static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vext.vstart;
+    return 0;
+}
+
+static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vext.vxrm = val;
+    return 0;
+}
+
+static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vext.vxsat = val;
+    return 0;
+}
+
+static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vext.vstart = val;
+    return 0;
+}
+
 /* User Timers and Counters */
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -873,7 +906,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
     [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
     [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
-
+    /* Vector CSRs */
+    [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
+    [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
+    [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VL] =                  { vs,   read_vl                             },
+    [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-- 
2.23.0


