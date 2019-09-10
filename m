Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvq-0007Zr-K7
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvk-0007Rq-FY
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvj-0006RG-By
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvj-0006Qs-6r
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:47 -0400
Received: by mail-wr1-f67.google.com with SMTP id d17so10677434wrq.13
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=92TyKMJVZqYJ1sG0e0fGsni//VQCxIEBuXE2vZnuLSU=;
 b=fCp/v3PClLrI0imaiFwq7qMFFi2zmj1QxRgMjS7wACCNfjqmwqvpSOme7dkgjmIxMC
 EDUWpbe6vQMb+4ZmBmEEt5ghk9BECqsjXnOUmeMZvc/GHxGGhbM+EkQT51Ak+l1jl0Gk
 e0VFHGUq/EulYOIN363hXs4N0qE8457le8B9ZcU1scRhKiurcqee7keIrBgu2aNuNst6
 s4q/1FXKkxew1jBMK8FqPNO8YA/vy3Cb08nb/tsZDbD2wVZYYWtsRfKIAW+4YflSZIWZ
 tcpsWF2pTqdyqNKuAf6FfMJD7jOR5Aud9gy/tFQRgUKZBVgb1QTOVVCdwEUjoZn6UDxu
 ysQg==
X-Gm-Message-State: APjAAAXB/8D6OOPcg53Dc0e6wzWVgfUzrDVVhvw5FpgvIzuHRvwN1TkE
 FbJ6pKCNiNVKpUSwRh0kqeq0S4AiNf+pRA==
X-Google-Smtp-Source: APXvYqwDK11TTw79/z98st8PiM//6SWGwXKKfruRtjYHVssroUDTejAIHpN4CLSF/ik7ILJtsJMl1A==
X-Received: by 2002:adf:dcc4:: with SMTP id x4mr21464894wrm.221.1568190285688; 
 Wed, 11 Sep 2019 01:24:45 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id c132sm2301142wme.27.2019.09.11.01.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:45 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:34 -0700
Message-Id: <20190910190513.21160-9-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: [Qemu-riscv] [PULL 08/47] target/riscv: Update the Hypervisor CSRs
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:51 -0000

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


