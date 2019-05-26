Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxa-0003s6-MY
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxL-0003Hg-7G
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgA-0006Cg-3e
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:27 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:33619)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhg9-0005z2-TP
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:26 -0400
Received: by mail-pl1-f173.google.com with SMTP id g21so5660400plq.0
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=bWnhtt8L+gQXw/3z9MmLUNiXj8flc6h/W79W61MZMHg=;
	b=ggGC7oeS/x6z2xeLh2WkdiUW6jUS0U1wDfUQ0ietPVb4JJNRoKZbDeYRD/QZtGgVE2
	SYQZILRghXEd8SJ657XcqGby/lMYhuChE0IKCGbDWHY7BowqFGrSEbv+wxfhDaQ40Tvu
	/yTjJJJQDNRLKyBO4UBN6xa1N79QM09++Trc/y53DIo6MGp+tvz4X7ed5R+jjbc/Zsf5
	SCyuzj9Rww7dDRl3/TE3XIIfoJzQs5GvkSGAw2PO8l+dKDf0Aipu1sjxdhl2r9x7fyB/
	8iD7WiMus38T2SIyQSE74Pgjt+pk9roaaAzwtZewWgtkd7/ldJBrpSleGFsmo1zFgwXn
	Kykg==
X-Gm-Message-State: APjAAAWMnwVf5/PCcJ8WSQTDvAwH0HC6Wu2dQezQWaFKyl+qV86Odu1G
	DgszNsWZ8taVTsbh1WVUSqcG48W4W14=
X-Google-Smtp-Source: APXvYqzPY4KMGwUG4O/4o0INh18c6RX7UotZarvjlgyOQqrSOqH/Vitk/FeTeONJ3jc6Bn5cScvGzA==
X-Received: by 2002:a17:902:521:: with SMTP id
	30mr78464887plf.62.1558833020841; 
	Sat, 25 May 2019 18:10:20 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	a18sm7424737pfr.22.2019.05.25.18.10.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:20 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:33 -0700
Message-Id: <20190526010948.3923-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Igor Mammedov <imammedo@redhat.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.173
Subject: [Qemu-riscv] [PULL 14/29] riscv: virt: Allow specifying a CPU via
 commandline
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
X-List-Received-Date: Sun, 26 May 2019 01:28:12 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 352646303420..84d94d0c42d8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -399,7 +399,7 @@ static void riscv_virt_board_init(MachineState *machine)
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
-    object_property_set_str(OBJECT(&s->soc), VIRT_CPU, "cpu-type",
+    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
                             &error_abort);
@@ -525,6 +525,7 @@ static void riscv_virt_board_machine_init(MachineClass *mc)
     mc->desc = "RISC-V VirtIO Board (Privileged ISA v1.10)";
     mc->init = riscv_virt_board_init;
     mc->max_cpus = 8; /* hardcoded limit in BBL */
+    mc->default_cpu_type = VIRT_CPU;
 }
 
 DEFINE_MACHINE("virt", riscv_virt_board_machine_init)
-- 
2.21.0


