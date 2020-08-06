Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSu-00049H-RV
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSq-00042d-RX
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:38 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSn-00082L-UO
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:36 -0400
Received: by mail-pf1-x444.google.com with SMTP id k18so17487277pfp.7
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uveFuVrXJlEx57TSQIau0d1s6zfy9//TT6DkYSm5JUc=;
 b=gHaEUTj7qcehTpJ2Y6XPjwQql+YAtvy5KkwnR/4QNRyeWixj8hiWIuKnqg9I01GSov
 iWV6wMipstNO/gq/mle+DsHmapdX95yUC0KgnSc4rbfBIZqVmt27vCDgTyVmFU2wgoM/
 8AfK12OiVQf7IBkmdnv5/eqQtkbY5VgxfshDa06ev5B96Pk5h6L7U2O6Ss6K/0WGDmvs
 HcsUDNGuBSUycAfEP6Bq1hq8KgGhZsE5KECqP1euqyptt23+MOkuyJMPgInZ8omBlFUr
 1et5xo2u240wNIpzKAs2o5NXQiFjV+36UkAlOLdRHo+Sb1IOy+kh57+z9Iq3gXsFAkoQ
 28Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uveFuVrXJlEx57TSQIau0d1s6zfy9//TT6DkYSm5JUc=;
 b=E0lf4CUI1ddp7quVRgmkXalIkzTN1bA1fsTwhy8RGd7uyPhJwvFTayvW/hZyafz690
 AqwQg2j2qHhUi1PAHGua7StaA0PslF9EpBZgpT0ll0S8gptgqDkOTv0G6zSUoVTCo79S
 cffp6Uz782nvAtRtNm2hN3G+q/LV5os3Ao0bo390xw6hm0CgTRCJd8rIwkjzI/4f17B6
 WVTj8qQiflyJp+kvi/eQRlT7kgg4AHZZvvKbLZbrZG3zUlggeTszmpUPF2IWDwmCXnv8
 X1qZprEMwNrv/0nyExnVC9zL25JfCWN5n/FBIfQUx9KvS4vkA0dPkTyAHHaoKh1VMycF
 omgA==
X-Gm-Message-State: AOAM532mHlh7+ESjWinIuBc6I0qSUndz19svSJ8fyw2gxzrA6qf+dXy7
 S9Fs+bCdnsX6iCHAP7wMu8NEAQ==
X-Google-Smtp-Source: ABdhPJyxsvq+Z3rcA5I33Ign7C33t2kVpBbrxFYTBczqjdxMpJerYfvOcag2Cw7WIZ+DFJOJwZ6TuA==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr7113165pgp.333.1596710972806; 
 Thu, 06 Aug 2020 03:49:32 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 54/71] target/riscv: rvv-1.0: slide instructions
Date: Thu,  6 Aug 2020 18:46:51 +0800
Message-Id: <20200806104709.13235-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:38 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 59c35343790..1e779723a0f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4707,17 +4707,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
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


