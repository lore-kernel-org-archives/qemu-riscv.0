Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHX-0001mX-NK
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHO-0001ei-Af
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHN-0004Dy-0o
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:02 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:39983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHM-00047y-O4
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:00 -0500
Received: by mail-qk1-x743.google.com with SMTP id y16so3345055qki.7
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=WHGAQUfOGf/lF2aQbiDJ1O5xra2r7l4uqRWZE5qJgIs=;
	b=InkDlxoMnrVROvjw+pUN7VTOQ71R3JauNHYjjqmmICSfsBbqehlloIEukaXYl+ny8v
	OwvArBjRSp8cVovL0BcZEUvax42DXusETr0d3OwL8nAd2SxYygByV7Zhe/NxOt+8DBz/
	njtEg8tIbd3Y7XGayn6wPqctay5iqysmkNGF5jzmb6V1BVOST7XNS+GNZu/WaWH9Y4QX
	nwuZ+DYnzBMwl7AeW2ltdykl546dtTRCU9J6fxUlLhdni7mZewiV7OauHrqEXomwcnQ1
	qj8DHAsvQgXktWkLAkapvZNbc+WzrjMPHKv2N3tUYSLJJjRK5hhYT4a4bYe6U2sLIfa9
	b25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=WHGAQUfOGf/lF2aQbiDJ1O5xra2r7l4uqRWZE5qJgIs=;
	b=eSCOVb8WpJOd+e8dikD35oyos81URtnExHk01Ib/l3EUwPUQpPzvxJZ+RlThvlWpij
	Th1osAy4izCtJiUVU1Z2XM76IAGk2/b1ejzNqJejYxRvhiGddtZj9L0KSwcQIIdTloQs
	Q30s2MVg4R5DgqAbeUXyMCBVEkeh6t8+1l3pVvzjr7D81Ph+S47jGjX+FQzmMsbU5KJx
	9grOAHAnaOq2XJTfTfuU8CDIBb+BZm7zf3EuCerKmrANYXz+Vw63AhAWkKcK5D1ZTyyu
	RG4xMcA9aj2MwIY+RoPevUPbSI6bFVuEUTitoZ9vo69yVKzctpF9Q8yrZ2j/wclF9d71
	WOdw==
X-Gm-Message-State: AJcUukeOVtfDQb8OGZ99bQ7bRBa6+MF2uVL0x/pkNmjQHPAwDtOFoLds
	3ZOE1z3XKC/v/LKyYQvxDslKBA==
X-Google-Smtp-Source: ALg8bN60k6U+LR28uLnJXV19pdqdkU++wxPD3t7uYu/DNCeCHIpxvTtUzgfqnb5i70pFYAGX+Jo8WQ==
X-Received: by 2002:a37:a391:: with SMTP id m139mr2766254qke.11.1545408227566; 
	Fri, 21 Dec 2018 08:03:47 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	u45sm6110081qtk.33.2018.12.21.08.03.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:46 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:01 -0800
Message-Id: <20181221160307.14819-9-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:03 -0000

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


