Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfiNS-0001WR-KP
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 06:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60589)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNQ-0001Tg-34
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNO-0007Ov-TP
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:08:36 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46236)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfiNO-0007Nj-Mn
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:08:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id v9so8691693pgr.13
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 03:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=don9t9xuSfJ9sumgvWd/xcF8icVMgBCMEjRj7CpLYOU=;
 b=U+4egMLIpJuPFoOdIZsuGNFbalMu7m5oHe+fS+bLdoJbdwfw+VpSM/sGDiXhSGAdL5
 PRR/TtITPsk6s0y8RA6VLzue6nYdN3qb68I3EdpLYEYzfTLirXWV20r5/HXPWn4oqC4q
 iCylsR3zkpcoJaTUoUw24UQySMMhIwMN6Qy7idQ3zEFYBlXeME19cPjZBuwypinqwQdX
 O53k9jSsaYP96YR8IxRx6/zHXgUxEanuAduRmwi/PgNK6TmvYhVFwLZ3EexJxvhWwwx4
 SwmYx3RUE3DGcIwpV1mey3AU08uTpsLT3999thseKD7w4+g5XeZ/GGFiJfUV2qVLXAY9
 XIoA==
X-Gm-Message-State: APjAAAVPvrvOW2oXZok3g6U29txGQ0IY/cTOFVg5Tm5C6yOr2DALQb+W
 ODsJ656DzTwxvisJfPTQdLHctA==
X-Google-Smtp-Source: APXvYqz2AL+V0vWeUKy+cJxZebE84fpBI1O0K56nZ+Tr+BiUm28Ur7QnKpXtdjcjxuX0qP07qpBE4w==
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr7757671pjs.55.1561457313481; 
 Tue, 25 Jun 2019 03:08:33 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id h1sm24806019pfg.55.2019.06.25.03.08.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 03:08:33 -0700 (PDT)
Date: Tue, 25 Jun 2019 03:07:43 -0700
Message-Id: <20190625100742.12522-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PATCH] RISC-V: Add support for the Zifencei extension
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
X-List-Received-Date: Tue, 25 Jun 2019 10:08:37 -0000

fence.i has been split out of the base ISA as part of the ratification
process.  This patch adds a Zifencei argument, which disables the
fence.i instruction.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c                      | 1 +
 target/riscv/cpu.h                      | 1 +
 target/riscv/insn_trans/trans_rvi.inc.c | 4 ++++
 target/riscv/translate.c                | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index be90fa7d0808..bbad39a337b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -441,6 +441,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d4e0f89e206..ba551cd3082c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -223,6 +223,7 @@ typedef struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_counters;
+        bool ext_ifencei;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 6cda078ed6ba..ea6473111ce8 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -484,6 +484,10 @@ static bool trans_fence(DisasContext *ctx, arg_fence *a)
 
 static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 {
+    if (!ctx->ext_ifencei) {
+        return false;
+    }
+
     /*
      * FENCE_I is a no-op in QEMU,
      * however we need to end the translation block
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 313c27b70073..8d6ab732588d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -54,6 +54,7 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    bool ext_ifencei;
 } DisasContext;
 
 #ifdef TARGET_RISCV64
@@ -752,6 +753,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cs->env_ptr;
+    RISCVCPU *cpu = RISCV_CPU(cs);
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
@@ -759,6 +761,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->priv_ver = env->priv_ver;
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
+    ctx->ext_ifencei = cpu->cfg.ext_ifencei;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.21.0


