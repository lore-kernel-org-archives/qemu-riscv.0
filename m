Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscm-0006W6-J5
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeg-0005nZ-1b
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:25 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqee-0006qu-Cj
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:21 -0400
Received: by mail-pf1-x444.google.com with SMTP id q17so2380687pfu.8
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qtfSsgTIZrjwffHcxDIfNLMAZ/v2FNjlWUaB1SIQIAQ=;
 b=lcmXFF2l9OB4vw6TGnt6M2SHwmgejCldimLE0yej4V6eiMI8PCfwfVO7wYJaGjLOJP
 +fy3b+Mi/tU3XD0SUTffPzE8vJDO4DKPkEbCa6CGYvH/GXJvjZ6731wnaaEGgrjMreYP
 czkbXwyn9c1PfE9u+Jfhv/IYcXCh0dmomq8l8VNDJGjJE0SPQjbZYadYhIjTSQZEV7EZ
 m19/uqaneym/SNDAWAzRxeEALb063rV8MkEMVMKi8t7yFq9cChRm/Pymkt4M/WYOIYye
 oAJvLd/pf2Mnf31bZLbpTd+Rb77OWRqylig/qrVUK/w0ulrqt7a0SPyU/73q5K0Fh2DN
 dl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qtfSsgTIZrjwffHcxDIfNLMAZ/v2FNjlWUaB1SIQIAQ=;
 b=kl9Tq63UY+XGbUFCky1tlYGxjFK0sgqramP5eWIHsyoEYvPkZRheyMAcJLEqpfmkh/
 rB2ujALXdadaglzT/Yvm6L632iBDsLCdiraAOJBBk6EEmDoOlTZF9pkEh9o7+nNsKtx2
 FCLuExjYxCS83zVMZSr896SMyeHmFVxvEwflWM7fzdGZpRnHGe6KMVK4FSkjrtlEnb7B
 y1DEpI4O8iDJEihkPgP+e4m9wH6vgpyjPk87lLHBWi2coHkD+4VmFmWH63BAJrp+tbKf
 OJUVF/zQZ+5Nackwpmb/lJUlqnH4gOZlUKAD/0OVGogWNyJj/q8ZS6rD69N5BERX/5Ob
 U9jg==
X-Gm-Message-State: AOAM530QQZops/ZxsuCL8fvIwjRpxoDzKTACqpp0j0TnnaaBwSHHnDRo
 0Yu3Wmb22ySvMV86+IlGbMMv2g==
X-Google-Smtp-Source: ABdhPJwqcdxYd0wy9jVRwaAnLJ/7YydEcDgzrktXAliYYfHmU1AP51FaoERgWOhjtIIXaTFjxs8QXw==
X-Received: by 2002:a65:6703:: with SMTP id u3mr54465793pgf.254.1594378399039; 
 Fri, 10 Jul 2020 03:53:19 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:18 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 41/65] target/riscv: rvv-0.9: floating-point compare instructions
Date: Fri, 10 Jul 2020 18:48:55 +0800
Message-Id: <20200710104920.13550-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x444.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:26 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 52 ++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8d251dee58..11c962431e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4148,27 +4148,30 @@ GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8, clearq)
 
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
+#define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)               \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,      \
+                  CPURISCVState *env, uint32_t desc)             \
+{                                                                \
+    uint32_t vm = vext_vm(desc);                                 \
+    uint32_t vl = env->vl;                                       \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false); \
+    uint32_t vta = vext_vta(desc);                               \
+    uint32_t i;                                                  \
+                                                                 \
+    for (i = 0; i < vl; i++) {                                   \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                       \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
+        if (!vm && !vext_elem_mask(v0, i)) {                     \
+            continue;                                            \
+        }                                                        \
+        vext_set_elem_mask(vd, i,                                \
+                           DO_OP(s2, s1, &env->fp_status));      \
+    }                                                            \
+    if (vta == 1) {                                              \
+        for (; i < vlmax; i++) {                                 \
+            vext_set_elem_mask(vd, i, 0);                        \
+        }                                                        \
+    }                                                            \
 }
 
 static bool float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
@@ -4188,6 +4191,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
     uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);    \
+    uint32_t vta = vext_vta(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4198,8 +4202,10 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
+    if (vta == 1) {                                                 \
+        for (; i < vlmax; i++) {                                    \
+            vext_set_elem_mask(vd, i, 0);                           \
+        }                                                           \
     }                                                               \
 }
 
-- 
2.17.1


