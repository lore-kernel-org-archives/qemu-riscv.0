Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz9yi-0004vN-4U
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jun 2022 00:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz9yd-0004nF-Ak
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 00:41:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz9yZ-00081h-V6
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 00:40:58 -0400
Received: by mail-pf1-x433.google.com with SMTP id u2so20093846pfc.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80JN4GRXfJ2v5wDed4AkRHij2k0NrDdS1EnRy9pve3s=;
 b=bHH1+51ZInqCdgkG0oJ1PAOGlGYdnFRl6G3iAP0Smy817uPyqEGsryNlBejhBVJRhX
 VfIlzWYUWrrRwp5aBMQGYXzNyS6C+Gta19f/UoVoIyMnUj0G167n2mszmq3sMIxobyrc
 +0txw+gRFAQLn2p/Xs9vnxlKsLVpKQOPYKffeVKtTIzZaO3LQm6Nh7QtQewafRTGH60P
 efJ7mfq7skDQwx4utdnKuYGGRi9mNzhwWFuj/cYHml058N2HKAsSz3wERkEXT6O+d9aU
 eX/oSHZqGSRj1LOVLFtGC4PNUKKf1KhHe2lAa93D9J8gPaBSzlpomkqmMmYL+j2XKcxI
 qnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80JN4GRXfJ2v5wDed4AkRHij2k0NrDdS1EnRy9pve3s=;
 b=wZ3/Am6+ZZ2zmXjI3vUsyFcbptXDsUxgFrbraBVkCD9u5FPBB0w/oEaOSbzJyISeT+
 ShnzJs0WQE0UEvJFKXN2WWiWFWYWPUXFqlsSw9zq2TS+S3SyaVQ88IVU2AHGiZ3sCuxn
 ueHuXWDmTwmuKkUkHn+8R/At4QplxrU7DKZiZ6aw/gQDaDyfsdLfpfTfJhgypG51a1iH
 kREHMAyduxB9TdO9pyEq+h/4JDj/UuxYxjQMIRWzkFxtteKp9z8zhaPuLGmxzwdPe0+s
 AMHGIEhnD93bI6gYKzFACocgSUGRQ0djNT1w9ZBmhTl6ce21t9cr7wvVXcv5X1u/dYJJ
 XSOA==
X-Gm-Message-State: AOAM5304aK7fxAIZqwKLEiBp4vll2ac8L0vS+RrzBel9TFnWhZQvLNjU
 NyWjfAKVQ1GPH0q+/SYZJ70bPw==
X-Google-Smtp-Source: ABdhPJxOSvxi57DByZonNTDC7syjCSb0yQmqMw0X/vAIGIJ3tXAggFdxYot1MM2Ctf38yHKaIgAJVg==
X-Received: by 2002:a62:f90b:0:b0:51b:5836:ee91 with SMTP id
 o11-20020a62f90b000000b0051b5836ee91mr37863073pfh.51.1654749653831; 
 Wed, 08 Jun 2022 21:40:53 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001634d581adfsm15934870plg.157.2022.06.08.21.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 21:40:53 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 1/1] target/riscv: Add Zihintpause support
Date: Wed,  8 Jun 2022 21:40:45 -0700
Message-Id: <20220609044046.1903865-2-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609044046.1903865-1-daolu@rivosinc.com>
References: <20220609044046.1903865-1-daolu@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=daolu@rivosinc.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Jun 2022 04:41:01 -0000

Added support for RISC-V PAUSE instruction from Zihintpause extension,
enabled by default.

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


