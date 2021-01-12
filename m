Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCy-000603-Pt
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCv-0005vb-LN
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:21 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCl-000861-VF
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:19 -0500
Received: by mail-pf1-x42c.google.com with SMTP id b3so734626pft.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zq+WO6dqQdKLzV9SUpnVBHKepWySTwXuRNliVWSbr6I=;
 b=Q92d0/B5xwm4jMmNkAWzECF/CfMWBCAMmo374iX1AFKxOrDb6/fvx8icUofCH8IP8w
 0bx4WJSaWP9rztqfOv9CK4eGoRULkQSvfsLKlI6KC2iViWzCA+BXs3ySBZajtVdhX9WN
 vXPJcsXkDjuL6ftUH3Ox6m+mn1oxa6/4SWyP7sZY1x2vYfnGwYaZHOfKXqelOdprVCX9
 oxYQp7PJuttfI0gNdLzX3s419yQyoerbLHk25QYEgTQBe5JzPdBAcsiH5AQULNUUZkxP
 eLiXCdlUQzUK3H6c+IhMLrmJtuoMRPMbJ2JLkJwji/redyNpwW7D9Odycu/LGSxH/q4d
 nWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zq+WO6dqQdKLzV9SUpnVBHKepWySTwXuRNliVWSbr6I=;
 b=DhSgAyrnpv6ggKFc+qdBhmGxHcH9moDVidF6FXoVbSAOWCjOcRihgZGRXIT/sqn7Y/
 NpHSJTO1gaES7BT3M8YLeJiHKmtfx1CGwrXI0CnBCsRh2F9eCpXrYJPwmhwN4jj18Iqm
 ExL/UDW+y5yxpLQ/9kNII6eML/KIu34V3MVWQ7JZPQjWsnGUWVKltKMz9+fHCjIe+4Ee
 lX2eyf9qw13UCriNmQFXzw4UQrxDoWIDDgs6Q/yxjObXfZA5wfJXpsQIQYmIvs2e7Qpf
 MR197LZqslw96ASyA23aZoFfRbZchiT9wWbT7p4urQlW5czPDe8VagnERNKLIUx7K74g
 Netw==
X-Gm-Message-State: AOAM533JfS7+4iwwu57ynaS4vKFV+3Bz0uto4Suy4m9snDf2PRODQUO6
 prVIs4CJ3YI0qeLprnP6bvca4Q==
X-Google-Smtp-Source: ABdhPJw1JQirnBRijOCD0NmYCIgcTYE6hBKiBXtUiP18EC0CcVU793Bf7IekCOnWR2snfjUp6EBdSg==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr3834636pgh.319.1610444590109; 
 Tue, 12 Jan 2021 01:43:10 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 46/72] target/riscv: rvv-1.0: integer comparison
 instructions
Date: Tue, 12 Jan 2021 17:39:20 +0800
Message-Id: <20210112093950.17530-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:21 -0000

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 8 --------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 39e2d21da5e..523c6cf7f6d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2038,9 +2038,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
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
index e14626b40bb..5622fb23f85 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1399,7 +1399,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1410,9 +1409,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1451,7 +1447,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1462,9 +1457,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
-- 
2.17.1


