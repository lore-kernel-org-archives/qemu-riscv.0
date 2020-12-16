Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpMB3-0000Tr-Mb
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMB3-0000SM-2I
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:04:29 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMB0-0001AD-67
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:04:28 -0500
Received: by mail-pl1-x634.google.com with SMTP id s2so12049874plr.9
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jwt90askM0N+FSIMNOKGS+GZDK+252vo/sdulttaipM=;
 b=foUaviYXYy4C9DMBZl4AHeDHQrDdv0gKrVoGpMigIlvFJhN7j7fCgsKQNDViUJSZxb
 qh3vQJSqTwAiUHPMAASsrI5eJDkDexqoX0mLUICw1S5jsqi1EeOLgOv8Tyevjc5Kbi/t
 62nRoGe4zgGzEZw1dW+ed80ie9E9r7X/butzh9EzW/0CpRkYboUoADzBdIDJvfEFNS9b
 paOhpuVNd75Uqq/jeZPgjVt3FfWFTF/GXWPRRM0CrUoKsgheFUg1/FBoha+8lFXWVDJn
 oairG3RPp83e6KpueLi7slkjDNYHqnwT2KupTsIdhQlPUCjbdz+dz47ZFiSzp19Drz8n
 aKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jwt90askM0N+FSIMNOKGS+GZDK+252vo/sdulttaipM=;
 b=Lb4pO+WEu8Xa30BBuoehbkYaFmOaGr6dDE4alwTEbYhcTBLby8U2flV/c760U5ydwK
 hy6JrKk440j+HsEVMu18MVRoC3d/goZ2v4kpA55zVfOJc8++6RQsAkd8QnCOALrsb2eS
 VkB0J1FxTSw5vWXYnZPn0QHcd2hIc5n6OAUeE0/1kADa7lt0QUR5W/FGyX+LyS/NNjgq
 6lHioz52sNDkJ536V8H7bzubQ7F41vQbZJbS3PjxpAs73VDmWKFRre3qkMy6taioHFml
 E/qEBhsguhNjPC634QFs8W08zHxNANbvN1mNf3/dLRpkWzQJx1Y/NeH+0f+WDbjV27H5
 IsbA==
X-Gm-Message-State: AOAM5307DkLKhflHDcmgjwYz9pUftmBiu2aG7lrxoBFTbcys6NHS2rkn
 RmpljPNalA62e6T1lyhWvG037HFH0zlVo+xhDMM=
X-Google-Smtp-Source: ABdhPJzBVmDUxRUZZMXyOsSUu9MaXom+M1tznWXeHYORcgiwJKKhGqQ5p+34b5DKxebv7NNV2YI6Fg==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id
 f12mr1213873pju.89.1608084264984; 
 Tue, 15 Dec 2020 18:04:24 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 10/15] target/riscv: rvb: rotate (left/right)
Date: Wed, 16 Dec 2020 10:01:35 +0800
Message-Id: <20201216020150.3157-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:04:29 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 61 +++++++++++++++++++++++++
 target/riscv/translate.c                | 36 +++++++++++++++
 4 files changed, 103 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 6d017c70c74..ac0634d754a 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -100,9 +100,12 @@ sbinvw     0110100 .......... 001 ..... 0111011 @r
 sbextw     0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
 sbinviw    0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 78ce4b11097..b4677293582 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -617,6 +617,8 @@ sbinv      0110100 .......... 001 ..... 0110011 @r
 sbext      0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 sbseti     00101. ........... 001 ..... 0010011 @sh
 sbclri     01001. ........... 001 ..... 0010011 @sh
@@ -624,3 +626,4 @@ sbinvi     01101. ........... 001 ..... 0010011 @sh
 sbexti     01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 11b5439e703..433cc7f9fc8 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -189,7 +189,36 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, &gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_rotri_tl(source1, source1, a->shamt);
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+    return true;
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotl_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -289,4 +318,36 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_shiftiw(ctx, a, &gen_sro);
 }
 
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    if (a->shamt == 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+        tcg_gen_ext32s_tl(t, t);
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+        return true;
+    }
+
+    return gen_shiftiw(ctx, a, &gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_rolw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0c00d20ab1b..10b4142a3ab 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -849,6 +849,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


