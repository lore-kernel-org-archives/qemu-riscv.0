Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvG-0002oV-Jc
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvE-0002mT-HU
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:21 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvC-0005j8-6z
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:20 -0400
Received: by mail-pj1-x1044.google.com with SMTP id mn17so863456pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mA6WmTq0HAeTWVW9JADPKdrVVOFarnUnoSrrLmA/A+I=;
 b=Wti7+Qy45b3jYHs9Xy8mbgqEGdSM7BFOtliljG7BXGEWbbMK9RJiWprcnalthE2p6m
 O+q1HOouRAZSiJvCz1/9cYhInm+VKZ+myABMGLP2lugHqqV7iWSlrswkFtTENQ3XcgzC
 6p7DEF42AdDLD4JIeEKNtqfAnGq1jt/26isQm04kNEgI0FYp4jFGUz0ikSY51yQ3CJOe
 vyVJ8E1P/iNx2KkumbGYh0CL1+l/mkNRSDEZEvqtjxYKnJzmSiwqQ2r+bt9zn2rALPZp
 B3XKS7U2Ro22lDkfSbe3YwftGsvBHpYbDGRufotqwzyjDRdhCl2oqXOG3KD9hyv0Hnlp
 ewTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mA6WmTq0HAeTWVW9JADPKdrVVOFarnUnoSrrLmA/A+I=;
 b=fmxjp6CB9vk27AzQBPN7x9TwPAuuNUlhOKYd8veiVodtEIFQvRQLr4JJY9GnovaHpV
 FF98ZHhOqeguk9OOOyrFWg4+i2mcqlB6VCrM9hmxJFu8trotC9xh3Zf5VWeWJTS6CMtC
 9Z9FdPzV/rMSTuxAhVjkCWWodWZc2pE5gekWG72E3DK9hAcnc3NWTKTG9K5VMPJkmsW7
 8mIUy6McIBFRSkgDOk8OPlmpuHLcapEdyDD1G5GJtxDTWHV6idxSlundZZEi+Cs+tg3z
 9m+dNPRoeEujZtrdms2tAGOksxQSodmAee3Q1hs3BOnQfR79CcnZG2t74HzFa0/xOkFq
 3nQg==
X-Gm-Message-State: AOAM5332+mQVGln36ajCK9GBd0xNm6gusNQXGM1KtQH0tyh4BHuHGYPb
 50KoZHMTs0cdlCsoqoiaW7Hz5A==
X-Google-Smtp-Source: ABdhPJxawJijz3GoSVgY68jv8xFhHGiVxhuOumLtsecuLmof5ZIi1Fr6ayu3ousgh+c38+o70/jIUg==
X-Received: by 2002:a17:90a:cc:: with SMTP id v12mr8357277pjd.96.1595409616905; 
 Wed, 22 Jul 2020 02:20:16 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 37/76] target/riscv: rvv-0.9: allow load element with
 sign-extended
Date: Wed, 22 Jul 2020 17:16:00 +0800
Message-Id: <20200722091641.8834-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 09:20:21 -0000

From: Frank Chang <frank.chang@sifive.com>

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 26 ++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 3834aca9ab..6b4b7f6574 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3097,17 +3097,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 /* Integer Extract Instruction */
 
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
-                         int ofs, int sew)
+                         int ofs, int sew, bool sign)
 {
     switch (sew) {
     case MO_8:
-        tcg_gen_ld8u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld8u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld8s_i64(dest, base, ofs);
+        }
         break;
     case MO_16:
-        tcg_gen_ld16u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld16u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld16s_i64(dest, base, ofs);
+        }
         break;
     case MO_32:
-        tcg_gen_ld32u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld32u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld32s_i64(dest, base, ofs);
+        }
         break;
     case MO_64:
         tcg_gen_ld_i64(dest, base, ofs);
@@ -3162,7 +3174,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -3180,9 +3192,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-- 
2.17.1


