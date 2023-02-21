Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUXeK-0001LZ-GO
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 13:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUXdx-0000oN-3S
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 13:45:40 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUXdv-00076z-0R
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 13:45:36 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 a14-20020a056830100e00b00690ed91749aso1104526otp.7
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 10:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zo7F0Xuyo2DIgiJ7bUWBiBAnAl0M9znadnezv0+RL9c=;
 b=SmtWNo9hiCFrCTJq+BTsFYI5wvlGgP9YcU9DMuk/fxiyt8IpT3TsFIyXl7FWEW7Af+
 5PpcYrMz/4C7+EeKRPcFA2Mr5uQt+klYJvciRxZEbLP1fjQjze6q8HY0cj06wGLecYPz
 Paizhky7EvG0JQ001WsTnrdKbEGD3DyVlnA+fuOL3vcoIIHFl+mEMiCgy2Js+R8j9k/t
 YwTZTS4i4DcQuJTinRCHDyrJ2hvwT6C0nsHLQ21YSwHH68MpntxsrUVkLtEuObR3rQna
 bPPbVbGPd+wFJEGzxFEn/TI0OHvJy01CvhPka1XrKJimvIJ/4YMT9zkfmdeVHo2nWlU2
 YRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zo7F0Xuyo2DIgiJ7bUWBiBAnAl0M9znadnezv0+RL9c=;
 b=yvWYbw2b79YQAMFTJz4CvF0XyxL6WVeJf++JqESQArk4WcBgXWQ6Vxa0dSdTe3iIWG
 iCtN5Up7KtqaWJQz5QQT0euDXhqSlAg7fSIeRIuukKN1a/WL1uWAPWCpaR3QzVMTNU7B
 hIGlctrXwEc/Ahm5DVoMWTTY691hJnG2d4hRqs5eh+cg+B2+0uAwyw20sSOYncRm7wxI
 ZrSzn2gEm0fKGOuU4bcHGXq4vuZ0hVaTFH9ifWuBaK+c4MTY3ZR2bb3n9pVml/efqJ4v
 u2ho6J5v3ws8xpsJznGTJqn9pZ7Z4yCCy6uUbdbgRAiPcjIQZ//PWbHo8w2YAm0DXjoO
 cHUA==
X-Gm-Message-State: AO0yUKXjZBT3L24gWtVEpvef057LkTntfDhJhZx/qP0jTpDAkof4GJPN
 Y+4c9Y0pIfRnwbxELnAgnCR4ng==
X-Google-Smtp-Source: AK7set+2J0w7UHZeUjGDMAHQMhjAQ7tUdhZbEsTQlPljCuQ7xfmftUEnmi7COeFRcPtVSiRFYVEJNQ==
X-Received: by 2002:a05:6830:3897:b0:686:50ca:7404 with SMTP id
 bq23-20020a056830389700b0068650ca7404mr2742630otb.4.1677005133654; 
 Tue, 21 Feb 2023 10:45:33 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a9d6156000000b006865223e532sm74692otk.51.2023.02.21.10.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 10:45:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv/vector_helper.c: create vext_set_tail_elems_1s()
Date: Tue, 21 Feb 2023 15:45:25 -0300
Message-Id: <20230221184525.140704-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Feb 2023 18:45:55 -0000

Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
load / store instructions") added code to set the tail elements to 1 in
the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
vext_ldff(). Aside from a env->vl versus an evl value being used in the
first loop, the code is being repeated 4 times.

Create a helper to avoid code repetition in all those functions.
Arguments that are used in the callers (nf, esz and max_elems) are
passed as arguments. All other values are being derived inside the
helper.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
 1 file changed, 30 insertions(+), 56 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 00de879787..7d2e3978f1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
 
+static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
+                                   void *vd, uint32_t desc, uint32_t nf,
+                                   uint32_t esz, uint32_t max_elems)
+{
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t vta = vext_vta(desc);
+    uint32_t registers_used;
+    int k;
+
+    for (k = 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+
+    if (nf * max_elems % total_elems != 0) {
+        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
+}
+
 /*
  *** stride: access vector element from strided memory
  */
@@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
 
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
@@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
 
     /* load bytes from guest memory */
     for (i = env->vstart; i < evl; i++, env->vstart++) {
@@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
 }
 
 /*
@@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
 
     /* load bytes from guest memory */
@@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
     target_ulong addr, offset, remain;
 
@@ -647,18 +631,8 @@ ProbeSuccess:
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
-- 
2.39.2


