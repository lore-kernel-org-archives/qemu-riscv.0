Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRz7D-0007CO-Un
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 11:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz7A-00078L-IP; Thu, 01 Apr 2021 11:20:08 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:45353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz75-0004zP-11; Thu, 01 Apr 2021 11:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617290403; x=1648826403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYo9f7SDlCNCdGevzHDoyzuvS/DbPHgRSssBU8sS0ac=;
 b=QkRAsvBiqQuEadsx+UOcsd+B/utPdN7Msw8Ww6KbXCR+8hcp/nt9/noB
 iIxFWvsJ9RqmLPn1rR2NhoI+WnE/Kij4rWnIBxdKh6O8nWKStT74RC7Wk
 5yha9aaLqeVcfqIEbLMT04vxzh2vBwNSgfTe/2EQRQ8Zq++c7mTB0xhFi
 SLAy/z4oDu82XKZOU+kPWZkKkJ1yQTXrCmh+m6sFmLn4JGs1SEJ2Kp5kc
 m47OUl0fM0gejLaTUlo1cj32aRsX0tCXD3Wvy04WJQKy4kd3c1mcTsn8Q
 2VYkpTFEf/lABFIbV5P4Sl36xCdZS/hulaYdJHD/PlDPOW790JanS23rR w==;
IronPort-SDR: jwC9sikp3olDDp+GROheoe4UFnwrsXstZsqm3Q1SXCHifWud1A+5BBTMWac1thcHrY1zGGPxp6
 cLWDW6iuhSKrL1Z3NIDRlJib/cX+EkuLdUcqq1n8ez4BzEd+PCw6qXSTHNTd1CYvTqu/uhAcUO
 2LMrZbzAFbC/UmkJJVrbtH/tLG0NKbgwHLgll1ulUdGGSlt3SYbyNe0GmoM1MXrUNSEWHUu9eU
 U6eCi/lnnH2SpCGl3hB4wQfNBEaAIyjT2ENbX/kMFiuKX3ny+leBrDr/yysqlWN0y27LsSuygx
 HKU=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="274398272"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 23:19:48 +0800
IronPort-SDR: DjLcJkkpUHRl+TPeqh3avaQ0BxoqV0loozeQb6yS4R1xJzMrvJv8qwzO2WwaV2RruBzG+DZxY3
 BiAEC819KTaNJk5o9JLJRCFYfj1REtjMH5kEbdVPZSFDkVRDt768vciEMRnW+3CEhZ85ntHcEK
 CKc++6aHZuVh0OiBQ0zQm/iEIMasgjvaE079OWWPjfTGWjvWx8c49Hd6Jt40gelAfsMhRhtK7c
 E9hFq72fGXmVMDoCK617RAeFotp1eNiAUt2Taj+ANBFcWtB+TNCGm3RbtCDLPJDAOt6afyTiQX
 +PNPBcKwcQ/99Z4Xz7ODwxK9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 07:59:55 -0700
IronPort-SDR: pAA4CGu+RXdj2Fjtgg7JpPJmZRTS/PET+6g+ElXUZbyPWydmQbJpSVHb11BU0P3Bg5mUepGYGH
 AQBpMSHb4xVpch+B4FwBecQ3OdHrHSI5TGDVjKKlVQul867Iv8LAC0p+sZFu5SzpVmWmq64g7o
 OMaKfLgNj0SiTwoPhltNPF2bbnJdaivzktqemP/1DZ02HYKxbjndnlMqQwrUN0IEkyAnl8LNa2
 qYHpuEjLLuxjA4UXeLISilS3euo2Vbaro6XbblrAe8qYUDzJehPTlu7ai+Um9NjSLE03CRmFfs
 w4A=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Apr 2021 08:19:46 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 4/5] target/riscv: Use the RISCVException enum for CSR
 operations
Date: Thu,  1 Apr 2021 11:17:57 -0400
Message-Id: <8566c4c271723f27f3ae8fc2429f906a459f17ce.1617290165.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617290165.git.alistair.francis@wdc.com>
References: <cover.1617290165.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=718ae7c5e=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 01 Apr 2021 15:20:09 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  14 +-
 target/riscv/csr.c | 643 +++++++++++++++++++++++++++------------------
 2 files changed, 390 insertions(+), 267 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1291ddc381..7b9b9da6b7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -475,12 +475,14 @@ static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
 
 typedef RISCVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
                                                  int csrno);
-typedef int (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
-    target_ulong *ret_value);
-typedef int (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
-    target_ulong new_value);
-typedef int (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
-    target_ulong *ret_value, target_ulong new_value, target_ulong write_mask);
+typedef RISCVException (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
+                                            target_ulong *ret_value);
+typedef RISCVException (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
+                                             target_ulong new_value);
+typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
+                                          target_ulong *ret_value,
+                                          target_ulong new_value,
+                                          target_ulong write_mask);
 
 typedef struct {
     const char *name;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a82a98061b..9df65a609c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -203,57 +203,62 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 #endif
 
 /* User Floating-Point CSRs */
-static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_fflags(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
     *val = riscv_cpu_get_fflags(env);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_fflags(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_frm(CPURISCVState *env, int csrno,
+                               target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
     *val = env->frm;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_frm(CPURISCVState *env, int csrno,
+                                target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_fcsr(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
@@ -262,14 +267,15 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
         *val |= (env->vxrm << FSR_VXRM_SHIFT)
                 | (env->vxsat << FSR_VXSAT_SHIFT);
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_fcsr(CPURISCVState *env, int csrno,
+                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
 #endif
@@ -279,59 +285,68 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
     }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vtype(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->vtype;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vl(CPURISCVState *env, int csrno,
+                              target_ulong *val)
 {
     *val = env->vl;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vxrm(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     *val = env->vxrm;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vxrm(CPURISCVState *env, int csrno,
+                                 target_ulong val)
 {
     env->vxrm = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vxsat(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->vxsat;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vxsat(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     env->vxsat = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vstart(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = env->vstart;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vstart(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     env->vstart = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* User Timers and Counters */
-static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_instret(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (icount_enabled()) {
@@ -342,10 +357,11 @@ static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 #else
     *val = cpu_get_host_ticks();
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_instreth(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (icount_enabled()) {
@@ -356,46 +372,50 @@ static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 #else
     *val = cpu_get_host_ticks() >> 32;
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 #if defined(CONFIG_USER_ONLY)
-static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_time(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     *val = cpu_get_host_ticks();
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_timeh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = cpu_get_host_ticks() >> 32;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 #else /* CONFIG_USER_ONLY */
 
-static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_time(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
 
     if (!env->rdtime_fn) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     *val = env->rdtime_fn(env->rdtime_fn_arg) + delta;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_timeh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
 
     if (!env->rdtime_fn) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     *val = (env->rdtime_fn(env->rdtime_fn_arg) + delta) >> 32;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Machine constants */
@@ -449,22 +469,26 @@ static const char valid_vm_1_10_64[16] = {
 };
 
 /* Machine Information Registers */
-static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_zero(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
-    return *val = 0;
+    *val = 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mhartid(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mhartid(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->mhartid;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Machine Trap Setup */
-static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mstatus(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->mstatus;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
@@ -476,7 +500,8 @@ static int validate_vm(CPURISCVState *env, target_ulong vm)
     }
 }
 
-static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mstatus(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     uint64_t mstatus = env->mstatus;
     uint64_t mask = 0;
@@ -507,16 +532,18 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mstatush(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
 {
     *val = env->mstatus >> 32;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mstatush(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     uint64_t valh = (uint64_t)val << 32;
     uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
@@ -527,26 +554,28 @@ static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
 
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_misa(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     *val = env->misa;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_misa(CPURISCVState *env, int csrno,
+                                 target_ulong val)
 {
     if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
         /* drop write to misa */
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     /* 'I' or 'E' must be present */
     if (!(val & (RVI | RVE))) {
         /* It is not, drop write to misa */
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     /* 'E' excludes all other extensions */
@@ -554,7 +583,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
         /* when we support 'E' we can do "val = RVE;" however
          * for now we just drop writes if 'E' is present.
          */
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     /* Mask extensions that are not supported by this hart */
@@ -585,55 +614,63 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
 
     env->misa = val;
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_medeleg(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_medeleg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->medeleg;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_medeleg(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_medeleg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     env->medeleg = (env->medeleg & ~delegable_excps) | (val & delegable_excps);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mideleg(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mideleg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->mideleg;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mideleg(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mideleg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
         env->mideleg |= VS_MODE_INTERRUPTS;
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mie(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mie(CPURISCVState *env, int csrno,
+                               target_ulong *val)
 {
     *val = env->mie;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mie(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mie(CPURISCVState *env, int csrno,
+                                target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mtvec(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mtvec(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->mtvec;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mtvec(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
     if ((val & 3) < 2) {
@@ -641,92 +678,105 @@ static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
     } else {
         qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n");
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mcounteren(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
+                                      target_ulong *val)
 {
     *val = env->mcounteren;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
+                                       target_ulong val)
 {
     env->mcounteren = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
-static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mscounteren(CPURISCVState *env, int csrno,
+                                       target_ulong *val)
 {
     if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     *val = env->mcounteren;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
-static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mscounteren(CPURISCVState *env, int csrno,
+                                        target_ulong val)
 {
     if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     env->mcounteren = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Machine Trap Handling */
-static int read_mscratch(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mscratch(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
 {
     *val = env->mscratch;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mscratch(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mscratch(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     env->mscratch = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mepc(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mepc(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
 {
     *val = env->mepc;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mepc(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mepc(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     env->mepc = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mcause(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mcause(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
 {
     *val = env->mcause;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mcause(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mcause(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     env->mcause = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mbadaddr(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
 {
     *val = env->mbadaddr;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mbadaddr(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     env->mbadaddr = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                   target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_mip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_value,
+                              target_ulong new_value, target_ulong write_mask)
 {
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
@@ -743,42 +793,47 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
         *ret_value = old_mip;
     }
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Supervisor Trap Setup */
-static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_sstatus(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
     *val = env->mstatus & mask;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_sstatus(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
 
-static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vsie(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     /* Shift the VS bits to their S bit location in vsie */
     *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_sie(CPURISCVState *env, int csrno,
+                               target_ulong *val)
 {
     if (riscv_cpu_virt_enabled(env)) {
         read_vsie(env, CSR_VSIE, val);
     } else {
         *val = env->mie & env->mideleg;
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vsie(CPURISCVState *env, int csrno,
+                                 target_ulong val)
 {
     /* Shift the S bits to their VS bit location in mie */
     target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
@@ -796,16 +851,18 @@ static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
         write_mie(env, CSR_MIE, newval);
     }
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_stvec(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_stvec(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->stvec;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_stvec(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
     if ((val & 3) < 2) {
@@ -813,72 +870,83 @@ static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
     } else {
         qemu_log_mask(LOG_UNIMP, "CSR_STVEC: reserved mode not supported\n");
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_scounteren(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_scounteren(CPURISCVState *env, int csrno,
+                                      target_ulong *val)
 {
     *val = env->scounteren;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_scounteren(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_scounteren(CPURISCVState *env, int csrno,
+                                       target_ulong val)
 {
     env->scounteren = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Supervisor Trap Handling */
-static int read_sscratch(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_sscratch(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
 {
     *val = env->sscratch;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_sscratch(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_sscratch(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     env->sscratch = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_sepc(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_sepc(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     *val = env->sepc;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_sepc(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_sepc(CPURISCVState *env, int csrno,
+                                 target_ulong val)
 {
     env->sepc = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_scause(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_scause(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = env->scause;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_scause(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_scause(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     env->scause = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_sbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_sbadaddr(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
 {
     *val = env->sbadaddr;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_sbadaddr(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     env->sbadaddr = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                    target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
+                               target_ulong *ret_value,
+                               target_ulong new_value, target_ulong write_mask)
 {
     /* Shift the S bits to their VS bit location in mip */
     int ret = rmw_mip(env, 0, ret_value, new_value << 1,
@@ -889,8 +957,9 @@ static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
-static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                   target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_sip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_value,
+                              target_ulong new_value, target_ulong write_mask)
 {
     int ret;
 
@@ -906,32 +975,34 @@ static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
 }
 
 /* Supervisor Protection and Translation */
-static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_satp(CPURISCVState *env, int csrno,
+                                target_ulong *val)
 {
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         *val = 0;
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     } else {
         *val = env->satp;
     }
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_satp(CPURISCVState *env, int csrno,
+                                 target_ulong val)
 {
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
     if (validate_vm(env, get_field(val, SATP_MODE)) &&
         ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
     {
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-            return -RISCV_EXCP_ILLEGAL_INST;
+            return RISCV_EXCP_ILLEGAL_INST;
         } else {
             if ((val ^ env->satp) & SATP_ASID) {
                 tlb_flush(env_cpu(env));
@@ -939,11 +1010,12 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
             env->satp = val;
         }
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Hypervisor Extensions */
-static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hstatus(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->hstatus;
     if (!riscv_cpu_is_32bit(env)) {
@@ -952,10 +1024,11 @@ static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
     }
     /* We only support little endian */
     *val = set_field(*val, HSTATUS_VSBE, 0);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hstatus(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     env->hstatus = val;
     if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) != 2) {
@@ -964,35 +1037,40 @@ static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
     if (get_field(val, HSTATUS_VSBE) != 0) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hedeleg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->hedeleg;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     env->hedeleg = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hideleg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->hideleg;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hideleg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     env->hideleg = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                   target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
+                               target_ulong *ret_value,
+                               target_ulong new_value, target_ulong write_mask)
 {
     int ret = rmw_mip(env, 0, ret_value, new_value,
                       write_mask & hvip_writable_mask);
@@ -1002,8 +1080,9 @@ static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
-static int rmw_hip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                   target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_hip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_value,
+                              target_ulong new_value, target_ulong write_mask)
 {
     int ret = rmw_mip(env, 0, ret_value, new_value,
                       write_mask & hip_writable_mask);
@@ -1013,103 +1092,119 @@ static int rmw_hip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
-static int read_hie(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hie(CPURISCVState *env, int csrno,
+                               target_ulong *val)
 {
     *val = env->mie & VS_MODE_INTERRUPTS;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hie(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hie(CPURISCVState *env, int csrno,
+                                target_ulong val)
 {
     target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
 
-static int read_hcounteren(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
+                                      target_ulong *val)
 {
     *val = env->hcounteren;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hcounteren(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
+                                       target_ulong val)
 {
     env->hcounteren = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_hgeie(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hgeie(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hgeie(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hgeie(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_htval(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_htval(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->htval;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_htval(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_htval(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     env->htval = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_htinst(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_htinst(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = env->htinst;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_htinst(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_htinst(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_hgeip(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hgeip(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hgeip(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hgeip(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_hgatp(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_hgatp(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->hgatp;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_hgatp(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     env->hgatp = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
+                                      target_ulong *val)
 {
     if (!env->rdtime_fn) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     *val = env->htimedelta;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
+                                       target_ulong val)
 {
     if (!env->rdtime_fn) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_is_32bit(env)) {
@@ -1117,162 +1212,185 @@ static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
     } else {
         env->htimedelta = val;
     }
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
+                                       target_ulong *val)
 {
     if (!env->rdtime_fn) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     *val = env->htimedelta >> 32;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
+                                        target_ulong val)
 {
     if (!env->rdtime_fn) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Virtual CSR Registers */
-static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
 {
     *val = env->vsstatus;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vsstatus(CPURISCVState *env, int csrno,
+                                     target_ulong val)
 {
     uint64_t mask = (target_ulong)-1;
     env->vsstatus = (env->vsstatus & ~mask) | (uint64_t)val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vstvec;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vstvec(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vstvec(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     env->vstvec = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vsscratch(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vsscratch(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
 {
     *val = env->vsscratch;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vsscratch(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vsscratch(CPURISCVState *env, int csrno,
+                                      target_ulong val)
 {
     env->vsscratch = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vsepc(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vsepc(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->vsepc;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vsepc(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vsepc(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     env->vsepc = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vscause(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vscause(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = env->vscause;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vscause(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vscause(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     env->vscause = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vstval(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vstval(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = env->vstval;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vstval(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vstval(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     env->vstval = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_vsatp(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_vsatp(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     *val = env->vsatp;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_vsatp(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_vsatp(CPURISCVState *env, int csrno,
+                                  target_ulong val)
 {
     env->vsatp = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mtval2(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mtval2(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = env->mtval2;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mtval2(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mtval2(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     env->mtval2 = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_mtinst(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_mtinst(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = env->mtinst;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_mtinst(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_mtinst(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     env->mtinst = val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /* Physical Memory Protection */
-static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_pmpcfg(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
+                                   target_ulong val)
 {
     pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int read_pmpaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static RISCVException read_pmpaddr(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
 {
     *val = pmpaddr_csr_read(env, csrno - CSR_PMPADDR0);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
+                                    target_ulong val)
 {
     pmpaddr_csr_write(env, csrno - CSR_PMPADDR0, val);
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 #endif
@@ -1331,18 +1449,21 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
-        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
+        ret = csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
+        if (ret != RISCV_EXCP_NONE) {
+            return -ret;
+        }
+        return 0;
     }
 
     /* if no accessor exists then return failure */
     if (!csr_ops[csrno].read) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-
     /* read old value */
     ret = csr_ops[csrno].read(env, csrno, &old_value);
-    if (ret < 0) {
-        return ret;
+    if (ret != RISCV_EXCP_NONE) {
+        return -ret;
     }
 
     /* write value if writable and write mask set, otherwise drop writes */
@@ -1350,8 +1471,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         new_value = (old_value & ~write_mask) | (new_value & write_mask);
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
-            if (ret < 0) {
-                return ret;
+            if (ret != RISCV_EXCP_NONE) {
+                return -ret;
             }
         }
     }
-- 
2.31.0


