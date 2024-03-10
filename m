Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7C4C54E66
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Mar 2024 11:55:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjHkI-0007j3-9X; Sun, 10 Mar 2024 07:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjHkB-0007gu-Su
 for qemu-riscv@nongnu.org; Sun, 10 Mar 2024 07:53:32 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjHkA-00041s-4m
 for qemu-riscv@nongnu.org; Sun, 10 Mar 2024 07:53:31 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3c20cd7ab33so1225949b6e.1
 for <qemu-riscv@nongnu.org>; Sun, 10 Mar 2024 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710071609; x=1710676409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXFJKr57FFL8Naa8L/xp3qZMbV9BR2rU2iKRNY7Q9BQ=;
 b=WpenGyZy+VhlC3jMQdOrqtBLNlCXU/2nwgghV/EYElOaEWwqVuU7O7LPgT6FGW4wTI
 smQnlHcCg+Bvy9jqYjU2KxvjglnvOQ1KWhaMuvCh3CLc2QquKmGahYJ/PMlR+ikhN+6U
 lfpWaBP9fVJ3Ie0hHGpW5KFot4qn6SLvybJSMvQgtMq07ziL2qZiVNZVtpkCUMHUlJ2p
 VdyWXvm3ntcTrwXEZDGT/oS5p00BwMrgg4XPD+YVvrEYdMT0iLi49PKgJkLC2dUTVj2I
 Es30HFTSdPCeOYDonUvloOjc6KjcguPYOcYaYM6L5uWIocUUecvoNFZ85Hwtu7nnsyo6
 C6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710071609; x=1710676409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXFJKr57FFL8Naa8L/xp3qZMbV9BR2rU2iKRNY7Q9BQ=;
 b=SwxTzrKuotQh/4RcTEidJSY8Zk7tubcxEySsB37PBLN687WYla4BL8eAFgEid9D5QZ
 6sH4j6v/O63oJxi8+6j/zteyWlYPSdJcgxWSb2rmdS4bVN2MopVGi+00CPFUhUY/hduc
 kTfN6mSzqyf9HCIZSqmCNadQ1LbZwpZ/ayVSn1CK/qb/K2MJg+pf3HiA3KCwA8vpPnbk
 wxUyvlbOcc9c0GG8J6rF3shF6K9o9CVKU3VpMeNxxJA++FcFlHzuOb5tQVSf+HgwuxyW
 J/cC1JRtB01gFTEwc7xKNwY3HN44fBPBe90AsARWw9Aba5C2koBSjX8rf7pJ46Ry0RnQ
 OiAw==
X-Gm-Message-State: AOJu0YzLuKfko5brSuM50FctKhZbtHciGSx3+P287daeHYjS8shN3hOT
 X/EliHDiKQPTB+MZZMZT03VsgfJ/WUe9/VfR676K1/ROnn9m+QqjDT1wyv3vg4E=
X-Google-Smtp-Source: AGHT+IHI0zB2FpS2NSwpVxHB+RfqIX79SdIt09mCh4aOpPyEBgNWRJRKiMWHCVlUl5CKiBuwWdTufg==
X-Received: by 2002:a05:6808:13c7:b0:3c2:3b86:b245 with SMTP id
 d7-20020a05680813c700b003c23b86b245mr4905122oiw.8.1710071608969; 
 Sun, 10 Mar 2024 04:53:28 -0700 (PDT)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 g22-20020aa78196000000b006e647059cccsm2449253pfi.33.2024.03.10.04.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Mar 2024 04:53:28 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 02/10] target/riscv: handle vstart >= vl in
 vext_set_tail_elems_1s()
Date: Sun, 10 Mar 2024 08:53:06 -0300
Message-ID: <20240310115315.187283-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240310115315.187283-1-dbarboza@ventanamicro.com>
References: <20240310115315.187283-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We're going to make changes that will required each helper to be
responsible for the 'vstart' management, i.e. we will relieve the
'vstart < vl' assumption that helpers have today.

To do that we'll need to deal with how we're updating tail elements
first. We can't update them if vstart >= vl, but at this moment we're
not guarding for it.

We have the vext_set_tail_elems_1s() helper to update tail elements.
Change it to accept an 'env' pointer, where we can read both vstart and
vl, and make it a no-op if vstart >= vl. Note that callers will need to
set env->start = 0 *after* the helper from now on.

The exception are three helpers: vext_ldst_stride(), vext_ldst_us() and
vext_ldst_index(). They are are incrementing env->vstart during
execution and will end up with env->vstart = vl when tail updating. For
these cases only, do an early check and exit if vstart >= vl, and set
env->vstart = 0 before updating the tail.

For everyone else we'll do vext_set_tail_elems_1s() and then clear
env->vstart. This is the case of vext_ldff() that is already using
set_tail_elems_1s(), and will be the case for the rest after the next
patches.

Let's also simplify the API a little by removing the 'nf' argument since
it can be derived from 'desc'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 59 ++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ca79571ae2..a3b496b6e9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -174,19 +174,32 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
 
-static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
-                                   uint32_t desc, uint32_t nf,
-                                   uint32_t esz, uint32_t max_elems)
+/*
+ * This function is sensitive to env->vstart changes since
+ * it'll be a no-op if vstart >= vl. Do not clear env->vstart
+ * before calling it unless you're certain that vstart < vl.
+ */
+static void vext_set_tail_elems_1s(CPURISCVState *env, void *vd,
+                                   uint32_t desc, uint32_t esz,
+                                   uint32_t max_elems)
 {
     uint32_t vta = vext_vta(desc);
+    uint32_t nf = vext_nf(desc);
     int k;
 
-    if (vta == 0) {
+    /*
+     * Section 5.4 of the RVV spec mentions:
+     * "When vstart ≥ vl, there are no body elements, and no
+     *  elements are updated in any destination vector register
+     *  group, including that no tail elements are updated
+     *  with agnostic values."
+     */
+    if (vta == 0 || env->vstart >= env->vl) {
         return;
     }
 
     for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
                           (k * max_elems + max_elems) * esz);
     }
 }
@@ -207,6 +220,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t esz = 1 << log2_esz;
     uint32_t vma = vext_vma(desc);
 
+    if (env->vstart >= env->vl) {
+        env->vstart = 0;
+        return;
+    }
+
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
         k = 0;
         while (k < nf) {
@@ -222,9 +240,13 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
             k++;
         }
     }
+    /*
+     * Set vstart before tail update - vstart changed during
+     * execution and we already checked that vstart < vl.
+     */
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env, vd, desc, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -272,6 +294,11 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
 
+    if (env->vstart >= env->vl) {
+        env->vstart = 0;
+        return;
+    }
+
     /* load bytes from guest memory */
     for (i = env->vstart; i < evl; i++, env->vstart++) {
         k = 0;
@@ -281,9 +308,13 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
             k++;
         }
     }
+    /*
+     * Set vstart before tail update - vstart changed during
+     * execution and we already checked that vstart < vl.
+     */
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env, vd, desc, esz, max_elems);
 }
 
 /*
@@ -386,6 +417,11 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t esz = 1 << log2_esz;
     uint32_t vma = vext_vma(desc);
 
+    if (env->vstart >= env->vl) {
+        env->vstart = 0;
+        return;
+    }
+
     /* load bytes from guest memory */
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
         k = 0;
@@ -402,9 +438,13 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
             k++;
         }
     }
+    /*
+     * Set vstart before tail update - vstart changed during
+     * execution and we already checked that vstart < vl.
+     */
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env, vd, desc, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -532,9 +572,8 @@ ProbeSuccess:
             k++;
         }
     }
+    vext_set_tail_elems_1s(env, vd, desc, esz, max_elems);
     env->vstart = 0;
-
-    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
-- 
2.43.2


