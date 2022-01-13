Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7yaE-0003r9-Jf
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 06:47:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7ya9-0003lP-Oq; Thu, 13 Jan 2022 06:47:53 -0500
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:58035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7ya7-00041W-Qt; Thu, 13 Jan 2022 06:47:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436623|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0405165-0.00021043-0.959273;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.Mb0bjsk_1642074467; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mb0bjsk_1642074467)
 by smtp.aliyun-inc.com(10.147.43.95); Thu, 13 Jan 2022 19:47:47 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 15/22] target/riscv: Split out the vill from vtype
Date: Thu, 13 Jan 2022 19:39:57 +0800
Message-Id: <20220113114004.286796-16-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.173; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-173.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jan 2022 11:47:55 -0000

We need not specially process vtype when XLEN changes.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/cpu_helper.c    |  3 +--
 target/riscv/csr.c           | 13 ++++++++++++-
 target/riscv/machine.c       |  5 +++--
 target/riscv/vector_helper.c |  3 ++-
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 41dcf9775a..abf217e34f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -124,6 +124,7 @@ struct CPURISCVState {
     target_ulong vl;
     target_ulong vstart;
     target_ulong vtype;
+    bool vill;
 
     target_ulong pc;
     target_ulong load_res;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b781e96657..bebcfcd009 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -57,8 +57,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
                            (maxsz >= 8);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
         flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6e4b8cd56d..8e67ff7c54 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -279,7 +279,18 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 static RISCVException read_vtype(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->vtype;
+    uint64_t vill;
+    switch (env->xl) {
+    case MXL_RV32:
+        vill = (uint32_t)env->vill << 31;
+        break;
+    case MXL_RV64:
+        vill = (uint64_t)env->vill << 63;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    *val = (target_ulong)vill | env->vtype;
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 58dd7c2fad..8cea167bca 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -124,8 +124,8 @@ static bool vector_needed(void *opaque)
 
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = vector_needed,
     .fields = (VMStateField[]) {
             VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
@@ -134,6 +134,7 @@ static const VMStateDescription vmstate_vector = {
             VMSTATE_UINTTL(env.vl, RISCVCPU),
             VMSTATE_UINTTL(env.vstart, RISCVCPU),
             VMSTATE_UINTTL(env.vtype, RISCVCPU),
+            VMSTATE_BOOL(env.vill, RISCVCPU),
             VMSTATE_END_OF_LIST()
         }
 };
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ad505ec9b2..a9484c22ea 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -52,7 +52,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         || (ediv != 0)
         || (reserved != 0)) {
         /* only set vill bit. */
-        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        env->vill = 1;
+        env->vtype = 0;
         env->vl = 0;
         env->vstart = 0;
         return 0;
-- 
2.25.1


