Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxw-0005Wz-5W
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxu-0005TW-N0
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:06 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxs-0002B6-Qo
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:06 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l18so45664pjz.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kPduHmxy7ox8o4++8myla5+lN7AnQlaZiLTod069e18=;
 b=PMb+8uxSVCzGzlM13YGwICdRU+4klTjVhGcU80fqWlJWhbBw2GKoRyDmvxm8PANUKF
 mN4wJ77hdHRGZY4LiBdXTsm/o8OC1JhDnEMfMil5xpMAxbAuyqgrPDz6b7nxSW89RL0Q
 ISRQAP6Mvn+bsvJ10eailS7gNcV5pk394MQNQQm+Rer5+RrWzjR3nnnuHsQR7eh/szjf
 JgUXlnDEZ1c5fLS5siExBdLqwLHU5QK7cLjDTc8uePJ/Y/VpyrJ2rHSqVUFB9p2nYiY8
 VH2+RUHeVMNuVX6GLczXkzXQ53THlqLZKOs5IX3RTXT/WzTwxvp3HwEsqGf+aaMaOZmr
 9UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kPduHmxy7ox8o4++8myla5+lN7AnQlaZiLTod069e18=;
 b=sWOfpDm8/EsYw/vgkW7Q/Vme8khxUKNDfc6FYWZtZBzktjYYmYregyUIPpSb4O0aF3
 NTn2aW52ZGwitvmlca1E/+2rx5zwb4epyaubdnlUwmCgnKb/mZn2UgQwNdqrjcuBneoe
 C0E8sgWBdaQkJrEF42mURh3lqyAb0stsG6Ot/r3S0NKiyY+C48L517YMR56Cj4rXdKor
 LcfnDlBsNB55kKOi/a5XhYtcX6zItNrsOjDHeHIK1fGYlByI3Wq5/6FilmO9wdOoN8Ut
 8kAg60fLd1GCzLLVYrGth2VSk6PLN+eoFfXLCFcakKL6aW2Lm8ND6H+HMzSJvjOwvxyF
 wHtQ==
X-Gm-Message-State: AOAM533sYgq5E2dID1yILP8mky/3bL6BpG5ODb8APdap03um6tSRgL+r
 fKazzBld18WyXaz0ZJSUHS3+gQ==
X-Google-Smtp-Source: ABdhPJxKVqozJGfLMvsE90ZsivN1o0Swb/LEM8BOk+Fe6i2Dtg+oVQ810szWkjnXK9XpFGchXbd4Ug==
X-Received: by 2002:a17:90a:e609:: with SMTP id
 j9mr4854280pjy.129.1601406423597; 
 Tue, 29 Sep 2020 12:07:03 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 30/68] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Wed, 30 Sep 2020 03:04:05 +0800
Message-Id: <20200929190448.31116-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:07 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 target/riscv/vector_helper.c            | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d7dac12883..0fed7c9e56 100644
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
index c34877140f..ae2b224b0f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2982,7 +2982,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
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
index ecc9be7733..8ccf538141 100644
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


