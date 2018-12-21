Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHR-0001i7-Hg
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHN-0001dZ-HH
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHM-0004DB-HZ
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:41926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHK-00048U-IA
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:00 -0500
Received: by mail-qt1-x844.google.com with SMTP id l12so6164094qtf.8
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=IWfZjYzkdRCs/v8ZQPYnDvi7qMZxCS9XtrTCN8xP4I8=;
	b=RUl6kom9WZe7dcJfGMvPHznB6POxbIX4uT5ZUpuHwderj3Qx1p4MHxPNPVxZJ9/Nsy
	JjrqZuXUOJeM8Nmd9shv/f6WkTNyln+sCG99yhSM+FMY9XP4mSATDwz2dhQJqvtom45Z
	OxpMKnHHQU4G5MnW6jvUD6HYk4nV3tgsAh3UjOFwCbYfEMfMU2gkVzY7oQEGBxAR+7Ku
	StBbWFyoZqNkFuW3TeLxXGrVvpsjgHHZwYAE1QFTxx9Ldn11RH8k/xJnuRCKkJnmnwr/
	WtDCFMInmEYPztFM08YbI7zsj/5jJg0sc50/OZ2OS/sZdhtHLuqk7+9a50K1ehYYaBV4
	EEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=IWfZjYzkdRCs/v8ZQPYnDvi7qMZxCS9XtrTCN8xP4I8=;
	b=F5jb1kcf8sk3bGbMeLNuc3yxacjds7FYcqQqG74mleEGWIBG0FJ8zCLUEmETkoa3gb
	9BFot3ZUdDxbsOe4YE0+a69fPx2y0PZXRtk/XlwGou9O9iKO1+NHu1aidtOaMF0HM3fD
	B5gjCuR8s9mqzUhrk2Sto1quFw2G5rz+RcQpIW7VyLAsQlsdcrYJ2sUVJuB+455LWLkZ
	ZJ3yrzE1sdA1I7l9amF12/44zNuF9kauxR1TnbNQvRsxfgNoMWmx71HpGAikRYTuMP2Y
	vMIFNJHDwiI7ZS+c54UAb6hrpNdom9YLbuw2SksGo71QR8iI4vEKIu2gcohW0BrLhuuj
	jj4Q==
X-Gm-Message-State: AA+aEWaDU4107xMZym56Hm3TcSQ1GXtwU6/7Pnq7Mn5sDEmfpAjJy88y
	RbzgezfMOn8H8t29/HNCVJcoCg==
X-Google-Smtp-Source: ALg8bN4bx5aORwCfxDz8A0kliLD0avfzy2RbG7oc/VUtFu3Go44tnj6e37Jzrlwb89fA/eAbfpUa/g==
X-Received: by 2002:aed:3784:: with SMTP id j4mr2922814qtb.50.1545408229232;
	Fri, 21 Dec 2018 08:03:49 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	h35sm6519532qth.59.2018.12.21.08.03.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:48 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:02 -0800
Message-Id: <20181221160307.14819-10-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::844
Subject: [Qemu-riscv] [PULL 09/14] RISC-V: Fix PLIC pending bitfield reads
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:02 -0000

From: Michael Clark <mjc@sifive.com>

The address calculation for the pending bitfield had
a copy paste bug. This bug went unnoticed because the Linux
PLIC driver does not read the pending bitfield, rather it
reads pending interrupt numbers from the claim register
and writes acknowledgements back to the claim register.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Reported-by: Vincent Siles <vincent.siles@ens-lyon.org>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 9cf9a1f98644..d12ec3fc9a54 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -214,7 +214,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
     } else if (addr >= plic->pending_base && /* 1 bit per source */
                addr < plic->pending_base + (plic->num_sources >> 3))
     {
-        uint32_t word = (addr - plic->priority_base) >> 2;
+        uint32_t word = (addr - plic->pending_base) >> 2;
         if (RISCV_DEBUG_PLIC) {
             qemu_log("plic: read pending: word=%d value=%d\n",
                 word, plic->pending[word]);
-- 
2.18.1


