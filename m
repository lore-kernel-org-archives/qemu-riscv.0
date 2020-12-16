Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpM9b-00070B-AP
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9a-0006xO-AC
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:58 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9X-0000xz-T1
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:58 -0500
Received: by mail-pf1-x430.google.com with SMTP id f9so15606624pfc.11
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xtiW98CkDaHIC/Mr1cwMxJaKMmWvgoxdzkvNQRFBr7g=;
 b=XLkQzjBjsdttMahBoMbRT7j2xQkPpCxJoxAr0BKVFNynlHNS7zp2vymsAvN/yyX96n
 p9S/e16mLKg8XyzGWydLlFqB+Nqp9BEP4VApLUjI2RRONpy5YzQzKreGcRAqIR1pQ7q9
 iOjAly6PTbELNhQXqUkgIylRU5zMTeYzxueeuZUB6UytMwHbGM4LRa3zNz74gVjY0mSg
 LabEjt6f+ZiDTyl6zzEYos53owILUHTEkVis2F8khKAaB15nXNkMz68y7sudcoXDUWrc
 i4RUUNvxfAyCXv2sYDXphxrPq9VxbSCKmOzo67KxkOKKVJpzGfrLzXW4tVIXtK4fk7pY
 34WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xtiW98CkDaHIC/Mr1cwMxJaKMmWvgoxdzkvNQRFBr7g=;
 b=abkn4t5f/vA4Az3M7ZjowLOWxaNpeQyJn1oKFgKxf84HJtC6fK3IEHz2zVN4qBUTU5
 axToQmPwmUeKTGedZtjZ9IDcJ66VTZiRoX8HkMAr5e/8oYYDXnBJOchrpeRvgBEqFmCV
 +08cBXirvRlsRE7QDDRxAeDlB8N+G0HC0Q9hy+G+rpL3Z26NAgSae0kH8eRCskzFVlPf
 /TbVNYPhZG+6p58XgLrP6tEuHF+xumbChe3FnG1puzh7SvekDpI6cw9fNggslyd0qmg3
 /9EkymmogrTFtIvpx5WjZlWsPXRrhnlfGSAKzxu6o4oXZAYkwrPKLgXqKyjq9yY/qYfM
 Tx2A==
X-Gm-Message-State: AOAM531GUsHvq4Tf5hhDU1I0wiHqsR+eHxF3wQkiJHPJk6cfIqae/hQS
 iy0Ovj6TyDrkc41cd1HPkePFXg==
X-Google-Smtp-Source: ABdhPJzv7PwfREOv809Ejc6C4JinsjNT1VHK0JBkeDY4valvwLxrtgUY5qKJ23sGyOvKMgPMuSbbrw==
X-Received: by 2002:a63:74b:: with SMTP id 72mr3735623pgh.4.1608084174612;
 Tue, 15 Dec 2020 18:02:54 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 08/15] target/riscv: rvb: single-bit instructions
Date: Wed, 16 Dec 2020 10:01:33 +0800
Message-Id: <20201216020150.3157-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:02:58 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |   8 ++
 target/riscv/insn32.decode              |   9 +++
 target/riscv/insn_trans/trans_rvb.c.inc |  90 +++++++++++++++++++++
 target/riscv/translate.c                | 102 ++++++++++++++++++++++++
 4 files changed, 209 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index fd7e0492372..e2490f791b7 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -94,3 +94,11 @@ pcntw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
+sbsetw     0010100 .......... 001 ..... 0111011 @r
+sbclrw     0100100 .......... 001 ..... 0111011 @r
+sbinvw     0110100 .......... 001 ..... 0111011 @r
+sbextw     0100100 .......... 101 ..... 0111011 @r
+
+sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
+sbclriw    0100100 .......... 001 ..... 0011011 @sh5
+sbinviw    0110100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4baafed21f1..c697ff5c867 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -611,3 +611,12 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
+sbset      0010100 .......... 001 ..... 0110011 @r
+sbclr      0100100 .......... 001 ..... 0110011 @r
+sbinv      0110100 .......... 001 ..... 0110011 @r
+sbext      0100100 .......... 101 ..... 0110011 @r
+
+sbseti     00101. ........... 001 ..... 0010011 @sh
+sbclri     01001. ........... 001 ..... 0010011 @sh
+sbinvi     01101. ........... 001 ..... 0010011 @sh
+sbexti     01001. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 5ea0f0ff81c..43e9b670f73 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -107,6 +107,54 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
     return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
 }
 
+static bool trans_sbset(DisasContext *ctx, arg_sbset *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_sbset);
+}
+
+static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, &gen_sbset);
+}
+
+static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_sbclr);
+}
+
+static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, &gen_sbclr);
+}
+
+static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_sbinv);
+}
+
+static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, &gen_sbinv);
+}
+
+static bool trans_sbext(DisasContext *ctx, arg_sbext *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_sbext);
+}
+
+static bool trans_sbexti(DisasContext *ctx, arg_sbexti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, &gen_sbext);
+}
+
 {
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
@@ -141,4 +189,46 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, &gen_packuw);
 }
 
+static bool trans_sbsetw(DisasContext *ctx, arg_sbsetw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_sbset);
+}
+
+static bool trans_sbsetiw(DisasContext *ctx, arg_sbsetiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, &gen_sbset);
+}
+
+static bool trans_sbclrw(DisasContext *ctx, arg_sbclrw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_sbclr);
+}
+
+static bool trans_sbclriw(DisasContext *ctx, arg_sbclriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, &gen_sbclr);
+}
+
+static bool trans_sbinvw(DisasContext *ctx, arg_sbinvw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_sbinv);
+}
+
+static bool trans_sbinviw(DisasContext *ctx, arg_sbinviw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, &gen_sbinv);
+}
+
+static bool trans_sbextw(DisasContext *ctx, arg_sbextw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_sbext);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7b427a9caec..ca176709674 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -755,6 +755,48 @@ static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_sbop_mask(TCGv ret, TCGv shamt)
+{
+    tcg_gen_movi_tl(ret, 1);
+    tcg_gen_shl_tl(ret, ret, shamt);
+}
+
+static void gen_sbset(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_sbclr(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_andc_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_sbinv(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_sbext(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    tcg_gen_shr_tl(ret, arg1, shamt);
+    tcg_gen_andi_tl(ret, ret, 1);
+}
+
 
 #ifdef TARGET_RISCV64
 
@@ -832,6 +874,66 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_shifti(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+
+static bool gen_shiftw(DisasContext *ctx, arg_r *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, 31);
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    tcg_gen_andi_tl(source2, source2, 31);
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#endif
+
 static void gen_ctz(TCGv ret, TCGv arg1)
 {
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-- 
2.17.1


