Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hptav-000112-8K
	for mharc-qemu-riscv@gnu.org; Tue, 23 Jul 2019 08:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36381)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hptas-0000l1-2y
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2019 08:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hptap-0003CJ-VF
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2019 08:08:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hptam-00038Q-1T; Tue, 23 Jul 2019 08:08:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 85DA181F0E;
 Tue, 23 Jul 2019 12:08:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-56.brq.redhat.com [10.40.204.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E2660497;
 Tue, 23 Jul 2019 12:08:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 23 Jul 2019 14:08:15 +0200
Message-Id: <20190723120816.1361-2-philmd@redhat.com>
In-Reply-To: <20190723120816.1361-1-philmd@redhat.com>
References: <20190723120816.1361-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 23 Jul 2019 12:08:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-riscv] [PATCH-for-4.2 1/2] target/riscv/pmp: Restrict
 priviledged PMP to system-mode emulation
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
X-List-Received-Date: Tue, 23 Jul 2019 12:08:36 -0000

The RISC-V Physical Memory Protection is restricted to privileged
modes. Restrict its compilation to QEMU system builds.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/riscv/Makefile.objs | 3 ++-
 target/riscv/pmp.c         | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index b1c79bc1d1..b754e4bf32 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -1,4 +1,5 @@
-obj-y +=3D translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o=
 gdbstub.o pmp.o
+obj-y +=3D translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o=
 gdbstub.o
+obj-$(CONFIG_SOFTMMU) +=3D pmp.o
=20
 DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
=20
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 958c7502a0..d836288cb4 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -28,8 +28,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
=20
-#ifndef CONFIG_USER_ONLY
-
 #define RISCV_DEBUG_PMP 0
 #define PMP_DEBUG(fmt, ...)                                             =
       \
     do {                                                                =
       \
@@ -382,5 +380,3 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uin=
t32_t addr_index)
         return 0;
     }
 }
-
-#endif
--=20
2.20.1


