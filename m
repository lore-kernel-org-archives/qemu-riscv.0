Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN2o-000151-4W
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 06:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN2j-00010G-Sj; Thu, 24 Jun 2021 06:57:10 -0400
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN2d-0003uN-JC; Thu, 24 Jun 2021 06:57:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436303|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00422116-8.37222e-05-0.995695;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXJpGGz_1624532218; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXJpGGz_1624532218)
 by smtp.aliyun-inc.com(10.147.41.138);
 Thu, 24 Jun 2021 18:56:58 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 01/37] target/riscv: implementation-defined constant
 parameters
Date: Thu, 24 Jun 2021 18:54:45 +0800
Message-Id: <20210624105521.3964-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.5; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-5.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 24 Jun 2021 10:57:11 -0000

ext_psfoperand is whether to support Zpsfoperand sub-extension.
pext_ver is the packed specification version, default value is v0.9.4.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c       | 31 +++++++++++++++++++++++++++++++
 target/riscv/cpu.h       |  6 ++++++
 target/riscv/translate.c |  2 ++
 3 files changed, 39 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..9d8cf60a1c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,6 +137,11 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
+static void set_pext_version(CPURISCVState *env, int pext_ver)
+{
+    env->pext_ver = pext_ver;
+}
+
 static void set_feature(CPURISCVState *env, int feature)
 {
     env->features |= (1ULL << feature);
@@ -395,6 +400,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     int priv_version = PRIV_VERSION_1_11_0;
     int bext_version = BEXT_VERSION_0_93_0;
     int vext_version = VEXT_VERSION_0_07_1;
+    int pext_version = PEXT_VERSION_0_09_4;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
@@ -420,6 +426,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     set_priv_version(env, priv_version);
     set_bext_version(env, bext_version);
     set_vext_version(env, vext_version);
+    set_pext_version(env, pext_version);
 
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
@@ -553,6 +560,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_p) {
+            target_misa |= RVP;
+            if (cpu->cfg.pext_spec) {
+                if (!g_strcmp0(cpu->cfg.pext_spec, "v0.9.4")) {
+                    pext_version = PEXT_VERSION_0_09_4;
+                } else {
+                    error_setg(errp,
+                               "Unsupported packed spec version '%s'",
+                               cpu->cfg.pext_spec);
+                    return;
+                }
+            } else {
+                qemu_log("packed verison is not specified, "
+                         "use the default value v0.9.4\n");
+            }
+            if (env->misa == RV64) {
+                if (!cpu->cfg.ext_psfoperand) {
+                    error_setg(errp, "The Zpsfoperand"
+                                     "sub-extensions is required for RV64P.");
+                    return;
+                }
+            }
+            set_pext_version(env, pext_version);
+        }
 
         set_misa(env, target_misa);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..4d20afb267 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -63,6 +63,7 @@
 #define RVF RV('F')
 #define RVD RV('D')
 #define RVV RV('V')
+#define RVP RV('P')
 #define RVC RV('C')
 #define RVS RV('S')
 #define RVU RV('U')
@@ -85,6 +86,7 @@ enum {
 
 #define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
+#define PEXT_VERSION_0_09_4 0x00000904
 
 enum {
     TRANSLATE_SUCCESS,
@@ -135,6 +137,7 @@ struct CPURISCVState {
     target_ulong priv_ver;
     target_ulong bext_ver;
     target_ulong vext_ver;
+    target_ulong pext_ver;
     target_ulong misa;
     target_ulong misa_mask;
 
@@ -293,14 +296,17 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_p;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_psfoperand;
 
         char *priv_spec;
         char *user_spec;
         char *bext_spec;
         char *vext_spec;
+        char *pext_spec;
         uint16_t vlen;
         uint16_t elen;
         bool mmu;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c6e8739614..0e6ede4d71 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -56,6 +56,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     bool ext_ifencei;
+    bool ext_psfoperand;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -965,6 +966,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->ext_psfoperand = cpu->cfg.ext_psfoperand;
     ctx->cs = cs;
 }
 
-- 
2.17.1


