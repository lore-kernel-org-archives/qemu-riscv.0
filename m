Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrd-0004ex-Rc
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:21:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrb-0004bU-LD
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrZ-00081r-KA
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:59 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrZ-0007n6-CZ
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:57 -0500
Received: by mail-qk1-x744.google.com with SMTP id y16so9621756qki.7
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=IWfZjYzkdRCs/v8ZQPYnDvi7qMZxCS9XtrTCN8xP4I8=;
	b=B5phCFixoLrMAE/hU+kaLwffwj9Xg6SfTKyGMSusQGRtuAA/E+oQbe9dl5scIVL/YM
	irfiYD5bqdeTRsejer+vfexoIqjzIL2+aNfR0yHs0SKeujw0MV39i0IYZBS4MTW1Obin
	c3QSOittK8M+ImWYU5fcWSVnObaPOIOg/aW8kuuq43mELuVvabWFElaYl0V9Q174Boad
	c84fsEcF3NU0sI6Z9C/36n62VeKgO/ThpUQVYNNnFmJCbwX8VlAsXU26rHcw1C8oGc54
	yV4o4lyd8cYQ3xnHhh2U3b9KZzcVTVMIP7OphkjNqmuLzAVEwO4s8rQndfKdKNj+/Pcc
	l97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=IWfZjYzkdRCs/v8ZQPYnDvi7qMZxCS9XtrTCN8xP4I8=;
	b=rn1CQXDF4xEfPxa1Cmjub09LqCiW/O7+gPgkXW4SgNqNxySP1NWAyZPv7BziKNswKf
	St/QRWtBKDe4mu31JPYYwulL6nRc+osd6lTH/MAelfoWrBy4xPaBESOv91s5u94m+C13
	4cIwDAOQWzGx5ibltPVeJ19SQ/mMqpQpZ04HTc2X3iTq/NATdm2wBl/Snzcd8Daksh+d
	BZLq9iQIqS1CfIeSNFvzAdCLti865t5Kk+63dKP76Gyg1t42KWNQT3qIsHt3SgkLwZxX
	X5i1apaZyL1QYCewtvjvvgUQEhcFxhSh3wFuxlQ0DEJzL+EED+8uZZu+ZFwpDamXof7r
	bCMg==
X-Gm-Message-State: AJcUukdCszQr3VkCqIGYcoxweK9ndRgUd4JQ433tTegBoN9y4/1wCRnk
	kXPXDdPrftoU5bNwLDMOZVdio060Vl4=
X-Google-Smtp-Source: ALg8bN5jm5L9xkOO41qzqSCZGqYPVX77m2uaxr/T6Lc7OLZMY3RM948q1q/+Tp7Isa+e3kPXsQIumw==
X-Received: by 2002:a37:9c57:: with SMTP id f84mr18421497qke.176.1545844830067;
	Wed, 26 Dec 2018 09:20:30 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	b17sm12614983qkj.69.2018.12.26.09.20.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:29 -0800 (PST)
Date: Wed, 26 Dec 2018 09:20:00 -0800
Message-Id: <20181226172005.26990-10-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::744
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
X-List-Received-Date: Wed, 26 Dec 2018 17:21:00 -0000

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


