Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8g5B-0002AK-70
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 03:01:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8g59-0001og-8g
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 03:01:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8fyK-0002j6-Am
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 02:54:09 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33575)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8fyK-0002im-2q
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 02:54:08 -0400
Received: by mail-pl1-x634.google.com with SMTP id bg8so1182677plb.0
	for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2019 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=vUMtH/5yGUYau7/QJGeMKHa++U5mkr6c61IYfcEVBV8=;
	b=aEUOX+Q9G1SUTgRRAFiLKgvmayWBgCk7isp8VF40uD0whRfhlDnlI97cQU7G6Syynw
	3FaAiMziLvuH2qp4hPz5e4J5ydXkIy2ckMM4xFDiX5PXsU+ru1sCDYbxDGTXhQhx2aFS
	bh5yzkhM+fXGpPGaGVMFQ+soXvgnbVAwTNr/1ueXFhQIbcJh1OMNFKZHA8+3FZw8S0J1
	zsroDVzVtmYL+hIK0I+YogPzF7rd32uP3AVdbaKS1WpuvR7f9sI+LE8NmO1X3Dvw59Ko
	20mbTmTBn+VqP0XMtoGgm5mF8oaAVlLwjOcCkoPXdTsCay/tb06KZONNY3Nn5meaWOf5
	0dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=vUMtH/5yGUYau7/QJGeMKHa++U5mkr6c61IYfcEVBV8=;
	b=K7kwGBGnTnF13NEXOE7wSsWgx+cf8/94ExyHqpqgzs4LJthnuIJbFuXNXufb+SFXcz
	zmO/pxJ2Eoe8f1DU26/+h983l78wAO1YSRfOW5flBw23tbh/1OdwCM71UlU5B+B8+YAd
	IXoiavHV0ZJ9GwXbexNNiMUvbfTELJSM2dYHwyey1ugE42E9l++r6dbxrwN4n7BIhcn+
	VDqcOTJaeXREeCcX1Uh28Y7RrLmk2ZSV0/PQ4obL5dfWZ+BX3vrHOoiovUaN/MMP2O2x
	Q/dUSQZJBL3fEvA0ybeuQBIoLW6fRKE5VOHmSWvxVb2Amd/UwNHR95ina7SWSKQeZJdY
	TmXA==
X-Gm-Message-State: APjAAAXDdL+bCIAqnli54LHx/B3LPUJ3RK0BRkbWWmVJVmvxaK42XPT+
	67u2WRf1Kx9yT/mAxFWA6KZO+g==
X-Google-Smtp-Source: APXvYqxt7NbrTSDf218z1iE2wO3yTBfVo2rVOBR1seQuh9ktyiDPmyS67Zn8MalXonmzBxC6coNzcA==
X-Received: by 2002:a17:902:a9c8:: with SMTP id
	b8mr29716159plr.12.1553583247132; 
	Mon, 25 Mar 2019 23:54:07 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
	[2001:b011:7001:1270:b809:36ef:31ed:7980])
	by smtp.gmail.com with ESMTPSA id 5sm17111618pfh.5.2019.03.25.23.54.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 23:54:06 -0700 (PDT)
Date: Mon, 25 Mar 2019 22:56:07 -0700
Message-Id: <20190326055607.14694-2-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190326055607.14694-1-palmer@sifive.com>
References: <20190326055607.14694-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: [Qemu-riscv] [PULL] target/riscv: Zero extend the inputs of divuw
 and remuw
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2019 07:01:12 -0000

While running the GCC test suite against 4.0.0-rc0, Kito found a
regression introduced by the decodetree conversion that caused divuw and
remuw to sign-extend their inputs.  The ISA manual says they are
supposed to be zero extended:

    DIVW and DIVUW instructions are only valid for RV64, and divide the
    lower 32 bits of rs1 by the lower 32 bits of rs2, treating them as
    signed and unsigned integers respectively, placing the 32-bit
    quotient in rd, sign-extended to 64 bits. REMW and REMUW
    instructions are only valid for RV64, and provide the corresponding
    signed and unsigned remainder operations respectively.  Both REMW
    and REMUW always sign-extend the 32-bit result to 64 bits, including
    on a divide by zero.

Here's Kito's reduced test case from the GCC test suite

    unsigned calc_mp(unsigned mod)
    {
         unsigned a,b,c;
         c=-1;
         a=c/mod;
         b=0-a*mod;
         if (b > mod) { a += 1; b-=mod; }
         return b;
    }

    int main(int argc, char *argv[])
    {
         unsigned x = 1234;
         unsigned y = calc_mp(x);

         if ((sizeof (y) == 4 && y != 680)
      || (sizeof (y) == 2 && y != 134))
    abort ();
         exit (0);
    }

I haven't done any other testing on this, but it does fix the test case.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvm.inc.c |  4 ++--
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
index 204af225f8f3..47cd6edc72a1 100644
--- a/target/riscv/insn_trans/trans_rvm.inc.c
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -103,7 +103,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_div_w(ctx, a, &gen_divu);
+    return gen_arith_div_uw(ctx, a, &gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
@@ -115,6 +115,6 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_div_w(ctx, a, &gen_remu);
+    return gen_arith_div_uw(ctx, a, &gen_remu);
 }
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 049fa65c6611..dd763647ea55 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -600,6 +600,27 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
+                            void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+    tcg_gen_ext32u_tl(source1, source1);
+    tcg_gen_ext32u_tl(source2, source2);
+
+    (*func)(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.19.2


