Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGD2-00064j-Bv
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGD0-000627-IG
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:26 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCx-0008A6-JS
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:25 -0500
Received: by mail-pl1-x634.google.com with SMTP id b8so1131142plx.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lz/W3BW+1lR1i74Oi5nMJEIOHCSiAJcSkdzoESnLrJo=;
 b=ax+gRW7dE1bmoOrmBQZB3CEFP8Hwsj01srbLSLnHY/F/Uzz75HEH2eulzSgmvf94ZN
 yr9oagB4UXcpwRHVvAwBcj+RpeCTtTG2EH9umlvJ9EKVIWmURfZw7ZtP7dsHe+itOq/b
 1e+l42oY8qkViK4ZEzXsOz3GayOBKzV3NoWX4yUl12ZmluorEjX5QiaLGtsFQWPAizdg
 KUPm8Y9U0ed4qhFVN+oUB8zWm4+U/EcFHeb/GJpYFOmHmvPXVxj8TT5HKbVJptQ08FZj
 G1ToH8VyWOY12z/nXwq0Qhm3q6wOutx85oj+uH2vEr8lkyG1rHsj0LJyEsMbYm2p1P65
 gbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lz/W3BW+1lR1i74Oi5nMJEIOHCSiAJcSkdzoESnLrJo=;
 b=HXrxlH3FI3GUTW/acjo4ConoEpOSS9pUB6AnM1HA5Rwb9rPJIWWai+0buX+0ngoSwe
 miIA2zHXsRHm/kn0pTKDAevESQ+99XNInNHYT+U4NLVqhXJRHq6gJIW7aAjf39Rx3R6Z
 mHxCxdw4jUPWUHEx+p9oTv30PqZbY8mCgaVCL4COsAWEJQL3Nc6chUFXqQtKLVDAmW+3
 kFLWHZsGdkMxURcFuTLw2bHB+SpJTGFl89x8ntczbI2eYXmUyo5CCLrJgjFwDXTHhnlE
 GL/5nYzpYL6xOLAGrgMPFVHichwPVuYQQU05Ae3XPRZ4WZm/anWpeMab0VqoZQhNPGy4
 o3bA==
X-Gm-Message-State: AOAM53256B0tUOFFjGu8o8yvTS97+bc22fPyEWgcjGfmbRXh+3rRBYHE
 jwGBUiV3o8jnCz12xobFxVG3Uw==
X-Google-Smtp-Source: ABdhPJyFoeT8Lz3Ou6rJ6N6aSzQgp3KCEYarpcidrzrzvxuuvswZPW5ofO9tX+TU/ZF3v6B9gOaiBg==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id
 fa5mr3761063pjb.144.1610444601606; 
 Tue, 12 Jan 2021 01:43:21 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:21 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 49/72] target/riscv: rvv-1.0: slide instructions
Date: Tue, 12 Jan 2021 17:39:23 +0800
Message-Id: <20210112093950.17530-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:26 -0000

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


