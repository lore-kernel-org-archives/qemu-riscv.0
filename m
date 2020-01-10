Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ippPy-00034J-9W
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jan 2020 03:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1ippPv-00030V-4Y
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 03:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1ippPt-0004i0-Kf
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 03:13:15 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:55682)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ippPq-00043Z-V1; Fri, 10 Jan 2020 03:13:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436327|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.299832-0.0160038-0.684164;
 DS=CONTINUE|ham_alarm|0.228253-0.000291776-0.771455; FP=0|0|0|0|0|-1|-1|-1;
 HT=e01l07447; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.GZbTVKh_1578643981; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GZbTVKh_1578643981)
 by smtp.aliyun-inc.com(10.147.41.158);
 Fri, 10 Jan 2020 16:13:03 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, chihmin.chao@sifive.com,
 jimw@sifive.com, bmeng.cn@gmail.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 3/3] remove redundant check for fpu csr read and write
 interface
Date: Fri, 10 Jan 2020 16:12:20 +0800
Message-Id: <20200110081220.891-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200110081220.891-1-zhiwei_liu@c-sky.com>
References: <20200110081220.891-1-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 10 Jan 2020 08:13:16 -0000

The read or write interface must be called after the predicate fs return 0.
And the predicate will check (!env->debugger && !riscv_cpu_fp_enabled(env)),
S0 no need to check again.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index da02f9f0b1..0c2b8fc8f6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -107,11 +107,6 @@ static int pmp(CPURISCVState *env, int csrno)
 /* User Floating-Point CSRs */
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -1;
-    }
-#endif
     *val = riscv_cpu_get_fflags(env);
     return 0;
 }
@@ -119,9 +114,6 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -1;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
@@ -130,11 +122,6 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -1;
-    }
-#endif
     *val = env->frm;
     return 0;
 }
@@ -142,9 +129,6 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -1;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
@@ -153,11 +137,6 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -1;
-    }
-#endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
     return 0;
@@ -166,9 +145,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -1;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-- 
2.23.0


