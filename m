Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A10CE77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBM-0004ij-7U; Fri, 20 Dec 2024 11:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZC-0004hQ-N0
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:31 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZ9-0004YR-P1
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pm0n7vEByie+dDvGA5eDUGGDm40OkWizfV+a14GV0nc=; b=lSUr7/Kv5ANreK5uaajz02yu5x
 +QBwLT+hR6tueXe4bbZvSzD/8p9ZrLCqXNT2GD2SG12gdn6C8t58PWKhim/am4G+3wis16ipbGxAC
 odz5yEEALvPoLf/KEFalLXYo9tZi6DV/dVsh5DYvSgB6+3pYMJYdCsQVote2N8FuiHckB/gEhS0Oj
 8Z0fYe3JPKtOj0GrQP5qtp2EPV011EQ54EkTZHHULHbyoV6RTMYzm1621UahoQ9HmcgVH2ilUWzfk
 p6EEKLSD41gw3DRquSFc/zjU+1s2FYMCbXGvbRDN/4ngRME6P5+jvXI3xHB8qOM/kdWbgYZ3fnsGM
 RVPlkF/A==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfD2-00ACav-NN; Fri, 20 Dec 2024 15:46:36 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 3/7] target/riscv: Add riscv big endian data flag into
 DisasContext
Date: Fri, 20 Dec 2024 15:45:31 +0000
Message-ID: <20241220154616.283933-4-roan.richmond@codethink.co.uk>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=roan.richmond@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Dec 2024 11:48:54 -0500
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Allows for endian check on load/store instructions. Keeps the BE_DATA
flag in sync with the MSTATUS MBE value.

Authored-by: Roan Richmond <roan.richmond@codethink.co.uk>
Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Co-authored-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/cpu.h                      | 2 ++
 target/riscv/cpu_helper.c               | 1 +
 target/riscv/insn_trans/trans_rvi.c.inc | 6 ++++++
 target/riscv/translate.c                | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 284b112821..18c3a2ed6b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -637,6 +637,8 @@ FIELD(TB_FLAGS, FCFI_ENABLED, 28, 1)
 FIELD(TB_FLAGS, FCFI_LP_EXPECTED, 29, 1)
 /* zicfiss needs a TB flag so that correct TB is located based on tb flags */
 FIELD(TB_FLAGS, BCFI_ENABLED, 30, 1)
+/* Indicates Big Endian (BE) data */
+FIELD(TB_FLAGS, BE_DATA, 31, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0a3ead69ea..6271c9b887 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -206,6 +206,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     }
 #endif
 
+    flags = FIELD_DP32(flags, TB_FLAGS, BE_DATA, !!(env->mstatus & MSTATUS_MBE));
     flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 96c218a9d7..76bb233a37 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -326,6 +326,9 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+
+    memop |= ctx->be_data;
+
     decode_save_opc(ctx, 0);
     if (get_xl(ctx) == MXL_RV128) {
         out = gen_load_i128(ctx, a, memop);
@@ -427,6 +430,9 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+
+    memop |= ctx->be_data;
+
     decode_save_opc(ctx, 0);
     if (get_xl(ctx) == MXL_RV128) {
         return gen_store_i128(ctx, a, memop);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bccaf8e89a..d1c8ac7fa8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -121,6 +121,8 @@ typedef struct DisasContext {
     bool fcfi_lp_expected;
     /* zicfiss extension, if shadow stack was enabled during TB gen */
     bool bcfi_enabled;
+    /* If set to Big Endian data mode */
+    MemOp be_data;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -1255,6 +1257,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
     ctx->decoders = cpu->decoders;
+    ctx->be_data = FIELD_EX32(tb_flags, TB_FLAGS, BE_DATA) ? MO_BE : MO_LE;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.43.0


