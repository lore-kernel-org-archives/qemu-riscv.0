Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EU7-0007iI-2t
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EU2-0007c9-Tu
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGX-0005Cj-8a
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:50 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGW-0005C0-Tn
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:49 -0400
Received: by mail-pg1-x544.google.com with SMTP id h8so13785364pgp.6
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=wWQTBWqlrfhzLmAcnqszBMaQHtgZX/43qgD2vd7QMo4=;
	b=mcydAMWWLkb6CRL1FapYP02au1d0tIh8KQoXRxYU92dsfvOt90afURmM976Su+ITk6
	PqCJHRfgzcnXkdD8zQkZJuFf2RLXQMbJCOScBW7LBvIHGBRt0jgTblJh69aTnwKTIu59
	WZrmGanjWk7nY/jEQHJnFdiIRnMg65lKZiVrBuBxiLiwbhc623WizoC5TtbFnVLAfukg
	pneOZ+4iMxH/56ldFwJL8vRgn/533Nn4uFeRe+9gOZw6rnN5iuUVmPYH0HWLaDYPWVnn
	AlWpvxl9bNfSbDMMN8bSdltJrwysfY24fnzZyKw89m1adQdiroSY66ntCy6PiBsqy0d7
	jFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=wWQTBWqlrfhzLmAcnqszBMaQHtgZX/43qgD2vd7QMo4=;
	b=nfdCUUlkbI3dARrzRQ55UwmNaCqkuNnxUnLPw65wbBTtzLSrLrl5okTC7OJYtskA6e
	RCV51TCK910msnG614dPmFahOIQj5v2empy9m65tHjfo7/Z4Suvn8/n7Gpy0Sqwum0k1
	y+sqv1LhdxvEuR2kHHnUmiT9jwXuIqrnRYB6BEkS1JrIvOzDTVjqn1U4vCtfd4m7WFaX
	XvSM7j0ayEvfzXztUxkcQfPtszA1GOCoN3Hm+l19gvSYmeX+AT6RiJg/Q6T+JI0OWX2f
	cDcjPkOVtjKnFH/JM96bUBrg7q60vLSSXp+WsnFVWprjdHuZGBY/YDEMrin4ENSDI8Sn
	nZRQ==
X-Gm-Message-State: APjAAAWHNMlXyRwR4+/z2Zs+AFQRaURCAZ+0u5C+g74sbATbU58m6Ljq
	p1lzUP4ymtysbGxhsZyaQGheBfT+P6xEqF61
X-Google-Smtp-Source: APXvYqxHW9izp2Ml6PiaiaPWstP4n7g0aN+cS3grJ31w2LAmCTMvwTXFIho6M7PM03c8G9FW9ecDNg==
X-Received: by 2002:a17:902:ab8f:: with SMTP id
	f15mr1923573plr.218.1553000087797; 
	Tue, 19 Mar 2019 05:54:47 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	h87sm32631792pfj.20.2019.03.19.05.54.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:46 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:56 -0700
Message-Id: <20190319124803.13826-13-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Atish Patra <atishp04@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PULL 12/19] RISC-V: Change local interrupts from edge
 to level
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:47 -0000

From: Michael Clark <mjc@sifive.com>

This effectively changes riscv_cpu_update_mip
from edge to level. i.e. cpu_interrupt or
cpu_reset_interrupt are called regardless of
the current interrupt level.

Fixes WFI doesn't return when a IPI is issued:

- https://github.com/riscv/riscv-qemu/issues/132

To test:

1) Apply RISC-V Linux CPU hotplug patch:

- http://lists.infradead.org/pipermail/linux-riscv/2018-May/000603.html

2) Enable CONFIG_CPU_HOTPLUG in linux .config

3) Try to offline and online cpus:

  echo 1 > /sys/devices/system/cpu/cpu2/online
  echo 0 > /sys/devices/system/cpu/cpu2/online
  echo 1 > /sys/devices/system/cpu/cpu2/online

Reported-by: Atish Patra <atishp04@gmail.com>
Cc: Atish Patra <atishp04@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 555756d40cfb..073bdcfe7410 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -95,9 +95,9 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
         cmp = atomic_cmpxchg(&env->mip, old, new);
     } while (old != cmp);
 
-    if (new && !old) {
+    if (new) {
         cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
-    } else if (!new && old) {
+    } else {
         cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
     }
 
-- 
2.19.2


