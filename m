Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hx9dh-0001pR-SJ
	for mharc-qemu-riscv@gnu.org; Mon, 12 Aug 2019 08:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <schwab@suse.de>) id 1hx4dR-0006v0-41
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 03:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <schwab@suse.de>) id 1hx4dQ-0001IH-9X
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 03:20:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:36376 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <schwab@suse.de>)
 id 1hx4dM-0001EP-Au; Mon, 12 Aug 2019 03:20:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 62B99ADCC;
 Mon, 12 Aug 2019 07:20:44 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@sifive.com,
 peter.maydell@linaro.org, stefanha@gmail.co, codyprime@gmail.com,
 anup@brainfault.org, stefanha@redhat.com, alistair23@gmail.com,
 pbonzini@redhat.com, linux@roeck-us.ne, bmeng.cn@gmail.com
References: <cover.1563302751.git.alistair.francis@wdc.com>
 <202a2df9cd8e3de2555295446ff1a144eef61eeb.1563302751.git.alistair.francis@wdc.com>
X-Yow: Everybody gets free BORSCHT!
Date: Mon, 12 Aug 2019 09:20:43 +0200
In-Reply-To: <202a2df9cd8e3de2555295446ff1a144eef61eeb.1563302751.git.alistair.francis@wdc.com>
 (Alistair Francis's message of "Tue, 16 Jul 2019 11:47:22 -0700")
Message-ID: <mvmwofizw6s.fsf_-_@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Mon, 12 Aug 2019 08:41:28 -0400
Subject: [Qemu-riscv] [PATCH] roms/Makefile: fix command for
 opensbi64-sifive_u
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
X-List-Received-Date: Mon, 12 Aug 2019 07:20:54 -0000

Copy the correct firmware file

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 roms/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index dc70fb5aea..775c963f9d 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -183,7 +183,7 @@ opensbi64-sifive_u:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=$(riscv64_cross_prefix) \
 		PLATFORM="qemu/sifive_u"
-	cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
+	cp opensbi/build/platform/qemu/sifive_u/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
-- 
2.22.0

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

