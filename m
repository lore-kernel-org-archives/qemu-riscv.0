Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMuy8-0007jK-Jg
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 13:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxW-0007H3-Mp
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxU-0000p0-QY
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:18 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y1so15041628wru.2
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F34s/BqR7DZslK/seY6TWRFLpbaO1IVWnnk22jxZxIM=;
 b=VhxpG2IVsM9bDzdsD0Cji9bbFkmbOsjEtJCBVXKDcE0ufhaC+ofqUn1eIXLyoziHyz
 Lt3xbkjDB+ZtcRt0e2if8r5iAdOv7rzdxbVGHZgrqcaJJMUmVYCDytGOIV1RW4OLYh9t
 VhejeTIGd2RGijP/9IYELtquZsU1SkS95PbLCC23rigGUFelX2ZXbnufX4t+6T+bnGJa
 Qkltrk1SUlGxOx87ue2Hy/6IjdaczM9Rxy5VQjxk9WepULEK8VdjJHfujDiiuFvKXsNK
 6puAwEwkBcK0Bel4rjLdV54icqS/CfOMTB1LlxVRy7oEJ2eMbv1sdhBjqK4Nm/4kgNyA
 oppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F34s/BqR7DZslK/seY6TWRFLpbaO1IVWnnk22jxZxIM=;
 b=zhaXSYnRXvSx4yDpPk8OSctDmpnYQiBZQwFf3/nw26Tu3OzvztvGcPZQGJC0/HxEpe
 Lqbd95zDFcXuV+YE47KBxuSZy4mWdB5Xn+wuU1igO9DRmEoFsSAKZ3edIEWtkEY0Zml/
 NAm6xm0K4cUyldNeDdilYiVdKYJ+xP82mFmzOfttd8RvI14cLRbFLJl7wrVO5igmVTrk
 zgIkiBOmRzKc74pmPexKoqYdQ867Z75vqAy6DOP0gGR1+D1r6dv/Ude8GkvzKRUuEbQ9
 KPAfpQIDzhkpP2bKy60fRrLxDryXBt5McdcyMYIcsJ/CcT9VySLUanF261rT/i4+rPPN
 RO7w==
X-Gm-Message-State: AO0yUKXK0XLlaO8eDvFH3GJYRKPXPT46S0hMEcIVdBKO9h1Lnos8LYZ6
 n3bD7x+v+iW6XDWmeW0EtW/sG8CG16x/qKRS
X-Google-Smtp-Source: AK7set8zEpaTIPzZzmSsCPrneaoxyi3FI7DfToDIIQPuKA3LauMEbdDiebBHTPpSRkhX5CrLa00/TQ==
X-Received: by 2002:a5d:4578:0:b0:2bf:c725:85 with SMTP id
 a24-20020a5d4578000000b002bfc7250085mr18238865wrc.12.1675188135215; 
 Tue, 31 Jan 2023 10:02:15 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:14 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 06/14] RISC-V: Adding XTheadCondMov ISA extension
Date: Tue, 31 Jan 2023 19:01:50 +0100
Message-Id: <20230131180158.2471047-7-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Jan 2023 18:02:28 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadCondMov ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Fix invalid use of register from dest_gpr()
- Use single decoder for XThead extensions

 target/riscv/cpu.c                         |  2 ++
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 35 ++++++++++++++++++++++
 target/riscv/translate.c                   |  2 +-
 target/riscv/xthead.decode                 |  4 +++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c541924214..13b065bc68 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -113,6 +113,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
+    ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
@@ -1097,6 +1098,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 876eaebd0e..a313e025e7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -477,6 +477,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbb;
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index bc1605445d..089b51f468 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -40,6 +40,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADCONDMOV(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadcondmov) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -264,6 +270,35 @@ NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 
+/* XTheadCondMov */
+
+static bool gen_th_condmove(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv old = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, old);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+/* th.mveqz: "if (rs2 == 0) rd = rs1;" */
+static bool trans_th_mveqz(DisasContext *ctx, arg_th_mveqz *a)
+{
+    REQUIRE_XTHEADCONDMOV(ctx);
+    return gen_th_condmove(ctx, a, TCG_COND_EQ);
+}
+
+/* th.mvnez: "if (rs2 != 0) rd = rs1;" */
+static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
+{
+    REQUIRE_XTHEADCONDMOV(ctx);
+    return gen_th_condmove(ctx, a, TCG_COND_NE);
+}
+
 /* XTheadSync */
 
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 880324e617..4f4c09cd68 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -134,7 +134,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 8494805611..a8ebd8a18b 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -84,6 +84,10 @@ th_l2cache_call  0000000 10101 00000 000 00000 0001011
 th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
 th_l2cache_iall  0000000 10110 00000 000 00000 0001011
 
+# XTheadCondMov
+th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
+th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
-- 
2.39.1


