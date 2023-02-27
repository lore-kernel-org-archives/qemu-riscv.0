Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWI8-0003Bj-0v
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI6-00030c-5J
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:14 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI1-0004vv-Li
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:13 -0500
Received: by mail-pg1-x531.google.com with SMTP id q23so2845703pgt.7
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YfgyBDnj6MuT0mZO5HljNGb2RUFRCLedXFv4M1Hnp4=;
 b=L8G4jfDc6o4KyBdmekotOmWnM1ZTwjSatdHUehx/ZdAs1Trennd6J4cZ/0XVkvUO1T
 d0KZcSgLsSPvhhiosnKRbcyas8bWpID+PjtvIEhMAKCyiRr9L4MevsTQDFk17GIr+1BQ
 1C7T0rEugSGiVnXYFjQy3/Y9xRGwXSeoRsQ29KIeqqZzGkSinmK2OMnl0YCYCxLrdmIH
 O9LFA/BDA8VM9eB+czoIQe216OuV+iCx9RD5I2mLgrNMFttmzvWET4BGxUe9FS5rB03b
 MLJRxhU2DZ0XmI0/yXAbkaiZPCE/j89/aqTuKa+Csu8Fin96Wt/iqjJfe+Ou3oJGgCzY
 fbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0YfgyBDnj6MuT0mZO5HljNGb2RUFRCLedXFv4M1Hnp4=;
 b=OdooXMNV1KjvxIzz9DPXWjAmbjBhJ1qBJ3WX9SBM7YAxeF61r5k1P+SllbqmaKwRk+
 fJ07yUkUUc5wroLk+mbqZhrR+Y/RQhFQGU+4h8DrB5LDKIGXiHh6rjI8oUowD/ZS0cxX
 ZCFy20GL7C1S8AEj1DRdOslC7V18LqyoepVQl1YuAa9+8PCpVo+eItFmtupIUYjmu3aS
 tWkcLVP1TASMsVQOEFsDF532WOzKaYDck03kV2qTFfK6qJYP8f702IsYFN8ZnaOXcedw
 jb4ZSfxK8s1vJRHB1eT9HDVxF+soPPRv8DAJhdNi/iQ5xiQ5b7RB16QmrdZJy/L5WL6i
 fqZg==
X-Gm-Message-State: AO0yUKVLH95ej6ExSszv8KoOKwMgTEIDGd/ZhjrtszmJZV7jRW7DtHuG
 HgzZVueiJc3aLGHmMWu39nngPQ==
X-Google-Smtp-Source: AK7set/NgsH1sFJOeQnqWQMAtbDKJSqMzc7zP64jy4o4DV2ZVlFqU5fWTF+13iqdntVyrq9pYJdr9A==
X-Received: by 2002:aa7:9466:0:b0:5dc:e57:e0e7 with SMTP id
 t6-20020aa79466000000b005dc0e57e0e7mr11674590pfq.22.1677476588020; 
 Sun, 26 Feb 2023 21:43:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 09/70] target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
Date: Sun, 26 Feb 2023 19:41:32 -1000
Message-Id: <20230227054233.390271-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:14 -0000

It is easy enough to use mov instead of or-with-zero
and relying on the optimizer to fold away the or.
Use an array for the output, rather than separate
tcg_res{l,h} variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9e682f36c9..1726ec622d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7442,10 +7442,10 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
     bool part = extract32(insn, 14, 1);
     bool is_q = extract32(insn, 30, 1);
     int esize = 8 << size;
-    int i, ofs;
+    int i;
     int datasize = is_q ? 128 : 64;
     int elements = datasize / esize;
-    TCGv_i64 tcg_res, tcg_resl, tcg_resh;
+    TCGv_i64 tcg_res[2], tcg_ele;
 
     if (opcode == 0 || (size == 3 && !is_q)) {
         unallocated_encoding(s);
@@ -7456,37 +7456,39 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_resl = tcg_const_i64(0);
-    tcg_resh = is_q ? tcg_const_i64(0) : NULL;
-    tcg_res = tcg_temp_new_i64();
+    tcg_res[0] = tcg_temp_new_i64();
+    tcg_res[1] = is_q ? tcg_temp_new_i64() : NULL;
+    tcg_ele = tcg_temp_new_i64();
 
     for (i = 0; i < elements; i++) {
+        int o, w;
+
         switch (opcode) {
         case 1: /* UZP1/2 */
         {
             int midpoint = elements / 2;
             if (i < midpoint) {
-                read_vec_element(s, tcg_res, rn, 2 * i + part, size);
+                read_vec_element(s, tcg_ele, rn, 2 * i + part, size);
             } else {
-                read_vec_element(s, tcg_res, rm,
+                read_vec_element(s, tcg_ele, rm,
                                  2 * (i - midpoint) + part, size);
             }
             break;
         }
         case 2: /* TRN1/2 */
             if (i & 1) {
-                read_vec_element(s, tcg_res, rm, (i & ~1) + part, size);
+                read_vec_element(s, tcg_ele, rm, (i & ~1) + part, size);
             } else {
-                read_vec_element(s, tcg_res, rn, (i & ~1) + part, size);
+                read_vec_element(s, tcg_ele, rn, (i & ~1) + part, size);
             }
             break;
         case 3: /* ZIP1/2 */
         {
             int base = part * elements / 2;
             if (i & 1) {
-                read_vec_element(s, tcg_res, rm, base + (i >> 1), size);
+                read_vec_element(s, tcg_ele, rm, base + (i >> 1), size);
             } else {
-                read_vec_element(s, tcg_res, rn, base + (i >> 1), size);
+                read_vec_element(s, tcg_ele, rn, base + (i >> 1), size);
             }
             break;
         }
@@ -7494,19 +7496,18 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
             g_assert_not_reached();
         }
 
-        ofs = i * esize;
-        if (ofs < 64) {
-            tcg_gen_shli_i64(tcg_res, tcg_res, ofs);
-            tcg_gen_or_i64(tcg_resl, tcg_resl, tcg_res);
+        w = (i * esize) / 64;
+        o = (i * esize) % 64;
+        if (o == 0) {
+            tcg_gen_mov_i64(tcg_res[w], tcg_ele);
         } else {
-            tcg_gen_shli_i64(tcg_res, tcg_res, ofs - 64);
-            tcg_gen_or_i64(tcg_resh, tcg_resh, tcg_res);
+            tcg_gen_shli_i64(tcg_ele, tcg_ele, o);
+            tcg_gen_or_i64(tcg_res[w], tcg_res[w], tcg_ele);
         }
     }
 
-    write_vec_element(s, tcg_resl, rd, 0, MO_64);
-    if (is_q) {
-        write_vec_element(s, tcg_resh, rd, 1, MO_64);
+    for (i = 0; i <= is_q; ++i) {
+        write_vec_element(s, tcg_res[i], rd, i, MO_64);
     }
     clear_vec_high(s, is_q, rd);
 }
-- 
2.34.1


