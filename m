Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvZN7-0005cV-O4
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 01:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN4-0005Z8-EW
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 01:27:06 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:64247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN1-0006FQ-Ph
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 01:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639117623; x=1670653623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6wAGSI6QUZs5W11re+UV7WaEUxAjGogCqsZ8UfXLz34=;
 b=Xc2iHgErQ5W8RP6wNzXBiMP7EAzv/80n0MFgEaW0R+NGRc1VvzXTs4fa
 Ztq5Xd8aFcT/7GMIc9Cp4aQJ6buBk2XLqXQ2UgVGiBaLV0SQEIA5Prnwr
 ulAXGqU4m2G4DecySu1/QU4xHTyd2ee51WLj2mbEF5xxEOen3J1KjD7m4
 2cIryC2ojLBq5oTB6n8aMUU+Op0E2MMskcX2aI6Y0LsCaahoVaETOr/0H
 J54nZM7NWKVo5sgdUmQKF1w5bbpexZ0UJ/RwV8aAE6gU0b4slg6o6BoDi
 n/kuGuRzWwPZxwhCssvBMMYdxO+kBHhPAUW9hjGJo1mrGkXXxhgCGG+P7 A==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="291899831"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 14:27:01 +0800
IronPort-SDR: YmpYJjNTnpGwONgAinDx6TynszmFF30Pk4Bnq0fVCPsxeJRxAUnF0DrcrMamBFqiOYaZhWH+UO
 L8mymnfHh6Th9o8wUxV/LztKh/fXWU3lS9e8UhLcCFICTfE/vamJCTggni+IqCI8PihX9ZW3cc
 nX+yLxHDGWzlsuiP6Vj/MWs6QaWy7h0S5egWkBLfxJg1k9MfpHXphkNURzahHdV0pCrFQd23M5
 u19MOEjaeFNs6P41csRiMnS8HOlpmQMK9GMGelW52l+03CWnp0GtrlC1NqpEPlyh77ctjwr2qK
 8eh0qFKkLqDq69wQkGIAhfcB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:00:03 -0800
IronPort-SDR: UKr0NuKycBTItQrorFCeyscGw0P2SQxStoIWIT4JbCFL7qPc5D52/cJWlc6zQsVjIyQBf2fQvQ
 bcpQ45I6JDJRiok0tddGzbdBBYFWYuXqyKKY4VicUE2MoPdchXhnx+dsH/7KDVI5Ds/9veoWk7
 BAgIQc2d9/lHVHy7E84z/aN3Rw/EyLsujyNWpxjSzTeZF1nuV5jGQtcpGtaGpHRf51C/L4IuhG
 rKAhUXMbSCos2u0fj+fPeXgf3wrvctSeRKoyERcOu1Z8KgssIPi22UodHqolomOQ0tuHw29EHC
 E2I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:27:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J9LXj26b6z1Rvlf
 for <qemu-riscv@nongnu.org>; Thu,  9 Dec 2021 22:27:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639117620; x=1641709621; bh=6wAGSI6QUZs5W11re+
 UV7WaEUxAjGogCqsZ8UfXLz34=; b=GBTW1AjyFy/YqvqYJxukhcJ8Eom3ttXvIW
 1fT5+G6MFyTJRdIwn1YxYOhAEq5XlEDJzFk28yDOkKd6fX/oHoe5qbD11oLNBfVh
 C/FlFRmRrqb0noovCH722LrHCwoDrVdz5HcrP99cuA6xiBMXzbqLMJzgIoembv0i
 kBROm9teEvZIl8SvYxpEX0KOC+6GcwXv8rU/xvzvf1Urhu6jt8wDI/1HnkGXlOZQ
 ZvZKXMTF4qeR0AqKhZBbJtTY0L+mIWPj0BJ/ikIn3USq6LmMRpAdsl58uYxmgofI
 rY3gsZNnXZYSLufNxBpSkDpYaCBjK+0nA83wqOeAwQbwIhvA/26A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vOX-Ie3n8nBf for <qemu-riscv@nongnu.org>;
 Thu,  9 Dec 2021 22:27:00 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J9LXc5Pk6z1RtVG;
 Thu,  9 Dec 2021 22:26:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Subject: [PATCH 1/2] target/riscv: Set the opcode in DisasContext
Date: Fri, 10 Dec 2021 16:26:37 +1000
Message-Id: <20211210062638.824672-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9719c98f0=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Fri, 10 Dec 2021 06:27:07 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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


