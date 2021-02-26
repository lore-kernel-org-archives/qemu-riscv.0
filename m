Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTlN-00042H-He
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlH-0003wn-OY
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:52 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlF-0003FN-N0
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:51 -0500
Received: by mail-pg1-x535.google.com with SMTP id g4so5426203pgj.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=24xh29az74mzGEe20xmLlf6aodzs+bobENS9/Uc5UYc=;
 b=G8nkhv3FRqnk+mJ1WNc/NEid5zDWe31itItRfUnOZR7HeUz1p7qhp4TCf9uPVntZ8b
 WVhEwgv9Y4hKmo3Im6gh3eySqX8R24EoB6JDe4bTzSbqB/UzBhreaNd2DKs4n2Qr3bXh
 nHxTOA7FwH9hciEb75nyBO/VjXvXG7sV9jYeFIb1fl9NiRCtYc8XdqRd9oMCCHB8peCi
 ukt810cbAldCKzYWG5wsUoe9A0P4CnEV+0IeC/g+sD53ZPPU5qnMgJJKrnzAQRJr20S4
 r0zG0iMpmQJbBcxoghai9daDUd7ZrNQmRaFUK60zkTlk+zgsOKeT6XgQ0KnvhC/iQR0T
 dh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=24xh29az74mzGEe20xmLlf6aodzs+bobENS9/Uc5UYc=;
 b=Vrep+GdvBqMk4tZGUmvsoR46Zws44BRUNHmdTC8jxHxjUrSnrwFi9AeSkzb4w9lkGk
 UVXqcOfuq+Wy7IGBtcjMDFClMnwyJW+nndGYQV1gCantLIin6mwW4m64KBaLi/A1TwCK
 oN6Om9NqN7hpTQ26Q/ezYq9B5c1hDpxgJTXVYcplr+bHdHxaB1MW9qSCoQ5ctbA4Qr+p
 itUXNpf6zNnH9JuURuPu1pmB1swNr7yH1Pndgu3x5rr6Ceyr79Zz21dnCN/KUTmR98Na
 OSPLtZwiQWxZbCBZ1kHipge/GTtUmV7VVWZOoDbKYQz8R7OPHacNHG5+rMAqzHSuFoZ9
 M/sw==
X-Gm-Message-State: AOAM531acCFgdbjzKzXBp0/vgeon7FcNflFucDE6wtXCptvbKXBwcJJp
 rjTQwS3KAZJlKUlgcUTAxghsxA==
X-Google-Smtp-Source: ABdhPJwzz1O+7ZRwDbJzgneFSqWm+xfojE55WNG3w19iUJTiHAAPjrMlwWIP0GdYUk1j2YLQp7kJPA==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr1041151pgb.110.1614309948252; 
 Thu, 25 Feb 2021 19:25:48 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 73/75] target/riscv: rvv-1.0: add vsetivli instruction
Date: Fri, 26 Feb 2021 11:18:57 +0800
Message-Id: <20210226031902.23656-74-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 30 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6fb85c83278..472626f1950 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -78,6 +78,7 @@
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
 @r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
 @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -647,4 +648,5 @@ vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
+vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 120b32367e5..1e9f5148ccd 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -159,6 +159,29 @@ static bool do_vsetvl(DisasContext *ctx, int rd, int rs1, TCGv s2)
     return true;
 }
 
+static bool do_vsetivli(DisasContext *ctx, int rd, TCGv s1, TCGv s2)
+{
+    TCGv dst;
+
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
+        return false;
+    }
+
+    dst = tcg_temp_new();
+
+    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_set_gpr(rd, dst);
+    mark_vs_dirty(ctx);
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    lookup_and_goto_ptr(ctx);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(s1);
+    tcg_temp_free(s2);
+    tcg_temp_free(dst);
+    return true;
+}
+
 static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
     TCGv s2 = tcg_temp_new();
@@ -172,6 +195,13 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     return do_vsetvl(ctx, a->rd, a->rs1, s2);
 }
 
+static bool trans_vsetivli(DisasContext *ctx, arg_vsetivli *a)
+{
+    TCGv s1 = tcg_const_tl(a->rs1);
+    TCGv s2 = tcg_const_tl(a->zimm);
+    return do_vsetivli(ctx, a->rd, s1, s2);
+}
+
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-- 
2.17.1


