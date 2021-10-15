Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHyW-0002LX-Q3
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyT-0002Fx-Kt
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:53 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyR-0004RH-Qq
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n11so5893108plf.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=JUM2EixDonSk3KZjMxm8PJhqCaMUa/ruAq7F3BIchqFAgnxnH4JcgOFuUyI66pYD1X
 mIhek/JYfTwKTROyC6401wSc/bCo/wAhnziuNbkZepclMyH9Af76P+fYtS/JFjNkz8wF
 bM2mLrkwb6KTWDCDEbLX2dlYw15WVZiDqSROh7ww49HwfeRb2riYOXz3ULtW9zgn1CPq
 N6M4GCr449nNW03tFS5L2iGPGHbYUDbvBdqoc9fp1HbP411JXTK/2TrSHOFmTMGdQGWt
 Ha7j2radnhSeI1uEJsrOD6hC3XtHbxgv0PsgGfmm1NKB6yjLF+RfCCRw7XMdoEF5hKEu
 dksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=DfdeDlNYeEP5f9QZVOEZdsfNwC3m2FoAWxWKGH56ILOC1Vb3wT6smKlCT7CW/9waT9
 NYK6BnIQzEGzsu1EObVYTWQw0zCl07QwRk1NUvPb+7iWL8fGnD1HapCCn347/tzwyxt3
 KqJMhVInWh2fNl+KuzU1odMQKnqX1tX5WyxSl/hLJCMaSuIhngSmJtmYYznb5HWVz1cC
 48u27TJcUGxosO1pHVlJEJ/iuLkznzGLry9KfL+sdSbeli49raAIC7qtxkXTBelHIY6t
 fDYOfOImb5Qn3G/7rhq9Yr6gM61N0GmGZkj8ROQ7o3MyCO14ZR3stCyhQ5fpCFudQbWS
 Irvg==
X-Gm-Message-State: AOAM533WGTmMAEwCoGcoWsM+y5YLPQXLBUEM/z4gCaSlvQ0hJT41A8uy
 eySti4FigsrOAmLqcT+jjaB7Ow==
X-Google-Smtp-Source: ABdhPJzwcW64PUN5Ic8xCwn2n1R07Vc2rz76Ztd/XR+jIBrIhK6ZuYaEzH0f/0l83mThZCP1BN4EsQ==
X-Received: by 2002:a17:902:e884:b0:13f:19bf:fc16 with SMTP id
 w4-20020a170902e88400b0013f19bffc16mr9626247plg.67.1634284190413; 
 Fri, 15 Oct 2021 00:49:50 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:50 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 50/78] target/riscv: rvv-1.0: slide instructions
Date: Fri, 15 Oct 2021 15:45:58 +0800
Message-Id: <20211015074627.3957162-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:54 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f883fdf4749..d79f59e443e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4430,17 +4430,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.25.1


