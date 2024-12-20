Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB0EE77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:50:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBO-0004kF-38; Fri, 20 Dec 2024 11:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZX-0004k0-J7
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:51 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZW-0004aq-0P
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7S2/jIeSV0gW9Zx9mfhHK7PVgIPGZZndHJsJ9c2H4uk=; b=RkEITeKf7dBdoqr77MbQlc7z8V
 ab9UtitY6GrjV/ck0H00wbqzrlYhh/3dlOi25qbUCF8GQffhjahheKD8Q1FudN0vxfWX8zLRO3RXV
 nINI++xjcfZabxpoloO/dd2YBThKQETQj6tuuJYQa0bRh2ejhvGq6B9KA22mGccg/4lO/OKf90wxx
 SlmEn1D52Xudi3jHlDKbKuUuwbwMdm0aSLsxYS7orURNfxy23KPS6CDLrZNhjVpEbwqdcOt6vR58J
 OoHw5uZ5o+gwRhuXTE2I2ZL8Rr4QmrxylotUGMcAI9aZCztxaN0raqog8VfUi9Sq3ABhQP+l//wKY
 +CuxpXBA==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfD4-00ACav-UV; Fri, 20 Dec 2024 15:46:39 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 5/7] target/riscv: Add big endian check for atomic ops
Date: Fri, 20 Dec 2024 15:45:33 +0000
Message-ID: <20241220154616.283933-6-roan.richmond@codethink.co.uk>
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

From: Ben Dooks <ben.dooks@codethink.co.uk>

Modified the Zacas atomic load and store instructions to handle big or
little endian data.

Authored-by: Ben Dooks <ben.dooks@codethink.co.uk>
Co-authored-by: Roan Richmond <roan.richmond@codethink.co.uk>
Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/insn_trans/trans_rva.c.inc     | 4 ++++
 target/riscv/insn_trans/trans_rvzacas.c.inc | 8 ++++----
 target/riscv/translate.c                    | 2 ++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 9cf3ae8019..9e5468b155 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -34,6 +34,8 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv src1;
 
+    mop |= ctx->be_data;
+
     decode_save_opc(ctx, 0);
     src1 = get_address(ctx, a->rs1, 0);
     if (a->rl) {
@@ -61,6 +63,8 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
+    mop |= ctx->be_data;
+
     decode_save_opc(ctx, 0);
     src1 = get_address(ctx, a->rs1, 0);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc b/target/riscv/insn_trans/trans_rvzacas.c.inc
index 15e688a033..a3946121ca 100644
--- a/target/riscv/insn_trans/trans_rvzacas.c.inc
+++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
@@ -25,7 +25,7 @@
 static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
 {
     REQUIRE_ZACAS(ctx);
-    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TESL);
+    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TESL | ctx->be_data);
 }
 
 static TCGv_i64 get_gpr_pair(DisasContext *ctx, int reg_num)
@@ -88,10 +88,10 @@ static bool trans_amocas_d(DisasContext *ctx, arg_amocas_d *a)
     REQUIRE_ZACAS(ctx);
     switch (get_ol(ctx)) {
     case MXL_RV32:
-        return gen_cmpxchg64(ctx, a, MO_ALIGN | MO_TEUQ);
+        return gen_cmpxchg64(ctx, a, MO_ALIGN | MO_TEUQ | ctx->be_data);
     case MXL_RV64:
     case MXL_RV128:
-        return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TEUQ);
+        return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TEUQ| ctx->be_data);
     default:
         g_assert_not_reached();
     }
@@ -123,7 +123,7 @@ static bool trans_amocas_q(DisasContext *ctx, arg_amocas_q *a)
     tcg_gen_concat_i64_i128(dest, destl, desth);
     decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
     tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx,
-                                (MO_ALIGN | MO_TEUO));
+                                (MO_ALIGN | MO_TEUO | ctx->be_data));
 
     tcg_gen_extr_i128_i64(destl, desth, dest);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d1c8ac7fa8..90125baf61 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1101,6 +1101,8 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
         mop |= MO_ALIGN;
     }
 
+    mop |= ctx->be_data;
+
     decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
     src1 = get_address(ctx, a->rs1, 0);
     func(dest, src1, src2, ctx->mem_idx, mop);
-- 
2.43.0


