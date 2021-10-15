Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbI05-0005sv-6H
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbI00-0005pM-6f
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:29 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzy-0005qn-Ec
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y4so5923009plb.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51DHnCrQjiDxe1qg3sQRvZM+kHTDbl2IWH+LWWgOJj4=;
 b=eMQ6rhY/wKNrM4fkRyYF4RH/CyOH99UC3JBNNlvFZtVF9ZHCnUoE3cqFvZGHdxvygA
 j0g8pF9JT0QyAt554Fz1PsQMUCTld8A6B65kZfgdrdDNi0ex+VlDAY3WMN+rOJQX280+
 vTtAmnP/6Tr4tXIXjUxXXs0pUoowCrdTTxbiWYOrgm09vLlWd0/5gtMvFAOgk/UaZNcL
 esCLVV/vTF6nYTq/gmT//fq5OVAvQC7AzndqQAQzfUI5Z1pcnPmz4k32XKEGT2B56AaH
 8dKX3TK1tANr3odhyWHxCUFnNQOT9owewxYy8fbzya37C2p50Eme7VWmvjfOJddFWgRN
 UfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51DHnCrQjiDxe1qg3sQRvZM+kHTDbl2IWH+LWWgOJj4=;
 b=2FNlaK/SV454MUFuaoqtDEQV33NFK6dC3Xeh2/MIsRSxTZQVgDimDLbCYnL8hGbshB
 ALvXjaCNLUBPSQ7z1HQOGh/NpFC6TjZbrZHWOt+/JLr5VP4zxWZI0RLHI7mJ+Gp72k2I
 hyRoXuvhv3vLRXnLkg7vIexYTvOQkQl6WgToBp72cY3ruJDGiY/AXnUf9PNHGSOfg7TF
 wENHws4F0W/B2bugDK6SzG75h/tvCfFwDceDEPc2yA/paLMcZPX8sBoZORWJvUBIPQO6
 Z4ddNqTK/nLmU4OnplTgqW4mlqUahvaPwCFwr8D/9FE43GHNXJRyiog7cFb/7izNvNjp
 6pXQ==
X-Gm-Message-State: AOAM533rDYBs8dhwhV7RUlvmlogOOzy8PN4/bzkWKlj8zOjyG6/mJ6V9
 bjRZLZynPiyd0y19w4r5DwPCCg==
X-Google-Smtp-Source: ABdhPJzxf6PpbePNOKeT/79NiTzOVUaCUDHEPI6e6xCl0R/aW+cCHEdt+cvOhGQ+leaqaUWbTPRsvA==
X-Received: by 2002:a17:90b:4d87:: with SMTP id
 oj7mr11881809pjb.107.1634284285263; 
 Fri, 15 Oct 2021 00:51:25 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:25 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 77/78] target/riscv: rvv-1.0: rename vmandnot.mm and
 vmornot.mm to vmandn.mm and vmorn.mm
Date: Fri, 15 Oct 2021 15:46:25 +0800
Message-Id: <20211015074627.3957162-85-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:51:30 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
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
index 6eebcffb29e..b78c13f0be7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2861,11 +2861,11 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 
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
index 276a2c1aab6..1afa4d454c2 100644
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


