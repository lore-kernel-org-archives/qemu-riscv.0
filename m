Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNm7-0006ZU-8e
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlU-00062b-Gb
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlR-00060M-VV
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so6903182pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejzjZuHzUuF45PjE42zmqG5UueSLguXib7uMJTY6Dhs=;
 b=b1VauQeFJDQ2RJBlxeQO5m2L4KsqROBMXoYkMIHvKwaLbmsnp5UBTxdYsvkQWxav5h
 5hICADk5iKFwLlIP+G43Jj20gmGZdXGwHB7qzZfJ/jTyeC58YLmZQztr7t+yXfpY0fOd
 srCoAhRkg4TXEMWqJBklPLHdkXABP7K8LjA+NI4KJtWBIHqdX4ljRukEOWf8+8zu4exw
 IXRyIeu3wxExsCzElXd4Ic6Ud+Qj2FhCm0iDARJ1Hh8cYXmUDMYHKASio5vLfv7mNIMx
 c1csxvY5dPzR0glGtQ53LQPZstJZt004jb2GjctyVnjGt4Ai2Jev7k53RJ9CqQYQh0hm
 X5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ejzjZuHzUuF45PjE42zmqG5UueSLguXib7uMJTY6Dhs=;
 b=i/im20/9wVeBOHShT0C94lT45BBRnPjJkw4HwPHDZijLEw56jPxgE9W4TPTvLjxipG
 C8hMuFL2TGxGms/1w7Ox03vddjPz8dstD/rUpV7LwzRM4lVuQ9IpOtOQGvMqcU4ZAs7t
 MzcAXehn1tKQbszOd/ZRRQpHrGMIbO1C43TiR90AS2Tlk+dW/AgzCtcwarg87h9kxATQ
 ioUOjXiKE2tvQtOIHyjOsaq4Rr15ZJ8pTwrYPMrhVZivHjorBqmeiNz4XeyX7U+KcJuQ
 qggJn8Fp6ZMdBj4gVFk+IkSY06qR7P0A4mlfpOl86QgtIo+twhWonNO9Q7zyAtDDn3nJ
 8VCw==
X-Gm-Message-State: AOAM530arTpMdv6xKQ2mOpq3GiWJI1ZL9bVHB7H6w0luu6AktKpx/lpk
 IwLFaliXU0QnR+VbcAINDy5zdQ==
X-Google-Smtp-Source: ABdhPJzvRuMbZV+wPpaCeSC6RcDFnT9XqOFmQYNHioAGI52aHs3rX9cKztcnv8nvem3HazY8KFSmmA==
X-Received: by 2002:a17:90b:1511:: with SMTP id
 le17mr18368195pjb.99.1635498088323; 
 Fri, 29 Oct 2021 02:01:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 31/76] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Fri, 29 Oct 2021 16:58:36 +0800
Message-Id: <20211029085922.255197-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:36 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 3645bb96356..9206e6f06c8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2731,7 +2731,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
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


