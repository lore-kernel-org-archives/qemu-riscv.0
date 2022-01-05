Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4vxL-0001SN-F0
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 21:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vxI-0001MQ-3M
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 21:23:13 -0500
Received: from [2607:f8b0:4864:20::102f] (port=37439
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vxF-0005Yj-ML
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 21:23:11 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so1857679pjj.2
 for <qemu-riscv@nongnu.org>; Tue, 04 Jan 2022 18:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ooreh3rb7r9FjgRMrvUAmcp7hG8h0BcZ1KVzhQuCEks=;
 b=b59hyNHvarTN5IJrwke8y/5CByJbdfgIOyh4Ye+vXZepHwe90Vyuxf1muv90QvRBwE
 UD4lPlsc90p3hbRufx1yvwbiFKvVKhNx4gbNwRlcagLx/3r8iwe8Ur9dOwbwAOb7Re8a
 t6/x10kNI7JVAk0bJB5631kAUBfhLi5tlUrrsJ58+37wHS2jVL3d0lyZUkRWz9/BH/EI
 OxOYAHvBmxUwVX0lahZ5yIEM3qbJPRljTtgvOz8YRz2nLX7aaXg5HRViS2XB2KeIYCgc
 1irsNrXg36UtJuwsY7gGxXjfpJy2jXbrp3KYDZmZQzkKPPBgwSoyKGO0US/EeIAGVwPr
 Gibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooreh3rb7r9FjgRMrvUAmcp7hG8h0BcZ1KVzhQuCEks=;
 b=pYDtxmIYXqwifLsZhXSsGvGSWGs2KO87CKn3jJTPps0U4RyzkyCXhLup+9SjG7CsFZ
 CKPZg/MIiG8OZ5bt8llLusLonCuO1qB9gOlUZ8m2PE5hLkUhBlV6x/9FS9T9l/LEIw3f
 +spiDYw7+f3MJ+fOSHlETdSv6bCyY2DF+U3gKlVBpLaUxp8VnbhWcEF9PUPGbmq0qKn7
 pEixsuY0LTEAOXLy2ZP7Ukb4j3g4Kygac6Y3J9ZnYndV0qpBObxrgOw/8Wd+HnSIxYGL
 MjNbEo7jv1jjbe8JSuXkyf77ydIzhcj4X6jpgeMVvdaqi3axzMmNTm9U4HwXeHRn7kQ6
 WZYg==
X-Gm-Message-State: AOAM5319oxgdSCMeLC5SMgQX6M/N9WXCkPPkod88cecD9MrWHFeuQgCR
 SGQjkY2wJeOB3O98xDBJSumUPfnJ+I0Vug==
X-Google-Smtp-Source: ABdhPJwT698Myz11xkomSjgtxL/cJvysS7DtrY8HCgBie6/aRQZjdSqX801WY4ZDvaSGNrvQcaMX4g==
X-Received: by 2002:a17:90b:4ac5:: with SMTP id
 mh5mr1576125pjb.2.1641349384535; 
 Tue, 04 Jan 2022 18:23:04 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id x19sm193593pgi.19.2022.01.04.18.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 18:23:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 3/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 function for narrowing fp/int type-convert insns
Date: Wed,  5 Jan 2022 10:22:46 +0800
Message-Id: <20220105022247.21131-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105022247.21131-1-frank.chang@sifive.com>
References: <20220105022247.21131-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 05 Jan 2022 02:23:13 -0000

From: Frank Chang <frank.chang@sifive.com>

vfncvt.f.xu.w, vfncvt.f.x.w convert double-width integer to single-width
floating-point. Therefore, should use require_rvf() to check whether
RVF/RVD is enabled.

vfncvt.f.f.w, vfncvt.rod.f.f.w convert double-width floating-point to
single-width integer. Therefore, should use require_scale_rvf() to check
whether RVF/RVD is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 ++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f1b44ccad2..6c285c958b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2719,17 +2719,29 @@ GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
 static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
-           (s->sew != MO_64) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_NARROW_TRANS(NAME, HELPER, FRM)                   \
+static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_rvf(s) &&
+           (s->sew != MO_64);
+}
+
+static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (opfv_narrow_check(s, a)) {                                 \
+    if (CHECK(s, a)) {                                             \
         if (FRM != RISCV_FRM_DYN) {                                \
             gen_set_rm(s, RISCV_FRM_DYN);                          \
         }                                                          \
@@ -2756,11 +2768,15 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, vfncvt_f_xu_w, RISCV_FRM_DYN)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, vfncvt_f_x_w, RISCV_FRM_DYN)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, vfncvt_f_f_w, RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, opfxv_narrow_check, vfncvt_f_xu_w,
+                      RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, opfxv_narrow_check, vfncvt_f_x_w,
+                      RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
+                      RISCV_FRM_DYN)
 /* Reuse the helper function from vfncvt.f.f.w */
-GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, vfncvt_f_f_w, RISCV_FRM_ROD)
+GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
+                      RISCV_FRM_ROD)
 
 static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
-- 
2.31.1


