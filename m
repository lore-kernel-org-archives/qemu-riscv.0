Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNmY-0007FS-4F
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmV-00077g-Lb
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:35 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmT-0006Cl-Kj
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:35 -0400
Received: by mail-pf1-x42f.google.com with SMTP id p40so3829574pfh.8
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrM11z8306OeDA9HI3AbfeDu222nNxWn77R0ZaUGsgE=;
 b=FO8ezQXzrLH1hTPJZT5ZOsLNTMpfL2Kd0jqml67/UTiorh/SZ7e1WfkHekZa/GIcc0
 Na3JU1vBepUFEyvgtHQWZ9akXqn/GYsSQwCznJei1XSUkeKeIlKSDxCTIqNn77sOvLBv
 1bvA7nifs9QQV4GR2nBjPTIu/+IJ1FV0QwAbyYjLvQ1gChm7yj9fKFwNLwESZRbVAQya
 N3mB8Ab7O4OOG13MxqGOEUrmdmhsLPY1unukeMNFg6gIXiMlWW2Tmr6qXipSlGKHG1mY
 muZVzYIxmR/X14i4RXmTSFpnTICzgYMq1gFQiojI0sah8LLBjF+e/cNN+BelijP29T2j
 VTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrM11z8306OeDA9HI3AbfeDu222nNxWn77R0ZaUGsgE=;
 b=Dci0wLtdy4mv4khC8kwm/AfqgRgTSELLW2KrN1LeOJW65mhvdjzDrlQFt4TImG8DnU
 g2W+Lvpei/Wt/PntKbScxWgHIFwWIg1BuiwSMdOlfi/1mJEKCn4sYt0k5Z5RC45FEgpi
 9hKBi4X0IKvmfnFWRHZEwUy8NjWo7wERtba3ONfOSJMA2wGe1yiUcvw4l665XaURESZh
 2HPcPr7cf94dhY6ytm+YkCMsuOKmtUI57uJQ+wfLLD+6Q5MCnF0CAFy9i5/NBP1GYN74
 aeHRZ+jRfH7B35KNQ6Su+9N22sNONJnHHVhOET6qBmfpZOQ+4irVUCnTbf1867tIEM1J
 uscQ==
X-Gm-Message-State: AOAM531FxaJM2oJIlqH4Y/7AVTkFTFK/0+NcxDudUkmD5ZGaUw5TW1Fx
 ir+RzxOqlS4vkticZkhpxpEN4A==
X-Google-Smtp-Source: ABdhPJwjz8S0jQHkELOchT7kgFBZSDGAAG4bHLgqF5rVIWuEOPvBxp7Gzpf2ezLfA3Fe5/ECj5zRpQ==
X-Received: by 2002:a63:7506:: with SMTP id q6mr7228615pgc.319.1635498152495; 
 Fri, 29 Oct 2021 02:02:32 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 47/76] target/riscv: rvv-1.0: integer comparison
 instructions
Date: Fri, 29 Oct 2021 16:58:52 +0800
Message-Id: <20211029085922.255197-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:36 -0000

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 9 ---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ed4554b6a1d..804f423d5bb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1809,9 +1809,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
 GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_SX, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_SX, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
 
 /* Vector Integer Min/Max Instructions */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e885d4d3539..277a5e4120a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1190,8 +1190,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1202,9 +1200,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1243,7 +1238,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1254,9 +1248,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
-- 
2.25.1


