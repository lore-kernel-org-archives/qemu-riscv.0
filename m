Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul6-0000Gg-AC
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54855)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguks-0008Q1-N9
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hguko-0000XG-LY
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:46 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:45866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguko-0000Uv-Cm
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:42 -0400
Received: by mail-pg1-f178.google.com with SMTP id z19so2879877pgl.12
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=NIyWvQXIInPHkbPMAYxhV18GTR99MjAgFa+NcGYzhSA=;
 b=DMUaREmLwIBJo8tH2W2mS8N7I+78QmEndfQSB1mYzKF598ByrbdxBlnZ7Z+c7r7OLf
 iaBLYXxpW6iHHOqjpXjdwPIUEAic+OlUw9+cnMy6kkUDRRK0uEEZyMT7v+h54hgxFIvE
 QYWubswOYdGBt3u8qo1KkcUfNR0OPlxDWCLghyk3yeQyW43cgoz+W38/dedkLsnWc+2N
 lxVTd6H6i7rlaxKLAUTS2sRgw0w9cJdsFecdu1IN/VuDl70ffxnsNoKmfdGUccsOMP6w
 GAX+mwdjlMxTrkutrQg/XsKTzsi2ndnAfbfMLa9yH77Ge7gmhELIVv9D/5M8ZJQ3F57p
 todA==
X-Gm-Message-State: APjAAAWCVQ18dLNIAVM4Dm6s2HPsHnCa0YFqwhPs8fBeikLEshaDJs+L
 xBcCcjc1wQtiJj3nXIMS+z+I+g==
X-Google-Smtp-Source: APXvYqzIdrLU/NLCrEjAGa6zmnFZ9fktBNkR6Rg0ZjJSKh/SpXRkz2+C2JA3SJdRLrepVvk72SI0Bw==
X-Received: by 2002:a63:a48:: with SMTP id z8mr10365362pgk.91.1561743219146;
 Fri, 28 Jun 2019 10:33:39 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id u3sm2138298pjn.5.2019.06.28.10.33.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:37 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:14 -0700
Message-Id: <20190628173227.31925-22-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.178
Subject: [Qemu-riscv] [PULL 21/34] RISC-V: Add support for the Zifencei
 extension
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:52 -0000

fence.i has been split out of the base ISA as part of the ratification
process.  This patch adds a Zifencei argument, which disables the
fence.i instruction.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


