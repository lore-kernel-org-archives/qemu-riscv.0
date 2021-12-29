Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2One-00059L-8N
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Onc-00051r-8a
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:44 -0500
Received: from [2607:f8b0:4864:20::1031] (port=35736
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Ona-0004hC-Jq
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso10070635pje.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xjd75YbG8F4ei39H9LGmQ6t+9PDsY+VwGpDiNki4ndE=;
 b=lfM9hLTYAnq+74RAiJTfr9weT+gC1UMI64PElE8X9YDxqX+GFkgRbB4XjOU8noF04G
 z1xoJdB4Fhrv9dpCqqExgBI4ORHb2JnezdC0/knr05gctpXZDoAVQRNpkMoe+PUB9a6+
 ObDgNcYzDND/lZa0Cn7/SbOORY2OlUtJGGR1sqWdYBmkuJgQU7gbzv+wpDdorgEbWYFt
 RF3ATU2ELB3dDtVzAC3Dkfzm5/Gv310jpvx0QPNNJl30eC4x4lgq79vVbWGTRJpIwWou
 xaefTONKH5yPbeAl7gdXCTm8uLEaw5LloCPIGTFa37Bqp+HAYS9aSwmqVfLcRI+idh/5
 CmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xjd75YbG8F4ei39H9LGmQ6t+9PDsY+VwGpDiNki4ndE=;
 b=pPX7OpylBoNeBSSdAhPx1PYOFpmbrmCFwYAxLldUEYZtWQWyT1TMK3xCHV4VDn7AfR
 b3cL88pF2y9PbB5bi7wIjtKXRcR88SrE2Ef1ZbvHjTwidxZ5hBfTr54TwQM5DDTH0jeW
 dWcOMuwfnkPP5fi+rKWCHD2JgIYxceEE71FAHPK8uSBv2T44D4Y5Md9jwIpmz4r6p0hh
 +tuFJFSYGYRjARjHC0q54/EqGNIGEeD4gVhciOQJF6NU3i7FLG2ezlSW1O25Wl/zQZ+T
 CwrHYNmzxJ4/z+HOg0A6lj0vozOAvZQh5qzd7iMuSakhT0w/lILskgRDKCbPfV/HPVqc
 +ApQ==
X-Gm-Message-State: AOAM533kMn9EyE2KBLjS+5c24H3hEayDy0pazPBJR60nBhuWO56oK/25
 4vNiqcNJvOO8AAoOe+ZIO/L5gMhA6YezKU+g
X-Google-Smtp-Source: ABdhPJz3o2/uDihfgF7Yu/oBg87dDv0WntIkO41eFtc3ERN6UYhpxy6B24Fv4XCgkO0/aoBchGaqhA==
X-Received: by 2002:a17:902:8605:b0:149:9a25:103c with SMTP id
 f5-20020a170902860500b001499a25103cmr2519834plo.155.1640745281423; 
 Tue, 28 Dec 2021 18:34:41 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 15/17] target/riscv: rvv-1.0: Add Zve32f support for widening
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:42 +0800
Message-Id: <20211229023348.12606-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:44 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c3f4dabf36..da0e501f85 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -77,6 +77,17 @@ static bool require_zve32f(DisasContext *s)
     return s->ext_zve32f ? s->sew <= MO_32 : true;
 }
 
+static bool require_scale_zve32f(DisasContext *s)
+{
+    /* RVV + Zve32f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve32f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <= MO_16 : true;
+}
+
 static bool require_zve64f(DisasContext *s)
 {
     /* RVV + Zve64f = RVV. */
@@ -2356,6 +2367,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2396,6 +2408,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2427,6 +2440,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2467,6 +2481,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2731,6 +2746,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2739,6 +2755,7 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2791,6 +2808,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
            vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
-- 
2.31.1


