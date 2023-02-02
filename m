Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNRal-0004aw-AA
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 23:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRah-0004WC-Mv
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 23:52:57 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRag-0001FX-8x
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 23:52:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id r8so726256pls.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 20:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqWGZjBcQvINY4Peoi2bS5ONYkVu6Qdy2fHeFgiLlfU=;
 b=HVzfsICWONk06qyzuo4jLrKFXAt3Q0EpTOhN2X7MLJNsga0bJG7omtxG8xJc4vmdqD
 In9ECBv3OmpjS5hqozzL7pc1A8Bv0+ThIT42B+um0YcxbzCj3PXzw84vd7Cr4XGAvuY0
 RE3+umoQ8n/v2+gj2wXR6Bgmj6wluTstesg1jHc93RxhU1al4whjLlXrphrBFd7v2dRG
 vEniQap9gi0+fHsN0n1VjP+EA8LELaocoEl5sdSzkkA+/0IpL5k297qcq2ZACUc/5u38
 8XMavs6amei8OMSA5gODNpMNx/F0L1+EWINOTx8xPD5dS56Vait/Hkz6rYHl9Wu1OLgJ
 IEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqWGZjBcQvINY4Peoi2bS5ONYkVu6Qdy2fHeFgiLlfU=;
 b=osSTwdEYuV7rPz0dl2mtfjxFRa8Bj5ZtnaauhRKTlG6yx0LmPo1SiRBskdMd3l+CpB
 TwkaMNMPpE9d/rjd19eUSYC3HFWcIKjyWz6Wh9zOz1K30WgYr3FZrimmw8yxSXYx+vZE
 itbVtiTB/cxctQhHLCJG94qegpd/q9Xk2K2raPVN1AQ3Fw+AZxcz4IsdK2wzJMJqQvjy
 N/hcTJ/PGibsTXaqFDYL3Yp5/PyNBmo8dwZ7uyKjwsst4gBJDJvxX6vR+StFTYiDB/pG
 ujIG4Yl9MIbAx1sxb6KOkSll06aOVkzTtz8cWvmpZdre3BqIHYcVE+HJa2p68LwY68pN
 uG7Q==
X-Gm-Message-State: AO0yUKU/8FN6k27GObVwdUIXtf3ze8j21IUDfuJ1nXDucncOFljBInw6
 rmOjf4dPU+TJ/njGQCQxdPbv0w==
X-Google-Smtp-Source: AK7set8slXyFaxXdVD/8wTD0he7lwiJjPTlPuDORy5poORwsoURlFJvUFRkoJGhK53MFHWJLS1rJJw==
X-Received: by 2002:a17:903:ca:b0:196:4e75:c933 with SMTP id
 x10-20020a17090300ca00b001964e75c933mr4284197plc.13.1675313573014; 
 Wed, 01 Feb 2023 20:52:53 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:52 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 08/10] hw/riscv/Kconfig: virt: Enable ACPI config options
Date: Thu,  2 Feb 2023 10:22:21 +0530
Message-Id: <20230202045223.2594627-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Feb 2023 04:52:57 -0000

Enable ACPI related config options to build ACPI subsystem
for virt machine.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 4550b3b938..92b1a9eb64 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -44,6 +44,9 @@ config RISCV_VIRT
     select VIRTIO_MMIO
     select FW_CFG_DMA
     select PLATFORM_BUS
+    select ACPI
+    select ACPI_HW_REDUCED
+    select ACPI_PCI
 
 config SHAKTI_C
     bool
-- 
2.38.0


