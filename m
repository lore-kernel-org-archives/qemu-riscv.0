Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaZd-0002YG-GO
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:44:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZa-0002Ni-53
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:06 -0500
Received: from [2607:f8b0:4864:20::536] (port=33286
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZW-0007rn-FK
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:05 -0500
Received: by mail-pg1-x536.google.com with SMTP id f125so7415722pgc.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mp+Dg287bQfhvSt+AX7ufFhRBdHxpYX3QavDrimu20=;
 b=GfTr1M/nW8mu2VRy27Vzr5iAO5kIajRiZwscRrsUywEFpMmrSmpOQHyFCoWBsgE9Bd
 XBxEQrapqHktf8Bxk29lPW+oHM/FOJvbfjtTRAxr6h9gzOkO0DmCMnwNHbPBTcPCoSeC
 ZdV4aLAwgSXVXsPRZP7m8yPLtgpoN8mFH61v4oO633NemU6oQoX1ygcKBHjpZjqTqfkl
 KwkBYPXJlHOTZDaFZRlc7TVuvIhIegBbG9WI/t/kemDWeaaGZaKfLqs4hR8KWDPc7wMO
 0LzRjzI4PKGh3VJcqzVl80WOkFxuDMT+HGVIftn2XN1FGnB2nTV3epcDo4pOszt9AHrV
 KnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mp+Dg287bQfhvSt+AX7ufFhRBdHxpYX3QavDrimu20=;
 b=aR4YHUr8WLUnZf9GVIxj9Jeh6w8h3UNvF0f6A9DpGz+6IAF6DH9/64ER1iVFye84Qr
 3hrhfVxcqUuGcqPM/6IAja93ZDMoYoOO/Kl7hy3aGrQCdv6Pr8g0DfAZedAb2eT/h1qc
 HzqS/2pe8XSWWv+WTgH+Gc1xybosTqDWY74vMRyPrrNqhdCWQexw7YGkWEK4/JeC/QqW
 acbJ/m9QD7jrRxXGCuWTJiVrCFPjFSELv1EytyLqf915Jn+GEJpsw/aIvwVlLoOdPkf9
 1Cp7lvdQcgJBApCOmieVSFFPtS8KX3u48vR7jqZLU142hLpTfY6T7RZDKalbNC1M0Kf2
 BgMA==
X-Gm-Message-State: AOAM533+Tc3Cix9bnJXP6UVI9s2Qimqq1SMUC9OFX7iFE67qcesIZYGJ
 vlWXFQIUx+/bB1NAPuw3EHxQmA==
X-Google-Smtp-Source: ABdhPJzOwgdu9Z7+2Qp01xrsoHvP+tn5ADW76rlUIvDQ+JU6K3rOfGWDQT20ruykfCq/fZAtBYeQGg==
X-Received: by 2002:a63:4385:: with SMTP id
 q127mr37122719pga.304.1639122239471; 
 Thu, 09 Dec 2021 23:43:59 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:43:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 5/8] target/riscv: zfh: half-precision floating-point
 classify
Date: Fri, 10 Dec 2021 15:43:24 +0800
Message-Id: <20211210074329.5775-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:44:06 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c                 |  6 ++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn32.decode                |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ec2009ee65..388e23ca67 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -482,6 +482,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fclass_h(uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return fclass_h(frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9c89521d4a..d25cf725c5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3906c9fb20..6c4cde216b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
 feq_h      1010010  ..... ..... 010 ..... 1010011 @r
 flt_h      1010010  ..... ..... 001 ..... 1010011 @r
 fle_h      1010010  ..... ..... 000 ..... 1010011 @r
+fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 8d0959a667..0549e25fb4 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -372,6 +372,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
     return true;
 }
 
+static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.31.1


