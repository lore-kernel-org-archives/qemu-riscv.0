Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsf-0007TM-Sl
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsY-0007IR-MV
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsX-0006v1-8Z
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35407)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsX-0006uQ-2G
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:25 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so220526pfw.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=OBRVpIVwK3kiEvI4bIZsljmE4GCfcTWi7KQvPyiBclk=;
 b=GTxmqAd0csdBQlMCuFpMaYvfjCKF2R1ajSefBkZEfF/WhYPacpFHQpwYmBheYYzMGe
 wln1dIR3syPQD15YJFg9wedvB4Q/TVO1PcJ5r5D/1r9yeWCXQ7c0oVBkJ0HAlCW3xpCn
 biI9F4bvM8lh+gXBXG5oPtfenkPtgNZ+WzsxdjcVBZIBCUXli8RChKK8KBX6M+gS6JC7
 9xeq6uKURYnv+G9Hauom3Fy+P2idX/MI35r9WRSfsS1TPZ3ebEu7roYy530+52XnN1M8
 TgNw+SbyeEWWecBt2rLN7RKMGUGrnZ32hbFnFCixJHNRcaupAs/Q1YuRuZ0OaQzDUhJo
 tefg==
X-Gm-Message-State: APjAAAUNqv94rOzmPyQunbDfipLGbNfZHukRyRW56FY5k8mHo2PrmL3p
 1QcS2FhcOl/Ig0Gn0wGmg8tBjVEAWKQ=
X-Google-Smtp-Source: APXvYqygzX7IIGhgUGnQchnUUYyh9rBeZw52SH+tgfTaFyMt+xyZ4oVAhH4MufigGt6mw/NjAsg/hQ==
X-Received: by 2002:a17:90a:c246:: with SMTP id
 d6mr4337916pjx.126.1568820503637; 
 Wed, 18 Sep 2019 08:28:23 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m9sm6589641pgr.24.2019.09.18.08.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:22 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:19 -0700
Message-Id: <20190918145640.17349-28-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 27/48] riscv: Add a sifive_cpu.h to include both
 E and U cpu type defines
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:31 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Group SiFive E and U cpu type defines into one header file.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 include/hw/riscv/sifive_cpu.h | 31 +++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_e.h   |  7 +------
 include/hw/riscv/sifive_u.h   |  7 +------
 3 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/riscv/sifive_cpu.h

diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
new file mode 100644
index 0000000000..136799633a
--- /dev/null
+++ b/include/hw/riscv/sifive_cpu.h
@@ -0,0 +1,31 @@
+/*
+ * SiFive CPU types
+ *
+ * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_CPU_H
+#define HW_SIFIVE_CPU_H
+
+#if defined(TARGET_RISCV32)
+#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E31
+#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U34
+#elif defined(TARGET_RISCV64)
+#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
+#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
+#endif
+
+#endif /* HW_SIFIVE_CPU_H */
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9c868dd7f9..25ce7aa9d5 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -20,6 +20,7 @@
 #define HW_SIFIVE_E_H
 
 #include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_gpio.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
@@ -84,10 +85,4 @@ enum {
 #define SIFIVE_E_PLIC_CONTEXT_BASE 0x200000
 #define SIFIVE_E_PLIC_CONTEXT_STRIDE 0x1000
 
-#if defined(TARGET_RISCV32)
-#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E31
-#elif defined(TARGET_RISCV64)
-#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
-#endif
-
 #endif
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index be021ce256..f25bad8f13 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -21,6 +21,7 @@
 
 #include "hw/net/cadence_gem.h"
 #include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/sifive_cpu.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -78,10 +79,4 @@ enum {
 #define SIFIVE_U_PLIC_CONTEXT_BASE 0x200000
 #define SIFIVE_U_PLIC_CONTEXT_STRIDE 0x1000
 
-#if defined(TARGET_RISCV32)
-#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U34
-#elif defined(TARGET_RISCV64)
-#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
-#endif
-
 #endif
-- 
2.21.0


