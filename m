Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ippPy-00033u-4A
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jan 2020 03:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1ippPu-00030Q-LN
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 03:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1ippPt-0004gr-Ff
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 03:13:14 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:33090)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ippPq-00043J-Hi; Fri, 10 Jan 2020 03:13:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07460611|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.195573-0.0212168-0.78321;
 DS=CONTINUE|ham_alarm|0.0142393-0.000318846-0.985442; FP=0|0|0|0|0|-1|-1|-1;
 HT=e01l04364; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.GZbTVKh_1578643981; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GZbTVKh_1578643981)
 by smtp.aliyun-inc.com(10.147.41.158);
 Fri, 10 Jan 2020 16:13:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, chihmin.chao@sifive.com,
 jimw@sifive.com, bmeng.cn@gmail.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 2/3] RISC-V: use FIELD macro to define tb flags
Date: Fri, 10 Jan 2020 16:12:19 +0800
Message-Id: <20200110081220.891-2-zhiwei_liu@c-sky.com>
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

FIELD is more unified to define tb flags. It is easier to add new
filed to tb flags.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h       | 15 +++++++++------
 target/riscv/translate.c |  5 +++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e59343e13c..8efd4c5904 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -282,22 +282,25 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_MMU_MASK   3
-#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
+FIELD(TB_FLAGS, MMU, 0, 2)
+FIELD(TB_FLAGS, FS, 13, 2)
 
 static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
+                                        target_ulong *cs_base, uint32_t *pflags)
 {
+    uint32_t flags = 0;
     *pc = env->pc;
     *cs_base = 0;
+
 #ifdef CONFIG_USER_ONLY
-    *flags = TB_FLAGS_MSTATUS_FS;
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, MSTATUS_FS);
 #else
-    *flags = cpu_mmu_index(env, 0);
+    flags = FIELD_DP32(flags, TB_FLAGS, MMU, cpu_mmu_index(env, 0));
     if (riscv_cpu_fp_enabled(env)) {
-        *flags |= TB_FLAGS_MSTATUS_FS;
+        flags = FIELD_DP32(flags, TB_FLAGS, FS, (env->mstatus & MSTATUS_FS));
     }
 #endif
+    *pflags = flags;
 }
 
 int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ab6a891dc3..5de2d11d5c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -735,10 +735,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cs->env_ptr;
     RISCVCPU *cpu = RISCV_CPU(cs);
+    uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
-    ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
-    ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
+    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MMU);
+    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
     ctx->priv_ver = env->priv_ver;
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
-- 
2.23.0


