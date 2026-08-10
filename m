Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799F9C5AE5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 05:58:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtJ1f-0004Ro-Rb; Mon, 10 Aug 2026 01:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtJ03-00040C-M5
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:56:39 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtJ01-0007mn-T7
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:56:39 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-84a4d8fd6ecso1571016b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 22:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786341396; x=1786946196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=64CMGN31294nAEJtyRhT/fogu+ligZ1n2U+FSvAoY8M=;
 b=WsouamMw5ll1M76dyGv8pqVHBma5WfSVHxSepL2IX6BZ1/XHJOWKCe+QIibCm5IJXF
 EYk/1aOTB7+hyxAoAs0jf/aMK8sVSokNlP69G9SKJXVM/kWDzRI1D8zCj0S5jDkmiHCW
 AGxn9Hj89pFGiMGu/KlacBwxxDPMZbKBTiswsSqFqv8QmwvPmBhhU8x/U1/baEkZdqde
 kMBeJFQtVJmcaXYE/zit2epRlEd6N+xGwpzr22CHfgELISKFY/htfrt+PU9YZyu9SxAT
 ouwpw7yqQLQ6emXMHddkkC59R3lPCoQttClXbMWTSUcbn88KukC2Obom87cNkoLLVOp7
 ImBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786341396; x=1786946196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=64CMGN31294nAEJtyRhT/fogu+ligZ1n2U+FSvAoY8M=;
 b=o2/hbZ4M9uQSi950RopAyJOk694aocZdI3ZCnq/smeDRLPc2q/2zM9D3sG1HE9y9Wr
 XLxCd5DMvSTo6q6MmMcIifHCX2dCRtay9inStL7n2S2TGWm2v6EJ3wvHmEUEexYP/W5a
 0CTrDfD1Y5wPZFLU9NXKbL94JVreY8J1OxeqvspJfvQrQPINS01XAT/bw8Ch6FNO+lCl
 AltR80ylh55gXGtlaYX8mlUOhK93UICazARWULlMS74rPlOcFC3NaM/PZrKRV6KrCuk6
 0m3HZrBX0WuuRrn8gHdrXCpnrpkyjp0l6TcVZg6XGPtwvYNxf+BCZlabux9hkt5vE1SS
 lpNw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqr8gJGijY3LHf1Qbm9BtuOXgApKkIbFmlwlmuDe2DVgYg7RoC2dGJ/nbxqWdklgi+0VLNonX/OLTJe@nongnu.org
X-Gm-Message-State: AOJu0YzcDi91ZnjSo6GMbHK0p37OQtMxwj4S3C1nO6gZFstkLWQhEStV
 sNHt/odxodwKclnsp6cMsNcBHt1fststA4T77OAHHXJ03DlDcMxCl5H1Z8Ctj5ba1Edd+aJhe1N
 9BPLJ
X-Gm-Gg: AR+sD11DAp6gzZYr9McIZUGU7NId9auTj3VP91qWzNTTTNqxUmaq0svNeD0uCIAyOsQ
 KeY4eqn9tfH+TDhFoydlP5LwgWvF1hj60xwBnGI4V99/v8tM1CnHMP9JZ4t42ntA7+oAYiZB3bT
 J7kI6NCDrjuslKT+xMyGd+4blrUrFIh0Wtisp5AUsBHvMmM78rsPCmxgkYl6mz98XkSH4k64gUh
 CYn3tIZsqhAf+eNlKFV0UkPZ1TdqZU5VR4zdwjpL6Jh3IZAC1FiUaCFiKw2DdyihA1EzziuS6ed
 XBg9uyzetRDy+Hrmdm+tAGAieIMT5O9xaryhigRR5bK2F85hlc3HFRu0+JY09g8b3GmEC3Si1eT
 0IVMzQYsG9lK1IecoYUri2Bmx0tU0/a2ftukmxz2NHCfWOsZ4n1TkLJAkbfQWLsNsV9R7jMtToe
 exu2QImUQyDnY5DBXAEwuh3u8L6DgKgImUxGO0jrAh5mcUnXybgDep+/e26myCZOI1UApRRozGQ
 gbMyWfGjOwPUaY=
X-Received: by 2002:a05:6a20:d52f:b0:3c3:9070:96b3 with SMTP id
 adf61e73a8af0-3cbce6caba0mr20533561637.3.1786341396511; 
 Sun, 09 Aug 2026 22:56:36 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315be86fc7bsm39172122eec.1.2026.08.09.22.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 22:56:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 4/7] target/riscv: Support raising misaligned exceptions
 for floating-point loads/stores
Date: Mon, 10 Aug 2026 13:56:15 +0800
Message-ID: <20260810055618.1175500-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810055618.1175500-1-frank.chang@sifive.com>
References: <20260810055618.1175500-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Frank Chang <frank.chang@sifive.com>

When the Zicclsm extension is not enabled, raise misaligned load/store
exceptions for misaligned accesses from floating-point load/store
instructions (RVF, RVD, Zfh).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/insn_trans/trans_rvd.c.inc   | 6 ++++++
 target/riscv/tcg/insn_trans/trans_rvf.c.inc   | 6 ++++++
 target/riscv/tcg/insn_trans/trans_rvzfh.c.inc | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/target/riscv/tcg/insn_trans/trans_rvd.c.inc b/target/riscv/tcg/insn_trans/trans_rvd.c.inc
index 3b9a745520a..1be2bee9465 100644
--- a/target/riscv/tcg/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvd.c.inc
@@ -61,6 +61,9 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
         memop |= MO_ATOM_IFALIGN;
     }
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
@@ -86,6 +89,9 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
         memop |= MO_ATOM_IFALIGN;
     }
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
diff --git a/target/riscv/tcg/insn_trans/trans_rvf.c.inc b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
index e935523c93c..481f7282da7 100644
--- a/target/riscv/tcg/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
@@ -52,6 +52,9 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
@@ -75,6 +78,9 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
diff --git a/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc b/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
index f36b46c2118..88711fb0769 100644
--- a/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
@@ -50,6 +50,9 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -75,6 +78,9 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
-- 
2.43.0


