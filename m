Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTjc-00029Y-Dp
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjX-00028D-Io
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:05 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjV-0002Qq-DS
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:03 -0500
Received: by mail-pj1-x102b.google.com with SMTP id i14so3565570pjz.4
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lz/W3BW+1lR1i74Oi5nMJEIOHCSiAJcSkdzoESnLrJo=;
 b=d+wHXA+xMDBjutKtkLXhNR9GhuHX0OLL1fiXvOdRVDW0e3xJdjBZr4BUy893nTxfLl
 wFEYLSmCSPs5Jmv4fSU+HULYlah2O7oAxHGsosBZC6tuhXCHODalIh8bcNR0t7pVZRco
 A+plmX0yXaFI2Yc04WFC50n6ePSoULArv5wS0MKWxkd/4gsvU8s8My8aEvVgI0MvFb2P
 E99mXsJxKmd9mk/+hajPIp+wpMqtCNUdr+kk21YWED7g0il6mqmpoZGo/EN7aFPvs5Sj
 hr8p0h1+1qa9mzpjsCYn5fmxuOJ/Q3cXgKA8vdL+Sg8fkn3wxRnzGKOuYGWhH1DmERGv
 5TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lz/W3BW+1lR1i74Oi5nMJEIOHCSiAJcSkdzoESnLrJo=;
 b=gmjNaWKgqYQOMRCbCKXDmzU8l5NiHVK4KL1flHCIrzXyxUQ16ZBxf7mbTzQmq+2+o5
 y+ee5b7gP43pmHMTafbaDW9X5ZW+9Na/dBw0TII1ml7qsKdrxHw8vJjcMRd8mhCWo3MW
 cuul+inR6jnOblWUa0qhVN+2rvjlfSWspIxtdg5ibl16Jzt8OWK6rcdGzudUvlqrwFES
 sIljQQ4IWM4kz/R34C+lq/9h9C3DNBLNV04Ji1fKf31VaYOwxcxTgwXR06dQINPCzQ69
 UtnvCg5iASP9v8FRDcWMJCv9gQInlhfseJScem2XbTok8VS9xdKqm1SwNoKawqffoDde
 ULMQ==
X-Gm-Message-State: AOAM533Dy9PvDpecwwsuc58qFeHu3n2fKiYNHuYyYvsQw0/qDoW9MmL9
 JHltsU2cYws5U1+c47ZBvmcTYw==
X-Google-Smtp-Source: ABdhPJx/0MXa6HdNP57iswzJisu91MmxNVoOVkH4iCrifqZqoeHLzB7lfVpVJG/Y7K4mCNi/L8sybw==
X-Received: by 2002:a17:902:7286:b029:e3:cec5:f0cb with SMTP id
 d6-20020a1709027286b02900e3cec5f0cbmr1213840pll.70.1614309840092; 
 Thu, 25 Feb 2021 19:24:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 49/75] target/riscv: rvv-1.0: slide instructions
Date: Fri, 26 Feb 2021 11:18:33 +0800
Message-Id: <20210226031902.23656-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:24:05 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a2ef6b708c8..fac387353fb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4639,17 +4639,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
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
2.17.1


