Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnH-0003nG-VR
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnG-0003ht-6Y
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:22 -0500
Received: from [2607:f8b0:4864:20::1036] (port=46857
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnE-0004dX-I9
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:21 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so18596366pjb.5
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1cP8poI1ecSTfpKdi4vVjuMlMadCloWz1TdPeYGIdyk=;
 b=GcKmnsPUnq8GGcmvFmlw+gPQFIA5DiO+i4kdwGa/eNRaMVGqU8tNWm2VxdJcA+H/SU
 B+72CNG+Sdh7WDW9ojKbS/lkWLRNJElNgFj4k7h5KbipDn8ECku6x3uoFLDyIOQSBYfO
 9DTxQbG6LmpErTlZBtzQee+DxnuNe+xT6dIxFklcitkuXhHMqrAigrKoXKIzhTkGDLX+
 FS8UKiLIWdzFQdYDw4r5Ew9L7VSKUWG2BXEOLh435qYjL441z8XF1zhtPrxRKy6JViFo
 xR+AjUaJG8eM4s2yNJaCmiAeoBITdk0nK3JWabfLX7aemPkV0l166T0SNJxWmYyPBYpv
 gIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1cP8poI1ecSTfpKdi4vVjuMlMadCloWz1TdPeYGIdyk=;
 b=GOJksqYN2tJAVmiK1AAQ7+FGPM8LAW5kbrJOe4+Ig5XBRF2xptPQM77yTFwLJ6eEw5
 14ct58ok1FakSHhSCHCIXNVl3P8UFXdSu9JApgZP460kuVzaZq46ETN0hIl3+m4kPecu
 +onR1mXG4dNmJLczo+Ef1VlCcQGpgaYT5PgIOnk2iNGmynQl8LRxoEEqOFRJrJkQUev0
 c7Xiu3lOouTYnLCqKNYyJDp9qceRrFUKpDCKz1P0dTRjpYv/Trrx8eElc4qm/vOw4IDE
 aBSx+wFrR8ulZDdM8MOUVOyPToKYhHA+if2483Eo8NqdT2dBO80S/Fz5x7XW6xy8o7ex
 82uw==
X-Gm-Message-State: AOAM533+mJSAWa/VB7D8sBB5vfrlDCyGYCcmo2bw7GPeIz5eZaS9koCX
 +Ykfmy6PC5GnYtCHayZHJSAKbA==
X-Google-Smtp-Source: ABdhPJxHCV72bdEkIxy55IVdIf1ZZyQb8SuqAdxMRquEO31OZaS+6X5oSGLu898a82h6lkwEf47ltA==
X-Received: by 2002:a17:903:2485:b0:148:a3dc:c22a with SMTP id
 p5-20020a170903248500b00148a3dcc22amr24310533plw.172.1640745259403; 
 Tue, 28 Dec 2021 18:34:19 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:19 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 08/17] target/riscv: rvv-1.0: Add Zve64f support for widening
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:35 +0800
Message-Id: <20211229023348.12606-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d7e288b87f..9ca8d502b2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -77,6 +77,17 @@ static bool require_zve64f(DisasContext *s)
     return s->ext_zve64f ? s->sew <= MO_32 : true;
 }
 
+static bool require_scale_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <= MO_16 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2331,7 +2342,8 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* OPFVV with WIDEN */
@@ -2370,7 +2382,8 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* OPFVF with WIDEN */
@@ -2400,7 +2413,8 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2439,7 +2453,8 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dd(s, a->rd, a->rs2, a->vm);
+           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2698,14 +2713,16 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           (s->sew != MO_8) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2756,7 +2773,8 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
-- 
2.31.1


