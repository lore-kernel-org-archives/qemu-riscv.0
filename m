Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAWdo-0003DZ-Uz
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 07:34:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWde-00038U-4l; Thu, 20 Jan 2022 07:34:03 -0500
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:37280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWdP-0001xU-Kh; Thu, 20 Jan 2022 07:33:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07600669|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.070847-5.90399e-06-0.929147;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.Mfx8eZi_1642681992; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mfx8eZi_1642681992)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 20 Jan 2022 20:33:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 22/23] target/riscv: Enable uxl field write
Date: Thu, 20 Jan 2022 20:20:49 +0800
Message-Id: <20220120122050.41546-23-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.99; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-99.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Jan 2022 12:34:08 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 28 ++++++++++++++++++++++------
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..7c87433645 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -449,6 +449,9 @@ typedef enum {
 #define COUNTEREN_IR         (1 << 2)
 #define COUNTEREN_HPM3       (1 << 3)
 
+/* vsstatus CSR bits */
+#define VSSTATUS64_UXL       0x0000000300000000ULL
+
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b11d92b51b..523d07a95e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -496,7 +496,7 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS | (target_ulong)SSTATUS64_UXL;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
@@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 {
     uint64_t mstatus = env->mstatus;
     uint64_t mask = 0;
+    RISCVMXL xl = riscv_cpu_mxl(env);
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
 
-    if (riscv_cpu_mxl(env) != MXL_RV32) {
+    if (xl != MXL_RV32) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
          */
         mask |= MSTATUS_MPV | MSTATUS_GVA;
+        if ((val & MSTATUS64_UXL) != 0) {
+            mask |= MSTATUS64_UXL;
+        }
     }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    RISCVMXL xl = riscv_cpu_mxl(env);
     if (xl > MXL_RV32) {
-        /* SXL and UXL fields are for now read only */
+        /* SXL field is for now read only */
         mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
-        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus = mstatus;
     env->xl = cpu_recompute_xl(env);
@@ -898,6 +900,9 @@ static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
 {
     uint64_t mask = sstatus_v1_10_mask;
     uint64_t sstatus = env->mstatus & mask;
+    if (env->xl != MXL_RV32) {
+        mask |= SSTATUS64_UXL;
+    }
 
     *val = int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
     return RISCV_EXCP_NONE;
@@ -907,7 +912,9 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
-
+    if (env->xl != MXL_RV32) {
+        mask |= SSTATUS64_UXL;
+    }
     /* TODO: Use SXL not MXL. */
     *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
@@ -917,6 +924,12 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+
+    if (env->xl != MXL_RV32) {
+        if ((val & SSTATUS64_UXL) != 0) {
+            mask |= SSTATUS64_UXL;
+        }
+    }
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
@@ -1380,6 +1393,9 @@ static RISCVException write_vsstatus(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
     uint64_t mask = (target_ulong)-1;
+    if ((val & VSSTATUS64_UXL) == 0) {
+        mask &= ~VSSTATUS64_UXL;
+    }
     env->vsstatus = (env->vsstatus & ~mask) | (uint64_t)val;
     return RISCV_EXCP_NONE;
 }
-- 
2.25.1


