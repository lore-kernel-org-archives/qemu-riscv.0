Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTjv-0002Ia-Vh
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjl-0002EQ-35
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:18 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTji-0002VB-GB
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:16 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o10so5404271pgg.4
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/LJbYaigkYJgDTUepB6KVm2XsQS2TjXtcR24GUBg5MQ=;
 b=VM6aOBmBudafrrvaOAhwbyxXX6cgpmMtc4i3IrH14jmHl8xH1Wc179oJOZImkeVUrv
 Rfauk6kaJyLEUlPNgOH1kF1TuMOpGbBp5+8NXukH3hw/Xq1fEmJdQ53WK03mWSsUcrl9
 P1fRmQC+aVD2ETjqDzbtFvnxJmIe3vbXjMffH2cIrqu+mqeOTAbBB+oyFEDhGrGR9exF
 oEiEfTwDKNUUeGzRS89EqTU0QlC3t5P+LgfgvHyqbDpmdizjMHfbY+C1GS8CMT345vMb
 l1rPWc+Z8b/zqWvQa9HK5LED+cPlf11HpGIWidcbFmRnsyPGfHiFUg9jiILVb8XQNE2E
 RjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/LJbYaigkYJgDTUepB6KVm2XsQS2TjXtcR24GUBg5MQ=;
 b=Cpp1SpAC9coQC/+WawVsopVJgfOr7+StXYr6+NyrfyAZ/YvRCFonpvFWpM3N/3dAss
 tQtYn96ai3d3yG7Kg4hy0qCr7+3FK40nOi0fZMkwolqkdVHMXF0B7Zg+AlMQX34MJJbY
 S9+RjCSmq407YIJJjpOBHNxWbApYjWGH33DB4nVLPTWJAswbT4+LtoNu2EIqu5TMV2WF
 PlRHI5gytZTOgo2ETsI1CoeQCsf16kQ4BeJB92IW4QEw2zC0i9FR5ELIvuk9GSRMKXXh
 mOBL4S1lNcJdY0Zmh2k+dZ92ccwLXsWodQ3fhKgT6PL7D782JqeUtHU8ITtJ3/jRHfpE
 Tglw==
X-Gm-Message-State: AOAM532HinhwJMYMabR3R39HVk1ou8+FKT4tPzY7qjgl2lZZ65beFuKz
 +dLMO6wQ0rkHYJF9p89OIpDnaA==
X-Google-Smtp-Source: ABdhPJx7DnzP1jAduSI0qOdgwN29G3HRu7opAzO9OACmzJOaU30ypLPFX0nQt5jbbvqy0yEaHblh0g==
X-Received: by 2002:a63:4084:: with SMTP id n126mr1048574pga.80.1614309853171; 
 Thu, 25 Feb 2021 19:24:13 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 52/75] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Fri, 26 Feb 2021 11:18:36 +0800
Message-Id: <20210226031902.23656-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:24:18 -0000

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


