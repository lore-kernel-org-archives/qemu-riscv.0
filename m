Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0VH-00075Z-Qo
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VD-00074q-VS
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:09:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VA-0008CZ-Vo
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:09:35 -0500
Received: by mail-wr1-x429.google.com with SMTP id d14so5376862wrr.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFuCwAlq5IxtAXriS8uiMD+6Isqin7gOtT5GKermJKY=;
 b=QrILnDg56AYQyjEsqvz1V4zQmAKFgde/UZhM1brl+P8lHr3EOHfpF0nLW45Xx6teUB
 SZIxzh0F0FLcpXB98KbuHykNPHAoMa0d0WEQwWjJhRRwSfQbV58W8pIaqkAulN+uQWMg
 2KGfZfL7tLxHNWKTidZYW0F3AHNUkEumd1oNj0tfE0Nv/pI/+ff/lvnPkI4JuQF7C2WX
 edAeQn3kPLDHxORkSmz7waKWnRWjfCeYsJr+aQ9eg6XZTEC0SwMIvjDV3kXYmvBo0ehE
 Z5bhqfic2FqyY3SKLpVp9ULWGPWiJRUttecUaWDGm9INJyzFnUlGLRHT0kbF56vgSlss
 pKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFuCwAlq5IxtAXriS8uiMD+6Isqin7gOtT5GKermJKY=;
 b=0yQCpbMtJAK+6bACPBkOj6+3lOSLs1Kg2ASQTcVjD529fUQOtUH27x5P7lRqjfng4M
 OK2OTm966Q3piP9SsqBRELAvW1rbt6udmmsBFN54mJfDEpC7IBbHTJUyPCEL6WXvGQev
 AGrustjcZpOtRpsaJ8bHA+z7amWiw/H+LQpqKWZ3x7c6cEkA2hn4f2dyV/NmxAAZuh1p
 oV25VqT6zEuy2QHdGAxDFGRhwKanrJlp+LOKEdP5k+90nmPW7T5of4m8a5Vwvi/Nygzv
 Px0+SwY/Uq7NU6BeHe9LZQWGStSOpYZ54TMq7EVGn4lbzlbKfE7vY8nHUNSFcerJ2spd
 D92A==
X-Gm-Message-State: AO0yUKUbezcLz5p7i4tui/xiPDiMdzoH73m7VLV+Y4bDNgZoWTvALdTC
 LkoXwamW2csTTcqikiT/Xg1VNQ==
X-Google-Smtp-Source: AK7set+HJHuSa3IFD8PZa39OxSNOhF218jjpo04ePRCHDbIYpzUz10+eZzuVWtsqmR9ViQCaaF9Psg==
X-Received: by 2002:adf:fbc8:0:b0:2bf:ae2f:576f with SMTP id
 d8-20020adffbc8000000b002bfae2f576fmr9212591wrs.14.1675447771318; 
 Fri, 03 Feb 2023 10:09:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c3be6ae0b1sm2517659wrt.65.2023.02.03.10.09.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 03/19] hw/acpi: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:08:58 +0100
Message-Id: <20230203180914.49112-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Feb 2023 18:09:37 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/cpu_hotplug.c | 7 +++----
 hw/acpi/ich9.c        | 4 ++--
 hw/acpi/piix4.c       | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index b8c9081738..5bc5f435f4 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -10,6 +10,7 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
@@ -41,8 +42,7 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
      */
     if (addr == 0 && data == 0) {
         AcpiCpuHotplug *gpe = opaque;
-        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
-                                 false, &error_abort);
+        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
     }
 }
 
@@ -66,8 +66,7 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
 
     cpu_id = k->get_arch_id(cpu);
     if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
-        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
-                                 false, &error_abort);
+        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
         return;
     }
 
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 6c9a737479..9759119b32 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -30,6 +30,7 @@
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -197,8 +198,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
 static int vmstate_cpuhp_pre_load(void *opaque)
 {
     ICH9LPCPMRegs *s = opaque;
-    Object *obj = OBJECT(s->gpe.parent);
-    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
+    qdev_prop_set_bit(s->gpe.parent, "cpu-hotplug-legacy", false);
     return 0;
 }
 
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 3a61d89f92..9a86d506de 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -206,8 +206,8 @@ static bool vmstate_test_use_cpuhp(void *opaque)
 
 static int vmstate_cpuhp_pre_load(void *opaque)
 {
-    Object *obj = OBJECT(opaque);
-    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
+    PIIX4PMState *s = opaque;
+    qdev_prop_set_bit(DEVICE(s), "cpu-hotplug-legacy", false);
     return 0;
 }
 
-- 
2.38.1


