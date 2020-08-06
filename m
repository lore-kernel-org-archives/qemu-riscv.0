Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSq-00040o-4s
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSm-0003xt-AY
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:32 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSj-00081Y-W9
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:31 -0400
Received: by mail-pf1-x435.google.com with SMTP id a79so8953119pfa.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QCgaHOJc28MDJv/HDNXjwj/D/gKb4Y9x94dqUUPLSy8=;
 b=LSzDzqJIVish0M+G6t/AoKhP96/TrYw5K/fUN5DpbyONdq7lwI7iOh8PDdti49ZDMd
 8UKvOkImjaG9qS5PrKEu7PkieMPMbBdSzDAL7a+BDTKOoI34MeJM6oTg3AKgEwdEBGOu
 ejF+q92KR6qXqlWMfyIfoHKAE9bdgKUsb0wDv/0KYYvf4wKYOsWfdRr7cxY/72dmEjLs
 oyeWTQuYGb+9l40xu1p7YG3m/EaOWJdVSbNLl61mNBmhlAIqrSdFdKd8fc2uhWq6PXZf
 iWuu+BEUolMuvPEI+IGy8C2O62ogdFoyA5q8fxAFJ2aPCgdd7awCh63j98655HEvFzrl
 Y10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QCgaHOJc28MDJv/HDNXjwj/D/gKb4Y9x94dqUUPLSy8=;
 b=GrnJhvrd+sLmnkIsSoPXGTygIFY1eMj3jDJWY5G7uMpQ6hEPPJRYkPeu3o4w0R4ExG
 +9DsjxiKvkmBSNrJUeNp71ObSkOoSMrXEjasJQny29+JDZRZa1r4SqFmRTpTLXIBmpWl
 7SqMycqfcdU+NQdalssakEZXrnBYEfvNch5p8vmbvYJNLIghnsC/dO/AFnW1dcLJvz8V
 1/YvZ9Ox+ZGgtYBJIPcBJhPfG7SIYX9RZ+iHKFfM/isGrimOv4iW9iwnG7N3o/3rwGyK
 5UxywIiqkHl3fhVbED0ipRdwqGTfbZWHjmjhlZnfKIVvQSfS05YBGJE07xWOq8svmBJT
 UHTQ==
X-Gm-Message-State: AOAM530rQT92jWA0DE0M3THAuvuqr9efGVM6oAgMMb6NRMbVPOR11xUq
 KrtRpvT5z6CB4FdLywv6JMt+Ww==
X-Google-Smtp-Source: ABdhPJxPBVSX6Yp6oAT9EBaGCvtr8Crq0ToY4OjKzX9h0h0q258dLoSPe+PRbhqTKuymlYgRCc+V8w==
X-Received: by 2002:aa7:9f46:: with SMTP id h6mr7697489pfr.321.1596710967764; 
 Thu, 06 Aug 2020 03:49:27 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 52/71] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Thu,  6 Aug 2020 18:46:49 +0800
Message-Id: <20200806104709.13235-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:32 -0000

From: Frank Chang <frank.chang@sifive.com>

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 42 +++++++++++++++---------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ffcf8d2df99..d8aa0825647 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3975,27 +3975,23 @@ GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4)
 GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8)
 
 /* Vector Floating-Point Compare Instructions */
-#define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
-void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
-                  CPURISCVState *env, uint32_t desc)          \
-{                                                             \
-    uint32_t vm = vext_vm(desc);                              \
-    uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
-    uint32_t i;                                               \
-                                                              \
-    for (i = 0; i < vl; i++) {                                \
-        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
-        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        if (!vm && !vext_elem_mask(v0, i)) {                  \
-            continue;                                         \
-        }                                                     \
-        vext_set_elem_mask(vd, i,                             \
-                           DO_OP(s2, s1, &env->fp_status));   \
-    }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
+#define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)          \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)        \
+{                                                           \
+    uint32_t vm = vext_vm(desc);                            \
+    uint32_t vl = env->vl;                                  \
+    uint32_t i;                                             \
+                                                            \
+    for (i = 0; i < vl; i++) {                              \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                  \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                  \
+        if (!vm && !vext_elem_mask(v0, i)) {                \
+            continue;                                       \
+        }                                                   \
+        vext_set_elem_mask(vd, i,                           \
+                           DO_OP(s2, s1, &env->fp_status)); \
+    }                                                       \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -4008,7 +4004,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);    \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4019,9 +4014,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.17.1


