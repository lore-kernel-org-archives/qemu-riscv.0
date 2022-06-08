Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nymd6-0007w8-2A
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 23:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nymd5-0007uv-4R
 for qemu-riscv@nongnu.org; Tue, 07 Jun 2022 23:45:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nymct-00060s-7z
 for qemu-riscv@nongnu.org; Tue, 07 Jun 2022 23:45:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so17211419pjq.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jun 2022 20:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixFsMDiFehJ4RdFbFJa4NaCJcAPjElQH9BFKqpYMhlY=;
 b=HVdrmxGB5WuXDpEZ+XhwENxlujt2NRbpuJLtgJA52krpBPWQe0BRc3yH21diswqUor
 8u2dZS+AfAbfg4wrdZYl217/DTj7kpXYGIjxtIg4M0W90g/Kx+fuUJsZ5Q8Nx20Ichry
 +OXEmdylfWre5zj3/uO7ksYIp6BOGgGWoKHpYo0ya+VZTzpcWoVhNmKnzWN/jWy8JobY
 si2TibRUrOnK0YdlEvUt7pUcv6vury8nOyjAg0tHLabY7GIJQ0GQVMN85wEbb5UbpbrU
 XtyqlN/lgtFw8QlRIjgg1VDJvFC/hXheNxnupkHGclliYuwLESn+8GXusUWoMv23/jiw
 PtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixFsMDiFehJ4RdFbFJa4NaCJcAPjElQH9BFKqpYMhlY=;
 b=JEhuCsih8vUKF0+TxKj8p9eXd16uS8wltBFfgq6f3k3kNYTbwnZWNrIhf9Y/OZcsDT
 wTYMHMk0NLFQ6lyQL+o+tnfSNBd1m2KwNYPVuAnB8ZFajPER7r7JEDijKlyRmVHUYk0K
 Tvhq+qKkoHJ8SqNTLvsD1aYoSfdsIFEynMZu0YwN7vQGLXIlH7+xkmtVzTSzCmIj82xX
 J4mBYnR2B1YFHvgu4rsktGvS26aJa8e5ziGNFmHFsewPin8bfX9IL6s5IWxZx9Qt0ldC
 xKzmYsTpVNkm4GygbcVsdeI93yKjHU1RrIi4+pe8PQx0fQxLkCS761QbnDKu3HFfpzJc
 PK+A==
X-Gm-Message-State: AOAM530mJiVw56EXWsdIntVKmARBdGWqorKFYf2hegnjocKqesq9NpCx
 7+y6WrqyHGvcCTmz71L4/3L11g==
X-Google-Smtp-Source: ABdhPJyQy0jnk+Yod2hZZ71XfawIoyhGi4G3z57Bd151b5axzTW641x/GTT/GH7RLGe11bmHwzTPVg==
X-Received: by 2002:a17:90b:3b86:b0:1e8:6b89:2bb2 with SMTP id
 pc6-20020a17090b3b8600b001e86b892bb2mr18998200pjb.15.1654659897778; 
 Tue, 07 Jun 2022 20:44:57 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a056a00216200b0051bd9981cacsm10258214pff.123.2022.06.07.20.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 20:44:57 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 1/1] target/riscv: Add Zihintpause support
Date: Tue,  7 Jun 2022 20:44:53 -0700
Message-Id: <20220608034454.1528469-2-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608034454.1528469-1-daolu@rivosinc.com>
References: <20220608034454.1528469-1-daolu@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 08 Jun 2022 03:45:11 -0000

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Dao Lu <daolu@rivosinc.com>
---
 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..183fb37fdf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
@@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
      *    extensions by an underscore.
      */
     struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c92..e466a04a59 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -394,6 +394,7 @@ struct RISCVCPUConfig {
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_zihintpause;
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4033565393..595fdcdad8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
 sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
-fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
+
+{
+  pause  0000 0001   0000   00000 000 00000 0001111
+  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
+}
+
 fence_i  ---- ----   ----   ----- 001 ----- 0001111
 csrrw    ............     ..... 001 ..... 1110011 @csr
 csrrs    ............     ..... 010 ..... 1110011 @csr
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f1342f30f8..ca75e05f4b 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
 }
 
+static bool trans_pause(DisasContext *ctx, arg_pause *a)
+{
+    if (!ctx->cfg_ptr->ext_zihintpause) {
+        return false;
+    }
+
+    /*
+     * PAUSE is a no-op in QEMU,
+     * however we need to clear the reservation,
+     * end the TB and return to main loop
+     */
+    tcg_gen_movi_tl(load_res, -1);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
-- 
2.25.1


