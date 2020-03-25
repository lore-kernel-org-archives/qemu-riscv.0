Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYY-0000r0-Ef
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYV-0000iL-98
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYU-0000BF-4p
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:11 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50236)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYM-0008WU-1u; Wed, 25 Mar 2020 15:19:02 -0400
Received: by mail-wm1-x342.google.com with SMTP id d198so3846530wmd.0;
 Wed, 25 Mar 2020 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJWqK5dP/JUjGEuwE5rKgl6cBOxlAe6qQTEyZU8C8W0=;
 b=VleCQCB2ornO9w/JxmRfcHEknZBnTHp7eX+ggBV84+MqPxxRabg1vxAR5ZLJUiaD8X
 WRk/rzD7DwTyQqStxRXjvhzX6OZMHkUPsBCJ5RO5HEr42KkKsglR3UCWdso+9PogQgDG
 RSQoAV09hl8gpLd5dq2pYv3iTJXnJMVHdhscJMPLG3IIxniBxbWovSYQlvHCbr9SJM+a
 QaYZjJcnjLopmdXcvMU0Ujy56D4j8yMydlmLQghGfciCIbIkKt2zOjhymPs1o9EKrzMe
 XRa92Pr9y7pvFQfRzjcW7PFyVayrRjJdQ0Zo97j34dCjki13dNHYL7UpELRBNFldy6+u
 tRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mJWqK5dP/JUjGEuwE5rKgl6cBOxlAe6qQTEyZU8C8W0=;
 b=kbxkKBJN7BiV9+kPIoBsOoNC5/e2i/iJfc8t7pLROcsEk3dGOks1YzvPKOJDF6r612
 ZRWuQ6Em/IAyPh4aa0RWFEpiTgm4fWl8FQpl9wPEoRX4BiJnunURzqgfo13pCgxuqA4P
 S+N+7iTQg13AiV9YDI/0na2oDEsuiurdErVillegb0NXoml5DzBSs5BaTAhPoDTSDslV
 sxDk2MULGLZO5CqzrM3o45W+PWP2RP41TRc50rv9mwnf7To0Q5x6Cm/v7NEBD8K0o0NX
 nItaDCEYWRMRa3HAQ5PWxobuDDNPlcXv2+xGNMzNlT2sl8PvdPfFDdKq0HiJG0W/tZgo
 uF8g==
X-Gm-Message-State: ANhLgQ1vZ0/jXpVA7HPCMsBfgS6whKZsVLPE34APt6lJISVVFxG4tAtY
 A/I/dLcsH51ndnOxM5POmteUXseT0Ck=
X-Google-Smtp-Source: ADFU+vsZJ2kDOybje24dj6jJl/WlOq2ip81mCzO5QWZlbxJukNvoz8idUswBtE/zTlmzkvq1ZJ2ocQ==
X-Received: by 2002:a05:600c:2051:: with SMTP id
 p17mr4738300wmg.153.1585163940694; 
 Wed, 25 Mar 2020 12:19:00 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:59 -0700 (PDT)
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
Subject: [PATCH-for-5.0 09/12] hw/mips/mips_malta: Add missing
 error-propagation code
Date: Wed, 25 Mar 2020 20:18:27 +0100
Message-Id: <20200325191830.16553-10-f4bug@amsat.org>
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
X-List-Received-Date: Wed, 25 Mar 2020 19:19:12 -0000

Running the coccinelle script produced:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --dir hw

  [[manual check required: error_propagate() might be missing in object_property_set_int() hw/mips/mips_malta.c:1193:4]]
  [[manual check required: error_propagate() might be missing in object_property_set_str() hw/mips/mips_malta.c:1192:4]]

Add the missing error_propagate() after manual review by adding
a Error* parameter to create_cps().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/mips_malta.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index e4c4de1b4e..8d43cfd41b 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1183,22 +1183,31 @@ static void create_cpu_without_cps(MachineState *ms,
 }
 
 static void create_cps(MachineState *ms, MaltaState *s,
-                       qemu_irq *cbus_irq, qemu_irq *i8259_irq)
+                       qemu_irq *cbus_irq, qemu_irq *i8259_irq,
+                       Error **errp)
 {
     Error *err = NULL;
 
     sysbus_init_child_obj(OBJECT(s), "cps", OBJECT(&s->cps), sizeof(s->cps),
                           TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), ms->cpu_type, "cpu-type", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_int(OBJECT(&s->cps), ms->smp.cpus, "num-vp", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
-    if (err != NULL) {
-        error_report("%s", error_get_pretty(err));
-        exit(1);
+    if (err) {
+        error_propagate(errp, err);
+        return;
     }
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
 
     *i8259_irq = get_cps_irq(&s->cps, 3);
     *cbus_irq = NULL;
 }
@@ -1206,9 +1215,9 @@ static void create_cps(MachineState *ms, MaltaState *s,
 static void mips_create_cpu(MachineState *ms, MaltaState *s,
                             qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
     if ((ms->smp.cpus > 1) && cpu_supports_cps_smp(ms->cpu_type)) {
-        create_cps(ms, s, cbus_irq, i8259_irq);
+        create_cps(ms, s, cbus_irq, i8259_irq, &error_fatal);
     } else {
         create_cpu_without_cps(ms, cbus_irq, i8259_irq);
     }
 }
-- 
2.21.1


