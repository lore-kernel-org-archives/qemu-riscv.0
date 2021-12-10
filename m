Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvao3-0006En-Dc
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanv-00067K-Ll
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:55 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42958
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvant-0006ta-U1
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:55 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so6869221pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOWao8o05t2OetkYHzKjns6q58uxy5xl9VSdFMxxNcQ=;
 b=CfB+JRaHBZV0LgtZW3YBnGoRpAOk7lSxuQbBElKYooHFPV9CTGr6CJ8BoMHPGg9nHo
 zXF2zAelu04xw9Ot8q/w8JqMcAwDYFqwzV8b+Py/FStAMpQsOzbQGsSPbRySV28UHMd7
 HzRqS7SgfHgCc6lKmh53L/2vYs/z7QjujK9YOYfujtj/Qv4fJSmCTLlxHtEbbt2WX7Q5
 kewBjQlSBYyoONcHMW1WtoQ5osdQeUCOhGhkCv93sGl4IIwf2wfSOdykspDSYJ9SGMNt
 J7soTjClWZR6D4rlEAPus6018uYbSJ4sGOIV8/eFCGbsRqISaIC2/QJQ4aUAKTyeHpsd
 5Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOWao8o05t2OetkYHzKjns6q58uxy5xl9VSdFMxxNcQ=;
 b=rEZDf/Anq9Jz+1xuIXMmoUolNf4gluWhvylbFMfOmnradLbW59dumngGBO5V6oinHc
 xig/FuGc8e67dBKfztqtcrRolC44Jri5ZFGDocFg6l7uGmTMrh9BphHG1iGxhWxiNMjS
 gLeF4YYEn7NF44wYRCIzhnC5G9IMvLhDNsib7h6E7nakgcdfyc7wJHB3tymH6PGcUiYd
 NpDkqGtM2aOooDLd4bWK/REUmrCRJAWhNmhL1HpdR9P9g56u6roTR/tKfvqGxAXKUp7u
 lu45GHQegdRFHZX5icdkRhS9h1TnQVXUdAgvIGYE64j8LUcD5ueoXVeROTTwAxoPBDn2
 0Y8A==
X-Gm-Message-State: AOAM532cUzzs6JHS7c0rYqvAPFZC61SxlH650eC1HuLznw8dFcPTOkRz
 uUJ3ZcbsYtVgUcPcDTPGNj4zLw==
X-Google-Smtp-Source: ABdhPJyria69SLXsjIZDkqV+9TFmu109nZJ8BDjI91GgGmeqIKP6vSI1Uw44OMulHDpwXpS1VZ0p8Q==
X-Received: by 2002:a17:902:f687:b0:141:cf6b:fee7 with SMTP id
 l7-20020a170902f68700b00141cf6bfee7mr72046123plg.75.1639123132790; 
 Thu, 09 Dec 2021 23:58:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 31/77] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Fri, 10 Dec 2021 15:56:17 +0800
Message-Id: <20211210075704.23951-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:57 -0000

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
index 4df2aa9cdd..d139c0aade 100644
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
index 3645bb9635..9206e6f06c 100644
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
index f97783acf0..b0dc971a86 100644
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
2.31.1


