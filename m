Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6zBa-0004dr-Oc
	for mharc-qemu-riscv@gnu.org; Thu, 21 Mar 2019 11:00:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6zBX-0004bu-Hv
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 11:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6zBV-0002vR-9b
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 11:00:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6zBU-0002sM-Ba
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 11:00:44 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r124so4387868pgr.3
	for <qemu-riscv@nongnu.org>; Thu, 21 Mar 2019 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=JORoJzYgQFH/7WNMb1acrFIMBBGdNJO3f8a7htCYba0=;
	b=SnnKAfMN6GX24WcIlk7TgcjH+TMnChzRlFFZXOcUTQ1KmNAFqls3ccIw4LqSw/3DUz
	Zv8LqczXFmsmn4q7D5qCjn8YP/Lyg02ek8qh3FSIh+13qIf1H6xnuzpqFeM3ziIG6BQ2
	XJdzYHCKNMryAziivuM+4lxLK6RS7NEAChohiGgPKLSnuaSgRDOBHog5iAy92JHoXn5v
	uuteJzrhlVW3LnkJqaWQ8WC9KpVRkl91prAa7VPnGVoQfvvNcbicymfEF9a2hmD30MNB
	tbXEuF32iEJ90tg5Tnf3AORRXXyXR7JKhFPAPyY8bOiZPOBUQUznOgn8kVpL45R4VZY0
	jrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=JORoJzYgQFH/7WNMb1acrFIMBBGdNJO3f8a7htCYba0=;
	b=TVjcrbCJtRO46LayYRiIS/U3uMMkpBP20wsdC+OhvTuDA3/kvnjoPZluVGaGbwRqZe
	UZV/ZyJVDkLZbCD+9eFA4z78cKgNR3dj4sIcmIwIVC1cyPL4eSbTU7sxkocQx/sOV5Tn
	06bC3xIbTG36Q70OzfUR2g2n82fv+8G6HvphUxJ+k+QYbx+eLU3cUePmxdSSjKP8sDKZ
	iHe9ZX66PYtJE+Jik5AbOGh2FUctQbLvDZ9xufNdPNp9elyNdF8FHVRDPohh0n9b4O4/
	AVzQxnVX6hDWyZ7JnuC3BuY9YvSaSd4jEwhD4/M7KRIqGM500Gw4FBgb6nXusXE+brzG
	3V8A==
X-Gm-Message-State: APjAAAVOC2bMf0p3CAIg5+WnlpHswbS3O0IRF4+bstggnroBHuBFixFF
	Qz1FKAk4i3MprGSDLZUtX18E1ji1cwBbH22N
X-Google-Smtp-Source: APXvYqwfNHjNPG4AGfyDOuJU5cNhzZO5DU3mQc48Y4CO+DUILbKS9fdIKtsy3b5eX8RSA4HZ4JySag==
X-Received: by 2002:aa7:8251:: with SMTP id e17mr3766682pfn.96.1553180440752; 
	Thu, 21 Mar 2019 08:00:40 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	m17sm8304368pff.170.2019.03.21.08.00.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 08:00:39 -0700 (PDT)
Date: Thu, 21 Mar 2019 07:59:20 -0700
Message-Id: <20190321145920.20897-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@gmail.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: [Qemu-riscv] [PATCH] target/riscv: Zero extend the inputs of divuw
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
X-List-Received-Date: Thu, 21 Mar 2019 15:00:49 -0000

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


