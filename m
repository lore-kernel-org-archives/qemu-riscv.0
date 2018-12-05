Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUSWm-0007IB-BH
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 03:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anup@brainfault.org>) id 1gUSWh-0007G6-Rj
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anup@brainfault.org>) id 1gUSWa-0005rx-BM
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:27:22 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anup@brainfault.org>) id 1gUSWZ-0005qg-Lr
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:27:16 -0500
Received: by mail-pl1-x641.google.com with SMTP id u18so9704898plq.7
	for <qemu-riscv@nongnu.org>; Wed, 05 Dec 2018 00:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=brainfault-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eeYvyP1uwG+CNh53IlxHP80V/dByOXA9HR36ir0+fcU=;
	b=itsjeH3hQdjS3xB52kxdCqgu2RD/IPohKJz2Y/lIHXmGRs9jouk07ct3C2/cThhCst
	lDu/ikUePn7RCHu5eDzIUHMw42M5Y6kUOcSo7b68fmRujDESvlNltPyvNZt3dLx9QtDi
	fUC+84vSyFDX1GlqM0dIjhjo5CXG/L0fTq2jYur+dabL/YOljFpr8fSZlJ/KmMcaAqVk
	8gnbjXeRUreIaRb66jo2gmWB8vX7JBvETI6kEY+D+JoFfgoMzpo2ArzrAsaegY0Srqx2
	HQYoXWmjJDxpPwD1y0Se9V7GS5jOHl51FBTImCpcYyJ9pQXjlaglvXR/ks/WhEUCywmT
	l4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eeYvyP1uwG+CNh53IlxHP80V/dByOXA9HR36ir0+fcU=;
	b=G7zOPcklqgcS28u4yiVYixfrsSW5w1szs/ZHF+kWYJCZCDAgaZVKC+Obr78/f3/IFO
	aTNVeuIi2NOtJeWKSdQ2BXVrYtvfghIgvJys3wwoNuJe561WEwg8B9A3/nqbzahLrzq/
	ta2CocUEbnf5btwDVRhbHoUsT4AXK30cM4A7eGc7kTZrVaEjiy/V1tJ2l4EMaRUyaqqI
	XNA+Shl7ZpUcvHGEAABlRUKVmXGxN8pkmuqkoOHkIASAJabTya8gRCgijaOvHmwWgf1F
	JP/M2gk7ZVH/ucHzFgPgOaWQ3IMkcUPLpccMLimedterxDMv+ZVvm85F3ehfb4Aps3YT
	qpuw==
X-Gm-Message-State: AA+aEWa+8cP/ToOFD4BObuqAFrvooarm92V4AgXIbtebvZriL6Mj5Ux1
	7FLArZ1rxrlm/dXeUUjKSZxw5WSca+U=
X-Google-Smtp-Source: AFSGD/VNXO3kVffLKY5CSaXBw/NU2VsHHao3wUPUuShlX7+n4C/312c2nNmKlWaYuZSn0ILlc5sAdg==
X-Received: by 2002:a17:902:8c91:: with SMTP id
	t17mr22563757plo.119.1543998433161; 
	Wed, 05 Dec 2018 00:27:13 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.50.107])
	by smtp.googlemail.com with ESMTPSA id
	19sm33410406pfs.108.2018.12.05.00.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 00:27:12 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>
Date: Wed,  5 Dec 2018 13:57:02 +0530
Message-Id: <20181205082703.13945-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH 1/2] target/riscv/pmp.c: Don't try further once
 matching PMP entry found
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
X-List-Received-Date: Wed, 05 Dec 2018 08:27:25 -0000

As-per RISC-V privilege spec, we should only consider first matching
PMP entry. This is not enforced by current pmp_has_access().

Let's say we have two PMP entries configured by M-mode code:
PMP0: 0x0000000080000000-0x000000008001ffff (A)
PMP1: 0x0000000000000000-0xffffffffffffffff (A,R,W,X)

Now if S-mode code tries to access 0x80000000 then it should
generate trap to M-mode because PMP0 blocks the access.

The current implementation of pmp_has_access() checks PMP0 which gives
result=0 so it continues and tries PMP1 which gives result=1 hence
the access to 0x80000000 from S-mode is allowed.

This patch fixes pmp_has_access() to return immediatiely once
a matching entry is found (irrespective to the value of result).

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 target/riscv/pmp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 3dbb87c69d..936a52b6ba 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -193,8 +193,11 @@ bool pmp_has_access(CPURISCVState *env, target_ulong addr, int size, int rw,
                 /* breaks iff other covering entries (invalid config). Punt */
                 *tlb_size = roundpow2(ea - sa);
             }
-            goto match;
         }
+
+        /* only first matching PMP entry applies */
+        if (sa <= addr && (addr + size - 1) < ea)
+            goto match;
     }
 
     /* only allow M mode if no rules are present */
-- 
2.17.1


