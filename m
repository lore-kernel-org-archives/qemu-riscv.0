Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k15Ey-0008Sd-6c
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 05:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k15Ew-0008QR-Ko
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 05:52:42 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k15Es-0000e0-MK
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 05:52:42 -0400
Received: by mail-pj1-x1042.google.com with SMTP id i92so2841525pje.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iO+2U68a22cUcrON6IBWEvEsa7DijwORALb/lFKQlyI=;
 b=PrGH5km178o4Vc67cAzl7Kuhq2GJSQ0RGa5INwsIUrIWDX21OCIE55hf5in2BkzIXU
 avrdJsdt6J8fDD9c1FVI88Awe5grxmiVrxUovHljW0LH764/5GFbeApB555Kr6QaibAq
 H79MzWc/KdclavSn/C0J886LDffcM4fZQS7dGDF0tP1f7Jy7HLW7g6UqtLAsM+x7dXz/
 /FECd84MWrwKNOcGdfX43TU/gva4J7XPXECNyoxPUiRtd1ZQrZI8tLyu2nape3gdgmQu
 kRjvVEUW6nTFxOMoAv4QRB7Ds/KitNuM28r0h5VB+PcvPB/1DYpm3ELYPRbHvAJjrnOD
 6CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iO+2U68a22cUcrON6IBWEvEsa7DijwORALb/lFKQlyI=;
 b=juhKM9LyBJx48nP4nKzlMJc3ZWFarOa1zrpBui/k8nURR7mbCjWhdQY9IdXmEylfxU
 ap/QUBNkEgIsRR83gBZJroARgI/DIrj/6tpROlo1hQQ7JStMNoKO7stnzdsb1f0UbLkH
 Hvri1ZjlE2MSdahoYDVKT6K+CCwHFJ39S/YcO7uvvdUIDCY4/PAqgNgz4t7fiF1IXZGD
 425AzvtReTfCOz0qgI+H68zTFjmTSOMU6tfVmUUALjAJ2pwdoP9NhImg0a9hZymoXuJr
 bODQyEp3KmWzBlbbIoDaugCTlz/nr1LbMFNQwaoBhVtFRxopEX4SSeu8UrjcFYK05pyP
 Nveg==
X-Gm-Message-State: AOAM533pBiT7ztqD+8f28FZjDyRX6jQzIietY8rQhGxwPdV8Gm7/xvIO
 iH2JKUF/0UIZnH7W4wCW+o7X6w==
X-Google-Smtp-Source: ABdhPJxhPInjJp1F9yfjepnvTHjSxZ1sC4wJSSgW/s1LZ4hBXiJ9aH3ai8PrEy1Ic2Esj2g4tt4q8A==
X-Received: by 2002:a63:920b:: with SMTP id o11mr35051477pgd.447.1596102757253; 
 Thu, 30 Jul 2020 02:52:37 -0700 (PDT)
Received: from gamma11.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id e5sm5040654pjy.26.2020.07.30.02.52.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 02:52:36 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 1/3] softfloat: target/riscv: implement full set fp16
 comparision
Date: Thu, 30 Jul 2020 02:52:22 -0700
Message-Id: <1596102747-20226-2-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
References: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=chihmin.chao@sifive.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jul 2020 09:52:42 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Implement them in softfloat and remove local version in riscv

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/fpu/softfloat.h      | 41 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/vector_helper.c | 25 -------------------------
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 659218b..573fce9 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -285,6 +285,47 @@ static inline float16 float16_set_sign(float16 a, int sign)
     return make_float16((float16_val(a) & 0x7fff) | (sign << 15));
 }
 
+static inline bool float16_eq(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) == float_relation_equal;
+}
+
+static inline bool float16_le(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float16_lt(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) < float_relation_equal;
+}
+
+static inline bool float16_unordered(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) == float_relation_unordered;
+}
+
+static inline bool float16_eq_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) == float_relation_equal;
+}
+
+static inline bool float16_le_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float16_lt_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) < float_relation_equal;
+}
+
+static inline bool float16_unordered_quiet(float16 a, float16 b,
+                                           float_status *s)
+{
+    return float16_compare_quiet(a, b, s) == float_relation_unordered;
+}
+
 #define float16_zero make_float16(0)
 #define float16_half make_float16(0x3800)
 #define float16_one make_float16(0x3c00)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 39f44d1..c68e6c4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3955,12 +3955,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     }                                                         \
 }
 
-static bool float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_w, uint32_t, H4, float32_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_d, uint64_t, H8, float64_eq_quiet)
@@ -4017,12 +4011,6 @@ GEN_VEXT_CMP_VF(vmfne_vf_h, uint16_t, H2, vmfne16)
 GEN_VEXT_CMP_VF(vmfne_vf_w, uint32_t, H4, vmfne32)
 GEN_VEXT_CMP_VF(vmfne_vf_d, uint64_t, H8, vmfne64)
 
-static bool float16_lt(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_d, uint64_t, H8, float64_lt)
@@ -4030,13 +4018,6 @@ GEN_VEXT_CMP_VF(vmflt_vf_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_d, uint64_t, H8, float64_lt)
 
-static bool float16_le(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less ||
-           compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_h, uint16_t, H2, float16_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_w, uint32_t, H4, float32_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_d, uint64_t, H8, float64_le)
@@ -4091,12 +4072,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
-static bool float16_unordered_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_unordered;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmford_vv_h, uint16_t, H2, !float16_unordered_quiet)
 GEN_VEXT_CMP_VV_ENV(vmford_vv_w, uint32_t, H4, !float32_unordered_quiet)
 GEN_VEXT_CMP_VV_ENV(vmford_vv_d, uint64_t, H8, !float64_unordered_quiet)
-- 
2.7.4


