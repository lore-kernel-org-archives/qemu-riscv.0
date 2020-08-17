Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asT-0001xc-6C
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asR-0001w9-62
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:23 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asO-0005EF-Ut
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id t6so7376632pjr.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jEL53gVciCeGizTNk9mXXl6FsFCJjT54vcs7pNcdT2w=;
 b=XbS0WBZu32+0Mq0xHCk6v0dhoY2+pooMga0E25t2pBZ9qQ+XV8HuEFkghYReEsQIAf
 Q7bL2yxM4OeOc3YpCC1+YYqKxPcOdJ8EAZIlKsygQUo8oluwYniKi9z+/eOdWd3jNbO5
 5PAv9RLfSI773pfXWlLs/2K93Z+XRZfx6Grr6aJjYa+WR8O3stqju51F/1aoUUNEILEu
 9Xo69nnd2AjD1lg6BkgB5dYqzJbRhzeTopIiCbSavi/eMTy5CqrEftsdB/U7JpH082EV
 8QdZx3QkT8rFZW96SXBaBOUb4vuNbcj3x2+RhSOiB6/mdq9ucCrm1oXCgYsY8q/nMBRd
 chgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jEL53gVciCeGizTNk9mXXl6FsFCJjT54vcs7pNcdT2w=;
 b=AZDxpT+aK/HNMxKAG0iKR0wyH8MmcUSFVslK5hTabqsEJu8IhrES7b8+OiQEaypaua
 cJvsnIb1tbrO/N7lL3JS05t3H+qJfBEx5QFKuLCwnxuEqlI43U8encaO64liXVmvE50I
 CZ88vKAC9D4MZschRLqQFVBbe50yhK7CQwuVp7s1Zs3NW4zKuVj/jO20Ywmz9KcXdhzc
 L6xTjIh3Bsi+AITB3XtBUxDh7ZneEoU6D8xjSumpqQgVUFd8WV1z8E4l2GhPynw5DsWZ
 DAgCf80evR+32YdsE2gfjf8eZKmnNO4/faW1zMMlzG6FX5EQaP1iTkR0UWsnUHvlqREu
 PZeA==
X-Gm-Message-State: AOAM531Gy74WSWGVq4jx6jBqLVDT44HT+i9S7CmI0LBdoe8WLUIivyMi
 5V7pibysAlTB6Jj1rUcVWmF97Q==
X-Google-Smtp-Source: ABdhPJy0OWKk56G/SWDkjnGMiQJ3BbdUTq542uozzddinMIxmsjZen9pJQtKthIUVag/r1gF/9foBg==
X-Received: by 2002:a17:90a:1f8c:: with SMTP id
 x12mr11838810pja.186.1597654339697; 
 Mon, 17 Aug 2020 01:52:19 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:19 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 48/70] target/riscv: rvv-1.0: integer comparison instructions
Date: Mon, 17 Aug 2020 16:49:33 +0800
Message-Id: <20200817084955.28793-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:23 -0000

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
 target/riscv/vector_helper.c            | 8 --------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index ef100254830..c3be3dd97ff 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2090,9 +2090,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
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
index 544c8e38fca..f80c13b0857 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1403,7 +1403,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1414,9 +1413,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1455,7 +1451,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1466,9 +1461,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
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


