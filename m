Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8mgD-00040j-Sv
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 13:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o8mgC-0003zq-Ll
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 13:49:44 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o8mgA-0005Ag-Rj
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 13:49:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id 3so2047272pfx.3
 for <qemu-riscv@nongnu.org>; Tue, 05 Jul 2022 10:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1y0Yc/JlfHdVvvbhyP93j3FsOC2gXUCOo4GCtzbqfoY=;
 b=kVsdhn8LNQfcxN/fPZBWQq/zHG+3tFtqY0bclYy3K3R2YQUc2/9sBq0r6Lz/xkUsfM
 SjZYhNBabKrv89wG/IA3YsxYLNFs/h2LTJnkZrmWuQvSPMwPeiy10zGYVMAQB2vVwAtb
 rOeFqZcGKYZRT3SCv0dLJbXu3lhrxLRGZ8DKRgvRn+o7UfxcE46+HjKhAtfMIKXy+NfG
 4nAWxRHjNyRE8fzaV5XV/kwxUeN5W0LvKkGqgSdE/t/zUz9l+3WKbL13at9Y9n9UjjJu
 pUprtdM8JvBJv+BNAVVXw6CIZvwATFiDhvdRRbNV1+keb6UaDj9OyVqfgVyxFPO2KI+d
 5NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1y0Yc/JlfHdVvvbhyP93j3FsOC2gXUCOo4GCtzbqfoY=;
 b=Ug0aBvPPgesZ/uxmTxM5BL5YAfYVjvJIEP9yF2Ss704xIsLem6oxSyUiwYE+qHKan0
 adbvxrncmV+jIVzczaI7BUtXEupH3eRlHDYDGhgssBovYrKctoogqrQgqKv9TKYd9lOx
 cY65Ltn6lbAAumrK3m/rFaH3WY32r99NAVqmHCetNpeNQOeuDTk5niyCfdekr1diPXdg
 9u2cfXmJ3F7RcTa9dK9MVX/4CkDc6/iITX3m+ejmCGPFv3vWZk08RsjIGX+DJRFX0Fwr
 Cdvqg/gPxczTqVxJKFCxxzSRmbfdxHfC/ZvbPnhGeM1rqRXaTdRwfFtMJqW4/QNf2PuA
 JD9g==
X-Gm-Message-State: AJIora9m9m2X7/JT8P5UuxaGdG8bITTo9xUe1Csg4dPf1DoAB4tymOUt
 tjN89VCpIdBz+DWV8T2nF7qtUA==
X-Google-Smtp-Source: AGRyM1tbMMX0UWaE8S1i1jVFuXTQ1/M4s5DBJD1+ekAyxmy4M8to/AQfoYA+WwGpd/0Mrn75CPKG8w==
X-Received: by 2002:a63:8049:0:b0:412:8f0e:2da6 with SMTP id
 j70-20020a638049000000b004128f0e2da6mr992714pgd.414.1657043379455; 
 Tue, 05 Jul 2022 10:49:39 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902d50500b0016be372a10esm4952004plg.20.2022.07.05.10.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:49:39 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v4 1/1] target/riscv: Add Zihintpause support
Date: Tue,  5 Jul 2022 10:49:32 -0700
Message-Id: <20220705174933.2898412-2-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705174933.2898412-1-daolu@rivosinc.com>
References: <20220705174933.2898412-1-daolu@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=daolu@rivosinc.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 05 Jul 2022 17:49:44 -0000

Added support for RISC-V PAUSE instruction from Zihintpause extension,
enabled by default.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Dao Lu <daolu@rivosinc.com>
---
 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

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
index f1342f30f8..2fd07bc2e4 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -796,6 +796,22 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
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
+     * end the TB and return to main loop
+     */
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


