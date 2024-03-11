Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B504EC54E60
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 14:01:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjgBZ-0005Ck-5x; Mon, 11 Mar 2024 09:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjgBP-0005B5-MK
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 09:59:17 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjgBM-0003ci-FO
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 09:59:14 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so2884946a12.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Mar 2024 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710165551; x=1710770351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgCmMDQSmZuQF2R71f2SMhy+sJRtIk+zLEeTXoFqnr0=;
 b=EbxY0jkAhPbRvRqzM9R0nnzODDczi8852x2J7xyT408YGS/gRuGDd9Wnk8XaAovHpD
 Y2gptmhGyTOyhZoC4/bxw3L9YX6r1dGN1Z/S80DsX2V46b2kTFOR3PFpcaEXsovV5uCx
 mMHv4zhcs4sgD4S84rKIyBwSDRKs241UKJXk0DbbbZAErV35ZHQoEDzrNnJNvmeBwG7q
 QRjK+ZcoFibtwaWNmNJbc54lBEXKuZt5TwlemTZVcb0n1Bi6/5QfBvHehVaw12DCYeOc
 Opx3ezICv+UAD/j174ODtdkltdMo6o2owm+mE+FqT1fse7P8Y3PVbl1ndIPtlOij/oGM
 6G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710165551; x=1710770351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgCmMDQSmZuQF2R71f2SMhy+sJRtIk+zLEeTXoFqnr0=;
 b=tUm1CfZPdNkWsK7ytSn9Q7Igzpa3jy+5ZGlsJwEJ8+VE7q0Ef3Py3+2m055Gy5z9YE
 lmD+ISRCPO6wH/z4JKZn1+DvvYMBdvFgMDDxTP/be3kTqE1JGqWKEXmV/pdC5XTtk16s
 nZwZP4ldu0vHn+ry+c0aa7X2tL5hjhMtU0X83mKbm9VB7iLTlxuI9JhyqFimFx1ca/Np
 f9ejA+wP4/fXHLl+6p05fAZuspbnDpjdgbBjXtedqBI+8dssr5v3/aFt+HReDU08IO1g
 TmGkCwjtPFpOOOzajDeqShWauEvZy2k5fJC8Sgg3tjRtoYEJe35uCZMWQswcvHDfvZIT
 4Tlw==
X-Gm-Message-State: AOJu0YyW8Tc1reS2jJVxJw7AROiDJJs6G8ww9twXHrpINHx9RzTqyJpV
 C92Os6vkGQZ3n6i1G5KEXNhLFY1qnjG22mNaT5HazCqOlqLkMOjnIisBeYiPEHmN7+Et2/8g85q
 T
X-Google-Smtp-Source: AGHT+IFUOt8MR2fJbaU5F/KoaZFJcpcrJix7dLyCXZZ4+H6xcp5Tp8OobS98XyvaUqRVVdJ+wntFcw==
X-Received: by 2002:a17:90a:6c42:b0:29b:b4a1:4f1c with SMTP id
 x60-20020a17090a6c4200b0029bb4a14f1cmr3887682pjj.33.1710165551192; 
 Mon, 11 Mar 2024 06:59:11 -0700 (PDT)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 nm3-20020a17090b19c300b0029c12fa64b9sm1324920pjb.4.2024.03.11.06.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 06:59:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v11 2/7] trans_rvv.c.inc: set vstart = 0 in int scalar move
 insns
Date: Mon, 11 Mar 2024 10:58:50 -0300
Message-ID: <20240311135855.225578-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240311135855.225578-1-dbarboza@ventanamicro.com>
References: <20240311135855.225578-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52c.google.com
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

trans_vmv_x_s, trans_vmv_s_x, trans_vfmv_f_s and trans_vfmv_s_f aren't
setting vstart = 0 after execution. This is usually done by a helper in
vector_helper.c but these functions don't use helpers.

We'll set vstart after any potential 'over' brconds, and that will also
mandate a mark_vs_dirty() too.

Fixes: dedc53cbc9 ("target/riscv: rvv-1.0: integer scalar move instructions")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e42728990e..8c16a9f5b3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3373,6 +3373,8 @@ static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
         vec_element_loadi(s, t1, a->rs2, 0, true);
         tcg_gen_trunc_i64_tl(dest, t1);
         gen_set_gpr(s, a->rd, dest);
+        tcg_gen_movi_tl(cpu_vstart, 0);
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3399,8 +3401,9 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         s1 = get_gpr(s, a->rs1, EXT_NONE);
         tcg_gen_ext_tl_i64(t1, s1);
         vec_element_storei(s, a->rd, 0, t1);
-        mark_vs_dirty(s);
         gen_set_label(over);
+        tcg_gen_movi_tl(cpu_vstart, 0);
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3427,6 +3430,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
         }
 
         mark_fs_dirty(s);
+        tcg_gen_movi_tl(cpu_vstart, 0);
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3452,8 +3457,9 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
         do_nanbox(s, t1, cpu_fpr[a->rs1]);
 
         vec_element_storei(s, a->rd, 0, t1);
-        mark_vs_dirty(s);
         gen_set_label(over);
+        tcg_gen_movi_tl(cpu_vstart, 0);
+        mark_vs_dirty(s);
         return true;
     }
     return false;
-- 
2.43.2


