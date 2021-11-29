Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX3k-0006oz-Po
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:10:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3h-0006lF-HA
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:26 -0500
Received: from [2607:f8b0:4864:20::630] (port=38546
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3f-00011l-E3
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:25 -0500
Received: by mail-pl1-x630.google.com with SMTP id o14so11002857plg.5
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rbt+tpMjnq4IOuZ+lSlbc+IgtGOMsUMuQxTyTcKKG7g=;
 b=aD7zgfMmC20HZ9B0LXkipbb/dzXMmMKmyx5bngpo+2UXGkKv77H4IqyZvEJ2xuB96s
 9NoBh9DmfN16IZvthzGkvUrQ4Z8jG1iSxL23S/FxunEXbmdSr6Wl07H8N5pk2tebTe7K
 J8d64AioV9xCbgKdBXQYkrvKcBON8xgaIIvljyWJjMLEy4Tc/Ve/qv5uF09YCsjfW4B/
 K2okoQvDtaa2gsYUBk8dMRm6Z6C39BfQ7mraQmU4khF3Hdcmysk4+x86PIPATIJBQb13
 aT0TPMDz5KO9Oe9F/X4a8YE+oP4QWPe4BmHYbEksLhuG1Ad8wOexsHZTvDne352O3HS5
 4lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rbt+tpMjnq4IOuZ+lSlbc+IgtGOMsUMuQxTyTcKKG7g=;
 b=v9q9OVirP3LTXbRVqOxKanSCOERx8eUdS+sh3ST8JH+gZWKsuIhXgKeK2fzq7S0YYE
 zL0LV6BT7hs+R32A0rPKztxG8bJp8huf8mfsJQuJeHlVA004ueGJpEYTOXz2+qiQT32/
 tmbGvAd8ZxWRL/gtl0VwLkbNtxmK4M+AcK3Nrk16yMJ/BaLGuINdQPRhKF+nxEtnYAhT
 jBjOu6sY6tiHe7PFgx7xL2D1nxWgU3aow585jJkFhkcvK8ajaa0LyJQRwyOhAYRWOmeo
 FQ3Q9OLU9FjyhboLDUz6pPRMqGL3MVke2MzSMPbBP2yRseo3S4tdolouTTat7GTLw78i
 YViA==
X-Gm-Message-State: AOAM530VB8tsi67akURizoz6+sOaWrG4V70opJ37twFcaGCK0BGH2UbR
 dUjkFUtNWM2rJKeICV//MdkTfg==
X-Google-Smtp-Source: ABdhPJylH07B4nNTBwlhtSC+3+mFcM4j1pxK4MGb1A+jm6VWD9waxJx1CSam6RNQGx2l6GtA0nuXSQ==
X-Received: by 2002:a17:902:d2c7:b0:142:f06:e5fa with SMTP id
 n7-20020a170902d2c700b001420f06e5famr56187860plc.87.1638155422177; 
 Sun, 28 Nov 2021 19:10:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:10:21 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 75/77] target/riscv: rvv-1.0: rename vmandnot.mm and
 vmornot.mm to vmandn.mm and vmorn.mm
Date: Mon, 29 Nov 2021 11:03:35 +0800
Message-Id: <20211129030340.429689-76-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:10:26 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 4 ++--
 target/riscv/insn32.decode              | 4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6e58343af35..c15497e4a15 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1016,11 +1016,11 @@ DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmandnot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmandn_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmorn_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1a4a2871464..8617307b29a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -635,11 +635,11 @@ vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
 vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
 vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
-vmandnot_mm     011000 - ..... ..... 010 ..... 1010111 @r
+vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
 vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
 vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
-vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
+vmorn_mm        011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 97b1dc10265..33ef7926e64 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2862,11 +2862,11 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 
 GEN_MM_TRANS(vmand_mm)
 GEN_MM_TRANS(vmnand_mm)
-GEN_MM_TRANS(vmandnot_mm)
+GEN_MM_TRANS(vmandn_mm)
 GEN_MM_TRANS(vmxor_mm)
 GEN_MM_TRANS(vmor_mm)
 GEN_MM_TRANS(vmnor_mm)
-GEN_MM_TRANS(vmornot_mm)
+GEN_MM_TRANS(vmorn_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
 /* Vector count population in mask vcpop */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4c1a1310e63..ad505ec9b21 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4470,11 +4470,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
 
 GEN_VEXT_MASK_VV(vmand_mm, DO_AND)
 GEN_VEXT_MASK_VV(vmnand_mm, DO_NAND)
-GEN_VEXT_MASK_VV(vmandnot_mm, DO_ANDNOT)
+GEN_VEXT_MASK_VV(vmandn_mm, DO_ANDNOT)
 GEN_VEXT_MASK_VV(vmxor_mm, DO_XOR)
 GEN_VEXT_MASK_VV(vmor_mm, DO_OR)
 GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
-GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
+GEN_VEXT_MASK_VV(vmorn_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
 /* Vector count population in mask vcpop */
-- 
2.25.1


