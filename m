Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGDC-0006QW-Im
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDA-0006Mt-RW
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:36 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGD8-0008G9-SI
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:36 -0500
Received: by mail-pl1-x62c.google.com with SMTP id be12so1122309plb.4
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/LJbYaigkYJgDTUepB6KVm2XsQS2TjXtcR24GUBg5MQ=;
 b=agEF+Eq+aRx/Dr7TFweaSmH3sA+7M3vMwzdWwqqsN5vFOZBeF9r6QI39c0Qd9iECwO
 saq22GV7gzjTV+9TEmdGzLjTzsxpmJ+L0f9cdte2HW65ic19oFb1mj/3EkuXhRioxGHV
 m5Iau1I2bFnm/Fif1pMYrMKLcWFhN62nhwgrMu+wiMo+lXp81icIf1DNJBCzuwHcD3cq
 tHsRHqBUmM6nvE0asUNn3U/TdgJ2O4ln6P4m9dN9UkjgXGSEF//IeMjy2giKklZZG5uQ
 kUTWWJKt/VLRvzjXhqzfKgcx4FXrJbuLv34h9hb/xknShnb5fOwH8GiiLyOD2EBeKRuw
 823Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/LJbYaigkYJgDTUepB6KVm2XsQS2TjXtcR24GUBg5MQ=;
 b=cb+2fNk+T/WQtyYTnOPYq9QzlKLgv7xrPyYTvuntwTkFBbErkpw2rbeosaCHF5NXx+
 UdqH7wAKdEpCC13TWPQh7tYotKdZ3ncGpdAHxFhl6fifgc7a4zYUZH0SmTtPfdq53xuN
 UYstRelhI+yvIgO6thCA4I5t6zZU4eK7p/y/sh/Iu//gKGLBfZKpMMcaO3qVWahhucU2
 GXynMqbuUxJEWrGTTpzyDrIRF5SrlI7t5ko2J7/YVTLjkyMn3LpUvPiAjHUyfInctQOr
 9X+i4sooi6bINRANqYKbxyLE9t7Z912OoY+Bw1kPuyDiBXdgjXvlFgcB0jkTD6dmOjlO
 lHjA==
X-Gm-Message-State: AOAM530fin30DTI0AInz7QRSEvonfirIeqBTdQ1fjR4xJVdhSe+CUCGH
 3t/iDs2RGIUS2XBOnnKE4vFWSw==
X-Google-Smtp-Source: ABdhPJzoq3aC8kQ3VCKTCY4SF8zUz0Mn/r/+umLctUWTged0/4zMAostjU4Y1f47C3SR+EAJ1NLgiA==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id
 r7mr3803228pjr.33.1610444613796; 
 Tue, 12 Jan 2021 01:43:33 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 52/72] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Tue, 12 Jan 2021 17:39:26 +0800
Message-Id: <20210112093950.17530-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 731c4bdd04b..c4ccccb0370 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2866,9 +2866,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
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
index c5048882e91..e6931466d40 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4382,14 +4382,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum_noprop)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum_noprop)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum_noprop)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum_noprop)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum_noprop)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum_noprop)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-- 
2.17.1


