Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyQm-00081O-Dp
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQj-0007wy-Ry
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQj-0007nA-43
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:37 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jQyQi-0007lx-NL
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:36 -0400
Received: by mail-pf1-x442.google.com with SMTP id p25so7036978pfn.11
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=J18hrsuxLmsCXXOrk6dxkfjT6yK/2TCdOo0otnuZFwo=;
 b=SOb6vy7jD+6hYjXUQqfSx8XeXQx38unn+uuxgVMkImPseS54ll88fyF9psRdiKCy4D
 rCFCPj5m/vZzw8zLccO57PyQSTuu0s2Cr6UFQRYdMjlAuV8QnQCXssADkW/4kVj8eNoV
 eig03ISZgRy/LMv0eb8Oev4voVoVIZgarE+mgXqDGFjbgeI+bG5LFRmGjX9YBASsOPkS
 kdK1It83tUp19NY7EeM0HBuS4FymiWamo6pbu2+DnwdZr1i3oyrl61f2WBnG/YDAPmUo
 6P09GFkdoWHwI03VY84xqsPUllOeEfxvrfp3XJSb/ZWJ3wNqZzWr3cT2fQB5wT48DfLc
 wkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=J18hrsuxLmsCXXOrk6dxkfjT6yK/2TCdOo0otnuZFwo=;
 b=ZMYe5NnSSm13m6zglrYtNR08M3leiHWHRwsQqhMUgWXkTiIYNAqU9JOiCKGl5AWO3i
 vIbsMkoouic4/bRx0nFnOvd4YUV3BzqDYiRZn6m/yYU5INxQfOGFn6iwSmm6Nv1xKz/s
 nuOBuh0n4ekhPfv8MTUlJQY32Tt3sql80i53jtqTPe14StO441VmGd2tZ0VyyKRW20j0
 5hUMY1V0WZRS9i487owtWAWWdXm8GoPDJaMzeJw/y2B+ncXEvIcqODUticAUjiNssGbv
 d9hMYIM8i8KJVpnQLynC1wC0eobvJtM5jlYvbwD1rul91E4gSFJPg+SuM/+o0JZm1YXt
 Pspw==
X-Gm-Message-State: AGi0PubeNWzngeaPwo2Vv93M+ELaXaOiVAf+1pyy86odJVbW0zlkdaN9
 z/znK5lMl2VWCMApJfz7h3pI7YhaPCI=
X-Google-Smtp-Source: APiQypJxkkLvXrt96+FhIfK0RUUlmrsD1hpL9sUDTNr4iwbieYWFxkxbP9GU923uJCkahCvgU+xdJg==
X-Received: by 2002:aa7:9e49:: with SMTP id z9mr22812291pfq.225.1587496774828; 
 Tue, 21 Apr 2020 12:19:34 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p68sm3101993pfb.89.2020.04.21.12.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 12:19:34 -0700 (PDT)
Subject: [PULL 6/6] riscv/sifive_u: Add a serial property to the sifive_u
 machine
Date: Tue, 21 Apr 2020 12:10:01 -0700
Message-Id: <20200421191001.92644-7-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421191001.92644-1-palmerdabbelt@google.com>
References: <20200421191001.92644-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=palmerdabbelt@google.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Tue, 21 Apr 2020 19:19:38 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present the board serial number is hard-coded to 1, and passed
to OTP model during initialization. Firmware (FSBL, U-Boot) uses
the serial number to generate a unique MAC address for the on-chip
ethernet controller. When multiple QEMU 'sifive_u' instances are
created and connected to the same subnet, they all have the same
MAC address hence it creates a unusable network.

A new "serial" property is introduced to specify the board serial
number. When not given, the default serial number 1 is used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <1573916930-19068-1-git-send-email-bmeng.cn@gmail.com>
[ Changed by AF:
 - Use the SoC's serial property to pass the info to the SoC
 - Fixup commit title
 - Rebase on file restructuring
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/sifive_u.c         | 20 ++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9bfd16d2bb..eb0abcae89 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -34,6 +34,7 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
@@ -326,6 +327,8 @@ static void sifive_u_machine_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             sizeof(s->soc), TYPE_RISCV_U_SOC,
                             &error_abort, NULL);
+    object_property_set_uint(OBJECT(&s->soc), s->serial, "serial",
+                            &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                             &error_abort);
 
@@ -417,6 +420,18 @@ static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error *
     s->start_in_flash = value;
 }
 
+static void sifive_u_machine_get_serial(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
+static void sifive_u_machine_set_serial(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
 static void sifive_u_machine_instance_init(Object *obj)
 {
     SiFiveUState *s = RISCV_U_MACHINE(obj);
@@ -428,6 +443,11 @@ static void sifive_u_machine_instance_init(Object *obj)
                                     "Set on to tell QEMU's ROM to jump to " \
                                     "flash. Otherwise QEMU will jump to DRAM",
                                     NULL);
+
+    s->serial = OTP_SERIAL;
+    object_property_add(obj, "serial", "uint32", sifive_u_machine_get_serial,
+                        sifive_u_machine_set_serial, NULL, &s->serial, NULL);
+    object_property_set_description(obj, "serial", "Board serial number", NULL);
 }
 
 
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a2baa1de5f..16c297ec5f 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -61,6 +61,7 @@ typedef struct SiFiveUState {
     int fdt_size;
 
     bool start_in_flash;
+    uint32_t serial;
 } SiFiveUState;
 
 enum {
-- 
2.26.1.301.g55bc3eb7cb9-goog


