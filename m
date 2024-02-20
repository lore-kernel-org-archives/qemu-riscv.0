Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC25BC48BC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 22:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcYZz-0003jB-Q5; Tue, 20 Feb 2024 17:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rcYYV-0002Sf-5U
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 17:25:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rcYYS-0003as-Pj
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 17:25:38 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d746ce7d13so40956635ad.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 14:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708467934; x=1709072734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYo30v7en8CVRQ433AMJs0Zn41Yvafyb8U7LnFnarII=;
 b=d/tKKqW67lY2KY6FGnDX222GZxLoVooR/oB/1SUjAXpMrZ8tLt++87LZZNXuSiCCJW
 57h1SkftA/zywDaj5yQQD0sJYZByti4bZdLcqKVntHz2NOBN14yZLwZT3TVL1fsir37R
 V2WomQ/eNdC8f7CegMqbKEWUVVDxnQTfLYByBTEC8WavG1FfMHJTol1C4fDRuCr0A50W
 eBOmGMAyie7uCSnpGAXqBhC3fIYWWIP0BTIZKtQNuD10S9dl+OzOKvsEhAQi1raGovrK
 J5VjkcIgTt/+/KQTNEaMOZcBTq0W4SgCDdeh21kg5AJus6rqxWTTSrFnKUFGWGHW63Qk
 Fl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708467934; x=1709072734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYo30v7en8CVRQ433AMJs0Zn41Yvafyb8U7LnFnarII=;
 b=pGJyVLmbUfT/lAs0hNE4D2e9R6LDkhwBwAxr4O0k6H3+I3KYZR+mTjXFsEFI4Ml8I6
 +56Y76g8cYflbgHgDyC43Sxfj/czXb/klozxVRCMM8Jw0RYxEPstP028xlqfs/aHamsx
 x7mRmorn+xOA7EGaqSWA26hPjb6+FjeFD5OK+GtXeBG+anbTbpCSwcLFREljWO9QdBKZ
 NUfB/ev6LA2U40lScM49pGdXks62xZCdOH2FVVPHGYV2+5wwAW0ixSvDDAC2uQyqhZoS
 VWzQwTxQPF6hFadkP56lh9N4jHgx24KcXPMy8bn72cnyQboceFmCASUEjgX+dVPy4apV
 WzYw==
X-Gm-Message-State: AOJu0Yw23g6veclcB+v+JqOQBk0L4IAtpeG79zd89hEdJNX7EJh5C2Ms
 RDeEUb3ZvWEHLLi306gFe5WJ5dJxQP526lPhHD+eHw5c5q1nRgOpzbx1fbysiBU=
X-Google-Smtp-Source: AGHT+IEzO2TirRMgX8/L4toetl30jamza480CNdzYgC523jN8H4WxNZJdqk3oBcwuiQAqIBShze+JQ==
X-Received: by 2002:a17:902:d4c3:b0:1dc:10a5:8be7 with SMTP id
 o3-20020a170902d4c300b001dc10a58be7mr4888389plg.50.1708467934681; 
 Tue, 20 Feb 2024 14:25:34 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 iw20-20020a170903045400b001dbb86b88e5sm6761044plb.124.2024.02.20.14.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 14:25:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 5/6] trans_rvv.c.inc: remove redundant mark_vs_dirty() calls
Date: Tue, 20 Feb 2024 19:25:09 -0300
Message-ID: <20240220222510.209448-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240220222510.209448-1-dbarboza@ventanamicro.com>
References: <20240220222510.209448-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

trans_vmv_v_i , trans_vfmv_v_f and the trans_##NAME macro from
GEN_VMV_WHOLE_TRANS() are calling mark_vs_dirty() in both branches of
their 'ifs'. conditionals.

Call it just once in the end like other functions are doing.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 58299d9bb8..8c9a0246ef 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2044,7 +2044,6 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
         if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
-            mark_vs_dirty(s);
         } else {
             TCGv_i32 desc;
             TCGv_i64 s1;
@@ -2062,9 +2061,8 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
                                               s->cfg_ptr->vlenb, data));
             tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, tcg_env, desc);
-
-            mark_vs_dirty(s);
         }
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -2591,7 +2589,6 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), t1);
-            mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
             TCGv_i32 desc;
@@ -2614,9 +2611,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
 
             fns[s->sew - 1](dest, t1, tcg_env, desc);
-
-            mark_vs_dirty(s);
         }
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3524,12 +3520,11 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         if (s->vstart_eq_zero) {                                        \
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),                \
                              vreg_ofs(s, a->rs2), maxsz, maxsz);        \
-            mark_vs_dirty(s);                                           \
         } else {                                                        \
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
                                tcg_env, maxsz, maxsz, 0, gen_helper_vmvr_v); \
-            mark_vs_dirty(s);                                           \
         }                                                               \
+        mark_vs_dirty(s);                                               \
         return true;                                                    \
     }                                                                   \
     return false;                                                       \
-- 
2.43.2


