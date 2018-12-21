Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHY-0001nI-7d
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHO-0001f1-HH
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHN-0004Eg-Ed
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:02 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:41927)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHN-0004Aw-4r
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: by mail-qt1-x844.google.com with SMTP id l12so6164500qtf.8
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=pGdFvWxsyK+082c4RANqehx4XfGix5v1XjwMetfsyZg=;
	b=BFLxT6q9KDFCMRBUTi6o8oPwvKDwh+WJDvy1PvXZOXrgmkn4lqivhU6vuZOuHVPFrb
	LmHjWBJSBPmDmwU6FC9tAcwzXxstYH2KT0tGfIuYNQfJmp2A4sdgr9TRVGrY/z9pM1AN
	YnnLeXxJjo7XlIyHOrEwgUvt37uDJ5YDJIm9jF1UN80vE5SWHW/0BZH0EMVxHPbrcDEk
	TUvEzQrdhDl1NoXj+uhIUvvcAXQ7INx/WtKXFxlO0tuGs4o4EgYrXYa5QwOqCmzMOGum
	+0Hb0a7njE3gwdhAcFFjlS92xTuNkrYaRHfYXecTWK4vkoaZXAzRrZA40er5tRxGJVan
	dcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=pGdFvWxsyK+082c4RANqehx4XfGix5v1XjwMetfsyZg=;
	b=ns5B5E6afdQaXwuSf7jr1wG+fmFLaibuM4e5woEPfFnldvEqEuqFAJrDMpzcraOI5X
	gf9rhpCu+VNmRZedJFqHErn1AHeVxbuh/Wok1FEEAf0RmXeb4mX4nTYFiblntP6ruhlu
	YiBt28m8FYYsZ+9RELO0tkRsKF51NC17uaiPmz81gzTDBCzGTXjTcLrMWr4nnuMN6qFS
	d4LmpbUvHE2+gTeXxShbbxuohmv9E5L40aTmkP8m87o+AbLJax/EbCI4DRn1+8zKb0kl
	UUSG/jSbD45IeW41zm/XJCz6GSOKySfjiJdfrmcRy3G8MB5EPF1D+ERAGXJPy+eSBiju
	Hoxg==
X-Gm-Message-State: AJcUukfxxZPqMKPwSQ8dZ+c8jYcAAD++0vO4adxZR9Evbywu+y3Snsss
	/sKGNqc+b1XUwGEI6viSY5hv+IQZL+0=
X-Google-Smtp-Source: ALg8bN7HDkHstcrzBb2D1EL2iZd9wYwALtAwVk5F7dj5Zd+ikIVsdvekOmaJkaezjpTpGeLN2J6RwA==
X-Received: by 2002:a0c:b093:: with SMTP id o19mr2997013qvc.49.1545408234814; 
	Fri, 21 Dec 2018 08:03:54 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id 24sm6307676qkx.77.2018.12.21.08.03.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:54 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:05 -0800
Message-Id: <20181221160307.14819-13-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
	Anup Patel <anup.patel@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: [Qemu-riscv] [PULL 12/14] target/riscv/pmp.c: Fix pmp_decode_napot()
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

From: Anup Patel <anup@brainfault.org>

Currently, start and end address of a PMP region are not decoded
correctly by pmp_decode_napot().

Let's say we have a 128KB PMP region with base address as 0x80000000.
Now, the PMPADDRx CSR value for this region will be 0x20003fff.

The current pmp_decode_napot() implementation will decode PMPADDRx
CSR as t1=14, base=0x100000000, and range=0x1ffff whereas it should
have decoded PMPADDRx CSR as t1=14, base=0x80000000, and range=0x1fff.

This patch fixes the base value decoding in pmp_decode_napot() when
PMPADDRx CSR is not -1 (i.e. 0xffffffffffffffff).

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 03abd8fe5eb7..15a5366616bd 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -138,7 +138,7 @@ static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
         return;
     } else {
         target_ulong t1 = ctz64(~a);
-        target_ulong base = (a & ~(((target_ulong)1 << t1) - 1)) << 3;
+        target_ulong base = (a & ~(((target_ulong)1 << t1) - 1)) << 2;
         target_ulong range = ((target_ulong)1 << (t1 + 3)) - 1;
         *sa = base;
         *ea = base + range;
-- 
2.18.1


