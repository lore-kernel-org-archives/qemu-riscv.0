Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDB2C54E5D
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 17:57:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkpKY-0005Nm-PS; Thu, 14 Mar 2024 13:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkpKS-0005Ms-8e
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:57:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkpKQ-0005VR-Kw
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:57:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5dc949f998fso895576a12.3
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710439037; x=1711043837; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evOZAHsNYwcjMRU2652mVev1RqP8h/mXUWQ4dqnEWos=;
 b=lrdcxDpRIxZNkETR5QJx13inidRHRROo6xS2qo3/roeM3t2UwwnbEhmpdthlrkImnQ
 edCo8cMN0Z8yeYNXG+Hzbi4nkzzlqjJmRBPhWu4r9UPI27NPqmzc0ITEwuCevBeDDU7/
 pUS1EbEkNJA3yx/1puW1hM0BI9ZV7PwsjEmKNW9J2Ct4oob9f/R4kr2Crk0YGM9f+wFm
 ki8PWda+KYF362+PJw0Dlw7Odnbu0vqRLlbveqnGEu3ddqTspcS2G7AAHIfRL/xFFk+T
 /Xw7Ol35+zDvtysgyUWlEwhAkjmKEYTrg/gWX9oVhNjiZabQxViFAkTZQxzIiI2wNRG7
 y4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710439037; x=1711043837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evOZAHsNYwcjMRU2652mVev1RqP8h/mXUWQ4dqnEWos=;
 b=U++vVmSD+EsCnp3Nk7FOR9fTWdg9L9JKrXsTgcH0qE1QqtrLjGtT87V/+/93pgdzLH
 LSMHgad1q/mLWouxMdTH/a4MnbW6UYY/USvmo0aojReOrH40yGdFXy7PeGz6ZYo82lvK
 l/7lNwL2iqfO/kl89jM6f/kyk8v6cT1NQyYafby0MVeCUqyDzfPjkbP8BEXhtOMR8deh
 r9pUf4ipHl2BnjAHhofwAw1t3/aI58xODQibuSFeLdD5yeiOgg8mTDgZAVOsUF1W2mzr
 bGjj53LLnIZ5rNWZGu4xy3vf9OljvBShpeHrkgbn4uZR275AJ917gBeptUM3MlUUiaR4
 adAQ==
X-Gm-Message-State: AOJu0Yyf7fnYQxxmHgG0oL6v52vU3QUzM1AFFYITHPNKEyhX8dv03hKJ
 2ErtkMkgYtdSTir+AexKCjxDTupl7UDugMiNjrLCDpAttBy0gBRsTSQNJ6QlCNo=
X-Google-Smtp-Source: AGHT+IEFvBvi5Scr/SXd0VgIuJIMbEWooSyTGOQFuOH8K38TsGvajNg0+u+ezH9o+U5wuis8EDH2zA==
X-Received: by 2002:a17:902:b112:b0:1dc:fcc3:7ca1 with SMTP id
 q18-20020a170902b11200b001dcfcc37ca1mr2173858plr.20.1710439037330; 
 Thu, 14 Mar 2024 10:57:17 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b001db717d2dbbsm1991776pla.210.2024.03.14.10.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:57:16 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for 9.0 v15 02/10] trans_rvv.c.inc: set vstart = 0 in int
 scalar move insns
Date: Thu, 14 Mar 2024 14:56:56 -0300
Message-ID: <20240314175704.478276-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240314175704.478276-1-dbarboza@ventanamicro.com>
References: <20240314175704.478276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
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
2.44.0


