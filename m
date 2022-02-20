Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLi1B-0005K2-H8
	for mharc-qemu-riscv@gnu.org; Sun, 20 Feb 2022 03:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nLi1A-0005Gf-AW
 for qemu-riscv@nongnu.org; Sun, 20 Feb 2022 03:56:32 -0500
Received: from [2607:f8b0:4864:20::102c] (port=56252
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nLi18-0002g9-Mm
 for qemu-riscv@nongnu.org; Sun, 20 Feb 2022 03:56:31 -0500
Received: by mail-pj1-x102c.google.com with SMTP id om7so12257133pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 20 Feb 2022 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44Rs1UUnl+Crmx/+Ii51ksCCx5jOIv3Vj+JyiRXDYoI=;
 b=chAcWzDBq4pU6KpXvL1RznCGA4zw1GhrVDuBXNh5W+I6FOtmNubc7zT6zm8N4HW3pW
 PxZ//Dj4y6eCrky3dLY/VE7l0LJ1q9+nrFBtm9vGI0nYAn9JRD890eKvJtkwQS5VefJV
 ZdSUd9VdwGLiRI2eSZWr6Y6SsbjOfEEf418/J/NG1eI1ECNs0F/YKPdXKOsNb7jAeztX
 W/IjDvcFh3IIA5NHwEqi8GWiJS7sfzJPdXXI0aUpX1jJIqt4Q+dv0vV60nxBjIp76JIH
 tjnxrPvDBaOWRSGmmTxZNnEWrmE/n7T9A7W2mi6owYII8XxE4MtAfITLZqxW0/Bz/CWw
 tGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44Rs1UUnl+Crmx/+Ii51ksCCx5jOIv3Vj+JyiRXDYoI=;
 b=xIJUWN4lib/0sPagl1HH+NYQ5e4YcIN/aH3BLMeL4ZrptcpRTf8ft6zTX/YORHqSYn
 4Nedf5/zemx/PhI7fwJ3zmE9mttXK+6slJ9ti4J6q7iLLWDkQL5qlGHjxSWDmUUgIZrV
 h6hqPcSjzxbA5XciBCYKkaMj4RkWiIPCAfSDx9nu0FYJMkep8Ib8AST2oBy8/tL7bvXp
 iXnbxCHfrnp0OYFJceI+UvFqhEXxwNI8tz8WWThrTdCL1W4MAkYycNtPocLDn5srEcj2
 ++h2bxEX1sE+PLBn1R/0FX1v5ASJHPHKJGnhikavLnv77lVmR9/+cdUYGtVhsA7v9Khi
 DIBw==
X-Gm-Message-State: AOAM530Wq+4EUE16WWMoBH2ORzH4zfiPOfL1La4VTMP4FDDpXFA9/icZ
 BwFfd2XWeEQEo0sNPq9UY+OPRg==
X-Google-Smtp-Source: ABdhPJzz5pf2LjrA8cJZjxLhNHZXD9FDYGdoXbKvgrWOK5QyZVoMCtZqhATc1vk9ubDcHch5FYkvxA==
X-Received: by 2002:a17:90a:4289:b0:1bc:275b:8986 with SMTP id
 p9-20020a17090a428900b001bc275b8986mr1872445pjg.153.1645347378538; 
 Sun, 20 Feb 2022 00:56:18 -0800 (PST)
Received: from localhost.localdomain ([122.162.118.38])
 by smtp.gmail.com with ESMTPSA id q13sm9317220pfl.210.2022.02.20.00.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 00:56:17 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v10 5/5] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Sun, 20 Feb 2022 14:25:26 +0530
Message-Id: <20220220085526.808674-6-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220220085526.808674-1-anup@brainfault.org>
References: <20220220085526.808674-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 20 Feb 2022 08:56:32 -0000

From: Anup Patel <anup.patel@wdc.com>

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c         | 10 ++++++++++
 include/hw/riscv/virt.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94fbf63ec8..da50cbed43 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -45,6 +45,16 @@
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
index d248d0dfa0..78b058ec86 100644
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


