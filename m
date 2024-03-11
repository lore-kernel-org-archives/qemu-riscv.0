Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D30EC54E60
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 14:01:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjgBc-0005Ff-I5; Mon, 11 Mar 2024 09:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjgBY-0005Cs-Es
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 09:59:25 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjgBW-0003fE-P5
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 09:59:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-29b7164eef6so2367247a91.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Mar 2024 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710165561; x=1710770361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1pgxbL4ext+eLfj8GE9V3VngjTMGW2LA/FcQ0QZgQg=;
 b=gkb6oqd/sz129hj/+aGAQVVazaIJTsJsUvcVIrgDw+2ZQNxl7VO7q93081ia4IDCwm
 VbopaVLwchd6WPss/G8RArZCAzZbNenHcHqze4o5XQLny/87+MEgQJx6KETb56HChZA/
 M6zZ8wIB+R85IaKnRdJLS8xsxvT0oGZz8l7HF8gLAmEhtWFW3WZQcZL4y6nwUtKtq+Ke
 y6NyKEOL2jEit4yuIyQvkpjZR/KHPdOAiUZTCcPVuxgrr1nvyCvotbow1O50cbLtrbxX
 EJO64jBBGUDfetYlGb1PvgIh8p76Nse9m08gZN81DyUQKzirNlS34Bx37kehmo/9mO/K
 MfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710165561; x=1710770361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1pgxbL4ext+eLfj8GE9V3VngjTMGW2LA/FcQ0QZgQg=;
 b=dgBw22y7Z3Xs7mJ8bkD1ct4duwfmPikO6x2MEx0OImj1LkCKTVGZIYmWfekYKggezl
 bv0/R2tGDuuaeb34svGhWjaQ66P2rwljrVu50KKMujJ5zVjf9P3t1+y65xO5QtoXh/mC
 QFdVZ/1H/BLaRdWjj3rcH9PagsYIrJC+MacF5i2uqreNS9yjqx3NFQpM7Ka6LUbkbkz1
 TcvNXUfoA4Ub9rlFGaHC7N0/swPLx7em/3SEB5dsrsyB0DxKFDV1eYI5XgfWV3VwiuKm
 ZFW0AYET0FHyPJys16TxjaMLiuWPWdMde5wMBW99B+J43CqIqyEeLEUFsBcP22djCbtt
 8xlg==
X-Gm-Message-State: AOJu0YxxWQzMC/kOYiqpVMIGfC3Kj7MfQLerpX5AQAQLFTDtKAUi8EYo
 H59qfMVXD25VzcQ8dFlRyGjOdFyrgDIlq2SzykL7orUvTRwaGqVMH2PVIAcmWMs=
X-Google-Smtp-Source: AGHT+IHBBcv+5sQ1SWjKA6FHNq9VnvR1huuFwmW+rlo6uzUmjiJtXFQDjmm3ziVmwWax5tRtei9lcg==
X-Received: by 2002:a17:90b:4c41:b0:29b:f981:1363 with SMTP id
 np1-20020a17090b4c4100b0029bf9811363mr2690831pjb.5.1710165561111; 
 Mon, 11 Mar 2024 06:59:21 -0700 (PDT)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 nm3-20020a17090b19c300b0029c12fa64b9sm1324920pjb.4.2024.03.11.06.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 06:59:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v11 5/7] trans_rvv.c.inc: remove redundant mark_vs_dirty()
 calls
Date: Mon, 11 Mar 2024 10:58:53 -0300
Message-ID: <20240311135855.225578-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240311135855.225578-1-dbarboza@ventanamicro.com>
References: <20240311135855.225578-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1031.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4c1a064cf6..b0f19dcd85 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2065,7 +2065,6 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
         if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
-            mark_vs_dirty(s);
         } else {
             TCGv_i32 desc;
             TCGv_i64 s1;
@@ -2083,9 +2082,8 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
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
@@ -2612,7 +2610,6 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), t1);
-            mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
             TCGv_i32 desc;
@@ -2635,9 +2632,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
 
             fns[s->sew - 1](dest, t1, tcg_env, desc);
-
-            mark_vs_dirty(s);
         }
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3560,12 +3556,11 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
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


