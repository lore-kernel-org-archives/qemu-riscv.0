Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTjD-0001cV-B1
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjB-0001Yv-KH
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:23:41 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTj9-0002Ds-U6
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:23:41 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g20so4568491plo.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=VBxQgvJ25FGw5sgX3NKQetq3Fz1iHVWZcRR/NFtbzRrrxvRAan9JHuJNgWnLEW7TM2
 hFu8C9brm4EKtPMPcSBm5pQzmUeLaXpieLqtj9mzu4tOb+0lve9THZwCy8jC0tZwbYgP
 mH/7tm1oZZT/AMG2Y6PqpsWqAe71ltDg95MS0n4GBy7fgsuMdVFdLBEJo90ISQUJ34Ju
 bw1ulOEH+qHOdP14cKdHs2jvwfgavdSW3qDrsdF3xuNmlUQXmuNNfXuILejr+tOa2kMM
 nWQgTEY6Rfkwt4HhhY72lnbgYQzXrFDJ8+4NyKN/pkTDoI/ypAfbR0+VNuqlp8+IT8f8
 EqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=UpNeywOlX6Ux6UQQkzopFeNLgWMNHuoaAvlJZDw2mBbZZesAodXSeTQeADAeH0ThBK
 iLZarAWLqVsytvkXpiAxiU9S8FFcsmF43eCMhHtW6KCE7Dqxm+vnul3/bIhuv3mqvRBn
 OgKwUX2gGnhrHhnmW1dzNCzqAfWg6vB46OIRArTqaqhzEuGICZbbjZXi+xl6bwmBmIe0
 tsNAUWhHJkmwRA2JfNUN4f0UpvS06WIZ6Sz14sBYr2jsY2tJiOBiAW3jfiiRXeZ+qsxo
 h644xlyc8XMWcnlTNQx+gyqoXV3WHWz581n49IEI8jfcQSsh/NMr3DgUIiWrkt7PhE0g
 yTpg==
X-Gm-Message-State: AOAM531tDwY1BPV7tM1i3EM/KAK9jrYmmD7hVIVlsYe06JXUZJuOfn51
 +z1PAwU6CdmFNbG12RZAWBLQiA==
X-Google-Smtp-Source: ABdhPJx0tjmaqkt5laJi35uuo11e31vcu41U86b7GDBB+dWCEbBy9XZD+wFkDONbeSq78T4G8aI9IA==
X-Received: by 2002:a17:902:8209:b029:e3:2c17:73a9 with SMTP id
 x9-20020a1709028209b02900e32c1773a9mr1004106pln.23.1614309818740; 
 Thu, 25 Feb 2021 19:23:38 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 47/75] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Fri, 26 Feb 2021 11:18:31 +0800
Message-Id: <20210226031902.23656-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:23:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5622fb23f85..93ed6f54e99 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3919,7 +3919,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3931,9 +3930,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3946,7 +3942,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3957,9 +3952,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
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


