Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2096C54788
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 21:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcuDE-0006nI-Vj; Wed, 21 Feb 2024 16:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rcuCO-0005Di-At
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 16:32:17 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rcuCK-0004Qu-7w
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 16:32:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1dbae7b8ff2so33199085ad.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Feb 2024 13:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708551131; x=1709155931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5LCx7JhXHyytKCEItKxM1b4nM5nHTxwBLWu1fnIZs8=;
 b=SJo5o93+l2pubxn1jcHH8EjUjzu657bLcLvVeAOwRkqjVnzZyW8a+IcQ9ZaguByo8P
 +CYr4AV3caKB+BXHjauTdPOC968a9E5xzHXCQnlrK8DAJr/Y6E5eVKgTJD8qC1WNTRyf
 7Meb8ses9Pj/q3M5OdzCokL4dS6nS22BL9IlEeFyDWF1M1fFD2/hB2JK2gpmygyhI6on
 /NR2Vh73IiJcLYRTqadizJ8nZuPdCWXzTbxkEkr6LXzF9O90g3MtYaCDqA9r+5RtJl6n
 1PeagBCRc0vrWv8Ztfn059TMv6a1a5fYuf93zU9aZrgtBpwC26+yBXRTW3LjiOWCiuXg
 cOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708551131; x=1709155931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5LCx7JhXHyytKCEItKxM1b4nM5nHTxwBLWu1fnIZs8=;
 b=OjKVCOWXVzDnENA889aal71Qdsjcs2IPAtiCVACiObWxAWhfolJ/XUJB6twK1WGr+z
 MHOMzy83hIAB8yAD3xP3vACAQTwkQt9r3zmtiikQg/SL0UPaUOiM9dAEuMo3L+FJT5bZ
 5CHN83LymG/ZOu0FjHP8DPQCtJL7YaTXdJ3xH7+LNe8R9vm3XXKNssiC0auEN13+GYxH
 jb5Xn3uTeEl+zVJO+AwUed/MJ0B04K4LYzgwgaF920K4nacUs54hBN76tLbeXd1jxXC9
 ZJpts/Lk5f6ebsZWGKwZsgzSyWyxeNduAE9O3sYeXVFabSejJzcHHYp8VyRaAuV/QytK
 miyw==
X-Gm-Message-State: AOJu0YxvFui3CvD+NpLPb4uOUoILiyGDC5U/KwKyiqf9bj97ydkIlWBv
 xjH+b/JtU225t+qDssr6ObsRuFKG9NmCRrbWXkA5gLeTuAM7bkuWzr/1P5i1rr8=
X-Google-Smtp-Source: AGHT+IFlTMx8ksrccuDJazO8Z9tREJOG35AN0AzH2+GLooXkFQr5rBDylORAFbC2OKxi0SEYM7ynKQ==
X-Received: by 2002:a17:902:e882:b0:1dc:f0e:4e with SMTP id
 w2-20020a170902e88200b001dc0f0e004emr8662359plg.12.1708551130887; 
 Wed, 21 Feb 2024 13:32:10 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a170902ee9300b001dbb0348733sm6618051pld.67.2024.02.21.13.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:32:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 7/9] trans_rvv.c.inc: remove redundant mark_vs_dirty() calls
Date: Wed, 21 Feb 2024 18:31:38 -0300
Message-ID: <20240221213140.365232-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221213140.365232-1-dbarboza@ventanamicro.com>
References: <20240221213140.365232-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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
index 69f32d081e..db08efa278 100644
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


