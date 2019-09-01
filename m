Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4G05-000814-2N
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzo-0007hN-B1
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzm-0006c4-9w
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:40 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzi-0006U1-6N; Sat, 31 Aug 2019 22:53:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id n190so5506229pgn.0;
 Sat, 31 Aug 2019 19:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QfxelKNXvH6HRHZmZTXsMIdJtdBWLrHSOEj4FQxqLkw=;
 b=RInUA/3P6XIkX2za5hzmzE0wpljobhUbbFA9p7lIEsPlTIgHDy/n/k+wyuJbIW+Fie
 3ULB3bOxvDVfqsg7mvkl+KYsU76EO/AOUTVxMVpiY9B03P+qOm2CQ3xKfhJyh0CIaOus
 638a+6U0cnkyG3FIHB+4ExcFOjcCRrJIganuRr577sKAbXmcvlmLtWj3tjxADjyPc17B
 D89O3aWa2GNGtSA4gLExrqDf8dnWU+LH7paHKCW+04MxHsZ5inqHtxsL5GxrTftEoSsJ
 tlj7yhm5wZU4kR1CrmMl8DUPHwAauhD8SWjttj+tr2HwbdBb7L/HkQU3kZ4ZLhspjJyy
 YE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QfxelKNXvH6HRHZmZTXsMIdJtdBWLrHSOEj4FQxqLkw=;
 b=isRf+I0jWN5v9CcQA4KAKEKJz84O1eHWa3MNIfqRcKyy5O5EdLqEhhL36m9TuhASaW
 RVqlRnujy2VEw/NiwT8iCmU2YuK7k13nr2gPinYm9+zJ6wgs7+kvQruak6rU5r8ymlx3
 8uoO/yXcQlXVBakC5djEo10W1x/w1YE3xH1OTs49AaPmIN3fkmhxniMx+Ch42KdUhIOk
 g4EeAxYg2w/34YgyPQjjA9KiFPXtwv4nAkgJRYA4CXt4sXwi0bbe82hTzKojYp10nL3s
 Z+NfrsV8dNP9WXfCFSS2eJTo3m5sjhbSMgGcqWWoDCR/IbwZXZKiWizxaYQ40Zx9wsk9
 xwOg==
X-Gm-Message-State: APjAAAVhYhtGcY2v96oCDd096YAq3KSGRk8DnJJvAfWZyi10VmrW7saX
 PaQonTutl425X9CkxzbZSwo=
X-Google-Smtp-Source: APXvYqzUIM6l1fGuZBNy8cfFEpYIRMaAU/LatJTs4e+nchSVtIIcWa+bkd22gJWRsOEzx5gLzkfzBA==
X-Received: by 2002:a63:6d6:: with SMTP id 205mr20091095pgg.262.1567306413006; 
 Sat, 31 Aug 2019 19:53:33 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.32
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:54 -0700
Message-Id: <1567306391-2682-14-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: [Qemu-riscv] [PATCH v7 13/30] riscv: Add a sifive_cpu.h to include
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:45 -0000

Group SiFive E and U cpu type defines into one header file.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
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


