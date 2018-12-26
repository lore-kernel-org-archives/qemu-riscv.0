Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrf-0004hJ-JH
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:21:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrZ-0004YE-GH
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrX-0007zK-D7
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:57 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:43996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrX-0007r9-2e
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:55 -0500
Received: by mail-qt1-x843.google.com with SMTP id i7so17826670qtj.10
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=pGdFvWxsyK+082c4RANqehx4XfGix5v1XjwMetfsyZg=;
	b=hCb9bHcUTmosQZTdPc3pFChUYVni85WHzug2suAPBTGMJ4D112hj1lXqcOfqHKtdvE
	7fRxpz0MPb+UWizmvK1Z/CM9tDxoatvH6wZRbUUDIPmUMtkVK2FZ+U0oVgAuDsJb1O9K
	6MdyxngPQy9X2uG1oEor85NRmOT64PAQqzHBWmDSbcjeBIp/5n4KW/Cem1ZefnakhQPr
	UilnaVsZlrPrSyVBHRL0y7DSTF6h2a+rv3XBIo+AXMKWUBM5S7hbMt0G26nx2yMfi85e
	90WSlutqsKsKEeY+3pNmK1F0+0WhADnOBgaTIUbM1Z3SIlDfJ4KjbYNgbnp3mUaFmLpY
	I+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=pGdFvWxsyK+082c4RANqehx4XfGix5v1XjwMetfsyZg=;
	b=AANsXV5UKTm2zeGgMkDJ7weSEK9S+GyA2YJ8QmsoIZOHJn3ctN7Naj/emZrd6FT7VW
	1CJEGXGXr/1Ex0KyxRIcZxcLcNnUZwobutXF+KRj/QDI0AKmzE2g54aXLqg0pSAhRUN0
	7WCvSopXbgAYziMk+coS/HoSVmrCG1Ex92yFmgVepTbMyjp5R/qIREiglGiKlsXErB3D
	F9CE+SXIa7UHLbqh7X1omKr0F7CIYieEKNvHs0dDR+GYoOJZqy8K9R03mSZPLHBk3EH1
	v+FxH6So9K7jGcvqgShJ4a8fA0shxd4/DSyN71v2PcMhrmc2xRmBiwVuUrqAlQY1eKlu
	qxwQ==
X-Gm-Message-State: AA+aEWaCz0RH/wC6frEWK0PiDnhTc4pvJiqfbI+1URSVH2AqWlh9d6rs
	EWk9AmfxD9YkCfHQahDKJ3jWRC1buUA=
X-Google-Smtp-Source: ALg8bN7KXaWbXl1EW4Ym+K3KKr5R+aTJB554/eBfVrYg0PjhyLkP113A1d2FG3tlcG7zMaRMFeevYw==
X-Received: by 2002:ac8:1779:: with SMTP id u54mr18928970qtk.285.1545844835755;
	Wed, 26 Dec 2018 09:20:35 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	o65sm13313201qkl.11.2018.12.26.09.20.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:35 -0800 (PST)
Date: Wed, 26 Dec 2018 09:20:03 -0800
Message-Id: <20181226172005.26990-13-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:59 -0000

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


