Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFThi-0000Sr-Pv
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThe-0000P0-FF
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:07 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThc-0001cx-ON
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:06 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s16so4547564plr.9
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=spudy6A2kz/IuNKk8c6Qdt4r6xC5abqAUDZa6d/gXhc=;
 b=WHeegHXPpjEgRX5R0+siIPKLMT7Qax/SuhM7nShWA7LE1K9tQnqq+mJQY4NY6y77Oh
 2CdTBwUI5ZrWuoPRjPurOYCKxPChwTDwOGhvLkV0v5Tv16nKlDaPgL7nLwnXgxiRW04R
 eLlTkddTDsRD1RtbAODwVQ912UcA503CZ1fQMG2OUZLrg9FP8+g4hX1espqNT2QBnkjw
 oJeE3trJ8ZSemCX8ioxNsYNN31SVWfKkdYYnsr9v5CcX2mRbJaMCE4dymppqeBUTMoBV
 szqc56xdZcIDdPEqhGSLLHVKw79YsstJMy39F4Zn4jgONy+uH89T2XZXvb8+WCrzDSK6
 l2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=spudy6A2kz/IuNKk8c6Qdt4r6xC5abqAUDZa6d/gXhc=;
 b=h/EXbnsiVd0aZC9S/oEZluGfg0hFEEtss/K+tvqIC/Ak2swv6BQTzQZshVgUStSSZ4
 mOq1vmTRCSjM8C8STNxfd71RPZqj+tOzIrb99mc7oqSSEh4UFgOgkaNG446u5axGC4jb
 wPFywpSprG18d9vqNI0icrgX7aiJ/+WbBFc7fpkmlBTxJ51l0BntGXNKd6NmI3t3qAtz
 Ek0QvqcfDv9ubGQuepa5Jg5owaNY0JwO2GeLblNiWy+c99mQwm9ELODmEvvKQzxXToPl
 znsYOmyr3yYTfQdvCEc7py0woTMaMUEr0i1ZHw1evIwRIMGd6hsEmj2Sdqd3aJmslVwN
 BBFg==
X-Gm-Message-State: AOAM532A3glZD93v6S325UmmA7c48n3hrHzX3dS/0Qk4+UdwFOPiEXHZ
 Tsmh+ZICwm/7DhjjeZoIj1Sqwg==
X-Google-Smtp-Source: ABdhPJwl+M9SZPejYoMu/tLp2m4alR5mk3DIduMgDHSc4xkHLfp2g/D++eXrlr5eY8fG79vrChlA4A==
X-Received: by 2002:a17:902:9341:b029:e1:7b4e:57a8 with SMTP id
 g1-20020a1709029341b02900e17b4e57a8mr1224058plp.34.1614309723597; 
 Thu, 25 Feb 2021 19:22:03 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 30/75] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Fri, 26 Feb 2021 11:18:14 +0800
Message-Id: <20210226031902.23656-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:22:08 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 target/riscv/vector_helper.c            | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0b53ce432c1..6b3caef1721 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -604,9 +604,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
-vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
-vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
-vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 97ad16f2b21..5b229d55307 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2964,7 +2964,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s) &&                                   \
+        require_vm(a->vm, a->rd) &&                                \
+        (a->rd != a->rs2)) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ecc9be77335..8ccf538141c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4466,7 +4466,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
@@ -4496,9 +4495,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
-- 
2.17.1


