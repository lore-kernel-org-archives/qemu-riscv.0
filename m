Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNpbl-0007cH-Jk
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 00:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbj-0007VZ-Qy
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:54:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:16643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbi-0003tb-68
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631076885; x=1662612885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JnuooeBmOvrNM6LgCIWux/Znpi60xXVkixxcdpQC3rA=;
 b=MMNXogOxzWo+ST0cF+7o4tFsvPIkNrDuIybA2Llk2/L8ywg2IjW1tRmN
 CqdG/Lf7GOSnsrkNfPByOGZlWHqESHPO8hqnF9CulMqkzEkG7vz1Z997J
 xau4X/funsI9nzLxPwXk+iqN8qN7Pjcx1cp9+WceW310fjixZFwicN78F
 ZS/nbGe2WgsIkFepiIlbp1tjBgpdsgiyj7/gwJ0GdJVAhjq8kUWKW3FU5
 0f31TWwFmp1d97u0W/783uQqFSNZlCdU82L8uTqJEAMhG0c+ZpVKSXF2L
 MWobRY4Wo8uTO5bLl3MbWZ4K8IeVYpj/DbkXsAb40XtkSKhMAYwJ6mVMb w==;
X-IronPort-AV: E=Sophos;i="5.85,276,1624291200"; d="scan'208";a="179443437"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2021 12:54:41 +0800
IronPort-SDR: XdRk2erqWhhYDriNF7NnVXBYiYV6Zy77bNzE2aEmnGJWDElpt7+IkoMu7cz89/rIdF4dqWqScR
 z/U/cKk40glMTrMfrFgCvpbYdqOQmr5nssChJPNEx4BRSJPeC7jKE5sUJP775MWYbSOm+OlBTv
 iLdrvxI5YSDVsaqaj8T+oUxa9lZTEeXkB8VBfG8NGO10qqrzuiHgMbXTNj4RGo9PCp8/dVjn9m
 VvzP5OEr8awZ93rw+DyY++2oB393YgE5zC45rIp0itwFdBKQBoa3FjkCgVrQBhAV7K4DkH4AsS
 ZcLuSx1HqRm/2E9NNlimb3oM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:29:40 -0700
IronPort-SDR: U+YQzLNQLD676bnQ7ouh5M2wsaYNcX3+8CkAKhtkRM4IQVzECRbxBcdAYu65RyF2ZBp222wiHK
 iGBsCWxFy2y8tks5HrF/AMhzSjqA7Dv7lSczOoEPNuUVODeRN/5LS4BOIKRmkXRFIhEAmmNUjk
 EjpVpfVdLV2EDyi8Q5LLasZrKmOdHJvhbmWBWlkCjId/h4qQGbDTbZA3zH8tkeM360Ct4sUB6v
 5SvJdUKwtx9WGq/zxQNa+FyrmXGG4sKkQFgYV00dZfkVEI8D545PPe4ApDc1/dVc7hu7sDHt2A
 5FM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:54:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H48v60vbZz1Rvlx
 for <qemu-riscv@nongnu.org>; Tue,  7 Sep 2021 21:54:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631076881; x=1633668882; bh=JnuooeBmOvrNM6LgCI
 Wux/Znpi60xXVkixxcdpQC3rA=; b=KQugqwMO/ulvTIyNkzDA4OUdMZehJxcZ/P
 EdiSk1ERUmcByoPjzemkVkaJGi9o+nSvcO2oCMWPASreG7Zi5ulGjVTqyfm1GVkD
 3jPPVSL1ciktiyRUIbt0IkhAuQ8jLRiMUWXp6BzFl4VWsNF4+jHahNzUZpXGvuP4
 Hvb5mDbTcOYxSD600yKEO+0BOnfQIBx5i0bEd+JTmFFIdeqj5DE4i3N22f7XDsbb
 /vYWwPn3zf9eGMRt73H3cQ2Pns4D3L+rOyB/E2r4IrptUgaxRZtbcIrxH7nroyqT
 tuvT6Noaa5kW0l2EW+MIrJPCRb/fT6rLVNd27Bx1Nq+xUOo3E93A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r9sl4Go_Su22 for <qemu-riscv@nongnu.org>;
 Tue,  7 Sep 2021 21:54:41 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H48v06kkYz1RvlR;
 Tue,  7 Sep 2021 21:54:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/3] target/riscv: Set the opcode in DisasContext
Date: Wed,  8 Sep 2021 14:54:28 +1000
Message-Id: <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631076834.git.alistair.francis@wdc.com>
References: <cover.1631076834.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=87817de26=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 08 Sep 2021 04:54:48 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e356fc6c46..25670be435 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -485,20 +485,20 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
=20
-static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t o=
pcode)
+static void decode_opc(CPURISCVState *env, DisasContext *ctx)
 {
     /* check for compressed insn */
-    if (extract16(opcode, 0, 2) !=3D 3) {
+    if (extract16(ctx->opcode, 0, 2) !=3D 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, opcode)) {
+            if (!decode_insn16(ctx, ctx->opcode)) {
                 gen_exception_illegal(ctx);
             }
         }
     } else {
-        uint32_t opcode32 =3D opcode;
+        uint32_t opcode32 =3D ctx->opcode;
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, ctx->base.pc_next + 2)=
);
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
@@ -561,9 +561,9 @@ static void riscv_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cpu)
 {
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
     CPURISCVState *env =3D cpu->env_ptr;
-    uint16_t opcode16 =3D translator_lduw(env, ctx->base.pc_next);
+    ctx->opcode =3D translator_lduw(env, ctx->base.pc_next);
=20
-    decode_opc(env, ctx, opcode16);
+    decode_opc(env, ctx);
     ctx->base.pc_next =3D ctx->pc_succ_insn;
     ctx->w =3D false;
=20
--=20
2.31.1


