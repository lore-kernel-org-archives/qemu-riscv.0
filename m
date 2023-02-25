Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqeR-0005bh-D1
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeQ-0005aT-5h
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:30 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeO-0001hD-AP
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:29 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l1so1434875pjt.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
 b=AiWna2/ArJ2tfXdT1g741YHhKMGSZ2G0hB1m3JocFUP+JV2UD/r+yWocFeMJXGgYVx
 yF7k5IqRIgzX5nd8PtJ8lUtuYni/fP1AaZNzl56MKBoHTRb7yjhpgEuLABV70hWdfUiX
 ld9S3KJHyXUSpkWYKfu19i8XnxlAcGu31yssLscqBbz5yVqJ2aVXxr4halMRSkRcIiiI
 pfr9Nmx4PtuUdpQEx8Wqj1ptiKh5rktbKDN893cLv4pClpBukt8oHwB8cz4WAjbvzjq7
 4QCnU2tl8LQ+lnm0P/l1lrKrzSD/ptAH3EpdkW/FW+eo6FmSdjyAO7liaNpv8nslNTD5
 XHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
 b=t9DVHmwYiTiTyFQxbtpP92zadrNNmag3MGrvu4yGUC7ltHD5ReX0IShuVIOw9MJWdA
 /7/YwDBpSrTFGRqtX9K5I4Hb9G9gXl9hWi0k0XbIytmRg08BmFH16Z/9IGGtriq6P5Hn
 HtQ4nhLZyeyJ3QxgJAiooAJVd0HQ+blgF2o+T9uw3mWvHwhpQZHzna7Pq1YahJmcGvB7
 skKi0myZNWdIe6JhtPI9jmCp+KduTTAX1veBUhJGYUDVnJ04eq4ySnqGiNWkiuhPnndU
 xCanNmqjdj1JVbqSADbVbN5+U+AUSk1j49GF61JGLMGTBYGyYSXm0VZfPfPKDAOyw+GS
 +AxA==
X-Gm-Message-State: AO0yUKW9FiRfxiMZnDohQ9+dC9Xoax8Ft8k+bcKTZjhD5qwoxPdaKDs7
 q4SeIj91v5FmM1j0Ipuv8eHHVQ==
X-Google-Smtp-Source: AK7set/ekVb1rUHG9DUXnuBh17cotCIOTah8Lm6DOR6/QOkuhRRLZ55nfwbyLiz18ZQ2iHDVpGr90Q==
X-Received: by 2002:a17:902:e5d0:b0:19a:80e6:2a21 with SMTP id
 u16-20020a170902e5d000b0019a80e62a21mr25498823plf.33.1677316527371; 
 Sat, 25 Feb 2023 01:15:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 21/76] target/cris: Drop cris_alu_free_temps
Date: Fri, 24 Feb 2023 23:13:32 -1000
Message-Id: <20230225091427.1817156-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:30 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a959b27373..76db745fe2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1467,14 +1467,6 @@ static inline void cris_alu_alloc_temps(DisasContext *dc, int size, TCGv *t)
     }
 }
 
-static inline void cris_alu_free_temps(DisasContext *dc, int size, TCGv *t)
-{
-    if (size != 4) {
-        tcg_temp_free(t[0]);
-        tcg_temp_free(t[1]);
-    }
-}
-
 static int dec_and_r(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -1488,7 +1480,6 @@ static int dec_and_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1518,7 +1509,6 @@ static int dec_lsl_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSL, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1535,7 +1525,6 @@ static int dec_lsr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1552,7 +1541,6 @@ static int dec_asr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_ASR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1568,7 +1556,6 @@ static int dec_muls_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULS, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1584,7 +1571,6 @@ static int dec_mulu_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULU, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1610,7 +1596,6 @@ static int dec_xor_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_XOR, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1639,7 +1624,6 @@ static int dec_cmp_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1666,7 +1650,6 @@ static int dec_add_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1755,7 +1738,6 @@ static int dec_or_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_OR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1796,7 +1778,6 @@ static int dec_neg_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_NEG, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1825,7 +1806,6 @@ static int dec_sub_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
-- 
2.34.1


