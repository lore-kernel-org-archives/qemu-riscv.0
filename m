Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hikbh-0002Zk-Hh
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 15:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hikba-0002Y7-QV
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 15:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hikbY-0007SX-0x
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 15:07:46 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:55910)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hikbX-0007S1-LI
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 15:07:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1562180863; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: Cc: To: From: Sender;
 bh=bhPgRYbSneY4s1bR3e/dhpZYjODq0ldO7IJvZCUOrog=;
 b=nz8LrS24O+aTiaMwKtg7GrpUegoY6lMFo1yLqgQ43Qh1kwmJDhQxrHdSmTFirhw5687Qt2wG
 PUipJ+q+Nl0GNqeAFzD5eCmX9UBGxobuek1UJjzfKG6T3g6nuqJxURdJIGU0vDD3GHKyu/Kl
 DtZJl3bvUCVRvBsHsCmxTDAEBqoDF/xsbKxOmo/+s9YW9+hWJa9B5X0HKkF5zbzxzodCrW7A
 tRLTFYHEkwaK+K+UR4gwrrjMGjEX+z7vtiI97fK8IU11by4rKWUXsUlXxYSSfhtBFCMns4iu
 MlKJw7V6qMMHxt3UBxnTSeUhdWgrX7okwkXWG9/eKgITD69veXNGuA==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
 (30-9-3.wireless.csail.mit.edu [128.30.9.3])
 by mxa.mailgun.org with ESMTP id 5d1cfcfc.7f5bee2bd210-smtp-out-n01;
 Wed, 03 Jul 2019 19:07:40 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org
Cc: Jonathan Behrens <jonathan@fintelia.io>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Wed,  3 Jul 2019 15:07:14 -0400
Message-Id: <20190703190715.5328-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH] target/riscv: Disallow WFI instruction from
 U-mode
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
X-List-Received-Date: Wed, 03 Jul 2019 19:07:48 -0000

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/op_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 331cc36232..2e5a980192 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -129,10 +129,10 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-
-    if (env->priv == PRV_S &&
-        env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TW)) {
+    if (!(env->priv >= PRV_S) ||
+        (env->priv == PRV_S &&
+         env->priv_ver >= PRIV_VERSION_1_10_0 &&
+         get_field(env->mstatus, MSTATUS_TW))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         cs->halted = 1;
-- 
2.22.0

