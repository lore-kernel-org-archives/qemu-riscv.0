Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwI-0008Fa-J3
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwC-00087E-Ut
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwB-0006ke-AC
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:16 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:34460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwB-0006jz-3c
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:15 -0400
Received: by mail-wr1-f45.google.com with SMTP id a11so13685220wrx.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dn6ffCPkA7oUVq7UkAAzaviL3Pr9DX2pgFSlHwRglF4=;
 b=ax07Z2sMLqAR6cjYYPrRpEhHsNQdbQHQyZYZb27mTiJDxl9hawGbgG76vZywvdwre6
 1hRx7mIce2EFpGXI76+K2EOQBFksalhU/py8Wzo7A2rLnIAqm4fVh1kp4ECw8PG8BSce
 Kx3+SEWnJEDAehN7oK+ACp5rCme6Gc9ALWPIWpmdm8cfHnFME9hQYjrWN9eOtazASyv+
 ilGolynNUjZp5Dfrdbh3b7FiX3pGQhOLazt+40v8UVuR5uyp8cS930zRW8glE3tAYHmo
 9fwuUaJg/lhkCyrvW6ReZabxlJuoT7/iwgDHWflmgJJRU1efleWR11mtZz5ITcpXXC9D
 SnHg==
X-Gm-Message-State: APjAAAUy5in2N+IiCYQgt4rdvY1ffXlnpu7hdBIoZVPV/c+9PXLwrLZI
 7ghaKJYo8h/FEGC/E0UG/w9kEdifh2JWuA==
X-Google-Smtp-Source: APXvYqyu7FNS4ohUvfOzQsK9YSsqNC4rpJVPLnqNuOK4DBNxfuXZZx57LtY544X2FHhXarnU9MvvCg==
X-Received: by 2002:adf:b652:: with SMTP id i18mr17845wre.126.1568190313477;
 Wed, 11 Sep 2019 01:25:13 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id v2sm4149372wmf.18.2019.09.11.01.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:13 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:54 -0700
Message-Id: <20190910190513.21160-29-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.45
Subject: [Qemu-riscv] [PULL 28/47] riscv: hart: Extract hart realize to a
 separate routine
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:20 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Currently riscv_harts_realize() creates all harts based on the
same cpu type given in the hart array property. With current
implementation it can only create homogeneous harts. Exact the
hart realize to a separate routine in preparation for supporting
multiple hart arrays.

Note the file header says the RISC-V hart array holds the state
of a heterogeneous array of RISC-V harts, which is not true.
Update the comment to mention homogeneous array of RISC-V harts.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/riscv_hart.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index d0f3199968..6620e41cb7 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2017 SiFive, Inc.
  *
- * Holds the state of a heterogenous array of RISC-V harts
+ * Holds the state of a homogeneous array of RISC-V harts
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -39,26 +39,33 @@ static void riscv_harts_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
+static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
+                               char *cpu_type, Error **errp)
+{
+    Error *err = NULL;
+
+    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx],
+                            sizeof(RISCVCPU), cpu_type,
+                            &error_abort, NULL);
+    s->harts[idx].env.mhartid = idx;
+    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
+    object_property_set_bool(OBJECT(&s->harts[idx]), true,
+                             "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+}
+
 static void riscv_harts_realize(DeviceState *dev, Error **errp)
 {
     RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
-    Error *err = NULL;
     int n;
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
     for (n = 0; n < s->num_harts; n++) {
-        object_initialize_child(OBJECT(s), "harts[*]", &s->harts[n],
-                                sizeof(RISCVCPU), s->cpu_type,
-                                &error_abort, NULL);
-        s->harts[n].env.mhartid = n;
-        qemu_register_reset(riscv_harts_cpu_reset, &s->harts[n]);
-        object_property_set_bool(OBJECT(&s->harts[n]), true,
-                                 "realized", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+        riscv_hart_realize(s, n, s->cpu_type, errp);
     }
 }
 
-- 
2.21.0


