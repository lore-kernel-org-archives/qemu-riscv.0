Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTlQ-00042Z-EP
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlK-00040H-94
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:54 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlI-0003H0-Cx
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:53 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p21so5386490pgl.12
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Xgm78Q7SMYR81cH4wXTeqyeLkMOfma68ZrCpZPuH9XU=;
 b=JKcYrpA2VlU34xGZ9wvu+YOtCoeTGzTnCJGgof9IfvVfe9/g39MGHkjWCYg4zrjNF4
 Oq5HXYu9TjrbPUiSxu3FCkGHIPXDtmg/jAh17NLF3JkEeK8c9FjBR6vAFbFGwLT8KCff
 0KyDjk1FAKzTBxfwR+nOAik9g7BGb3h8AJCIuIzxcMNi3r/P7bwosYGSJ3VuG0+31vDL
 tvtmu/yc10dm3IqbesYuJyY4uHRWYnNgSRUm6MiVNT541h0l15k67ZTBgrp6bA8J78BL
 XLdGhxUmXyUdcUbcuP97pbU3TRa8WXBJOj2O8H+DY21hTt+wRW8DkWZbb34WJTQn8/WT
 PEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Xgm78Q7SMYR81cH4wXTeqyeLkMOfma68ZrCpZPuH9XU=;
 b=hzbNsCtEe9HHFKhoPzz/n5Hb9X65Ngnzk20ZZVq1moR2KzAV0eOJeddPN1jO4AYT/P
 lAQ9P6SI2pIUktKqHRYP05/QsDeGFR2cusee8dyrjbHgxPz9rQyCPn9XSlNfdUc+l2M5
 S/DCd5H71NnX56y8JrojOtMXYmzhgbg1ZAd5Vd98X/lHOQbGy9e6FMVv+Gj4YnSxWev0
 dZRocI+g0e9Nsf0MMa8TzJ3czuY6IBF+cOdRtOcbGGWmlne+n1/PEbcZg1YhadU7dro2
 ursT3gGPaXJizFg6vKDk0URfCUULDVF3ikpzqbc8G9aTugpB1Yd9AuUv2QcuLuGYIALW
 4PSA==
X-Gm-Message-State: AOAM533dXX7PK8tOLFirYyv5xvrF6NVv/rAtRo7Ihz9mq43ebkLdORZ6
 b092NcaeUHdSs0NMV5owWB8Z/Q==
X-Google-Smtp-Source: ABdhPJwS6vKMp4X3PZxahSA+NgRnT6p8yUTbl0iqnNl1vwqSKRB0XpAAJHygOKb/LjQZhX/ga/O1Bw==
X-Received: by 2002:a63:df01:: with SMTP id u1mr1012602pgg.341.1614309951072; 
 Thu, 25 Feb 2021 19:25:51 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:50 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 74/75] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
Date: Fri, 26 Feb 2021 11:18:58 +0800
Message-Id: <20210226031902.23656-75-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:54 -0000

From: Frank Chang <frank.chang@sifive.com>

rvv v0.10 adds vector unit-stride mask load/store instructions
(vle1.v, vse1.v), which has:
    evl (effective vector length) = ceil(env-vl/8).

The new instructions operate the same as unmasked byte loads and stores.
Add evl parameter to reuse vext_ldst_us().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 38 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fc6834c1ec4..55560116ff6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -292,17 +292,17 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-             vext_ldst_elem_fn *ldst_elem,
-             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
+             uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, esz);
 
     /* probe every access */
-    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
+    probe_pages(env, base, evl * (nf << esz), ra, access_type);
     /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; i++) {
+    for (i = env->vstart; i < evl; i++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
@@ -332,7 +332,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -340,20 +340,20 @@ GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
 GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
 GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
 
-#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           \
-void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
-                         CPURISCVState *env, uint32_t desc)             \
-{                                                                       \
-    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
-    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
-}                                                                       \
-                                                                        \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
-                  CPURISCVState *env, uint32_t desc)                    \
-{                                                                       \
-    vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         \
+#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                            \
+void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
+                         CPURISCVState *env, uint32_t desc)              \
+{                                                                        \
+    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));              \
+    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,   \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);      \
+}                                                                        \
+                                                                         \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
+                  CPURISCVState *env, uint32_t desc)                     \
+{                                                                        \
+    vext_ldst_us(vd, base, env, desc, STORE_FN,                          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE); \
 }
 
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
-- 
2.17.1


