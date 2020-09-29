Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKys-0006uQ-Dd
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyq-0006rB-Sr
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:04 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyo-0002LU-W7
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:04 -0400
Received: by mail-pj1-x1033.google.com with SMTP id t7so3186563pjd.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=16oHEl1NxN00cp2dlLbq5l1EITT6tr89WGs7ZTyJaMc=;
 b=aWEIjEfSu1MM4GxkEAqGt8Q1lDWUN+XuaIhj5h98K1bppNQacYedYFGKRCFWr7NxdX
 u8hlE9Kyb509tA6wU9yevOnw0wvQz/Ob+2ea01dH9SWNIkgauwkoPRqUQsXJaWnt8kK7
 N1oSfMxh1VEniO1pdZrcZijBC9DsMc4YNbT+bddO0mptm4U5fQw7dC06mSUDtfIAhb8U
 G9yzG31DXsefI5sp+6SDEBPSy/qfPvrfAfmmD9rOJS1c5pu6KGrll7G9LiL5k5o4cqvi
 rM7P4H7Aeh/Ps+37sENI6Q6GXpkJjQohims+BWC0wI1+ruRkIV6VJrtL0tauarCgMpyF
 H/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=16oHEl1NxN00cp2dlLbq5l1EITT6tr89WGs7ZTyJaMc=;
 b=foT0pqB1ycTze1L21IBJ/EgLZ935/6DhGhvcKQVi5RJlZnHtflYftkJHHUAHjxtlBJ
 pWsiGe08goXtBv1Txgjzk4bWwxCjYn+jSsF3QmWEccpUoS9iEGTFss0GchgI9QLWPx/x
 qffDsNLTj6u27jEMdyXUo91eXepKYqj+fXwJhnhKbLjRksVj4RGjtMxD5I5c+Cj7RYev
 kgKyYgkW2D9ddCQCBuZWNncEG9RU7sWiJ7itXnyzYzRvBSju5qStHZAyDZWOvisvDu/7
 CoBXfMGvuR2vkVfJr9q/BiUAVZtUCU0fdjtvmT3gotkwQx4jB1rykvdb0hDr9t0yQrPu
 qlLw==
X-Gm-Message-State: AOAM533q5MBM8AKq/rIdbq+WZYRejYueXQYP15lc+orBWXK7gyP591Ly
 aDbZOpxYasj1hspKcj2xYxbfND+ON22BJA==
X-Google-Smtp-Source: ABdhPJzMq124zqZQd5uvNyiJ03ADxOrYTa7q/HLp6KVUNWw1Ld4wQNOja6oBEviZcrGh0Utyi09z5w==
X-Received: by 2002:a17:90a:ea08:: with SMTP id
 w8mr4965676pjy.41.1601406481801; 
 Tue, 29 Sep 2020 12:08:01 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 46/68] target/riscv: rvv-1.0: integer comparison instructions
Date: Wed, 30 Sep 2020 03:04:21 +0800
Message-Id: <20200929190448.31116-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:05 -0000

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
index 16f051a8d7..b1f0fa76b2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2055,9 +2055,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
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
index e14626b40b..5622fb23f8 100644
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


