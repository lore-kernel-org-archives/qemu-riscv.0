Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iK2YS-00059o-KD
	for mharc-qemu-riscv@gnu.org; Mon, 14 Oct 2019 11:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2YQ-00056i-25
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2YP-0007us-1X
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:37 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:56260)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2YM-0007qi-VP
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1571067991; h=Content-Transfer-Encoding: MIME-Version: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=mKfdVcMnjwr/PCEUJrPeGUjvWyXL5CqobGQSV80LBhI=;
 b=z2lP73f9ywNoHJJUFVMzriRDN89qJ9IaVXifoLI+J0DqZuLUnOdVDcLXqVsfcKWTK8hzntJF
 HqkqHbdwHXQjKP3iaI/KNEvB8/gbqWBTXUZQS4hVotApdQDjkMoRiiQ9gOKYKEOWzSyqTLsn
 dMjVGYyyiQqbqLtSvshqpcoHuB8LU4ZssfK/f0fitcPEuEv78Ft2Gf3RtqXnlyu6mzBhD9x0
 U6SWEbyaTv74kyhCOiOJV59L2arJswGdCY06NxWL5D2Ta9yJaBhGPiapBdQv8KrNrlVVwFx4
 u4Cm4g6iA27wmwiUc7jQdMSyIS3KuWt9OsWVAebty5U8t8ijyWZdkQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5da49851.7f705dace450-smtp-out-n01;
 Mon, 14 Oct 2019 15:46:25 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jonathan Behrens <jonathan@fintelia.io>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v4 1/3] target/riscv: Tell gdbstub the correct number of CSRs
Date: Mon, 14 Oct 2019 11:45:27 -0400
Message-Id: <20191014154529.287048-2-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014154529.287048-1-jonathan@fintelia.io>
References: <20191014154529.287048-1-jonathan@fintelia.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
X-List-Received-Date: Mon, 14 Oct 2019 15:46:39 -0000

If the number of registers reported to the gdbstub code does not match the
number in the associated XML file, then the register numbers used by the stub
may get out of sync with a remote GDB instance.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ded140e8d8..cb5bfd3d50 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -384,7 +384,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             4096, "riscv-32bit-csr.xml", 0);
+                             240, "riscv-32bit-csr.xml", 0);
 #elif defined(TARGET_RISCV64)
     if (env->misa & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
@@ -392,6 +392,6 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             4096, "riscv-64bit-csr.xml", 0);
+                             240, "riscv-64bit-csr.xml", 0);
 #endif
 }
-- 
2.23.0

