Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzZyB-0005Oa-Th
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 01:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxz-0005EB-SQ
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxx-0007vv-Qr
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:27 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43247)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzZxs-0007XZ-0A; Mon, 19 Aug 2019 01:12:20 -0400
Received: by mail-pf1-x442.google.com with SMTP id v12so445710pfn.10;
 Sun, 18 Aug 2019 22:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pqOCkNiswrl8eqAUR5cT2tEbqpobUdAiltlSIodl66Y=;
 b=HjHeWLX4H8vEB4p6A/CPalF7KtznkhW2/VHqmPtTM/uhwFeBHVZlQcreNyjdYaXt43
 bbBxK89d5d/GKDHytEuDz7RIvlLeMO9wBdvwtmXX7TYSTjsM3qrtpr+1WATce0Cu4Ra7
 yBZO4c6o6mfWkVTRu8rg/DLCojbvdSMOPp5k6wV3NEVcWThChCWV4cfhMvhCvGldem1A
 CjKtDcFGCez9BZGAnm7vd6fW7k5gunIcmBGMKYYk8AJtfs6s0UqctHhIdXHnrIjhLbep
 TOkKJ4SGmaX4SFD+xKPqj5W62Jk6d/Y+vW59nMiiMGUHDUq7I7zfWcUuHFii01z8Eroc
 ubuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pqOCkNiswrl8eqAUR5cT2tEbqpobUdAiltlSIodl66Y=;
 b=pPmkquuS7QkFyifVXxTwQnvh5CWUx33UwHHvYKWr7tDIEUVk7Z3R//MI4zy6Rx0zm5
 h92Od5DyOthGcM8PCOjIsyFzhA3++nfmwz7L5ZsWUoJwXVbmUiKlp7DGzTptwi6UAUtp
 VvQXttLAK9g2yakqbP+D7W1tVAmUZzRmYYWa12/6qpPzYqX18lG/ynbTYRnFpEq1YIkp
 GECJfgSsUihsAgbayoUBNuXCnVdFOQJK0/BL5aZEp7662dxq7wOfuAJa9PwblhIsFeBf
 ZLHLvf6Jlqec1+1qAnUxXlIQS88oJAfqO3EWOsARBxk9Wn4mGjPxCU7LhymviIxTdwqn
 ew2Q==
X-Gm-Message-State: APjAAAWdAR5CwAjP9n9Og50XCX9laSFV1Y4+hQ60ieqnwSsHaLJfsUfj
 Z9YtIX21kZoj375txCnjMgEqp98A
X-Google-Smtp-Source: APXvYqx8kjMMJ2VOPlp5bNJl0+vy4bNxB0QXFTP3CWLQgl1ivxnQwmCWZTrONi1gaapRzXt1KGal3A==
X-Received: by 2002:a63:a35c:: with SMTP id v28mr18483156pgn.144.1566191539128; 
 Sun, 18 Aug 2019 22:12:19 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q13sm15464986pfl.124.2019.08.18.22.12.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 22:12:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 18 Aug 2019 22:11:44 -0700
Message-Id: <1566191521-7820-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v4 11/28] riscv: Add a sifive_cpu.h to include
 both E and U cpu type defines
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
X-List-Received-Date: Mon, 19 Aug 2019 05:12:32 -0000

Group SiFive E and U cpu type defines into one header file.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 include/hw/riscv/sifive_cpu.h | 31 +++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_e.h   |  7 +------
 include/hw/riscv/sifive_u.h   |  7 +------
 3 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/riscv/sifive_cpu.h

diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
new file mode 100644
index 0000000..1367996
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
index d175b24..e17cdfd 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -19,6 +19,7 @@
 #ifndef HW_SIFIVE_E_H
 #define HW_SIFIVE_E_H
 
+#include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_gpio.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
@@ -83,10 +84,4 @@ enum {
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
index 892f0ee..4abc621 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -20,6 +20,7 @@
 #define HW_SIFIVE_U_H
 
 #include "hw/net/cadence_gem.h"
+#include "hw/riscv/sifive_cpu.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -77,10 +78,4 @@ enum {
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
2.7.4


