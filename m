Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jLVrM-0002PO-JO
	for mharc-qemu-riscv@gnu.org; Mon, 06 Apr 2020 13:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrJ-0002KV-QH
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrH-0003Ha-SL
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:48:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrA-00033j-Ao; Mon, 06 Apr 2020 13:48:20 -0400
Received: by mail-wm1-x342.google.com with SMTP id h2so283112wmb.4;
 Mon, 06 Apr 2020 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n53pt0qup4Bja42ysNmHw44EY6rNqSSO2uSNuR4e+2E=;
 b=r9V51Y1xouns4swlMGeNtpuxw+oQavIJ/c9mpdu2LCGIbVrGK1kRlGdNoixeGzATtE
 UWGY4aI4RIc1AzBg5KEUzySGBSELe6AAoS+vPZeFgqmS2uw5AREWo9H8NySwQbOXDPUd
 zrKRiclIwWnQuK2WASc4pf/9X9JzkGAQWMrHaSonCSDB3FrR+KRUBfisyJsnaDbvJ28T
 WZ3HsobJok8RaVMknOCwZPowiC5PIV4iQaiUREOh++wY4FzqJSvJu/lbHdty63aVdXpc
 8fn27fKfdmBe51TJA0IXrasNmP3zKtFBJaTQMWDagGNwEKyiPpnyGFjWpQ06J01Odo7s
 lrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n53pt0qup4Bja42ysNmHw44EY6rNqSSO2uSNuR4e+2E=;
 b=pCT2owFhmfi8920C+ME2qnfPegX34pJ7f+H1uwPM8OFbR9CShuvOXe0K9gAd7qYhc5
 1anJfbeP1ldPbrr7J/9fllYttfQP6tdINzzB3UnT5vDdlvd+l4UWMyKofFBK2H/bSwT2
 EvS5sGVjZR71YBMWEmfpdWhnwE1DSGw4smzP8vcUUsLoSUMqp4DIke95kmS9c5xuLevT
 YIG+QOqQPGB1eh1w5OvqDvqjptFN7ivfzbThAuVn4u/Biu3w9AfjF2JexCNmMAsCEIbK
 PjXKFpwxpG+LeNum7YE2Uml3Okn1wxF+UpTsN8vREeVxpXF90CfWFqY8jZntpJ7AcJaX
 ePdA==
X-Gm-Message-State: AGi0PuYGCvkHKXaNP7G2YRITRbFBOZPePA++ayqqiG0l/yQJeGDlzoYB
 9sZspp8BBaTgJSfCeGPppdUh/o+wtpQ=
X-Google-Smtp-Source: APiQypIuiPc2GUAaxQjcigKrXvSPriurNaUO+3xMcESy5OJB7RM1rwN+sb5yoML4b63vYmiMCYPbkA==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr206848wme.20.1586195299094;
 Mon, 06 Apr 2020 10:48:19 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH-for-5.1 v2 24/54] hw/riscv/sifive_u: Rename
 MachineClass::init()
Date: Mon,  6 Apr 2020 19:47:13 +0200
Message-Id: <20200406174743.16956-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Mon, 06 Apr 2020 17:48:31 -0000

As there already is the riscv_sifive_u_soc_init() method,
rename riscv_sifive_u_init() as riscv_sifive_u_machine_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/sifive_u.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7bf1f30a35..e13ab34de4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -312,7 +312,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(nodename);
 }
 
-static void riscv_sifive_u_init(MachineState *machine)
+static void riscv_sifive_u_machine_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
@@ -606,7 +606,7 @@ static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "RISC-V Board compatible with SiFive U SDK";
-    mc->init = riscv_sifive_u_init;
+    mc->init = riscv_sifive_u_machine_init;
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpus = mc->min_cpus;
-- 
2.21.1


