Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9day-0000zk-1k
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dal-0000uG-IU
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:47:23 -0500
Received: from [2607:f8b0:4864:20::633] (port=44921
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZl-0007e7-7U
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id v2so8068933ply.11
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KXfyIgNNfg76I5EkwaL7PW/lgAedfx1kwsBP2EJ2oo=;
 b=Vqa0YTZQ/ue8eGYogQqt6gUIpvbMd3V9vOZqAKAcdv48EyAkJ3o/fB96D+nrQaJNzK
 yeq6pA64zvOWawqfoL+GmjTV878Ev1nB3sefDuMna/NtZSm4XY5gcUKs+cHB+xOf/MYg
 AMoBGPqewF2BoECXQnYwcuToaDJ3Ur+yRc7XmlkHznSTmsYdwz+63omPN8xmwsnMdloZ
 E0Dunh+kOs32T3rEBZdfmKpFf5Vy7e45PACrkHYKJpYZqIpmGBZw//dzjbSfCPAvXWVw
 zSJnYn8+i6rriCQgz9xL7PQK7qOeV3mWGnVRs59nqpGwavq45mrN4IYskuyzVG21Gp+A
 N7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KXfyIgNNfg76I5EkwaL7PW/lgAedfx1kwsBP2EJ2oo=;
 b=xKTS27qVMmY9IxfMJWHHanSI2BACZWR/JcHtoijwnSgR3z8uDg3TV4WDsvAnt9WJNI
 AA7X+MDOVqHAjZSl6wiTsC0eIDx46idWtrc0mmkzkL28X2mAz05qUqwmB317hawvMyk8
 LTmXKwS+xR6skkzIaHNrwDleyl9WGU7QMLELfGjTAaHAvqWkTQ1qFgTKtgvhttPIRXeQ
 4hAKqR/PFr+IzxveyH1eLb60ylh7TI9y/x6UN2Q9d2qRR8LJhacbepil6rgZhDVNvq0m
 GfVgbmJ7cyQDkKKhlqhC/p5V/16KJLTDjN87coVR28eRwETnLp9csK3HEJmh7VsJWuI/
 SEZg==
X-Gm-Message-State: AOAM532Lr8c/ZTe0BZ6TDa3mjhEjZkAG/mf3Sp4xn0M7APKOA3isDiRZ
 OZ10zEe5iRemTZWlk2IuhYO1UA==
X-Google-Smtp-Source: ABdhPJx8c/i4zTQldiAU3VhUjl9mXG4q27jKqz0j7Gs8/SH+qk+dptHDpTfJ84HoBuEE3HBKEyCWYg==
X-Received: by 2002:a17:90b:4a0e:: with SMTP id
 kk14mr28092547pjb.12.1642470377345; 
 Mon, 17 Jan 2022 17:46:17 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 15/17] target/riscv: rvv-1.0: Add Zve32f support for
 widening type-convert insns
Date: Tue, 18 Jan 2022 09:45:18 +0800
Message-Id: <20220118014522.13613-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:47:24 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b02bb555a6..f2d3c9e8b9 100644
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
@@ -2358,6 +2369,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2398,6 +2410,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2429,6 +2442,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2469,6 +2483,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2733,6 +2748,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2741,6 +2757,7 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2793,6 +2810,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
            vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
-- 
2.31.1


