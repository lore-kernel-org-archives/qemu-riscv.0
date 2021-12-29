Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnY-0004lT-C1
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnV-0004cg-RH
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:37 -0500
Received: from [2607:f8b0:4864:20::632] (port=39556
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnT-0004g3-VP
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:37 -0500
Received: by mail-pl1-x632.google.com with SMTP id h6so10988951plf.6
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dbS4H1WPWmTJSeTr7C9MaPGPN8smTAfEpWt29Vshjw=;
 b=EsVBWphDpC9rSaGDuBUEYGHN1nNriCACIFe9A+Bqq+3UEbBJQ9EDp2HlVmAsvskQ2a
 iBiqg9tlPa89j99fopbdG8xsKq0tOlmewzGDf3VsN5jXTn+gQ/nTiJX0sh+y0Q1+sHLT
 2dwdm4p2WjvLSvizJOZNauAaLLpk0sDKhBUmncgbQ9wx2n6ZqJty+h1gjTX84RFv3OOg
 DpaO93Zg2bxNNFD/WMMtWaML/uCBr+Ek3PPx7YdS9U++N+cJpLCVY8JGt3E7RwMs8k2d
 qg/853hPELM9htft6yUVLcD7zeapxVa4ufZwd/W/IxBB10kdnX+LMQK72n/geEv9SLKz
 wcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dbS4H1WPWmTJSeTr7C9MaPGPN8smTAfEpWt29Vshjw=;
 b=eI5hnN58bfUhEVa6AJq1ADv+Zd05BIJ3H4oQ4s0x9Hls0+wSgyTMzLR244wFPEQkzb
 nzwl8S9gke2C6WW2JP+CXDPox9UhMkwRrsQQhH94qTobkjPDIa+g6UPd3oU4iA1nASoc
 rv6ew03o5FSJW6KVI4MFu6huty492gDfJCNpUwRX/c8pUe4+tzJCacGpFCO74j5VB+XS
 5Z56aF8O8UwPWSMN983KkIKRl4CyjLfm39fzfRMqx4jQdGuu2h4r/9MAQc9QeGiGykCt
 SMD/AHSkto4ilCEC6i2u9GmvHo043uz9UeR2PozYpprdhFe/o5Hvnw4e0aUHeycXFTNg
 B7uQ==
X-Gm-Message-State: AOAM530xxeIa1n4uekyeEeEACWLMmV/3IANUHcsKrgxRygxVqosAaOy1
 4sj90vwjQsQGMYGxkehhl0Ft+g==
X-Google-Smtp-Source: ABdhPJzD4WfBmvgmxSTxpcitZ2eAIaIaSDYccwKtXeY3bJgsB8mM4DTGV+h3mIs/biK38ZOzxzKDvA==
X-Received: by 2002:a17:90a:fb83:: with SMTP id
 cp3mr29793983pjb.111.1640745274809; 
 Tue, 28 Dec 2021 18:34:34 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 13/17] target/riscv: rvv-1.0: Add Zve32f support for scalar fp
 insns
Date: Wed, 29 Dec 2021 10:33:40 +0800
Message-Id: <20211229023348.12606-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:38 -0000

From: Frank Chang <frank.chang@sifive.com>

Zve32f extension requires the scalar processor to implement the F
extension and implement all vector floating-point instructions for
floating-point operands with EEW=32 (i.e., no widening floating-point
operations).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c6280c7b0b..1f5a75eca7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
 
+static bool require_zve32f(DisasContext *s)
+{
+    /* RVV + Zve32f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve32f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve32f ? s->sew <= MO_32 : true;
+}
+
 static bool require_zve64f(DisasContext *s)
 {
     /* RVV + Zve64f = RVV. */
@@ -2227,6 +2238,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2308,6 +2320,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2530,6 +2543,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
            vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2596,6 +2610,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2610,6 +2625,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_ms(s, a->rd, a->rs2) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2632,6 +2648,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
@@ -3366,6 +3383,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
@@ -3393,6 +3411,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
@@ -3445,6 +3464,7 @@ static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -3452,6 +3472,7 @@ static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
-- 
2.31.1


