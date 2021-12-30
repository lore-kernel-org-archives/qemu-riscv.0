Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ugE-00051h-NM
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ugC-0004uH-QJ
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:37:12 -0500
Received: from [2607:f8b0:4864:20::52c] (port=43763
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ugB-0003Wh-AL
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:37:12 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 8so21326316pgc.10
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ba+tzdtFHkcsjjcU0If6YzKpfeahDC/ZvvxeQqTk1fU=;
 b=OXtMeouxigNm1ThXSWWtgDgKPSCOjChpBvq0QyvZEDuoxkMKtrBQAG7Hvo4XAC4uLZ
 EUHgorH/8I+0a+TyMd+JgAJWro73V1JJfgkhViNFlIp9Yr4FeOzwBDr8jj9AD9pEMhMd
 mxqYwBFvHLOMLrcI2eIu+fTZR88AzU39C5GlvweVuBXQJlGOlPLvOydqgfcbzbPglEbn
 SzF5EGIirtidGmRevuWmFfb/cc1c9L3pdPRisw9gbOynaTENbucCH/QDSm4KBcLvFe1d
 3J3aPOQk+34K4H7ymAHrsNM/NaLwbMc8ayCcWFSQeKvPYyRTjujvyIdzW7dwqXKlAXrV
 qUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ba+tzdtFHkcsjjcU0If6YzKpfeahDC/ZvvxeQqTk1fU=;
 b=6Fn8idtD0Spm3KIQOkZdhv1Ud0y1Gf6l6R3ZuI16kwQnujsnQjbUU9vXKLAWXbhAAK
 NoG/sc0iQjy3zNsscWFEoAbhVMFBlcz2SompTJvdSykt+DEdM204O+/rryflH5MvWuCM
 DxNmtrPYjVli7quspxICu65wTfPWEo3Ng8K/GnHkR+HCYigt/hI0A1ncgoRf1SDjSFRU
 1zdg0C8l2GlAC7dwng6cV88A3gX/w8c5LpnvSTYsbEX1CRb6xV5apDEDvbvfTk3CRgDf
 1Qlv/kQ6HuQCyQnf3HZoqDYXttawzn8WlengDJwT1Tth66IvN0KUxPiELedxrGgzDQ9d
 o1fg==
X-Gm-Message-State: AOAM530BOa2fllhGkfi7cRmFYVpgsNtBNJxckUuEbnybtbhdgxyzCLqJ
 hdjO4W1DzzXxztneAf/SR0VTDg==
X-Google-Smtp-Source: ABdhPJzRs5T5PfWaGR+h9fMG34gOOXKE9jH+/0HPBLtEYtwOrmNt67rle1vAJuVYquwqy62gyNJ/kw==
X-Received: by 2002:a63:354c:: with SMTP id c73mr27248603pga.532.1640867830026; 
 Thu, 30 Dec 2021 04:37:10 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:37:09 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Thu, 30 Dec 2021 18:05:39 +0530
Message-Id: <20211230123539.52786-24-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:37:13 -0000

From: Anup Patel <anup.patel@wdc.com>

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 hw/riscv/virt.c         | 10 ++++++++++
 include/hw/riscv/virt.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7579f7b41f..86b03736eb 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -44,6 +44,16 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
 #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
 #if VIRT_IMSIC_GROUP_MAX_SIZE < \
     IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e12e8ddcae..62d8e9c6d0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
-- 
2.25.1


