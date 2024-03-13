Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5D6C54E66
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 22:02:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkWfv-0007OS-9t; Wed, 13 Mar 2024 18:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkWfo-0007Ns-TE
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 18:02:09 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkWfc-0004IQ-3g
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 18:02:08 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6e6bee809b8so373581b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710367315; x=1710972115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgCmMDQSmZuQF2R71f2SMhy+sJRtIk+zLEeTXoFqnr0=;
 b=FcLUht3Jl4ztI0Xs93QZnyFKt60nFXmdMPaM7Wv7b7EFoJJDSiHWLpk7JGVcA0Qt+2
 HdS8bDJuN3jzX6SWym75pw//tB/ghVQ0JuY4GxCx++BgOVcPyu3VrYyNvGFjvdakPiMU
 3ATXWXYIJt5Te965Nr0ie1I8O9hFbJzOt5fHJX+S3NkP5DoMLp3SuwhYNJ+80Jfv3Bz6
 YkKLPin4kbJoiD+nOiLileZFm8lkgxoUjqNf6d0e+lgNHHefoA0963my3X1AjFX6htKx
 xPW2j+6FM+Vsdc8a9tRW8NZzYJsWA5VzGp3t/sdEWwB1laFRPcnPXIuKY+g1LzAbft06
 j40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710367315; x=1710972115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgCmMDQSmZuQF2R71f2SMhy+sJRtIk+zLEeTXoFqnr0=;
 b=nn6+QzrGx9IHRWp3qicRZJ/5X9bzWzZ2DbPj2D6QfAIouxLBu2sLGDDjEmzXyiGoE4
 VuFhcilarvHJWlGh/zGUXrM/Da6wPSJnh0YRhU/oNDFpQEoec+/itMN3LlWedez8pJRz
 WWpSg75tq8UDp5fqJtMDRrbaamsPJGzGC9QwfNXeVXoaC6TeDKmKKj/C42NtTJPFdSRr
 hy48AyXBSFv2e/MqOGMXRHqe0IvNkfel+zzsL/lU9Ctwmwe/oTWd2qLfanimj/eDOz+I
 u2jPQsIhZsv3VhGe713vZOdapQRX2GPT9d0WKWsmT0Z4GZVpAWUo9MNGByHSY9qM8h15
 YKcQ==
X-Gm-Message-State: AOJu0YyhTXkEI4hl9BT1a4H7Zgr6ziNqsRnGY8FTS861CLwVA9nVk8Xr
 KkuK2dmOZ4TE/ZoW82pgZRObuIETeDWI2unCVnI+7KNtm0QcVNfS4coM7gwsJy4=
X-Google-Smtp-Source: AGHT+IGNiU2Ud1v0MUvDfJ7c5mrHDTOIZFsFdPrs3ba/09te0l464Q8gmGcUt24N5ZKbx1mt8RpHsQ==
X-Received: by 2002:a05:6a20:7f9d:b0:1a3:3c59:9db8 with SMTP id
 d29-20020a056a207f9d00b001a33c599db8mr254265pzj.39.1710367314775; 
 Wed, 13 Mar 2024 15:01:54 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 ln17-20020a056a003cd100b006e6bcbea9e0sm95812pfb.88.2024.03.13.15.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 15:01:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v14 2/8] trans_rvv.c.inc: set vstart = 0 in int scalar
 move insns
Date: Wed, 13 Mar 2024 19:01:35 -0300
Message-ID: <20240313220141.427730-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313220141.427730-1-dbarboza@ventanamicro.com>
References: <20240313220141.427730-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


