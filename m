Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixhIm-0004eG-7h
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 20:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIj-0004Xi-4Q
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIh-0006nx-Bx
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17129)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIc-00069K-Mh; Fri, 31 Jan 2020 20:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519414; x=1612055414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Un87p05BHTC7q3iYM5JGl4ck5VhjcF8oqmPMHOJ6FRE=;
 b=dxThINWCCHYoVkw7py1OZ4oXcSkN0CexyAE0+3YvN6CWtRJjp8FmQxhr
 vBnR8iIVja2VZjYfxugdv3WCdTj8NkIqC5zDt1qQ7Tp6Lz30WmvAKC9q1
 4jdg/tEZVhtYyxug9Pv2muUmpmOEMdwwlRebGIqjBaXQ6MwuaSOvP/DJe
 vKVbLLjGdU6+yRR5sMfR/pvqKpXSckpXNfynP0uOUmLkn9zX2I9wM3PaW
 EV6BLs9wEs1bhHsRsnwP/qqK3rVifKsEvNVTPjCajN8vbp9mTyJHLOfdP
 Dxqk5UYuwf3OJBfsXkqc54+TVdWGlG99TLULng9T8UdnbKupR0p/p8uV/ w==;
IronPort-SDR: 9y38ktyTDgU+E+J2yMMKfIu7pbVw83QtnWVIjfj62+ty0PkmzR+viz0wLxssdrJyQTGv5F1g3B
 1IMErmh/snHMgvpbyxk4uBRsqEwgdq5zoFUEAJvq8J//aKFgFAZ3WFzPBVhQmhL8kheQZzMvHZ
 shQDWj/c9h8aI3ffy++Ugzj2iQ32Tfqn6ayv7iRsuf5fszs5Wzaa9PkqSjLHUYzCRa4YWEv2DA
 2ctMA995uzYhAMDxwHhTb31evLeUQYSmLyExV9k8FK/efVVQp4MAmf+3csDepSCY9EOzkYIa6D
 CSs=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872486"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:09:20 +0800
IronPort-SDR: M7nvFXEfisRLhi9RhGFdLHZ1F4BexyFo0zUyZkkUyhWGoAgMhZ27LcYTs6VYkDU/b6AJRtrUqb
 zxLfSpG1Ts9M9ETTZ7eOhrZvqR2F+eQzq8oiTdichuGJA8LzZEW29RJXSJ+6sW/qH5JFLATDUf
 QXg2j0Rp38lJgp5DyeqtraVyq1nMjwVKBxhJMHTHzxp2Ei7wnHj5bNeYrIq5NjnO5zTQke4Vpo
 TEL+RY7uFjRdKB/qM2v612Iq8HIzPd9Yabn8EBELhnhZFsMAinM1wTQQwjirw76bDVjK01zKR3
 hk+X4B9iu0FU4/+Rvp4QNYWh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:29 -0800
IronPort-SDR: vzJ6EMeryOGQXVk4PbmP7LkX14j/9exVGiRcCApSy0sTS7LqjmKOkbVXKEotwAYdVnAPEwQzq2
 dvKcPOUwo7fOkGmoKB2/98FU7HVG+JamwQhnvJhFli+xfBdUDuo1C/5KBxV+RGg5bOW+Ho4azz
 hfcY2NMKkv1x0lQeXnDIzRo/vmJdbCQOEnNxHMwHlcR0WoOefmAK/ImBoV8HL1U8pnRsKWLvyf
 0uNnPannvO8Q4SIjqqp1tfi85bnF6J+YzyC9NnydvT3E56gqDbzm0WAQ+7qPxB21F4YeGh7Mrc
 Dtg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jan 2020 17:09:20 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 26/35] target/riscv: Disable guest FP support based on
 virtual status
Date: Fri, 31 Jan 2020 17:02:44 -0800
Message-Id: <af25bd3f009f8f73b43c91ab5205bfcb9d28666b.1580518859.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580518859.git.alistair.francis@wdc.com>
References: <cover.1580518859.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Sat, 01 Feb 2020 01:10:22 -0000

When the Hypervisor extension is in use we only enable floating point
support when both status and vsstatus have enabled floating point
support.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e7728cb0ca..827a38324c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -99,6 +99,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_FS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_FS)) {
+            return false;
+        }
         return true;
     }
 
-- 
2.25.0


