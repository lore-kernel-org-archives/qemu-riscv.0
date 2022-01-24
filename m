Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBnjj-0003E4-4E
	for mharc-qemu-riscv@gnu.org; Sun, 23 Jan 2022 20:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnjh-0003CG-7h
 for qemu-riscv@nongnu.org; Sun, 23 Jan 2022 20:01:33 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:63776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnj1-0003rX-IH
 for qemu-riscv@nongnu.org; Sun, 23 Jan 2022 20:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642986051; x=1674522051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9l97yNeymIo/fMxa2isTdGBCvimAkQsFYCnC07EtMM=;
 b=N/iYrH+slhcjr3K6Z9Eij5HsDgI/yd4oQMbrMvhO1ysmpeh0QhAJZI1v
 prxRDfdKtaz3maRWLWRnoC2O9vpE3B56aZgVHf6ejIpifzjQd4stcgYV1
 btzDHWzf2ziFoQK6hkgE3zlpzBPWOyXXmrFFEpJ1ep/SM7v1i5zQW34H+
 uWuw6tpJ+EzvMY6oodH3nyc+tFHQHziCrR/4XKhmbs7rdthNhHhCGArM9
 OHbK942xLBW7MSd6RdWWk0tIHrCQ1gNIGkuVBFFYQIQEudiHsTAkx5TKk
 ks7KHmiBg53oFnAN3i4AOuvtsPc3DHsXmCMhfB84/5Mr5zGwQDCbiMbjH w==;
X-IronPort-AV: E=Sophos;i="5.88,311,1635177600"; d="scan'208";a="195977490"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2022 09:00:26 +0800
IronPort-SDR: 5+Imt0bFrYVDH3l8ccjLWHzFM7uUR0gnSgTauCzGo7g5YsZSbgfVB8l50Ek3l/+FpzOuGJDdPt
 wk+f9IH6bwcgea4Y+rWC5+NAlZvKezOZYtHoI66LBrkNC/YR3BA5+KlgxT9Ij/g1miQDPllR3+
 s+G87PxRIX43FYVSNy8iQv5LhEipU1cy0BW0DuHUaU24Q2kSXu7Gnm7oIYh3stwz6i+0IIBqHm
 Vpz+2B7RTEhrxEVFgowCM9gDqOPjKne7NZ32IEEoY5lTKOHyaF4/kHmC/cnHo8Amdi+mRw8j0n
 FYN8NP3PlqPH40k6KRGZxERW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 16:33:50 -0800
IronPort-SDR: z0a6/KSHkvNtPr8mvMwHAfOHCqtoC0ChOdx5g88bNuNqECalorWZSXkr4aovRVy27a35oh+vwG
 7YsAguhirHYJGgmiKDqUQ/q0TKE/nJwcgrNri9SQWhR/35P6aG/294L+xhCnX4kRLPrkICyBVw
 Okov0xplunK1/bkyXHB7EPyW/lfTGhFhRwceJu6Qpve4+7UCVf/ThyxqC8BNMH5ERSdfNOpP2E
 sRHNKwQRH+rGuZYjqAbM9NjXhKqzmRZTNDvZ+WXtfuF1Evbmftbmup1yCZxxwWB6G6xZCKkEqa
 gkY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:00:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jhs963pcPz1RvlN
 for <qemu-riscv@nongnu.org>; Sun, 23 Jan 2022 17:00:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642986025; x=1645578026; bh=Z9l97yNeymIo/fMxa2
 isTdGBCvimAkQsFYCnC07EtMM=; b=q9W9IuYJMBNpVO1lnt7iP6WSeGxGVEEj1u
 qmd7WIZLvjUk1pu7KbpVBoLuhDhQjy9MF9YzvCZM+rXTyCxj5kzM7wms1LVmDafn
 neuWS4+GweCc4hL12ey3RqfQa7uKpgK9B7KO7be2DysKbld3dQl6p+jDXkgMNT47
 QfJpzyou8pmPx9wzr31kyWfjmbUazDJSKRyMdgoxLiI66N15zbCGHHBsmzvdnjGH
 81ArJpMYTu1B3UpXhkB9pRrWaKt2d+R8am0vpw8YxM97fOwXYaIh5id4V8KbYXO/
 gt34Z4v3UOrHyOekolxz+qM/KNp4uCZIo50xscVMCYd6JSIRSM2w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OYFSVAe8ARoz for <qemu-riscv@nongnu.org>;
 Sun, 23 Jan 2022 17:00:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.84])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jhs8y4G4kz1SVp7;
 Sun, 23 Jan 2022 17:00:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 bmeng.cn@gmail.com
Subject: [PATCH 2/2] targett/riscv: rva: Correctly generate a store/amo fault
Date: Mon, 24 Jan 2022 10:59:58 +1000
Message-Id: <20220124005958.38848-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=01678aa48=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jan 2022 01:01:33 -0000

From: Alistair Francis <alistair.francis@wdc.com>

If the atomic operation fails we want to generate a MMU_DATA_STORE
access type so we can produce a RISCV_EXCP_STORE_AMO_ACCESS_FAULT for
the guest.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/594
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc | 56 ++++++++++++++++---------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 45db82c9be..be5c94803b 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -93,7 +93,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
 static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
+    return gen_lr(ctx, a, (MO_ALIGN  | MO_TESL));
 }
=20
 static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
@@ -105,55 +105,64 @@ static bool trans_sc_w(DisasContext *ctx, arg_sc_w =
*a)
 static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TESL)=
);
+    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amoadd_w(DisasContext *ctx, arg_amoadd_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amoxor_w(DisasContext *ctx, arg_amoxor_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amoand_w(DisasContext *ctx, arg_amoand_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amoor_w(DisasContext *ctx, arg_amoor_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
ESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amomin_w(DisasContext *ctx, arg_amomin_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amomax_w(DisasContext *ctx, arg_amomax_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amominu_w(DisasContext *ctx, arg_amominu_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
 }
=20
 static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
@@ -171,53 +180,62 @@ static bool trans_sc_d(DisasContext *ctx, arg_sc_d =
*a)
 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ)=
);
+    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
EUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
=20
 static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl,
+                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
 }
--=20
2.31.1


