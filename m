Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml3C8-0006rY-SH
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3C6-0006mi-45; Thu, 11 Nov 2021 01:04:18 -0500
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:51600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3C3-0003sa-Lz; Thu, 11 Nov 2021 01:04:17 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437331|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0599752-0.000428917-0.939596;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr22uTb_1636610649; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr22uTb_1636610649)
 by smtp.aliyun-inc.com(10.147.42.16); Thu, 11 Nov 2021 14:04:10 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 12/20] target/riscv: Split out the vill from vtype
Date: Thu, 11 Nov 2021 13:57:52 +0800
Message-Id: <20211111055800.42672-13-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 06:04:18 -0000

We need not specially process vtype when XLEN changes.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/cpu_helper.c    |  3 +--
 target/riscv/csr.c           | 13 ++++++++++++-
 target/riscv/machine.c       |  1 +
 target/riscv/vector_helper.c |  3 ++-
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9fba876e08..52ce670cbe 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -119,6 +119,7 @@ struct CPURISCVState {
     target_ulong vl;
     target_ulong vstart;
     target_ulong vtype;
+    bool vill;
 
     target_ulong pc;
     target_ulong load_res;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a40ed6d748..9b9dc83ab9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -78,8 +78,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     if (riscv_has_ext(env, RVV)) {
         uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
         flags = FIELD_DP32(flags, TB_FLAGS, SEW,
                     FIELD_EX64(env->vtype, VTYPE, VSEW));
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6bb2d09519..8f8f170768 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -286,7 +286,18 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 static RISCVException read_vtype(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->vtype;
+    uint64_t vill;
+    switch (cpu_get_xl(env)) {
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
index 19e982d3f0..2161bc80ca 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
             VMSTATE_UINTTL(env.vl, RISCVCPU),
             VMSTATE_UINTTL(env.vstart, RISCVCPU),
             VMSTATE_UINTTL(env.vtype, RISCVCPU),
+            VMSTATE_BOOL(env.vill, RISCVCPU),
             VMSTATE_END_OF_LIST()
         }
 };
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4..b02ccefa4d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -38,7 +38,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
 
     if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
-        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        env->vill = 1;
+        env->vtype = 0;
         env->vl = 0;
         env->vstart = 0;
         return 0;
-- 
2.25.1


