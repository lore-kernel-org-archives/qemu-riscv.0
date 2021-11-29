Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWzk-0005NL-Js
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:06:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzj-0005Gb-1g
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:19 -0500
Received: from [2607:f8b0:4864:20::433] (port=42503
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzg-0000Uj-Ho
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:18 -0500
Received: by mail-pf1-x433.google.com with SMTP id u80so15297777pfc.9
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejzjZuHzUuF45PjE42zmqG5UueSLguXib7uMJTY6Dhs=;
 b=AQ2TJxoIr0sKEHWsF1GI0F2OSEhB23/wzIeS4QKYqCE4FOcouWeTrKnAGhfO1WzcwT
 kA0bgy9jNjKU1OU5N/YK7lpbOvNpjnPDZGrjeGL9M0sZQx3TC+I0vm0W404Odguy+eQf
 jD+jIkY1aiZuLxnxvpbGVRqXq5Pi+i/Vfj/q+zkD+L7yKFKxgYfNKcydjT30TwoglGf5
 eC8A4pMKlh/eF9dCt0VYURe+79r4U50JFdMOZo6OwEBviU2rqzUsfnHt9EvCz8ZY/V3U
 KPixq5+C0hbOaXlwfK5hKma25H1zjtMvD9be/P8DGZu1Eq++U1pgSs2QMsrtz1IUoYLP
 2KcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ejzjZuHzUuF45PjE42zmqG5UueSLguXib7uMJTY6Dhs=;
 b=BS95G0EMN11t3AD5N/TUcnWNBs8qNCxMg8oUNzbsPZ/z395UkayAvG7No5u7lzleue
 HcTYTWvJc2JReTzv8UUVUWc1MHqLEFaZQ29xDMJ3+5SJCnA9YTXqzn/v1HSac26qVjkK
 DndhwOo8fGhxe5jKPms0kx7Bx2+K25Iztp4HjRoQgEsl4TfTtHyPDpx7bS0F/llcxcrG
 GAj4rnUxiM1z8av9lacZEykJh17Q7LJiK9Y/N+bKJGVAP9mfHMKM2MILswGv4YF26fa5
 WIvSvivOie0Ed1dWPg0JvU0Kg1K+6wanZb4UBitT8VCdumVMIrLiJKBlI20vbSxU0DWK
 B0hQ==
X-Gm-Message-State: AOAM532+3lX7z9YWnaI27Heqtwji1CpzMlWzqY+x3tzXzBWDUXBXc6U7
 SkKPAlYRNJ8TxmGleholMgzKaw==
X-Google-Smtp-Source: ABdhPJzHhXhK8A8EtLB4eK9e/vBO9IEQfTz+tqSe1hwOT6B6cHfqmZ88SZ+9dAiWfNnkQ8kbqW4frw==
X-Received: by 2002:a63:8149:: with SMTP id t70mr23173564pgd.2.1638155175288; 
 Sun, 28 Nov 2021 19:06:15 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 31/77] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Mon, 29 Nov 2021 11:02:51 +0800
Message-Id: <20211129030340.429689-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Nov 2021 03:06:19 -0000

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


