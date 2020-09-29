Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzF-0007Cx-8C
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzB-00074N-Mo
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:32785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKz9-0002Pe-64
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id q123so5548939pfb.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tWafgA8oSgwNuMnxIky3hD8WxEu97yVsDKCsnTJt54I=;
 b=ZQ8lK1pwFwL1ZRiU6nbjiJyq3rCH3DYQ4AEG0dwZxvx4hPt8Zs994trcvihxbEvmW+
 IrM5luoty4t5VysShRxk8Mvbb6dJTOMH4kTTCtAa3SCL0C0voeCxOIPouekif3pdyCnK
 8AoC1+rteVg0fDkZJR1UdZ6efp0KMn7S+e568rvh/ZGiz/UlztY+xj6NnspXJnsZe5Gn
 S8Gve1ytGj433rFBbryt32p4uJBjtEPQqG+6G+VGhrkhYQYamPwncGUoByrrpkd8Sj4v
 YrzHrACNwRGiQVvxrCy2yXWR54CsLciYl1SoE6AKY5C8XNj8ns68X5v9JspQhiKrEnDD
 aSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tWafgA8oSgwNuMnxIky3hD8WxEu97yVsDKCsnTJt54I=;
 b=DF0m/Y2hsV4CLQ0dEuWBoXQHyAtln3ddQdel+gsFR93UnlkcFxi4NRR/7ixaCKFbWe
 9YAnWjvWTRisN+gNGGjbrODlvqrHWlru9MYtLLLnxb+ax3Oic0Sl7NcfJnAks2zCfEgQ
 OJ9OR8e9ZMTz2UToihbCU6n0G+8TDnK5B8mBFc8XeKcTu62+OZmGwaEu0qS7HSd6mokX
 JB4s1ZOAdXPeU8L6QRh6fz5/mRJVdW2pftpIYxMoajKE6pVhY+tU+jY8bYla8yn5glBY
 aTY14BTHnF2cOb3msJlKpnVRC6QoK2i/Qv5qQF9h13L0K7lcBKi0vZKjaazeyQc24ZN3
 FiRw==
X-Gm-Message-State: AOAM532zKFBQHJKLmepyLFUcYrUvDPRNtTamzJ+aXk4sLurEf41DZ4a6
 rpUzTu41hd8KqFJ/5t6XkONt8w==
X-Google-Smtp-Source: ABdhPJyC1lW0mOPeNkW1X//ETpZCCR47wpMfUtx9z4ZI49Bm7Pe+FCLkMv+pfkBew9BtZ8zClL16Uw==
X-Received: by 2002:a63:f84c:: with SMTP id v12mr4374589pgj.125.1601406501597; 
 Tue, 29 Sep 2020 12:08:21 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 52/68] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Wed, 30 Sep 2020 03:04:27 +0800
Message-Id: <20200929190448.31116-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:26 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0d5872830b..e2f4de6078 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2884,9 +2884,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
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
index c5048882e9..e6931466d4 100644
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


