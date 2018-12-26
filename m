Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrK-0004A9-Mm
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrD-00044B-UA
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrC-0007p3-2t
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:35 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:35426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrB-0007mC-Lr
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:33 -0500
Received: by mail-qk1-x743.google.com with SMTP id w204so9627645qka.2
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=WHGAQUfOGf/lF2aQbiDJ1O5xra2r7l4uqRWZE5qJgIs=;
	b=jh9Pk4XjZBvkRVzqBGxwtDTMi7TiqBV5bXoLhGvlrPwFEGzLgTthfR1RhrxG1BYKRF
	d+u9aagpylBap8s6gdG9h2L636vJB20UgqjBmXzfnktCoXbqVGyX/1RKb5aEpNpiP7PV
	C5oRYpEmxKr4ox+amGbaFLsL5yuh/bdneHlUwrjeqyIXXp2tE1cEs6anVhf+ImUPASHq
	DPLTKz1cOBwx8HSkgLWQqR4EYHf62Psz+Z43fGedFk7PvQJ7gkzVRazR4aBHhXGgZsTM
	F3UPvpmNsc6SeJnTGX4Ix7ZGJ3hI6uOq2RS1JwhD8N8BKmIoJ5H2t4k3qSumtHf2MBnU
	wcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=WHGAQUfOGf/lF2aQbiDJ1O5xra2r7l4uqRWZE5qJgIs=;
	b=p/rEZblW0ol27rxWLvhv7GZrfwaAmZmF4TbwgrO6gZSJU1QFdgigQ2bviXeLiFA/bQ
	a/ZYa87e8CvfkoyGykEn0e2nv7+BkhiIw1irWOK6dNsos9ydCmnrJWiTOtxLjNNISUSt
	E5EXas8nC34Lh8WMYGldVjWQm+oYwEp89rF7hQ6e7ZmIgWhUsX4ZbXSQNVY0bXzJN8Y7
	xtM9DRMFXWEIV9kV1HonPKq4aL8PNbFhBcxgp2X8ZziittrNlUzvtgW0r9ICKfAf51NP
	x5bYQqp6s41hITsH5z5Byg3Hu/uJ+XSekcUD5lgwEI5+5oIKnT8tbMaqPP3mg6Yyy8h6
	/lmw==
X-Gm-Message-State: AJcUukeaYjeO/uhMS1/Pn374NVW3j1XqyWLBkuE9kr/y5e06mUBfdael
	u9WVAdDnuDw1YmkZZTgOPLwXKmwEr9I=
X-Google-Smtp-Source: ALg8bN4svfrDAlxYKl+NsPTyCmuxbmm7ZDU/jTqowIEYq0ozONw5YCu6tfBmpNzO62A/WRjyeN6owQ==
X-Received: by 2002:a37:7d85:: with SMTP id
	y127mr19100936qkc.302.1545844828127; 
	Wed, 26 Dec 2018 09:20:28 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	b17sm12614931qkj.69.2018.12.26.09.20.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:27 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:59 -0800
Message-Id: <20181226172005.26990-9-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: [Qemu-riscv] [PULL 08/14] RISC-V: Fix CLINT timecmp low 32-bit
 writes
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:37 -0000

From: Michael Clark <mjc@sifive.com>

A missing shift made updates to the low order bits
of timecmp erroneously copy the old low order bits
into the high order bits of the 64-bit timecmp
register. Add the missing shift and rename timecmp
local variables to timecmp_hi and timecmp_lo.

This bug didn't show up as the low order bits are
usually written first followed by the high order
bits meaning the high order bits contained an invalid
value between the timecmp_lo and timecmp_hi update.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Co-Authored-by: Johannes Haring <johannes.haring@gmx.net>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_clint.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index 0d2fd52487e6..d4c159e93736 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -146,15 +146,15 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
             error_report("clint: invalid timecmp hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp_hi = env->timecmp >> 32;
             sifive_clint_write_timecmp(RISCV_CPU(cpu),
-                timecmp << 32 | (value & 0xFFFFFFFF));
+                timecmp_hi << 32 | (value & 0xFFFFFFFF));
             return;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp_lo = env->timecmp;
             sifive_clint_write_timecmp(RISCV_CPU(cpu),
-                value << 32 | (timecmp & 0xFFFFFFFF));
+                value << 32 | (timecmp_lo & 0xFFFFFFFF));
         } else {
             error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
         }
-- 
2.18.1


