Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNmw-0007qy-4F
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmt-0007lF-6U
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmr-0006Sz-JQ
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id r28so9380707pga.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wAsbdEEdW0VsHEhKHigFQ1lYgGtjc9PMvUIOzqgH5ts=;
 b=Q67E6JYpViUDCBX4jLYdpmCVkXHHX8sjq9xpbXTwxXrvrz3JH9Nl2LuclE2J+rzbcy
 KtAF+CDfPVJVZPT+FYJnh8jjRG0dhccejxJLPn7f6cGy92GWZZFFTgryjlssV68aMRTU
 twjo+X3Ewieby0O4566ap3DY5cwG6QDvkbiTwknroSFbktwSMdBH2N/5lKgJyXF4AwSS
 /n685z2Dr4hnLM45X0ox3LYMBI6CW/9/GIv8EjMP40VJQgLX4hBTMDXPDP6MEe9acf8/
 Im6vnZlbT4YB3ymMEFvg5wyTtPfVkrgQUjbg3oZ+go0CsZI+r/7CAlB2htGnXKjd5ZCW
 GffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wAsbdEEdW0VsHEhKHigFQ1lYgGtjc9PMvUIOzqgH5ts=;
 b=YYs8Vx8jIzrudAWW0KJiuhdqjYuhbkWiwRyNwL+aUA1M/8+CuSJ07o8Eu7EeLxBqsG
 YSss6A65XW1WDm/pt3HgTcY8YlNarAKmLo2yvaWs+b+a+mNWdMESs9xYyer87Sg3r2b3
 XhAT7CxaamA686kbhprYWUdstBL9IFceAKjBHj/V7snDS+t2/YZWMTFIe2WyaLvOcTkm
 R3+WADFYJkg77uHJZpzDLQPEnX06pPBcu+yihvmnukgWjeWl91KG3zQRFecmEwHUS4zL
 rCgnM49djZJztMctx7XDR6hJ9/EuHNkE5afTIdGfu0sFQJ+Z0Z8rLVF0X3l0CFyRKvEV
 tEuQ==
X-Gm-Message-State: AOAM533byGMiizGeDe+2SIrWZEw90j7A37AjJyd2z2SQ7y7u/TV+BgQ3
 jG5liZfF9O8yKZ2tPUNBDjfWDQ==
X-Google-Smtp-Source: ABdhPJy2GSaMC6Gn1GPw/T+9LJ8sROquduPth4wIcHkK2n647VnTrWaBqurlyP0/2t3MJJBC2eCwGQ==
X-Received: by 2002:a62:1507:0:b0:47c:2e05:8d7a with SMTP id
 7-20020a621507000000b0047c2e058d7amr9529335pfv.30.1635498176249; 
 Fri, 29 Oct 2021 02:02:56 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 53/76] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Fri, 29 Oct 2021 16:58:58 +0800
Message-Id: <20211029085922.255197-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:59 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f5588d9832c..998247d71d9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2637,9 +2637,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
-GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
+static bool freduction_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_check(s, a) &&
+           require_rvf(s);
+}
+
+GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c95c8bd9db3..79a2c3ff3ac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4173,14 +4173,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum_number)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-- 
2.25.1


