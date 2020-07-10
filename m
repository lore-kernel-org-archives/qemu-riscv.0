Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsci-0006JS-8E
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqen-0005pG-SN
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqem-0006sP-6E
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id md7so2454857pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ygjrrf7rRZnUnKLXc2yMhphcba8GxuFslumP6WN+l3w=;
 b=H8J0lfR09NUZ7HHXlMR9BcCcHgD2L4i3KaZ+QFZ4ZlcKGU4NH4Gd0Mu1yN6myf10Ka
 PLoGMEpqQYf2BpIsUcYszpGL79RDQMB8H+0/wnMJwFD4tl2Jiv4k8scJBFK1tAHC8TAD
 T//8VzAIUpMk7dkf5vWAtlDR4Wv2Alp6FHGNdwZ+nLGoQX9IJoIXzyEznwC0sZLh+Jq6
 YxUUqfcHrZuHhwyuq67mvLTwCihu0VVA/9bFWfUNJYx0AMFZENrBU0X/tApbjwaBxPwU
 QjxpYultUgTQb+MK4L79dOKU/zadBRZlJb7muRt1lHkDd6yYlS47CAb+ZH8xupp2Bdjm
 S4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ygjrrf7rRZnUnKLXc2yMhphcba8GxuFslumP6WN+l3w=;
 b=dR+uySJU2b4DfnAcUrz9IDjA6BIi2/dtQLIG1nq2jbcFKTEmaMaLVTa0yp01f0LH+M
 AWXHJ/GNpmwfjj7iNa0yoWGSdPN9WV3DxV4sm8s1FZNFF6PXOL2Ow8zwZyMyvlsj9fMw
 iQSc93towc55kAQxdahW8bTnFIXK8gdocGube6BggVst5DY8tdFihbz/2ZCjXCA3gTbS
 lhcNtr/Ib6jUsPeroPkgovQ/1vbVZVapyhqLA+RJhNuWwcgOeQUSJor6Z57S4uDDKxum
 0oIxf2NxLcOBU57yQy+zTEhSKomKBubrKLNcjaqg+cEOwpVzVKg004waQ3lI8S7hwqLN
 NddQ==
X-Gm-Message-State: AOAM533XUgtp+p8OorW/JJmZS0GfeYWi/jGLj3ZtsEFB5e9EBGL4y7ni
 YG92znn5p7eaoH6mZsNxx5dbMe7bFh9kpQ==
X-Google-Smtp-Source: ABdhPJyVPHyNekeLprL7Tsw6zvaKGqRoxOHeKgGFmAFO38u1ezz5zMqyOS3bBND3HY7vvMNHO//1zw==
X-Received: by 2002:a17:90a:a788:: with SMTP id
 f8mr4956070pjq.39.1594378406984; 
 Fri, 10 Jul 2020 03:53:26 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:26 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 43/65] target/riscv: rvv-0.9: widening integer reduction
 instructions
Date: Fri, 10 Jul 2020 18:48:57 +0800
Message-Id: <20200710104920.13550-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:30 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++++++--
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7d44ce7e0a..f441385f3a 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2747,8 +2747,16 @@ GEN_OPIVV_TRANS(vredor_vs, reduction_check)
 GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 
 /* Vector Widening Integer Reduction Instructions */
-GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_check)
-GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_check)
+static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    VEXT_CHECK_REDUCTION(s, a->rs2, true);
+    return true;
+}
+
+GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
 GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a7f960184b..7a10b957df 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4627,14 +4627,14 @@ GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR)
 
 /* Vector Widening Integer Reduction Instructions */
 /* signed sum reduction into double-width accumulator */
-GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t, H2, H1, DO_ADD, clearh)
-GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD, clearl)
-GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD, clearq)
+GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t,  H2, H1, DO_ADD)
+GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD)
+GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD)
 
 /* Unsigned sum reduction into double-width accumulator */
-GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t, H2, H1, DO_ADD, clearh)
-GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD, clearl)
-GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD, clearq)
+GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t,  H2, H1, DO_ADD)
+GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD)
+GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
 #define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
-- 
2.17.1


