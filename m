Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iK2Yi-0005G8-A2
	for mharc-qemu-riscv@gnu.org; Mon, 14 Oct 2019 11:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2Yd-0005E5-8h
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2YZ-000820-B9
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:51 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:10549)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2YP-0007uU-1v
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1571067997; h=Content-Transfer-Encoding: MIME-Version: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=us11dJP4tYiWCt+M3OJ3tptc3yO5a5+8OevvcFXza3A=;
 b=PV+zxUXC3VIRJxwHqYnEMUVLsMyZviV1GAcDT4RIEWOJAXdb/wAM0BC/nb47oKyvk9+d6TCe
 AO3qV2hgy9P6yr0S6pl9srqgbEbg89iT/8vx/t1oZwkIIlpoO81szKbDB8uSHiKx15E589ea
 oIlXyTddOkLVI3qhBoq5JEOC931fZTX6nxg14qWMJwH3ts7jMeiwXnhaI5I5X5H+KegobJwb
 hv6rVY12os6QJ1d89/sEtTwNyjWuVzvC8TZ0XJeDXRlL0wA68DJz6tCLbwst//aBfcuJMm/1
 1SPshs8d6ERhxbPTegK4PH0Mwk5XjsMMkIpjmxjZwWGRaFWhtDjJTw==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5da49856.7f705dace450-smtp-out-n01;
 Mon, 14 Oct 2019 15:46:30 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jonathan Behrens <jonathan@fintelia.io>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v4 3/3] target/riscv: Make the priv register writable by GDB
Date: Mon, 14 Oct 2019 11:45:29 -0400
Message-Id: <20191014154529.287048-4-jonathan@fintelia.io>
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
X-List-Received-Date: Mon, 14 Oct 2019 15:46:53 -0000

Currently only PRV_U, PRV_S and PRV_M are supported, so this patch ensures that
the privilege mode is set to one of them. Once support for the H-extension is
added, this code will also need to properly update the virtualization status
when switching between VU/VS-modes and M-mode.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---
 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 1f71604b78..1a7947e019 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -387,6 +387,15 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 {
+    if (n == 0) {
+#ifndef CONFIG_USER_ONLY
+        cs->priv = ldtul_p(mem_buf) & 0x3;
+        if (cs->priv == PRV_H) {
+            cs->priv = PRV_S;
+        }
+#endif
+        return sizeof(target_ulong);
+    }
     return 0;
 }
 
-- 
2.23.0

