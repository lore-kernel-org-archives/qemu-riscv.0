Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCX-0005k5-S5
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCW-0005i3-O5
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:56 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCU-00081L-MF
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:56 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c13so1047836pfi.12
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VlkAAJ1j5WmFWndiLH5xuDrnWtgYalvcYw/+Hn68wnw=;
 b=XsjJUcb6cgIQQg1N6JBdx8dw5d6NuPFK3Y9GUgBfJHVoeHAMKFNnVd6iqt1bgvCtJ4
 /Z05aLNlYpaxRItlktDX7Ctp2BdKxSwsrxIT/RuZgkBKzMyBUcQ8REyFMdooyILV5sTy
 4FFanvEFG/PSmR/J6cWUD6qe1IGgGTHb9y1kmVeAPmDN8jHqHpot2nzyxeknQzS0pbQJ
 FaouAfRj7rl+GqVpW5/gSEzR6l5QAQzPg7fInwBb/fVlxhZ6T52bojkHT4XLxKG3J9y8
 VMRaixnu14eoR11mPsDSuY6GfJ69J09sraNp/fD+D/oJ1Zb7NDmYhqC88M4qNoVkk4LA
 t0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VlkAAJ1j5WmFWndiLH5xuDrnWtgYalvcYw/+Hn68wnw=;
 b=KKG/+h7+uegaoDof8Bp4UiW69c8AP+gHK/0lhbhClF+GnzE1d3HTWWy0xzeuxeZGT8
 SCTFK9qAxjR6vQ/9rnxd7kUNk9X7gQWnkbwd3gNosnspUTMo0qXXis0u7LWjnri6CyE8
 wtthDyEfTg+5GFq5SBqdCwpuETFqM/R0CjMhmA+qMo4neEAKTK2ZUqvmslT/MDufzPfc
 Hm364bBUq2U596tolglub6DoXmCOc6Q+VmgPqss5AnL2NrIJ/oHS6xcMlD/53P8DWN+l
 mAkjg3m6EaWBVqsvhkN1iycDZ/Fw69/xaARCCaEq0PxvJiJGe6V1kxLr3FPX7UvzEFyC
 MaBQ==
X-Gm-Message-State: AOAM5328yARgfi5uvAgHxaNzwrYdL2ynKnAfJrY64sCofkwruEhi8pwj
 Uz1SRBR91doWAi8lXusKDuZ72w==
X-Google-Smtp-Source: ABdhPJyk+tpIURf9hRDKjlOk91g/Q/mv+dUb1Msir9LFEtDRqISFCfi9Dl5nHzfHQ/Rern2q6q0zhg==
X-Received: by 2002:a05:6a00:796:b029:1ad:6394:432d with SMTP id
 g22-20020a056a000796b02901ad6394432dmr3857614pfu.36.1610444573439; 
 Tue, 12 Jan 2021 01:42:53 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 42/72] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
Date: Tue, 12 Jan 2021 17:39:16 +0800
Message-Id: <20210112093950.17530-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:57 -0000

From: Frank Chang <frank.chang@sifive.com>

* Only do carry-in or borrow-in if is masked (vm=0).
* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              | 20 ++++++++++----------
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
 target/riscv/vector_helper.c            | 20 ++++++--------------
 3 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1e2508adfb8..2806334a31c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -353,16 +353,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
-vadc_vvm        010000 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vadc_vxm        010000 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vadc_vim        010000 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vmadc_vvm       010001 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmadc_vxm       010001 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmadc_vim       010001 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
+vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
+vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
+vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
+vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
+vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
 vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 91936ec464a..7711f86230c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1774,7 +1774,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ * destination vector register is v0 and LMUL > 1. (Section 12.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c37d0404113..8e122ba41d0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1153,7 +1153,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, i);                \
+        ETYPE carry = vext_elem_mask(v0, i);                  \
                                                               \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
     }                                                         \
@@ -1178,7 +1178,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
                                                                          \
     for (i = 0; i < vl; i++) {                                           \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
-        uint8_t carry = vext_elem_mask(v0, i);                           \
+        ETYPE carry = vext_elem_mask(v0, i);                             \
                                                                          \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
@@ -1203,19 +1203,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vm = vext_vm(desc);                              \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, i);                \
-                                                              \
+        ETYPE carry = !vm && vext_elem_mask(v0, i);           \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1233,19 +1229,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
+    uint32_t vm = vext_vm(desc);                                \
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
-        uint8_t carry = vext_elem_mask(v0, i);                  \
-                                                                \
+        ETYPE carry = !vm && vext_elem_mask(v0, i);             \
         vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
-    for (; i < vlmax; i++) {                                    \
-        vext_set_elem_mask(vd, i, 0);                           \
-    }                                                           \
 }
 
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
-- 
2.17.1


