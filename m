Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDuqI-0002Bw-Eu
	for mharc-qemu-riscv@gnu.org; Mon, 16 Mar 2020 14:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDuqG-000279-9L
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 14:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDuqF-00024h-5c
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 14:52:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDuqF-00022S-1s
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 14:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJlVMKZax5qIb1MJWYEp8Y1G4BH96heGWQHiGeb4Cus=;
 b=bLqSBK36CJXHUtMqYw5klZkwpS85/CLFqH5VXZTtNysVO1TPjXo8mzQkp3Swf5PGNuoiH8
 VF3w8zNyyPbzmp5G2rWRdGzAy+sDymOCtpBFvCU13MqixP5PHm9TcrFs7jHoLVrx7LyRhp
 S/sEiqZlwYKaTt+FXEH2k+HV0IeAlng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-fadWJupDOuObOFHIc6PXpA-1; Mon, 16 Mar 2020 14:51:53 -0400
X-MC-Unique: fadWJupDOuObOFHIc6PXpA-1
Received: by mail-wr1-f70.google.com with SMTP id n11so8983619wrs.13
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 11:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NlR0W1rwyt02Ypkn/GIhl77Q2tixa1X5gZqoTZJ3XAc=;
 b=MXITn7p+KApvWA8DbINgRY/XxhaFM4soyFKTPMf1oBoIQCGecaie5FFCEhztNyPxlj
 y6L9n+0DzRXtmguZPBM8bL8MWaBISFLHB/mxGU2B578EtD/J3WUj0C2ftDJ8b0t+0FI0
 6iyDYq9r4AXBYDMAtjMwFSln35ru49jZCQeLhl6WeGzziC94WT6vtI7RNPBwK0YShv0u
 H2wokqEort1W5TVPSqid1oNnUVaduhKwLC0+EiYgCmkDael/+nxhnPjfJ/we64nQ2/aa
 /jL+/TFMTD6q4Icr5nZRg0agMOMbAZXUntS574d0A0fINF+T9e2QgbIBnYy0o0zmr3wh
 1KVQ==
X-Gm-Message-State: ANhLgQ24nRWqjV/6W0KiOm1BTzheeyCpJesSdloVbACBse8af1lKFjGb
 NrUaVsOPgu7n/HGyL6v43XPmK1OphDF5wuWIDlxFG5EbcTg/ii8C9hvb/3lK+ajDJqpplONXpO0
 Zk5QpxRQ614ffkxk=
X-Received: by 2002:a05:600c:204:: with SMTP id 4mr486840wmi.112.1584384712298; 
 Mon, 16 Mar 2020 11:51:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsfokMzXIaYUKe+yPU0VT7cajBV5qDQv0gD5seZGtXEytA4OUpypM+GVgF/rry1m1L7lSzfVQ==
X-Received: by 2002:a05:600c:204:: with SMTP id 4mr486823wmi.112.1584384712123; 
 Mon, 16 Mar 2020 11:51:52 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id l18sm1082013wrr.17.2020.03.16.11.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:51:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 20/25] hw/riscv: Let devices own the MemoryRegion they
 create
Date: Mon, 16 Mar 2020 19:50:01 +0100
Message-Id: <20200316185006.576-21-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316185006.576-1-philmd@redhat.com>
References: <20200316185006.576-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Mon, 16 Mar 2020 18:52:01 -0000

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/riscv/sifive_e.c | 6 +++---
 hw/riscv/sifive_u.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index a1974ef7be..646553a7c3 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -145,8 +145,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
                             &error_abort);
=20
     /* Mask ROM */
-    memory_region_init_rom(&s->mask_rom, NULL, "riscv.sifive.e.mrom",
-        memmap[SIFIVE_E_MROM].size, &error_fatal);
+    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom=
",
+                           memmap[SIFIVE_E_MROM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
         memmap[SIFIVE_E_MROM].base, &s->mask_rom);
=20
@@ -208,7 +208,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
=20
     /* Flash memory */
-    memory_region_init_rom(&s->xip_mem, NULL, "riscv.sifive.e.xip",
+    memory_region_init_rom(&s->xip_mem, OBJECT(dev), "riscv.sifive.e.xip",
                            memmap[SIFIVE_E_XIP].size, &error_fatal);
     memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
         &s->xip_mem);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 156a003642..662d42a5a7 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -497,7 +497,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev=
, Error **errp)
                              &error_abort);
=20
     /* boot rom */
-    memory_region_init_rom(mask_rom, NULL, "riscv.sifive.u.mrom",
+    memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom",
                            memmap[SIFIVE_U_MROM].size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].base,
                                 mask_rom);
--=20
2.21.1


