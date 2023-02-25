Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqdw-0004r4-Rj
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdu-0004nz-TM
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:58 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqds-0001QY-Dp
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:58 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h14so1853826plf.10
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
 b=KtrkV8BrlUDhgiWkKXhfJ+IjkikHl7XTjLl+UBKFkvKc7TaxwwJ9CvHBzhXE0wQB2m
 2jEAG+sE2ysGeN9gL+BKh6+TyN7XOlIW09PacKbM4/NRgvUQ0QB5tbWx2ZoFs8qZVKKr
 dI0LKxHUqSBiZkyZF0NE7eLjX6htiHhOHdPVC/Qzx6ULqzpRLwUzX9ccYP0og8FTrU9+
 Fv9SA5zWeL/VfCeY9Yx0av1rttXX49XOuIJyvN5XaYP2aUGRDpYAJoLO6jUfVHtW/vwc
 ES2VNyT1KV9SmJ0kOX8HR1vjDCLLhadyrZ578c2WsjQaLtiQcwKpcfOe5RMphXrxMaci
 tbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
 b=SV5l9b+8lWAkJjxF7kZB3KzlmuoZkiHE9QGadGvHKPUyEaSTv4ShHu7RyNeL82M2ST
 6OD+KVd+in9sC6pXkSqSnv8yfJza4uAaG3OTfVbHdUNv4sVmiCiObDjTFCxoqrs8HN2h
 b2DnA7WdQ3/Hkj4ug5enOSfdsrcXgCNp++C+DxwTOKJDWlC6auzSWH9OY5tD3lz8V1QQ
 so+6/9gaf+jbsb5WofeZT0DPIZ80c6XIxH8vRfd7thiVEBjpen+Vn9bHu2YmqvxiJPWi
 1OatEKDInADWAG8P9Fycu84AI6CM6cibE/2WqBYqhkkngpZMR+67bKDpPbjb5GdbiE3W
 Msvg==
X-Gm-Message-State: AO0yUKXV9ItnyB3IqkuZ+NtHK0SpjtRPcy/8HIC2XoFNVb9zXcmtqCMw
 p7IiA000oSTIFU5nuNrr1Hynzw==
X-Google-Smtp-Source: AK7set+NasPUHorbaZQENXc0pFQCdhUhe8127hpmUzKVZY8F0knYHHYAT5JusNGc+yzmXwCTR8Ue9Q==
X-Received: by 2002:a17:903:2291:b0:19a:b427:2335 with SMTP id
 b17-20020a170903229100b0019ab4272335mr22851992plh.56.1677316495628; 
 Sat, 25 Feb 2023 01:14:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 09/76] target/arm: Drop new_tmp_a64_zero
Date: Fri, 24 Feb 2023 23:13:20 -1000
Message-Id: <20230225091427.1817156-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:14:59 -0000

Only the use within cpu_reg requires a writable temp,
so inline new_tmp_a64_zero there.  All other uses are
fine with a constant temp, so use tcg_constant_i64(0).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c | 41 +++++++++++++++++---------------------
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 8ac126991f..0576c4ea12 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,7 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 04872d9925..b5d6508cbc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -408,13 +408,6 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-TCGv_i64 new_tmp_a64_zero(DisasContext *s)
-{
-    TCGv_i64 t = tcg_temp_new_i64();
-    tcg_gen_movi_i64(t, 0);
-    return t;
-}
-
 /*
  * Register access functions
  *
@@ -433,7 +426,9 @@ TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 TCGv_i64 cpu_reg(DisasContext *s, int reg)
 {
     if (reg == 31) {
-        return new_tmp_a64_zero(s);
+        TCGv_i64 t = tcg_temp_new_i64();
+        tcg_gen_movi_i64(t, 0);
+        return t;
     } else {
         return cpu_X[reg];
     }
@@ -1532,7 +1527,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
-                                new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11001: /* PACIASP */
@@ -1543,7 +1538,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11010: /* PACIBZ */
         if (s->pauth_active) {
             gen_helper_pacib(cpu_X[30], cpu_env, cpu_X[30],
-                                new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11011: /* PACIBSP */
@@ -1554,7 +1549,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11100: /* AUTIAZ */
         if (s->pauth_active) {
             gen_helper_autia(cpu_X[30], cpu_env, cpu_X[30],
-                              new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11101: /* AUTIASP */
@@ -1565,7 +1560,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11110: /* AUTIBZ */
         if (s->pauth_active) {
             gen_helper_autib(cpu_X[30], cpu_env, cpu_X[30],
-                              new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11111: /* AUTIBSP */
@@ -2285,7 +2280,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
                 if (op4 != 0x1f) {
                     goto do_unallocated;
                 }
-                modifier = new_tmp_a64_zero(s);
+                modifier = tcg_constant_i64(0);
             }
             if (s->pauth_active) {
                 dst = tcg_temp_new_i64();
@@ -3550,10 +3545,10 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     if (s->pauth_active) {
         if (use_key_a) {
             gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         } else {
             gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
     }
 
@@ -5628,7 +5623,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacia(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacia(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x09): /* PACIZB */
@@ -5636,7 +5631,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacib(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacib(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0a): /* PACDZA */
@@ -5644,7 +5639,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacda(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacda(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0b): /* PACDZB */
@@ -5652,7 +5647,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacdb(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacdb(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0c): /* AUTIZA */
@@ -5660,7 +5655,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autia(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autia(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0d): /* AUTIZB */
@@ -5668,7 +5663,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autib(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autib(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0e): /* AUTDZA */
@@ -5676,7 +5671,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autda(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autda(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0f): /* AUTDZB */
@@ -5684,7 +5679,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autdb(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autdb(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x10): /* XPACI */
-- 
2.34.1


