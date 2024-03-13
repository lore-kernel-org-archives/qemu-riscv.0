Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F12C54E58
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 22:03:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkWgP-0007aU-Bg; Wed, 13 Mar 2024 18:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkWfr-0007OY-TH
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 18:02:13 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkWfq-0004JR-0T
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 18:02:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e6b75211ceso385661b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710367328; x=1710972128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1pgxbL4ext+eLfj8GE9V3VngjTMGW2LA/FcQ0QZgQg=;
 b=hpuWcTMFzrBRzzh2zoD79qVKHxVr/w9Dw4qdcbr5C9lB0rAO9sOFdbbxpAkKOI/rrC
 4NjAopwLUaP1VC9nUBsrzjq2V0ellK1ucIZm06WwWZlrZOKZjnmIXMFLqGZK8EUPCMEO
 xpLItscv/jhIRIYxMnjA39H3C6yA3BmcSKMJXvLAiIoYMVw1k/kQg1uVo9l7SpFLaruk
 toNOeOFnbOhSUfZslfR8ZzI7K3L6KZRIY0goss8fevG+BO87hQ5NrwWeNh6HbCBBYLi0
 vq153eROtO6l/pThHuYIFjXE5wyCH9nNNqQb0pcaChO6K9aJ9kNS6YuKaNxdcReVcEBy
 CMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710367328; x=1710972128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1pgxbL4ext+eLfj8GE9V3VngjTMGW2LA/FcQ0QZgQg=;
 b=EAYJXWB2iLmbYjTyon+KnqosU3P3ipvB3TXIaoVC5qusaH/nBJ95zua7fjl2SSRkPG
 cdN+ZDsV/1yU6/VjRUQpXKk0vEm+z90LccweZ4iC9nAYZHWiwWz54v/ZD16qHaXJ3mka
 n5jGNJMFSGz39mgyZaeOSZKXlLvs+kcPZBk9aPseCu/wV0GfwBP9TFrrobGIt4S5lKCX
 IAIp5aWTD5eMDjh+zS+C2RxqaPzW4KkfwPJZIv0Ms/xuwypzM5T4an0dqgZOhT2r9lHU
 ZSvljfXIzt14yHKLnDWyZ9wPrWz/gCbtgkXe88eWg7nDoOPejCqyOnJ/yNtmP65V6KRr
 g1eQ==
X-Gm-Message-State: AOJu0YxbaH7ggCu5x5UfvxRAA35L2MKdsEu0IzGkcRzyREJD/iqV9gKj
 GIYLyK8SkvmoPsNgBCEKV7T9LcJlUaBo1SiDD3TLZs4TtFuwQadHputsF3PbpZA=
X-Google-Smtp-Source: AGHT+IGp/Ln0kwRIHpnc6obWnua89IWtM3mpNckKU/0OTEFw8CCNOy+L4CP2xmYDa9z0crLdcdqO+g==
X-Received: by 2002:a05:6a00:3901:b0:6e6:5343:c165 with SMTP id
 fh1-20020a056a00390100b006e65343c165mr23688pfb.16.1710367327972; 
 Wed, 13 Mar 2024 15:02:07 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 ln17-20020a056a003cd100b006e6bcbea9e0sm95812pfb.88.2024.03.13.15.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 15:02:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v14 6/8] trans_rvv.c.inc: remove redundant
 mark_vs_dirty() calls
Date: Wed, 13 Mar 2024 19:01:39 -0300
Message-ID: <20240313220141.427730-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313220141.427730-1-dbarboza@ventanamicro.com>
References: <20240313220141.427730-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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


