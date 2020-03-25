Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYW-0000kw-FS
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYS-0000bl-9W
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYQ-000096-VC
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYG-0008Rx-Ay; Wed, 25 Mar 2020 15:18:56 -0400
Received: by mail-wm1-x342.google.com with SMTP id a9so4165536wmj.4;
 Wed, 25 Mar 2020 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9hrbhBuaNbQeWGl1mm7dnqJYIZiyDKEgrGsnKIPUcM=;
 b=SezOYz6oc+EApTTqVJvWAuQbWiYgDL12PNUdLUj9R0pzsIaE4R+L3VYxi5VRpB9NI8
 oXRyNZKNjNyWGoGGjHjdAsoEd+pLRXsGb6jgsw4C32QtuDsJqRyyTFhOfWA/vRvfBc3j
 zNVPhQAPJz8r3ObHeF3FYaVIOfnx7qflf+l3qG6AT7Q16p9/2w91ZmwF7f60tyTAaxcg
 QLrvojwqjqwdgdEah/PyDs3kgOgx3C7jnfQxVvmOMgp/N7T29IEWXwdMmsQLPHpESqWQ
 ihxSheQkzMJGb5yZp2p4klTgVUpY/O8VeNGVOSjo3lLCaMppBfhNdUzA/xCYDRn9NhgT
 MK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r9hrbhBuaNbQeWGl1mm7dnqJYIZiyDKEgrGsnKIPUcM=;
 b=A77tngFstThjiZdsUKZ23Gdf55tEvXMNsk7pUYNGszSI/dIvBGZMSpJFzDy1rEfiFx
 XyZsSZyCdhb9OgZDk2MsnsXl0fj6F3kc+wgVSmRla0tWm3eG6bB5BaIw93hnAB9+tnVn
 h4yM8JWPEt/KNy0BTcXmBNuNtq8s6w8RS0sMA2JZicEMpGf93LhGNM9obJ0ul4Am8EWs
 W7CN0ly7bRl1/te8rxsf/WWNOxEXZnYCgTXkd2B2eUXWJ9QOH8D9AxM0O7+5h/Jt0j3G
 PBpsRnt4dewFv7nA0aH2C1tKqo++PBBhc5HPHmEqs/4E1f+fl9wMMRaWlT7hPCeMJv9W
 FLfQ==
X-Gm-Message-State: ANhLgQ1GleVf4nfo6Po6C6Vxv8EXHfpu/F3yqFabOTcDKWYMel603A6n
 nJhEGShORNQtBfNG30scz8Yo0VX8v44=
X-Google-Smtp-Source: ADFU+vvsD/UjeB9AddoTLd45jff2BJbXWW3gEE7CoPDDqErMz+LmEmNVorX2Nr7Fxi++HnZLzRrs/g==
X-Received: by 2002:a1c:6285:: with SMTP id w127mr5147255wmb.133.1585163934933; 
 Wed, 25 Mar 2020 12:18:54 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.0 07/12] hw/mips/cps: Add missing error-propagation code
Date: Wed, 25 Mar 2020 20:18:25 +0100
Message-Id: <20200325191830.16553-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
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
X-List-Received-Date: Wed, 25 Mar 2020 19:19:10 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/cps.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 92b9b1a5f6..d682633401 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -68,100 +68,152 @@ static bool cpu_mips_itu_supported(CPUMIPSState *env)
 static void mips_cps_realize(DeviceState *dev, Error **errp)
 {
     MIPSCPSState *s = MIPS_CPS(dev);
     CPUMIPSState *env;
     MIPSCPU *cpu;
     int i;
     Error *err = NULL;
     target_ulong gcr_base;
     bool itu_present = false;
     bool saar_present = false;
 
     for (i = 0; i < s->num_vp; i++) {
         cpu = MIPS_CPU(cpu_create(s->cpu_type));
 
         /* Init internal devices */
         cpu_mips_irq_init_cpu(cpu);
         cpu_mips_clock_init(cpu);
 
         env = &cpu->env;
         if (cpu_mips_itu_supported(env)) {
             itu_present = true;
             /* Attach ITC Tag to the VP */
             env->itc_tag = mips_itu_get_tag_region(&s->itu);
             env->itu = &s->itu;
         }
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
     cpu = MIPS_CPU(first_cpu);
     env = &cpu->env;
     saar_present = (bool)env->saarp;
 
     /* Inter-Thread Communication Unit */
     if (itu_present) {
         sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu, sizeof(s->itu),
                               TYPE_MIPS_ITU);
         object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-present",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         if (saar_present) {
             s->itu.saar = &env->CP0_SAAR;
         }
         object_property_set_bool(OBJECT(&s->itu), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         if (err != NULL) {
             error_propagate(errp, err);
             return;
         }
 
         memory_region_add_subregion(&s->container, 0,
                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->itu), 0));
     }
 
     /* Cluster Power Controller */
     sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
                           TYPE_MIPS_CPC);
     object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->container, 0,
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpc), 0));
 
     /* Global Interrupt Controller */
     sysbus_init_child_obj(OBJECT(dev), "gic", &s->gic, sizeof(s->gic),
                           TYPE_MIPS_GIC);
     object_property_set_int(OBJECT(&s->gic), s->num_vp, "num-vp", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->gic), 128, "num-irq", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->container, 0,
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
 
     /* Global Configuration Registers */
     gcr_base = env->CP0_CMGCRBase << 4;
 
     sysbus_init_child_obj(OBJECT(dev), "gcr", &s->gcr, sizeof(s->gcr),
                           TYPE_MIPS_GCR);
     object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->gic.mr), "gic", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->cpc.mr), "cpc", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->gcr), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->container, gcr_base,
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gcr), 0));
 }
-- 
2.21.1


