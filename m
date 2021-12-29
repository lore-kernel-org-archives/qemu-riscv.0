Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnB-0003T2-7U
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On9-0003Nv-Ne
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:15 -0500
Received: from [2607:f8b0:4864:20::62b] (port=43000
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On7-0004ce-Th
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:15 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u16so14828630plg.9
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqjBR2rdF5LZaas3NxvRjCd3bRaUxrMW/OmvY9gd7hc=;
 b=QeIsN0eZuhkwirT9k+nvBabgcKZ903fJyfJ3xluLawua1TzNP0QPVm/jQ8BR2l2xii
 qwM0Bb5ocYmARu9kwZ8mITgNtcr+tA+NMBCOyJqDw56c/plLvH+IFpE9rw214zmVaX0J
 mK6icVBRdYORcbztg0gbFwjR/rpyICajgMMpiOke37SOHiql9sYENLpJat90bKAuA3BV
 +npenpBc/n1WNu0svF5fr03sGZlHnd6lwM9JJWQP2H93f1jMRj/+0goS2D8yrtNDpEGj
 F3tHLSt9vSJfIuDddfOEob/vuGZwcTxW3OfVzLn0AKC2sCtJrvNOmnGBq/uB79OhNJeH
 OSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqjBR2rdF5LZaas3NxvRjCd3bRaUxrMW/OmvY9gd7hc=;
 b=oXmc4ae5otyGRBIOTl/977XkKvcJcD3L2kzJ+JSGKZdXJbi4XKAyqnm2v15dgigGzP
 9uAGlkqSdyMOTD74TamPs2VECKZMqAFd04loVClgMBwt1Ri6vxUCgqK6Tkh0Ae8tSBmf
 PEhFH53JgB4oGhDTN7hcxuACcm8JnkUnsFMS9ceDlQqOzAvyzALxe0HCvr5pjj/bLb2y
 ykr8jsGWSJthTZwZszZpRGP1xvBdiEk9goetOIF9kE+qifYbtps1ZaWxEKgRSd6TaTRo
 O64ysKBd+u6+5EWlTXyV3r9Rd4oDXCpv3nw4rxTT/pjxjFkeK6s8SetJEAqKfpmlRZOv
 72pw==
X-Gm-Message-State: AOAM531C3/ZeUlXAP6w3R1KpMoSBZwEtiRp2QhmfWEWGheDxiRfFwRCJ
 pXUfQoJJuZ9/wduQi8TXY+Y80A==
X-Google-Smtp-Source: ABdhPJwKFB4+iK2TcS40HNz00M+uw17eCHTlw3evX1GN4khQoFmG711KiaQM/nJi5WLZbR9M7UeGaw==
X-Received: by 2002:a17:902:ea03:b0:148:ea19:557 with SMTP id
 s3-20020a170902ea0300b00148ea190557mr23950332plg.129.1640745252811; 
 Tue, 28 Dec 2021 18:34:12 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 06/17] target/riscv: rvv-1.0: Add Zve64f support for scalar fp
 insns
Date: Wed, 29 Dec 2021 10:33:33 +0800
Message-Id: <20211229023348.12606-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Zve64f extension requires the scalar processor to implement the F
extension and implement all vector floating-point instructions for
floating-point operands with EEW=32 (i.e., no widening floating-point
operations).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 41 +++++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index a1e403fe86..0aa8b7918f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
 
+static bool require_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <= MO_32 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2204,7 +2215,8 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
 
 /* OPFVV without GVEC IR */
@@ -2284,7 +2296,8 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ss(s, a->rd, a->rs2, a->vm);
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
 
 /* OPFVF without GVEC IR */
@@ -2501,7 +2514,8 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
-           vext_check_ss(s, a->rd, a->rs2, a->vm);
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
 
 static bool do_opfv(DisasContext *s, arg_rmr *a,
@@ -2566,7 +2580,8 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2579,7 +2594,8 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2600,7 +2616,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
-        require_align(a->rd, s->lmul)) {
+        require_align(a->rd, s->lmul) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         TCGv_i64 t1;
@@ -3326,7 +3343,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         unsigned int ofs = (8 << s->sew);
@@ -3352,7 +3370,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         /* The instructions ignore LMUL and vector register group. */
@@ -3403,13 +3422,15 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
-- 
2.31.1


