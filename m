Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKHvM-0002ti-66
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 04:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKHvJ-0002qd-SY; Thu, 11 Mar 2021 04:48:05 -0500
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:56843
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKHvH-0001jq-Kp; Thu, 11 Mar 2021 04:48:05 -0500
Received: from [86.56.46.35] (helo=broc.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lKHv8-0005Te-7L; Thu, 11 Mar 2021 10:47:54 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Fix read and write accesses to vsip and vsie
Date: Thu, 11 Mar 2021 10:47:38 +0100
Message-Id: <20210311094738.1376795-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.02,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 11 Mar 2021 09:48:06 -0000

The previous implementation was broken in many ways:
 - Used mideleg instead of hideleg to mask accesses
 - Used MIP_VSSIP instead of VS_MODE_INTERRUPTS to mask writes to vsie
 - Did not shift between S bits and VS bits (VSEIP <-> SEIP, ...)

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/csr.c | 68 +++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f3..4a5b362ec1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -748,30 +748,42 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
 
+static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    /* Shift the VS bits to their S bit location in vsie */
+    *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
+    return 0;
+}
+
 static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (riscv_cpu_virt_enabled(env)) {
-        /* Tell the guest the VS bits, shifted to the S bit locations */
-        *val = (env->mie & env->mideleg & VS_MODE_INTERRUPTS) >> 1;
+        read_vsie(env, CSR_VSIE, val);
     } else {
         *val = env->mie & env->mideleg;
     }
     return 0;
 }
 
-static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
+static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    target_ulong newval;
+    /* Shift the S bits to their VS bit location in mie */
+    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
+                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
+    return write_mie(env, CSR_MIE, newval);
+}
 
+static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
+{
     if (riscv_cpu_virt_enabled(env)) {
-        /* Shift the guests S bits to VS */
-        newval = (env->mie & ~VS_MODE_INTERRUPTS) |
-                 ((val << 1) & VS_MODE_INTERRUPTS);
+        write_vsie(env, CSR_VSIE, val);
     } else {
-        newval = (env->mie & ~S_MODE_INTERRUPTS) | (val & S_MODE_INTERRUPTS);
+        target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
+                              (val & S_MODE_INTERRUPTS);
+        write_mie(env, CSR_MIE, newval);
     }
 
-    return write_mie(env, CSR_MIE, newval);
+    return 0;
 }
 
 static int read_stvec(CPURISCVState *env, int csrno, target_ulong *val)
@@ -852,17 +864,25 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                    target_ulong new_value, target_ulong write_mask)
+{
+    /* Shift the S bits to their VS bit location in mip */
+    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
+                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
+    *ret_value &= VS_MODE_INTERRUPTS;
+    /* Shift the VS bits to their S bit location in vsip */
+    *ret_value >>= 1;
+    return ret;
+}
+
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
     int ret;
 
     if (riscv_cpu_virt_enabled(env)) {
-        /* Shift the new values to line up with the VS bits */
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value << 1,
-                      (write_mask & sip_writable_mask) << 1 & env->mideleg);
-        ret &= vsip_writable_mask;
-        ret >>= 1;
+        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
         ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
@@ -1121,26 +1141,6 @@ static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                    target_ulong new_value, target_ulong write_mask)
-{
-    int ret = rmw_mip(env, 0, ret_value, new_value,
-                      write_mask & env->mideleg & vsip_writable_mask);
-    return ret;
-}
-
-static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    *val = env->mie & env->mideleg & VS_MODE_INTERRUPTS;
-    return 0;
-}
-
-static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
-{
-    target_ulong newval = (env->mie & ~env->mideleg) | (val & env->mideleg & MIP_VSSIP);
-    return write_mie(env, CSR_MIE, newval);
-}
-
 static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vstvec;
-- 
2.30.1


