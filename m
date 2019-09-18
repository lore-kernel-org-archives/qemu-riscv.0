Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbs1-0006RI-1F
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrv-0006L3-UT
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbru-0006SC-Nc
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbru-0006Rj-HQ
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:46 -0400
Received: by mail-pf1-f196.google.com with SMTP id i1so201327pfa.6
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=92TyKMJVZqYJ1sG0e0fGsni//VQCxIEBuXE2vZnuLSU=;
 b=f/gK2PLLK03XP/SApsaJjVhBHeChnrwE5HF6O0ir7hlLfsWyl5LVQfS+uXWlFxJykd
 NrqT6Lm2ALk2atZRUEg1vY2+mcEkdMozVEavB2LBOJvaro585vQfyQLT3xscRgHM/H+s
 8yYqAw94BnNRcfWH+sUKZ4VnBoUv19Ql9kPBGZ3UPZgv+k3pSwM6y6EEbb7ptPJmVf8t
 ehQOEzMSazX1DVqfS/NOR6Qb+FaX/7SigzjfuzXROI9vYyujgmBNzE7hKtSqgEUlY1jp
 T7NJHSByYbvMlVaU8R8p/lbL8WskaoNsQ8rLaj+H0PbNY0DWjCmwVndzjpTA96WImFn9
 4VBQ==
X-Gm-Message-State: APjAAAVX0V+eaaIdgsVKfP2JVP1afX1Soaszlu89vKPCuXJ+eX0YwZlk
 /vUbH9hQqfIwdhngx92Q6D42r81NHHQ=
X-Google-Smtp-Source: APXvYqxub/yFjTWkkwdEvm+mpAeLAU47O928RVVr8MEf5Jt8emDQ6c9G3aj/uRnlnTkhNad7G7c/EA==
X-Received: by 2002:a17:90a:fe04:: with SMTP id
 ck4mr4494761pjb.74.1568820465007; 
 Wed, 18 Sep 2019 08:27:45 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i74sm9222296pfe.28.2019.09.18.08.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:44 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:00 -0700
Message-Id: <20190918145640.17349-9-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: [Qemu-riscv] [PULL 08/48] target/riscv: Update the Hypervisor CSRs
 to v0.4
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:51 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Update the Hypervisor CSR addresses to match the v0.4 spec.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 11f971ad5d..e99834856c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -173,6 +173,24 @@
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
 
+/* Hpervisor CSRs */
+#define CSR_HSTATUS         0x600
+#define CSR_HEDELEG         0x602
+#define CSR_HIDELEG         0x603
+#define CSR_HCOUNTERNEN     0x606
+#define CSR_HGATP           0x680
+
+#if defined(TARGET_RISCV32)
+#define HGATP_MODE           SATP32_MODE
+#define HGATP_VMID           SATP32_ASID
+#define HGATP_PPN            SATP32_PPN
+#endif
+#if defined(TARGET_RISCV64)
+#define HGATP_MODE           SATP64_MODE
+#define HGATP_VMID           SATP64_ASID
+#define HGATP_PPN            SATP64_PPN
+#endif
+
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
@@ -206,23 +224,6 @@
 #define CSR_DPC             0x7b1
 #define CSR_DSCRATCH        0x7b2
 
-/* Hpervisor CSRs */
-#define CSR_HSTATUS         0xa00
-#define CSR_HEDELEG         0xa02
-#define CSR_HIDELEG         0xa03
-#define CSR_HGATP           0xa80
-
-#if defined(TARGET_RISCV32)
-#define HGATP_MODE           SATP32_MODE
-#define HGATP_ASID           SATP32_ASID
-#define HGATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define HGATP_MODE           SATP64_MODE
-#define HGATP_ASID           SATP64_ASID
-#define HGATP_PPN            SATP64_PPN
-#endif
-
 /* Performance Counters */
 #define CSR_MHPMCOUNTER3    0xb03
 #define CSR_MHPMCOUNTER4    0xb04
-- 
2.21.0


