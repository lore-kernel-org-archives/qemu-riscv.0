Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxc-0000Zm-Ow
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxU-0000VL-57
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxQ-0003Xp-NA
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so8775936pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8hmEG6kPBDvJUrkusqG/oNJMxjuWtGKg7+Z2UYPNA+g=;
 b=GTCMqt4YGwVKhBmiYSpvZD05hZik4N6ipvAsUL2tjg1OMjCE4KL/9FD+6AXjPKYHTO
 ffMEXool82mRcEjMb9lEX8dLh0F3Zww5IopR7YWMAmu30p/GR2XRBvvrvoaL/x8ct3mE
 YhC1mmGUecpC46YbTmMcEv0c0nVUCSiJD4FgRcbJ7kmRKoyK9ruGXMqI7bsv/2KoLnAA
 9a665a7LdINh8sxIKNx232+SHdqI3aWc7+jry0LJOtTewFCvJsoQTuSxCGzNC1U9wHjB
 j8d5xbxJ6sN6jbcwz0tbuhwQsvJwGvVwJF/P6SE/Kcr71ja5CRvd+PD4IFn1Ip+Cv/bw
 MPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hmEG6kPBDvJUrkusqG/oNJMxjuWtGKg7+Z2UYPNA+g=;
 b=FpriktNuFF9ugydR9Ul3mgmQt0NpB9fVevclNhRfMossCVzOU6UUTLbRJkvpX6OFrY
 dHahI6eVHF+H4xQ1VG6bVHKxg9I/zaPpgUsaUHb3Eo0geAdOXvCwUl/5W+G7GbwT6old
 mo4zOK/xh9Gs7uN0zoU6KfGb8h54Mxm65XTjRJlS+NzlDvM6YB2XtWXxOAI0kUek+agj
 O/6wRw92n5gkFAa8EgNTgvWp+evf7GcZGLQUcQxzedUG0CBI5pQKgM0oj5dddwQxJsJO
 qvKrQ/eKv/2v5FlCb7OFXUl+yaXdhMuC7hwb7x4319EB5c6Z6SyuHcmOejv6N677/KbK
 ku9A==
X-Gm-Message-State: AOAM53127yaa8fLZr/4k+7QWSOYe+VPjWvRJMho99sUouLPWYdZTRVju
 KPqXQPXDoX7yzOM0Rtbe8oy2QqhCKrnYhSfw
X-Google-Smtp-Source: ABdhPJzcfNvy3zgZRaedgA2qoiRqK7me2gmq9q195I2x7zGItkc6B71yCuX9iZqJiz6WH79J20XFrA==
X-Received: by 2002:a17:903:228c:b0:13e:f389:4ca9 with SMTP id
 b12-20020a170903228c00b0013ef3894ca9mr9758090plh.80.1634284127401; 
 Fri, 15 Oct 2021 00:48:47 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 31/78] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Fri, 15 Oct 2021 15:45:39 +0800
Message-Id: <20211015074627.3957162-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:53 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 target/riscv/vector_helper.c            | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4df2aa9cddc..d139c0aade7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -629,9 +629,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
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
index 5376adca60c..538a32a605a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2730,7 +2730,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
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
index f97783acf05..b0dc971a860 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4260,7 +4260,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
@@ -4290,9 +4289,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
-- 
2.25.1


