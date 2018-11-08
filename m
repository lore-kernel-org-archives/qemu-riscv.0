Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKj69-0006OH-TU
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 07:07:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKj63-000620-70
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 07:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKj5q-0003TY-9C
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 07:07:35 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:54018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gKj5X-0003Kb-S9; Thu, 08 Nov 2018 07:07:08 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gKj5V-0007T8-II; Thu, 08 Nov 2018 13:07:05 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 2976062-5;
	Thu, 08 Nov 2018 12:07:05 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: kbastian@mail.uni-paderborn.de, mjc@sifive.com, sagark@eecs.berkeley.edu,
	palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Thu,  8 Nov 2018 13:06:28 +0100
Message-Id: <20181108120628.29926-3-kbastian@mail.uni-paderborn.de>
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
Subject: [Qemu-riscv] [PATCH 2/2] target/riscv: Fix sfence.vm/a both
 available in any priv version
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
X-List-Received-Date: Thu, 08 Nov 2018 12:07:44 -0000

sfence.vm has been replaced in priv v1.10 spec by sfence.vma.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/translate.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5359088e24..f44eb9c41b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1292,10 +1292,14 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
     if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
-        /* sfence.vma */
-        /* TODO: handle ASID specific fences */
-        gen_helper_tlb_flush(cpu_env);
-        return;
+        if (env->priv_ver == PRIV_VERSION_1_10_0) {
+            /* sfence.vma */
+            /* TODO: handle ASID specific fences */
+            gen_helper_tlb_flush(cpu_env);
+            return;
+        } else {
+            gen_exception_illegal(ctx);
+        }
     }
 #endif
 
@@ -1342,7 +1346,11 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             gen_helper_wfi(cpu_env);
             break;
         case 0x104: /* SFENCE.VM */
-            gen_helper_tlb_flush(cpu_env);
+            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
+                gen_helper_tlb_flush(cpu_env);
+            } else {
+                gen_exception_illegal(ctx);
+            }
             break;
 #endif
         default:
-- 
2.19.1


