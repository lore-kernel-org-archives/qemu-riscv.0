Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEi-00006m-Dm
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEf-0008T7-Q5
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEe-0003Hz-Qa
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:53 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEY-0003Ca-A4; Sun, 12 Apr 2020 18:37:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id v5so8500176wrp.12;
 Sun, 12 Apr 2020 15:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n53pt0qup4Bja42ysNmHw44EY6rNqSSO2uSNuR4e+2E=;
 b=FY3kR1dpch1nGcofNA83QihfuToa/EFDePyLaqSTHp32sQ28Xuu22WT6DAH+BOu5bo
 I4Ha2cII2EUA0T3FsebpB72+BNdO/hivTe2uPjWyhxdWjGbH2fgRmauR9QssXpCFUWTZ
 VeZ7ea7Ps4N8Zdh1D1F0z4aa52JzExnDoztz9TovGOlAhkQxEDyf9+gxsYQ9WhxxD6GQ
 sQmUdsrarFsY7XFcHosyw6DuCArLYQiogq05A+kYu3IgSYejwWTeNSM3JhhW2wM872Ft
 Oi/4dyEOtIzEBrX4b4hqmR5WPqzB/H0SAtWva3rl+VT1o890Wr1EU6bCkPchTVglSFrX
 aScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n53pt0qup4Bja42ysNmHw44EY6rNqSSO2uSNuR4e+2E=;
 b=HKa9smBdE6ofo2fALcKiUOiX/M8k2S5cY8W1JT/0vt3TaeZ+Fmnt6PTVRrcCnhULpw
 pf00wfLq4onQPjoOGwI/3cZwJ6d+9T7cmaVZEGjNHi4M1u/6WrWKnGuzaxmkluXuTzi/
 JINm+ZjLMQdKO4P9xFv799moxh9anbs8qqXr6UkyBgzJ3OQyMCO5Y0rt+4cHjOFYEm2I
 jA2wXcFr0N+oa6+kl+q95qzCfD3euhS46sQC1qKlLo/FWWgSepUyfK5uXfhF3Lfj4xWT
 fJ33m8UbwmZmd18MUv/FXhR2V9VG+QxOOworA918HEnvkIy3UV3bhG3Kac1vrmjHaqrH
 Rb0g==
X-Gm-Message-State: AGi0PubYttcUcibSnGDQM44QZhjCkAPlTkUm4yrbrSqHUM8MjV7XWmh8
 isbpLB80N/jQ0g08eudessdOEQ7Z/P5BgA==
X-Google-Smtp-Source: APiQypK0QAZuqTAbvbcPnmAsYwCoAbv+vcG/8+s83QanTDeyVYBqZfjXhnTL+gubnA+ExKPvjDxz+A==
X-Received: by 2002:adf:cd12:: with SMTP id w18mr15624824wrm.311.1586731065164; 
 Sun, 12 Apr 2020 15:37:45 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 24/24] hw/riscv/sifive_u: Rename
 MachineClass::init()
Date: Mon, 13 Apr 2020 00:36:19 +0200
Message-Id: <20200412223619.11284-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:54 -0000

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


