Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0WU-00034l-Ah
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WS-0002t5-TI
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:52 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WR-000087-6w
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so1954168wms.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
 b=rs57IDWy4ex+nQZQeb0ZdIEk31Xy11/nJRW20rReogKUl4KeTcl3cc8D8LgRDr/zB+
 u1xu9JIMluXipYjm6yV9E/vCM1QV81BfzX0tAdIVcQnw3SCt52ft5tbmv43LCl6DvtTH
 +QXN/gSlICEsSY7Anmepv49+d8lBSk9UIxVr0gIISD9X1Ok3aWpRr7HtqqsuJSk7XLTn
 fVD6/NnMCZOT/f2RbzUvvj+eDfPcB+/4tofTKLsSRibABiwE6rlqpTGNK5Eo76e31gJO
 dbSu47RseekPIV/lwoCjG8G/2gpwb7R4RXsh7j//TXCxI5TY2cP0XC26agoEOcURnJlX
 nvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
 b=U9DcqmkYm3ebFoUV6Cl5s+tPnbS7k+4ZD9N+jvW2Z+V5QFKjfbwQ7yCptNwib7GrLR
 UHConNxLdhhYgOqTcMxbrI8XVjoWzorbxR4AcI4MjAWwT6Bywb92M1qOvyTQA5Wasq1j
 3Hajfyp+os5+s3qUFPuLjX8rL24QH4Qh3MLGhMPj6BAVJjMr7YnDYGH+DKwEWMNVZ6qL
 zhSRev3gbe42sPiEnKcA/0JQpDKgHmf6WMMoU+R0kdkDYYEgpXaDEUOeGx6cnFTPmX7i
 jVpkezGCq5vvptw2iwVzjnlRnO+bh/gegvtBuLfeTtJIx6H7OlrNBTqUw/b7sfYi81RH
 OanA==
X-Gm-Message-State: AO0yUKXOFt/Y/mVj9LmdzW/Yu1ucvHY1IMy2ylh5FTCoDEo/rbolbruu
 QxHgVkuipmZmm0OTgnqnfyuE9Q==
X-Google-Smtp-Source: AK7set/UQPHJbaivQObW3mjose4JOUwmr7paKMilq0UeHRneB+SQcpqKao3IOC5rr9sj8rTstH09aA==
X-Received: by 2002:a05:600c:5543:b0:3df:5eb:828c with SMTP id
 iz3-20020a05600c554300b003df05eb828cmr4955707wmb.32.1675447850564; 
 Fri, 03 Feb 2023 10:10:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a05600c43d500b003dc0cb5e3f1sm3231511wmn.46.2023.02.03.10.10.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 18/19] hw/rx: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:13 +0100
Message-Id: <20230203180914.49112-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:53 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rx/rx-gdbsim.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 47c17026c7..5d50f36877 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
+#include "hw/qdev-properties.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
 #include "sysemu/qtest.h"
@@ -99,12 +100,10 @@ static void rx_gdbsim_init(MachineState *machine)
 
     /* Initialize MCU */
     object_initialize_child(OBJECT(machine), "mcu", &s->mcu, rxc->mcu_name);
-    object_property_set_link(OBJECT(&s->mcu), "main-bus", OBJECT(sysmem),
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->mcu), "xtal-frequency-hz",
-                             rxc->xtal_freq_hz, &error_abort);
-    object_property_set_bool(OBJECT(&s->mcu), "load-kernel",
-                             kernel_filename != NULL, &error_abort);
+    qdev_prop_set_link(DEVICE(&s->mcu), "main-bus", OBJECT(sysmem));
+    qdev_prop_set_uint32(DEVICE(&s->mcu), "xtal-frequency-hz",
+                         rxc->xtal_freq_hz);
+    qdev_prop_set_bit(DEVICE(&s->mcu), "load-kernel", kernel_filename != NULL);
 
     if (!kernel_filename) {
         if (machine->firmware) {
-- 
2.38.1


