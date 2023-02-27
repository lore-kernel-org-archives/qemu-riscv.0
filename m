Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJZ-00080l-5s
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJN-00079U-3p
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:33 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJF-0005TX-7t
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:31 -0500
Received: by mail-pf1-x434.google.com with SMTP id u20so2791552pfm.7
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LajvWmI+pLtygQsSP7BRlVIFeqnQdv7FpjH6OPM0h/s=;
 b=UQe/gMPPOxNpxVX3ybzi8T75p0aDK3PMe/c5PlVr1N199yb+U/rIXA8soXeBgnX7q3
 uFBRlur1kZA9xTh/YhAgBwC7x31wTXn8B3RM6DSuBh/H4tp/TAlRNtNXkuG4y72JOBA6
 zTDDQ3veI1Mcfo8PffQYkzalaDZWh75eOoAa4PlKdBRbcxvk+pin79N5wgDQVg9TU0Dr
 Ozvrzym6xya4aBmgzhnuHLCOK7GGTLvGRPpwgdQUWdbzY9g7jFVpFciy/5sa70VIPw9T
 O1VJ5UPSzOZwQrgBNd1weXWgbX3I+abxpBCHQKrNAWmq9OOjAy7PEUOVGkG76w+sbP3T
 mIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LajvWmI+pLtygQsSP7BRlVIFeqnQdv7FpjH6OPM0h/s=;
 b=lFQghfzqL3QV6VFDB3AYwLAMsYN32xh5vkMD+rIwevyGAsqrhJ85VgH2D/jJ8XOOoh
 BE9O6ahjdWza4im9fC+zMdg0fRU7sBDJOXr/UCS3OmouDY8zbNhWmkJO6Uppu8wjRPqE
 /RyZ6c8VZf1bvI0k4K5CZHJEPDfP+r04dGj0bo66RUdRoWMYy10OrS9Ja0HonLT770og
 hmtzaQltnwxpNENKh5a4c7qk1mBSn0KgrVAHxjzbLzm/nGPbPMI9vzE91tIdXn8gc9Ur
 HcoSU6Gd/m3PZ5STAoNDxumzYgI8UJoSZ358dTxW7gALliJPrlMfAMO8b9zm4qpNG4Gz
 Mzgw==
X-Gm-Message-State: AO0yUKWU1u66UAqFhwCRHIK40j5ntE8fEi0OFTSwDW4QrjOKT5AvwHwv
 r/dk7yRMryyBR/E67H5dOsPVFNsYunkWTlOxr58=
X-Google-Smtp-Source: AK7set9WchFc0caO5HdgN0mtXhZm4lmlhGabvxYJZt9wEohmJ35PL/qERhNhZuZPGhGzbz7HfwN10w==
X-Received: by 2002:aa7:9639:0:b0:5ab:be1b:c75e with SMTP id
 r25-20020aa79639000000b005abbe1bc75emr21305279pfg.24.1677476664118; 
 Sun, 26 Feb 2023 21:44:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 38/70] target/ppc: Avoid tcg_const_* in xxeval
Date: Sun, 26 Feb 2023 19:42:01 -1000
Message-Id: <20230227054233.390271-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:33 -0000

Initialize a new temp instead of tcg_const_*.
Fix a pasto in a comment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vsx-impl.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 6e63403727..9916784e64 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2449,7 +2449,8 @@ static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
     TCGv_i64 conj, disj;
 
     conj = tcg_temp_new_i64();
-    disj = tcg_const_i64(0);
+    disj = tcg_temp_new_i64();
+    tcg_gen_movi_i64(disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2492,8 +2493,9 @@ static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
     int bit;
     TCGv_vec disj, conj;
 
-    disj = tcg_const_zeros_vec_matching(t);
     conj = tcg_temp_new_vec_matching(t);
+    disj = tcg_temp_new_vec_matching(t);
+    tcg_gen_dupi_vec(vece, disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2546,7 +2548,7 @@ static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
 
     /* Equivalent functions that can be implemented with a single gen_gvec */
     switch (a->imm) {
-    case 0b00000000: /* true */
+    case 0b00000000: /* false */
         set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
         set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
         break;
-- 
2.34.1


