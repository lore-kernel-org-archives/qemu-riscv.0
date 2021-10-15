Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHzu-0005Yc-C7
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzs-0005Sq-HB
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:20 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzo-0005hJ-OZ
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:19 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m26so7710503pff.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIj430FIbZ9EdxzXNCCDp2iO8R3sg5cdcprIACul/Yw=;
 b=Lf1419+oahomCOE3TzdfpuOj3Tqoqg1QLvZne8rn2OxcDiMqQg+NyfyuNh2k1t0Xux
 GubQV3EYSLyIHAAreRcvKWXnzNz4ABbXlozyRrBoEIK+/fdCXPPdM4bfu5Q5bVnRwsYN
 AX/kKAO9toKOlvxBAUWhHWhBxHwslCOmF2dloas2KXA1gCYazoQC80IVt2T3TzrzLTme
 plj6N2NHVyRrmIstiwWCAvUVgSEfw79VLAp2uZx4Wj1cU/XxCdgHiKEPOUM/IwGPUGns
 l8gZ+FY19MMcU8Xq1B5c+hcNzoOI/UyMMOktrd0tG+ix9SWk7IoGiRmNg4rkmKnjn0Q4
 ih5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIj430FIbZ9EdxzXNCCDp2iO8R3sg5cdcprIACul/Yw=;
 b=VME1wNvpEG0Cxm/2o5UASZLJX/ybh81q8y/kUF0nBJq1wRy12lHEpiQbozvY+BpbPG
 EmbplHCagVNuBUyIszeyhv1YW23ag23CU6VJl/Ut4KdRM0yFlpNKTy4BZLdgZvU2O1Tk
 GwgtCUeSKPq7POYUorIusJJxQuDNS+c2b1mlvxn5RAlqw/lMKseJ17TB3GmPl19Ah/hL
 l+Fidjyi3v3S0ThhSThl/KXqssnwiMb+cIkiTWAWoaD16ZBr+n0+iPHpQ9puYXDVXy1Z
 Ly92zQ6osyT9QcnbdCDtgzi1FVq5TXshoz+Ozi2c374KgA02Ci3EvCQm88kVv8UHXkU7
 +D3Q==
X-Gm-Message-State: AOAM532Qrs6VssUffgDdx/q6qaApX6MC6tlNEuKS71QfrOUrSy4IwbvD
 mkyhr+HvzS9jdjMNOsaFMHBbdQ==
X-Google-Smtp-Source: ABdhPJyrQkdxqaeeJFYJALExUPNreO7i7q9RHe9mUsi7PZiRxcFz7HFDqYOShcR9of+ktQXdsjgtxg==
X-Received: by 2002:a63:b94b:: with SMTP id v11mr8109205pgo.145.1634284274871; 
 Fri, 15 Oct 2021 00:51:14 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 74/78] target/riscv: rvv-1.0: add vsetivli instruction
Date: Fri, 15 Oct 2021 15:46:22 +0800
Message-Id: <20211015074627.3957162-82-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:51:20 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d7c6bc9af26..3b6524bad91 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -79,6 +79,7 @@
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
 @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -672,6 +673,7 @@ vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
+vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d463e494b71..9dedcdf4779 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -160,6 +160,26 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     return true;
 }
 
+static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
+{
+    TCGv dst;
+
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
+        return false;
+    }
+
+    dst = dest_gpr(s, rd);
+
+    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    lookup_and_goto_ptr(s);
+    s->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
+
 static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
 {
     TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
@@ -172,6 +192,13 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
     return do_vsetvl(s, a->rd, a->rs1, s2);
 }
 
+static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
+{
+    TCGv s1 = tcg_const_tl(a->rs1);
+    TCGv s2 = tcg_const_tl(a->zimm);
+    return do_vsetivli(s, a->rd, s1, s2);
+}
+
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-- 
2.25.1


