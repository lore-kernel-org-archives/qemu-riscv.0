Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asY-00022c-Mb
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asW-00020H-HW
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asU-0005Ev-Ei
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f193so7888019pfa.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/GnwhWW2LoppIMQ4Co1GACx8GcXTAa6/KQWK39IohYo=;
 b=a1Q0fS0AN7AVYCFOGJmjrMMUGb4ODu5QZRUHj66JRG3xuR5XVqI8182gFVxsDanWp3
 Q0rnqhaqgCnCuSVx5JgIwn4ojCUDH8leeeAr6hMAPg36fxUQyiuxv3R9Pjb5CiBdLBtm
 q13tvNaoxXpiY6tLaVS6R89DK7HwbT1xHgWVwuBGazZBfeqXyvoQlWVcHCp1iPV2NfwM
 D3HIu7+NcKxOLufDUC4LY3Wgu9KXzqbv1zNw9IQp75AGPJlntpjyWwwzgqgq9x8u+MXy
 sE+2eregGeQmqWasZONnjRQqt+GaQJupStVxFzN9nM6a7W9UuxPcQ5KBZ35Q3aBVg1we
 ZW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/GnwhWW2LoppIMQ4Co1GACx8GcXTAa6/KQWK39IohYo=;
 b=ZNJAJXhPeROPGilrIpt/PYil+yqEznuE7xCuoV3ZqcerTByRUrPlRVs43MVAL1mx5e
 np4Bd7mI3Ib9uHrbZIMLaM8u7Ib1V79rcTjynql2lF/xXBxMcS1sfTLNdasv2+aH6IVz
 PvuGABfH6MJDmsmxBJH5j2Yn4+/uJWWmE8FJhnQMwFaLMhN9c5sL4elUTssJLel0UVuc
 Y5lYtPYwocXvMi+7ftbMwXoE8QRz7uxgpiNcXXAWwoDbJRfO/FnwOvF6OMsfTuWBMppF
 nIgII+nwd42vhjVu1iijbwd59hJNfLeI+0dTvmAhOm5dCU+VKX4LwftB/F+TDaskryVh
 EGiQ==
X-Gm-Message-State: AOAM533wW0rTLgOFKJ7FlubDowhV17BjEzXIPGN34dSnsOu3Euxo4Tqm
 udLeLTkwLZZplXcYAr68bLPMqw==
X-Google-Smtp-Source: ABdhPJze1rqFYLc+wyuZkFSglCKksHv2jZ7dL5YrBN30uRMxrK8LUm7b9t+8G9T2Z54jxDnzhTHFrg==
X-Received: by 2002:a63:f44b:: with SMTP id p11mr5010240pgk.324.1597654345057; 
 Mon, 17 Aug 2020 01:52:25 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 50/70] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Mon, 17 Aug 2020 16:49:35 +0800
Message-Id: <20200817084955.28793-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e6441f18465..766622d3878 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3963,7 +3963,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3975,9 +3974,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3990,7 +3986,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4001,9 +3996,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
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


