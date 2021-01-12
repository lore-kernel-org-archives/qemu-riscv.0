Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9IX-0000xL-Gv
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IV-0000ug-J2
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:39 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IT-00026O-OJ
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:39 -0500
Received: by mail-pj1-x1033.google.com with SMTP id my11so87864pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vI4PT95qFC5cOpQqvpiMt5k7T9r484Z0BZTxnN6cUx8=;
 b=AI2tPDFp/PPL3n7P7whv0Ihmp91v8XAFFZG18nhjYk7hrzl0Qp/bqukGMc1NXt7ouN
 /Go/dfXl/IYWp80U0MWVWsDZ4++/X/6kwGidWuFIff1A2plRrcAXE6haxjqe0QCgMM/z
 sr3NbY7vncBwFA5W79wSSHZ14nJSYswQvuSOsYKvq+RV07v9nMO7EIw1b1mBf9AskSHg
 MhkrKfnPh0CO19oXsoNVBDc0DcGPPhdwjhABiae0uIbcAotaD9QR4srCuWN75Vqm/WTe
 sUg9TmhxLj7sQL4nLljkJ2HKyDHi6hPVbguMy9qAgqL8q8jWT3GUTMkLosj+ITw5i0XF
 JLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vI4PT95qFC5cOpQqvpiMt5k7T9r484Z0BZTxnN6cUx8=;
 b=ToWN3aO7GNOLHMvmFJB0NObbqpUn1JsgSJSlR2uVbuQfCc2aXKsWw4t4aeQI+mZ1Ay
 vTaXRvu4O2EuD9nt3awgejzwrk3f6MAU0HivGwDRd7HAZcn3PduFD9cPAltMS3G8Vrob
 JHOFtw+w5UgzXoA1pTW4zRjtO/sfaeYlchsPbKZDdg/n2vnnIK0+O1jvJ5olzi+p/b9e
 dSoECiKEG9raqqYKIPme6VqPqla0dbDGUpoZpSRSx/fG1GvzEaQY9UZbPCq1vCW5Ez2b
 2C/R7doq7CAc+ClMuUrxBdAfTAo13nVPEGZE6nE9UgSc2JMdKmwzaWNFX/E4Q99eIdel
 RNtA==
X-Gm-Message-State: AOAM531vwztmA0J5UZm3ewTKVhVhse1KLpC1hall1VVrQD+j94zrcnLf
 9VmyJY+0doVZZiH+s+aznBnRFw==
X-Google-Smtp-Source: ABdhPJyYfVOzM1avGrJ9ent9jfeAIn22bGm+qVeKCHbb2nKx6VvntON9UnZWvIeqJeY0TqELcTzt8w==
X-Received: by 2002:a17:90a:c084:: with SMTP id
 o4mr1920727pjs.165.1610418036470; 
 Mon, 11 Jan 2021 18:20:36 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 05/16] target/riscv: rvb: pack two words into one register
Date: Tue, 12 Jan 2021 10:19:46 +0800
Message-Id: <20210112022001.20521-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:20:39 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 30 +++++++++++++++++++
 target/riscv/translate.c                | 40 +++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 89498a9a28a..d28c0bcf2c1 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -91,3 +91,6 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+
+packw      0000100 .......... 100 ..... 0111011 @r
+packuw     0100100 .......... 100 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d0b3f109b4e..7f32b8c6d15 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -602,3 +602,6 @@ cpop       011000 000010 ..... 001 ..... 0010011 @r2
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+pack       0000100 .......... 100 ..... 0110011 @r
+packu      0100100 .......... 100 ..... 0110011 @r
+packh      0000100 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 73c4693a263..2d24dafac09 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, tcg_gen_eqv_tl);
 }
 
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_pack);
+}
+
+static bool trans_packu(DisasContext *ctx, arg_packu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packu);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packh);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -74,4 +92,16 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     return gen_unary(ctx, a, gen_cpopw);
 }
 
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packw);
+}
+
+static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packuw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3a14bdba194..53c0c34ce16 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,6 +711,29 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_deposit_tl(ret, arg1, arg2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
+    tcg_temp_free(t);
+}
+
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -732,6 +755,23 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext16s_i64(t, arg2);
+    tcg_gen_deposit_i64(ret, arg1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_i64(t, arg1, 16);
+    tcg_gen_deposit_i64(ret, arg2, t, 0, 16);
+    tcg_gen_ext32s_i64(ret, ret);
+    tcg_temp_free(t);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


