Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHye-0002nv-Bc
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyd-0002jA-6t
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:50:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyb-0004aj-Ar
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:50:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t11so5872042plq.11
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p5/5s6FKa6MzrMjEpRi/bH2ffo4p/FZohyK66WL6fZM=;
 b=nR/YKCQmlcrpmD8Y7l/iOy6V9n/ah7bVivYChurzT8k+3f/+3QWSgWEauUGRth7vZO
 iPhVJGNf8yLUsIErSscogv0I1CSK4yPcQH8BpZzEV/O5L5KcXrqXyqRWcgpCJoiSkPAp
 9sJm0dy7s9MfSzyelQdeWulUtO1/qq5PvFPS9ecEt+nCsnQhqUCNDaMPc5Jln9XnOuzB
 O91SFQq2sG125/qhdFBQM+oPcQLyKL5HWVjysrQWtZXphRe5r5bffY9FaQ6m1pOA2TOF
 7aFzT3+/y8u74YMiiAdnMesL4eYiXf37fKlYaadQcRsVIooIb3OLlk+yNkvWAN+DJfaY
 bn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5/5s6FKa6MzrMjEpRi/bH2ffo4p/FZohyK66WL6fZM=;
 b=0PZrhU3W48IhkoQ5nHB8K+ETqUDF+GgNFmh8m+EGnGngRucfhk15HeADtz0JBqg11M
 Vye/8FBhdTzZ068NwAqGiCGbxIEmsBFQTKr9GO98VkGc/GjCeTCswEBuD7cBTAgKRzl+
 CckCpPqw7LfiSwL1iIl51qqYi00tTYeLLxye9qKwxzs+WMqRbt6swKCP++7O4ze8L/Wi
 PNtyGVSG9BGrdfD/hdHxlBuLREMCbbxGQ4G5i2z87No4bRqpOXaG5ytDolyn8tDZuAOc
 KDbcoIsfgrFo3qTERkVZTSVcEZDHbHhyCfX4ClRUYi6UoRKhzip14lLUhhISXe/xcsLi
 3KWQ==
X-Gm-Message-State: AOAM533w7OE/1jLD2Cf1oTv5FWZaWmTLID/epjNlXT9WPcqpxLquim6/
 c/PTN+tGImblsuDekGt2lZtucw==
X-Google-Smtp-Source: ABdhPJxIBFh3XmssFTBTjxVVlqMXf5g9/9+t+R9W8MUjvoznDQBdsNLWKMGvshcAGBDaIQW6KlPObw==
X-Received: by 2002:a17:90a:f0c9:: with SMTP id
 fa9mr26245270pjb.107.1634284200023; 
 Fri, 15 Oct 2021 00:50:00 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 53/78] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Fri, 15 Oct 2021 15:46:01 +0800
Message-Id: <20211015074627.3957162-61-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:50:03 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ef54f8e04fa..0c171a25930 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2636,9 +2636,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
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
index c95c8bd9db3..17633ac2792 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4173,14 +4173,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
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
2.25.1


