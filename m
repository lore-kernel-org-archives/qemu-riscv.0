Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscq-0006h6-Gq
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfP-00065M-Fs
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:07 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfN-0006y7-PA
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 72so2114791ple.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zFI1QkkuOkl4l1Y4Jd70RldsPCo1cFuhVFIV6olrASE=;
 b=W054i38Ta4Y6E5PuUfiQlj3B2JHuO/kUEztiJPtOjWsBb7kdOq1l6zZRjl2x8jU4sR
 rco0cNyEcZuKvb/clhkCWyGOCpQyR2BR/RIBpa8RoH4UrqRi8GnRnsKCqQ26Wcz0qeDj
 cprUMmK4BSlsxSuvCf9VUP2A4yGU2bgFOW9CCCk//ziSv/OqZvOki2AzxJ71jOGEUjsI
 gELEmqiBTXuHWsalxvD1I+bs6WtrkMZTswmWK89inChj0AUeKHjK64rQaPyy34Y4y0fd
 +nKggMLXfVqc/011nIiDEtSBPLOVNsLKzq5t2DMlSCZZlEI6kcrB5NR124Xa5tkK1DbJ
 Hg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zFI1QkkuOkl4l1Y4Jd70RldsPCo1cFuhVFIV6olrASE=;
 b=imzu9W1UVrSUBxI1uHLinEcqYKIy6E/jPelwtfHw9D1LR9nlluh3R9n3ifHqL8jJ4S
 2J3pXpWZRgj4ZZ+5aZSv3rTVqW1sIM9d3X55zYwqVwlZtGv2igR2eVwTS/rzSFaGhW4S
 0n17PEN8+yfQGhYROwyFGzBKGjuJXhsiXK6sOYey9ANzcSmKUfw/5Oc7CPt7lSwKELjt
 n2rHNaYfwL2C8WJYeD7jd+gR+hHdRYD6KRUsrSKr1jK8r004KYc+atAZR9RlYR0w/qXh
 cxTFD46IvYmLmmG3ux0X//qV0oLpDJLhDiUxw/tRsgYe9qQVcrpEzQr4bqX+GoXwajWS
 bjpQ==
X-Gm-Message-State: AOAM532FJUHAhfacYEQFDOxEy+rLAyGBp8/FT2SxFit+H9OWGSrFQo7H
 4TOPrmItXyrGDwtSYj5889FUpg==
X-Google-Smtp-Source: ABdhPJxGooPSHi5LlCgoX39+dsIyAK7QJL4CFTJD5yeDoMJ4HZ91mZ7q9uRP3pyWtIf2whBvnrOcVg==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr53615648plr.188.1594378444524; 
 Fri, 10 Jul 2020 03:54:04 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 52/65] target/riscv: rvv-0.9: widening floating-point reduction
 instructions
Date: Fri, 10 Jul 2020 18:49:06 +0800
Message-Id: <20200710104920.13550-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:07 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvv.inc.c |  3 +-
 target/riscv/vector_helper.c            | 67 ++++++++++++++++++++++++-
 4 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e1dc1f83d3..1c301c1440 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1078,6 +1078,8 @@ DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0fe46c10c2..e32946b1f5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -580,7 +580,8 @@ vfredosum_vs    000011 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 # Vector widening ordered and unordered float reduction sum
-vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
+vfwredsum_vs    110001 . ..... ..... 001 ..... 1010111 @r_vm
+vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
 vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
 vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
 vmandnot_mm     011000 - ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index f308b2bc3b..34b0392625 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2778,7 +2778,8 @@ GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredosum_vs, reduction_widen_check)
 
 /*
  *** Vector Mask Operations
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 76ce3c8e3e..67d5fd37aa 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4798,6 +4798,51 @@ GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, false,
               float64_minnum_noprop, clearq)
 
 /* Vector Widening Floating-Point Reduction Instructions */
+/* Ordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
+void HELPER(vfwredosum_vs_h)(void *vd, void *v0, void *vs1,
+                             void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    uint32_t vm = vext_vm(desc);
+    uint32_t vta = vext_vta(desc);
+    uint32_t vl = env->vl;
+    uint32_t i;
+    uint32_t tot = env_archcpu(env)->cfg.vlen / 8;
+    uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
+
+    for (i = 0; i < vl; i++) {
+        uint16_t s2 = *((uint16_t *)vs2 + H2(i));
+        if (!vm && !vext_elem_mask(v0, i)) {
+            continue;
+        }
+        s1 = float32_add(s1, float16_to_float32(s2, true, &env->fp_status),
+                         &env->fp_status);
+    }
+    *((uint32_t *)vd + H4(0)) = s1;
+    clearl(vd, vta, 1, sizeof(uint32_t), tot);
+}
+
+void HELPER(vfwredosum_vs_w)(void *vd, void *v0, void *vs1,
+                             void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    uint32_t vm = vext_vm(desc);
+    uint32_t vta = vext_vta(desc);
+    uint32_t vl = env->vl;
+    uint32_t i;
+    uint32_t tot = env_archcpu(env)->cfg.vlen / 8;
+    uint64_t s1 =  *((uint64_t *)vs1);
+
+    for (i = 0; i < vl; i++) {
+        uint32_t s2 = *((uint32_t *)vs2 + H4(i));
+        if (!vm && !vext_elem_mask(v0, i)) {
+            continue;
+        }
+        s1 = float64_add(s1, float32_to_float64(s2, &env->fp_status),
+                         &env->fp_status);
+    }
+    *((uint64_t *)vd) = s1;
+    clearq(vd, vta, 1, sizeof(uint64_t), tot);
+}
+
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
 void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
                             void *vs2, CPURISCVState *env, uint32_t desc)
@@ -4808,16 +4853,25 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
     uint32_t i;
     uint32_t tot = env_archcpu(env)->cfg.vlen / 8;
     uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
+    bool active = false;                                                   \
 
     for (i = 0; i < vl; i++) {
         uint16_t s2 = *((uint16_t *)vs2 + H2(i));
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
+        active = true;
         s1 = float32_add(s1, float16_to_float32(s2, true, &env->fp_status),
                          &env->fp_status);
     }
-    *((uint32_t *)vd + H4(0)) = s1;
+
+    if (vl > 0) {
+        if (!active) {
+            *((uint32_t *)vd + H4(0)) = propagate_nan(s1, 32, &env->fp_status);
+        } else {
+            *((uint32_t *)vd + H4(0)) = s1;
+        }
+    }
     clearl(vd, vta, 1, sizeof(uint32_t), tot);
 }
 
@@ -4830,16 +4884,25 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
     uint32_t i;
     uint32_t tot = env_archcpu(env)->cfg.vlen / 8;
     uint64_t s1 =  *((uint64_t *)vs1);
+    bool active = false;                                                   \
 
     for (i = 0; i < vl; i++) {
         uint32_t s2 = *((uint32_t *)vs2 + H4(i));
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
+        active = true;
         s1 = float64_add(s1, float32_to_float64(s2, &env->fp_status),
                          &env->fp_status);
     }
-    *((uint64_t *)vd) = s1;
+
+    if (vl > 0) {
+        if (!active) {
+            *((uint64_t *)vd) = propagate_nan(s1, 64, &env->fp_status);
+        } else {
+            *((uint64_t *)vd) = s1;
+        }
+    }
     clearq(vd, vta, 1, sizeof(uint64_t), tot);
 }
 
-- 
2.17.1


