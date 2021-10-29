Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNo8-0001y7-Ab
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNo6-0001sd-Q3
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:14 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNo4-0006oN-Jb
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:14 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s136so9309771pgs.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYipsOeTG6EdNPKqvKVV8vo/aYWv/COS3+lr8OPQNRM=;
 b=NsMOW0GrTSFuuyOxez+Kst9bKBOR2c/A937iHo57ZxrwL8IanAfBrzhSzDSygefmBo
 8tusEKLBTM6uiseymE1f4JSkWNhoUH6VBvoFkvRLrJnk1fNPgJVHq91u4lnMiYvRswZz
 pkVlBoLeYs3V6het68t0yYOgKVXHIIf0clyihPuNRQSiluWtiv04cKqwEGWEl49ABtIG
 RsgXM8SnFbojEhwiRUAG5s5YS4n6tDFr4KPwd8hzYax0T/awFh6S/5uziYi24eBoZSLJ
 IGm+GfbEu8u+lC5sUMaJGlm+cKqgH0oNO+b5dXzhTmN31TPwd/NxRoSwHt+m6qOuh46U
 nIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYipsOeTG6EdNPKqvKVV8vo/aYWv/COS3+lr8OPQNRM=;
 b=lT3DaGQGeRI1BV0bl9VPczG6KNYrSxgzSO9s9AwOyfaPUTEaxldzYxXAbtGJaI4OLU
 1cc9TlX6HZKn3Mk4b8kwhs8oGlxhSvFVdl3f2rRUdr763c2jz+KejLhLmVY0dPkFzX82
 E8aEV7vMSMQdInF0UlOsnDjXMGwKvQSzPesWV0KKTBu4zopk5+AcTZTjUzHHA5IgfNaX
 z3G/rkNJd7IDYts88o79RVHZAMDM1gbwaCJc3fOyM6n1c4SfSP6fS/rnBlsNO+i1X4Fc
 EZiC9bXld2kYqvL6q8TeHYdUPMCpL51/fQIRG69liOLk5lwqVNYlrYG2WUi0+E3pYggQ
 hODg==
X-Gm-Message-State: AOAM531kkG35x6Vzaeg40b2AUfnd8ERAzlKabPkoNm58UM0MGzDXZOkv
 zSYxC2wxeds2DhOidm4ii4LV+A==
X-Google-Smtp-Source: ABdhPJwgdbeZyvCkUEsuHhiHEZCxj7ng2Zucf2gT3tlwzV7j1wu/gti82OOrb0iz7Nq9StHqITRKew==
X-Received: by 2002:a62:3387:0:b0:44d:7ec:906a with SMTP id
 z129-20020a623387000000b0044d07ec906amr9823235pfz.69.1635498251452; 
 Fri, 29 Oct 2021 02:04:11 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 72/76] target/riscv: rvv-1.0: add vsetivli instruction
Date: Fri, 29 Oct 2021 16:59:17 +0800
Message-Id: <20211029085922.255197-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:04:15 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index ff8f6df8f7b..e540b5d33c2 100644
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
+    tcg_gen_lookup_and_goto_ptr();
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


