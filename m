Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQ2E-0006bc-CM
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ2B-0006Tc-Ga; Mon, 19 Sep 2022 19:18:39 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ29-0001pI-Jl; Mon, 19 Sep 2022 19:18:39 -0400
Received: by mail-ej1-x634.google.com with SMTP id lh5so2134996ejb.10;
 Mon, 19 Sep 2022 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ScsUFIDAHrm9/OPFECQYAYLcM3exK8eoaXsBNG48BMc=;
 b=bklrnXC+Q9cSo2FFOWfTXPpVHkz7irXkFbdyd6/BCU2xuyoZleDIoNMU8HijhM8/f/
 12oHjj6bdYlh8ovjo9fbo/AzzIKh/s88xDprTDDu6uVtD36FZCWsn66rd086C8EY+gRS
 b3PgE5tctP66cgHs7ldVIlsIuNOVQEBmmny+GbC5huXVVzJ4n4/hjoj0ooNBMuoyC7+/
 IwvCtApFdCbrV78O3C5mq3mtM7+Rv7m08+xwa8/kKzar8suXKXKnclqYu1UxttLqEop6
 3JIuCuLhTHc4skzYus3eB+AmX/fOGOrCA9D1UqE8mKBQsr1TgwZu8W5CRb5gZpTnS7Dn
 LqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ScsUFIDAHrm9/OPFECQYAYLcM3exK8eoaXsBNG48BMc=;
 b=o+OsrzuWNRK9PPgyfJuYgcySZYx4NVmuponWOTapWBvzAqxpn9ik3I174OrWR2y8KL
 FqUIGPa+EKRsXwxnfZDiZ8+hbzBK/Mjm+iNzxU7shOXFMZlty3KB2vCPMxcQjWNjiK/n
 5jy0Ho53iMhJQW/3S7L5c4EjohcOteUoo4Ns7rmMh0BuX0Zts/s+NgF+ENUZeXTQTeep
 7ZveAlG2H9MbjF4L7gnc/RFODerp0z08+yzYMIjP47BnYzI1Y91QrBLWFy9ue4k4A5C9
 5S5H/7j1OH/VFc4N++kEMWdx0rDQD3RIAyQQofzbwQgu8VFhQmlWeCjrsgmhfPVa/Z8h
 qTEg==
X-Gm-Message-State: ACrzQf0M16R2h1Mg6GmYg29N2ckd1g/J9bNx6gZUPRJ0A+9oRIvwkpxo
 hGu71W07PO6oXpNzfTSRg5CXNqx4sWuEUQ==
X-Google-Smtp-Source: AMsMyM5zOFXr+h5fB5zVLEWuIudF3jkOWN1HVQ7NnRGDLPPjOGxYXkHu7b5fRJV74nWfwRAhpeBFrQ==
X-Received: by 2002:a17:907:7207:b0:77b:3647:c24 with SMTP id
 dr7-20020a170907720700b0077b36470c24mr14030221ejc.417.1663629514343; 
 Mon, 19 Sep 2022 16:18:34 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/9] hw/core/sysbus: Resolve main_system_bus singleton
Date: Tue, 20 Sep 2022 01:17:14 +0200
Message-Id: <20220919231720.163121-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2022 23:18:40 -0000

In QEMU, a machine and the main_system_bus always go togehter. Usually
the bus is part of the machine which suggsts to host it there.

Since tere is already a current_machine singleton, all code that
accesses the main_system_bus can be changed (behind the scenes) to go
through current_machine. This resolves a singleton. Futhermore, by
reifying it in code, the every-machine-has-exactly-one-main-system-bus
relationship becomes very obvious.

Note that the main_system_bus attribute is a value rather than a
pointer. This trades pointer dereferences for pointer arithmetic. The
idea is to reduce cache misses - a rule of thumb says that
every pointer dereference causes a cache miss while arithmetic is
basically free.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/core/bus.c       |  5 ++++-
 hw/core/machine.c   |  3 +++
 hw/core/sysbus.c    | 22 +++++-----------------
 include/hw/boards.h |  1 +
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index c7831b5293..e3e807946c 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -129,9 +129,12 @@ static void qbus_init_internal(BusState *bus, DeviceState *parent,
         bus->parent->num_child_bus++;
         object_property_add_child(OBJECT(bus->parent), bus->name, OBJECT(bus));
         object_unref(OBJECT(bus));
+
+        /* The only bus without a parent is the main system bus */
+        assert(sysbus_get_default());
     } else {
         /* The only bus without a parent is the main system bus */
-        assert(bus == sysbus_get_default());
+        assert(!sysbus_get_default());
     }
 }
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..ebd3e0ff08 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1097,6 +1097,9 @@ static void machine_initfn(Object *obj)
     ms->smp.threads = 1;
 
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
+
+    qbus_init(&ms->main_system_bus, sizeof(ms->main_system_bus),
+              TYPE_SYSTEM_BUS, NULL, "main-system-bus");
 }
 
 static void machine_finalize(Object *obj)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d31..16a9b4d7a0 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
@@ -336,26 +337,13 @@ static const TypeInfo sysbus_device_type_info = {
     .class_init = sysbus_device_class_init,
 };
 
-static BusState *main_system_bus;
-
-static void main_system_bus_create(void)
-{
-    /*
-     * assign main_system_bus before qbus_init()
-     * in order to make "if (bus != sysbus_get_default())" work
-     */
-    main_system_bus = g_malloc0(system_bus_info.instance_size);
-    qbus_init(main_system_bus, system_bus_info.instance_size,
-              TYPE_SYSTEM_BUS, NULL, "main-system-bus");
-    OBJECT(main_system_bus)->free = g_free;
-}
-
 BusState *sysbus_get_default(void)
 {
-    if (!main_system_bus) {
-        main_system_bus_create();
+    if (!current_machine) {
+        return NULL;
     }
-    return main_system_bus;
+
+    return &current_machine->main_system_bus;
 }
 
 static void sysbus_register_types(void)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 311ed17e18..7af940102d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -346,6 +346,7 @@ struct MachineState {
      */
     MemoryRegion *ram;
     DeviceMemoryState *device_memory;
+    BusState main_system_bus;
 
     ram_addr_t ram_size;
     ram_addr_t maxram_size;
-- 
2.37.3


