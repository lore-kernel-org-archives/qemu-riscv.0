Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A35C54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 17:20:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhuvv-0007oj-Gm; Wed, 06 Mar 2024 12:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuvn-0007j8-Dx
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:19:53 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuve-0000ZX-39
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:19:49 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dcab44747bso424885ad.1
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 09:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709745580; x=1710350380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyujL+gBJnyXc4btQWbM8dsePlAWzhj7CULgQEyCEx4=;
 b=Z6T+RA1u/sSCcQv0SpirXSi/XRp8xvPuYgKJ7tbS8HK76sZbZcy/F0OVPLRYwe1BO0
 /+MICV2uKZxsfpG4oTNB0ytMDZ46FAEy4EXWTKvuv1SR+ZzQhbYHY7Mg0qfQE/zTGfJb
 c1Y24o/q1XuUy34Vys4JqRkmnLLUzuH5ONaBx6lCnLMmF2v11V/NVWYnq7TpgB6IOvla
 uNYudu+Koy8nA5dwLMnZU0x+Bk7KxTHuI3HwfX4vcZoKsC7pwSvgTScDDe0GmWab66Mo
 GmUPQ0CaHFRuJBr49lbvxNk10IeGrmumDa56uyS4gee+MGQ3y9jYjEl6uQNW9GgDuzrJ
 MveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709745580; x=1710350380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyujL+gBJnyXc4btQWbM8dsePlAWzhj7CULgQEyCEx4=;
 b=gkijVV9vHvte0AvfAL+nWQZz6jApHiXLnKOfU+Xcmtm6jIPX/nb8zr7j9XRi2fLPUo
 1ngPA3TawVdUFR3dIz7Cuul1ZmBIYJJxMgmkdJeYfP75JxGY8AIgYB2HIZEaX766VQ71
 6+q7YvjQJEPuPS+S4baary5rbUm3p90VdsrCbE0tGoGUOyK3jOqxaVe3pQzzO2Sx7HlC
 gEpuXdk1Ppr6EJZFtmIT8taa3TKuHGUy2M43EkP0/Y+XvrLAcQXVvtIlzAMmxscjgbVT
 K8l4BmPiBTpneQtQsK8owTCYUty7jmHMOsyivN3G+8OmV0x/Rt0ltUMxVcESo2sVCs/g
 6OXQ==
X-Gm-Message-State: AOJu0Yxje4A+mQ21+9aj1fz5fEpTLEj37ZY+rWsGmkEHs9M9xvAIin0k
 ItijrpvTz0ikpkA+T79FEA4oSfZm4GTQS/GGxrgdR3trlxnOAq+sBHw7+TRuJAo=
X-Google-Smtp-Source: AGHT+IHKwk9FU5UHVHqZe6EyWawkYE/Tu4Q6EETkYSJFRlthHm75kmynDsB47Mu0JP+X7bZYlfp/HQ==
X-Received: by 2002:a17:902:d4d1:b0:1dc:fce2:3084 with SMTP id
 o17-20020a170902d4d100b001dcfce23084mr7214693plg.7.1709745580406; 
 Wed, 06 Mar 2024 09:19:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170902c71100b001dbb6fef41fsm12869712plp.257.2024.03.06.09.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:19:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 1/9] trans_rvv.c.inc: mark_vs_dirty() before loads and
 stores
Date: Wed,  6 Mar 2024 14:19:24 -0300
Message-ID: <20240306171932.549549-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306171932.549549-1-dbarboza@ventanamicro.com>
References: <20240306171932.549549-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While discussing a problem with how we're (not) setting vstart_eq_zero
Richard had the following to say w.r.t the conditional mark_vs_dirty()
calls on load/store functions [1]:

"I think it's required to have stores set dirty unconditionally, before
the operation.

Consider a store that traps on the 2nd element, leaving vstart = 2, and
exiting to the main loop via exception. The exception enters the kernel
page fault handler. The kernel may need to fault in the page for the
process, and in the meantime task switch.

If vs dirty is not already set, the kernel won't know to save vector
state on task switch."

Do a mark_vs_dirty() before both loads and stores.

[1] https://lore.kernel.org/qemu-riscv/72c7503b-0f43-44b8-aa82-fbafed2aac0c@linaro.org/

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 742008f58b..b838b8ea5b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -652,16 +652,14 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
 
+    mark_vs_dirty(s);
+
     fn(dest, mask, base, tcg_env, desc);
 
     if (!is_store && s->ztso) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
-
     gen_set_label(over);
     return true;
 }
@@ -817,11 +815,9 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, base, stride, tcg_env, desc);
+    mark_vs_dirty(s);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
+    fn(dest, mask, base, stride, tcg_env, desc);
 
     gen_set_label(over);
     return true;
@@ -924,11 +920,9 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(index, tcg_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, base, index, tcg_env, desc);
+    mark_vs_dirty(s);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
+    fn(dest, mask, base, index, tcg_env, desc);
 
     gen_set_label(over);
     return true;
@@ -1122,11 +1116,10 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
     base = get_gpr(s, rs1, EXT_NONE);
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
 
+    mark_vs_dirty(s);
+
     fn(dest, base, tcg_env, desc);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
     gen_set_label(over);
 
     return true;
-- 
2.43.2


