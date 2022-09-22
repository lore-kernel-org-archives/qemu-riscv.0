Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obH1D-0005gk-Ln
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 03:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1obH19-0005eR-V4; Thu, 22 Sep 2022 03:53:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1obH18-0004av-9i; Thu, 22 Sep 2022 03:53:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id w28so12350404edi.7;
 Thu, 22 Sep 2022 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=qopK1q4o9/GPa+6WfiHYZTGp6k7Ho5GuTxgVZINIgAY=;
 b=G4EaIGbT/l/GjbkpJy2wSwU1naxTQPzpTjDUjXOqMcbJBAx74tBxO0+fqR/BUMwA3D
 mDfaJwjaW9u4zFK8OmaWCLR9JWm+uNcMqbnA7sszgo6YJoEflUEIAt2aS4YOzyQRGf6v
 qzh0mvIv1ME2W567uxPOmWRQDeTRrTD1tIkE2GNYAOZ4xlvAZQ/45TeS/d0cwtL+o4cf
 Lrk2m1ujN/VUyz+UZy2kWpLkpo/NkmA3WzL5Sj41T7QUZxe5P2wxos8M2BSq5YCzudvs
 LWkcXvcpJQD/VOflmfRXpyUQtY4yC+f+/Yk4TtX0ilTPcYyg1PZ97jvmV29ER09phLHW
 z4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=qopK1q4o9/GPa+6WfiHYZTGp6k7Ho5GuTxgVZINIgAY=;
 b=1tcJYv7L1gmZH2aE/Bzo11SNrUEUWUK+oO26LqjRxF8x859lAiAEKK9TyYx4FDkgq6
 m8UObi6sv1dyA0welZ36PLJjY4KXfXiWXDL7NZPR7kZULjWybPBGiPaxZhmfeI5yuzrK
 CTKWbCuRB0hoyxdjrVcMeya2fgF/YsJg8nwpg44oGbA3ZpvGWqUcoah6WlpN2I9P6HlM
 VX10wNZf7nxxBRfYgf6xqW+Txvdg5rI2qyrMYUkQVQ6KDyPZkW/Z9wDzbnuj4SxterQy
 MaOuk2URSKoJs2wldOuYfNGoP56ILX055QB6QfZLrY7QYUE8TKMQ1yL7XD/wIPlHo7YK
 Z9eA==
X-Gm-Message-State: ACrzQf0SvUXr1a+1FwZZD8ym+05+qOi8XCltsPfuABc9R9SYhQgprvXb
 yrYPCAYhMrjoEUFL1ZEymqCuHf5qjWY=
X-Google-Smtp-Source: AMsMyM5x6tyH9WexeSNyKnVIr7+GOHu0HsboNoCYvpMl7lCCcPVaMv5bEbzI1D6RgtKZho8QwiYzhg==
X-Received: by 2002:a50:ee08:0:b0:44f:dc1:fc6b with SMTP id
 g8-20020a50ee08000000b0044f0dc1fc6bmr1919853eds.15.1663833182159; 
 Thu, 22 Sep 2022 00:53:02 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-214-084.77.191.pool.telefonica.de. [77.191.214.84])
 by smtp.gmail.com with ESMTPSA id
 j12-20020aa7c0cc000000b00445e1489313sm3121790edp.94.2022.09.22.00.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 00:53:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
Date: Thu, 22 Sep 2022 09:52:32 +0200
Message-Id: <20220922075232.33653-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Thu, 22 Sep 2022 07:53:09 -0000

SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
inherit from TYPE_MACHINE. This is an inconsistency which can cause
undefined behavior such as memory corruption.

Change SiFiveEState to inherit from MachineState since it is registered
as a machine.

Fixes: 0869490b1c ("riscv: sifive_e: Manually define the machine")

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/riscv/sifive_e.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..d738745925 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "hw/boards.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 #define RISCV_E_SOC(obj) \
@@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
 
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
-- 
2.37.3


