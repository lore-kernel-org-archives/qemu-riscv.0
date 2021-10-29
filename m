Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNmn-0007gk-50
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmh-0007cd-Gq
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:48 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmf-0006EA-Dd
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:46 -0400
Received: by mail-pl1-x629.google.com with SMTP id r5so6434295pls.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=VvQiEyHR/LIsRCZzZNOZOtKLe7a58IEhw2/Gs9fIBxPfbMNKHdCuXwzCI94wtr4RcM
 Id2KovWj3v+bb92055jJNvyub15vvoacBjfQUZ2Mns5YZY29JQM2ITf4JdgJjqkeVGVL
 vSWEbszmCB3JDHndITwdyFG5usXXQG+AH145aNgMOGSOw72zxh8htuZ2/UdPm6U/z4uQ
 6MzjHuKjsmVpJcAEOF6djpFwi5VvywdYdYYAQI2lQIrjkCPkBXErKl3RQpOl7yoScMz5
 PYsEj2peJZ/uxgclZSsrJQGjavtLii89mpXKnxQ4e0SuxNDVtq/vY3hd5VXgfO9iWIB8
 mKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=UwpkQ3e5JZY2vmnPbnVsa8pnc1TSu19/mWi1tshjEIaO6MnreZcMsQo2u6nDAAFepQ
 Y1pvrm8gXYHfFlae/FNTGwrgaEeyWWfCqvsMwkFV9LtBI+zxz85KkKz4U5/LS+3GJAAi
 8VUuz8WcRCZ9sC6NS1Vx5PYSZM/FkzvTarbS/lhrklS61of1ZwnAY0I1VOT2gQiEm/vA
 V1OE63XBl4duDSx88sl3KeDAxCTXGkaXZRwVwIMzr+q38lnCbYVFz5qc8TUpdoGFGcjC
 e+aKTnDuy08ZtcikbmxCLEsFhK6bbfWzymnL1OQmaBgvv/My71Xfg8Jxy46+NvRNtaPk
 V+8w==
X-Gm-Message-State: AOAM531ThVPUaeu88uNTSZQayNoIhwasq7GM1w8y8UmJafHvIMYvivWw
 paV2WKyE6Hr2+gdNvIlxVH3yVQ==
X-Google-Smtp-Source: ABdhPJyt8ezX2Jqxoj+eP6FmiRLhxRbBiU1VwLZxRo+mEmld0IwvGQ8QJTENfFlgjGLRxIOqggY4RQ==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr18705817pjb.87.1635498164179; 
 Fri, 29 Oct 2021 02:02:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 50/76] target/riscv: rvv-1.0: slide instructions
Date: Fri, 29 Oct 2021 16:58:55 +0800
Message-Id: <20211029085922.255197-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:49 -0000

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


