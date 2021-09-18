Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbo-00031C-Rt
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqi-0002wV-SA; Sat, 18 Sep 2021 02:29:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqh-0003cw-83; Sat, 18 Sep 2021 02:29:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id w6so7620328pll.3;
 Fri, 17 Sep 2021 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YjgSfg0xBjBwWrsBZb6kaSkbk1qB2DNEM6WGdIHGeQo=;
 b=JiYLyI3MjF1DZJ3FB17TF8onXf3Ml9KNeU5r9JkD4s2IrsTMGbnG50MZxrpALdoBYa
 wm2a7DMaWHvAlTyPa2U2bEbGs0vTb0fLO0Jga/vYZm1RJrNE+gCtWZYXrYJbrEMRzjDz
 JXv1G01CuReROafnuScDFb3/0mOUaH4UlwglOu2EIC/0odlfw8DuJzbr2ZFeuZn63++k
 NaWkwXU/UhGyPzcRJD4G0bw7JN3Y9WK9WKxOBIK4x9wlDSrQhlitU18tGiW4qwxwDb5V
 7oZFkkpTXDOk70pgYmFsL2CX+dtylsF4fl1wKwvCq9Jm3l4x6ZjyZI4rjKz0r6MJrWlf
 Qpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YjgSfg0xBjBwWrsBZb6kaSkbk1qB2DNEM6WGdIHGeQo=;
 b=lZ6SmvT+sSdo0P8sUyZI9tehZtOJFNgYRZVC/5W0iCov0DsJ+HzyEgn27NTvterVWD
 5x7U9RnYfyXm6/uGDP0n9322Rm/j5uBMUVTsoEib76IE76sqTx8w8PgDYWHgaml/htWQ
 Rzow4ITfsKFDOH+tceRvu4OjjWuxW5qZnLFm5GJOTXSzEpGRaW08d811DCZshYD6ClLC
 wWzproFtG6qn37jNp+O0C0GpfUt6tAeRBjrqXhXefsKa3ywmDSGZnTqzLrFhrFQITtAv
 nntLI1lHdYTTIzVjkWbuNAN4l/KZPNkI0PNwZu1lq2SW5mlTkKHQWAmX0LhANc9jXpoT
 1BZw==
X-Gm-Message-State: AOAM532RKXlaf5B6ez+WewYqVVHiMWdnO4FhrT/btClV5EVP+QQAOFOP
 77zIOekSSXQUBeWulXu9HSZF+SB6podgYJhb
X-Google-Smtp-Source: ABdhPJziTyljmC7ptJqfD/DBRD6zKO0zH2XDHEeeBeNLkIVH7KPqPDT+iVINI97O5rUlPKOFeBB1Ug==
X-Received: by 2002:a17:903:234a:b0:13c:9439:5cf1 with SMTP id
 c10-20020a170903234a00b0013c94395cf1mr12931593plh.2.1631946557546; 
 Fri, 17 Sep 2021 23:29:17 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:17 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 06/10] target/riscv: rvb: add bfp/bfpw instructions
Date: Sat, 18 Sep 2021 14:28:12 +0800
Message-Id: <20210918062816.7546-7-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:57 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:29:21 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index fa4597b44b..35f7b0926b 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -245,3 +245,30 @@ target_ulong HELPER(xperm_w)(target_ulong rs1, target_ulong rs2)
 {
     return do_xperm(rs1, rs2, 5, TARGET_LONG_BITS);
 }
+
+static target_ulong do_bfp(target_ulong rs1,
+                           target_ulong rs2,
+                           int bits)
+{
+    target_ulong cfg = rs2 >> (bits / 2);
+    if ((cfg >> 30) == 2) {
+        cfg = cfg >> 16;
+    }
+    int len = (cfg >> 8) & ((bits / 2) - 1);
+    int off = cfg & (bits - 1);
+    len = len ? len : (bits / 2);
+    target_ulong mask = ~(~(target_ulong)0 << len) << off;
+    target_ulong data = rs2 << off;
+
+    return (data & mask) | (rs1 & ~mask);
+}
+
+target_ulong HELPER(bfp)(target_ulong rs1, target_ulong rs2)
+{
+    return do_bfp(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(bfpw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_bfp(rs1, rs2, 32);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ac57982e4f..474b1add63 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -74,6 +74,8 @@ DEF_HELPER_FLAGS_2(xperm_n, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm_b, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm_h, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(bfp, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(bfpw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 60b56dbf95..5d354f63a2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -702,6 +702,7 @@ unshfl     0000100 .......... 101 ..... 0110011 @r
 xperm_n    0010100 .......... 010 ..... 0110011 @r
 xperm_b    0010100 .......... 100 ..... 0110011 @r
 xperm_h    0010100 .......... 110 ..... 0110011 @r
+bfp        0100100 .......... 111 ..... 0110011 @r
 cmix       .....11 .......... 001 ..... 0110011 @r4
 cmov       .....11 .......... 101 ..... 0110011 @r4
 
@@ -741,6 +742,7 @@ add_uw     0000100 .......... 000 ..... 0111011 @r
 shflw      0000100 .......... 001 ..... 0111011 @r
 unshflw    0000100 .......... 101 ..... 0111011 @r
 xperm_w    0010100 .......... 000 ..... 0110011 @r
+bfpw       0100100 .......... 111 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index e869d82c8f..1997d33008 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -369,6 +369,12 @@ static bool trans_xperm_h(DisasContext *ctx, arg_xperm_h *a)
     return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm_h);
 }
 
+static bool trans_bfp(DisasContext *ctx, arg_bfp *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_bfp);
+}
+
 #define GEN_TRANS_CLMUL(NAME)                               \
 static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
 {                                                           \
@@ -775,3 +781,11 @@ static bool trans_xperm_w(DisasContext *ctx, arg_xperm_w *a)
     ctx->w = true;
     return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm_w);
 }
+
+static bool trans_bfpw(DisasContext *ctx, arg_bfpw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_bfpw);
+}
-- 
2.17.1


