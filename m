Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKj5u-0005sf-8J
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 07:07:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKj5r-0005q9-FW
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 07:07:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKj5m-0003RB-4h
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 07:07:27 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:54662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gKj5X-0003KW-Jz; Thu, 08 Nov 2018 07:07:07 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 nylar)
	id 1gKj5V-0000MC-Ne; Thu, 08 Nov 2018 13:07:05 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 2969533-3;
	Thu, 08 Nov 2018 12:07:05 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: kbastian@mail.uni-paderborn.de, mjc@sifive.com, sagark@eecs.berkeley.edu,
	palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Thu,  8 Nov 2018 13:06:27 +0100
Message-Id: <20181108120628.29926-2-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.11.8.115717, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH 1/2] target/riscv: Fix FCLASS_D being treated
 as RV64 only
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
X-List-Received-Date: Thu, 08 Nov 2018 12:07:29 -0000

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18d7b6d147..5359088e24 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1237,13 +1237,14 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         tcg_temp_free(t0);
         break;
 
-#if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_X_D:
         /* also OPC_RISC_FCLASS_D */
         switch (rm) {
+#if defined(TARGET_RISCV64)
         case 0: /* FMV */
             gen_set_gpr(rd, cpu_fpr[rs1]);
             break;
+#endif
         case 1:
             t0 = tcg_temp_new();
             gen_helper_fclass_d(t0, cpu_fpr[rs1]);
@@ -1255,6 +1256,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         break;
 
+#if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_D_X:
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
-- 
2.19.1


