Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzCUQ-0006xB-8t
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 01:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUK-0006sR-6D
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:38 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUI-0002O1-ET
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982974; x=1671518974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szLf4+H6loGSUBXV3yvtyEKTqnWeINnnQTOWKG5HXYo=;
 b=lUlIuYNCSktyTtk3VFtX5lZCsa6LDO7nnH9ct6jSaMHEU/7GNjnGbacd
 LLxXAJGj1e9I0tJ42T9jv1hwPeJbkUqHlmF7K4J/1W9itRWI49qOuA0xL
 xdcRIVI+/SR8j1NwtgFKK/6TCgQW4mo97zNom9cmzgw4G3RLcA5eaPw4u
 TYFtQCRZZ6eLXXO2WwUGed6epByVXImOkjK8Azj/ACPJS/UXnNWcIwtgw
 xtERWJ+3zZYKYphUBaI/QwPhNBRyllaEnQdkvctENpriKVe29JDWQlwem
 8F+WZhWPJgHRJiRJJO8SunaPibw2fIAKDBvPOln6F3qLhF+g+c3uqfBxD Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="187632722"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:33 +0800
IronPort-SDR: Xpm5ggHh/lNbK5Kyk1vIBMSw0qbOOsHS9c0wBPa8GBgE+PbP9zneYsCXWAx7TVpDQJwl6c5i3y
 j29I3hQWpAcnJpjtgOap//PpJIEHZTeufnIkRq50YTHPrATaLuqNtJSyQ5nVWtNqt5LGGxG4/+
 PFZ2ofFQCNFo2MWRYayq+hbFVtKk9v1STOvQGs5XgneQJaLObZ3miUy/i+KMv5JnsZoEAkiLiJ
 ODD7uxt2+0QyJU652+qKR+xeE/XGDuIcWFVOJd9rgqEEdTkhIZgSVi6uv+56WF2Koq9Hh5UZcy
 CPa9VosV3rA7X5Zq3MQJmLOa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:22:23 -0800
IronPort-SDR: 2XRTwB3FcqbF6zHaQbOItkTwacQH3TCklHd3fl2GOkHPN51areu8zj8hfRHoO+c0Aek6MTb4F6
 XrCSFQXZtpbqfECvHG/+xjvqwvk4+kt2CpoN7nTWmJoRPIG9e8o6xLwfbz2UujZkdA5Vlt7eaO
 AqSxsAnB5a2+6si5BxgRP6LRIVWLT/BUBTf6cgBCtx+13TaL9buLMBzvX8hQTTgud2ZEUqmpGa
 yi8MPHvHh7i5SOwDEbcHt6GcIvOfBBA+GKJ2gireWcEeKUW0lqs5W2XsWVC0BxKJ6T+fBwi5dp
 qZ0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVZ46RGNz1RvTg
 for <qemu-riscv@nongnu.org>; Sun, 19 Dec 2021 22:49:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639982972; x=1642574973; bh=szLf4+H6loGSUBXV3y
 vtyEKTqnWeINnnQTOWKG5HXYo=; b=HJb09PaCbU4usWT/QXoHNJMBoStNM4ZybS
 uuGovr+zIuT3dgmKhuu3iINpqYPPIlAq4by5WsOdbedPZbpbwEsdiUChIX+q8xT5
 hc8zcjmlJAHESX48385mN603zB4J4EXcatUJT0AURv07FF3PfQ1uqyaee+PJbhr2
 S1CxWpfPrsiZSz4uHoHFxYF7tKjKN1xqQID/ofsl1e0pEgt/ZPtYHSz6THo5zUO6
 fe+VOtcEKDrkRMVbA1rtBbDOS/YeR4oYmDhXt+cALZE7lO1rJC8IF9t+OkauB8wI
 D8+zlcnrmPks8ZXZe6R72xsAWmmsp+/sfW877z0tGypUhb85ACGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qA_3lopYNnNa for <qemu-riscv@nongnu.org>;
 Sun, 19 Dec 2021 22:49:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVYz4ZF8z1Rwvd;
 Sun, 19 Dec 2021 22:49:27 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 1/3] target/riscv: Set the opcode in DisasContext
Date: Mon, 20 Dec 2021 16:49:14 +1000
Message-Id: <20211220064916.107241-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Mon, 20 Dec 2021 06:49:38 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..24251bc8cc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -586,6 +586,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
+            ctx->opcode =3D opcode;
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
                 gen_exception_illegal(ctx);
@@ -596,6 +597,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
--=20
2.31.1


