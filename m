Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa1B-0006cY-7G
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa13-0006PK-4z
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:13 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa11-0005VB-GN
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:12 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso7199153pjr.4
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BupoAsKzkCuUQGMRjABpAZtafv55Wlzos5b537icK1M=;
 b=X6fJqO52WK5G21xPZlaYlw76kce6n/qWl1RmSXWhddsrWkOyc1zVXl70Pn+N5PFD4m
 nrCdsYsrPfcMAayCDs8AM4mCTgtLuahTQt23wGABXDF7gCXHUhs0GdDVUfxlVqmK+86f
 5pEt3FoyA1bNX+HqqH8WBsCwZtmGGSl/mox+oNJtAiTYUPyOZ2hs1hJ+g2bgYKu2N7Yf
 qyQOc1+CeVc/Bb+FgvUWMYhcxYKNjwNX3vHC3Mj5oNBSXVbHogX6C1eln4v+Z9xyy8Rf
 pqhciKWJzJazrS0zfTw7VGE04KC7Pe0QdfVbaYjLesgTUh4XfNelon4tCmjPRx1oULdy
 dkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BupoAsKzkCuUQGMRjABpAZtafv55Wlzos5b537icK1M=;
 b=Vr0KvC+DtX2YKKuAka3ZG5W2cky66RZTNJNWAp4brPW0uynMEsJWtrRT9EP2iLLY7/
 3aKhrVexKUKc4MoA1Jft6/EITZqMRVY9PJ7GfW+hFLDYP1d+rj3eAPIWe0TE5jtp5PbD
 cy/zQeHeBkd3GUXu15LFqGTusqcNya1S2Nwph2NQJrm6SJXyHJOWeIZYN8PgBuiXHzgO
 1k5lu6TNrmVuK9aMBdjQSCvznS/FS1mwXv+lZwRMH97XZ+888n6pRZ7gr2yWhF0rDwL+
 K8PMnsUdqP4Q5iLRfNAL8EBWcQdzFcA562UY+OVKsbxtE4Pdo6qA3hyM03+uJBH/lJcB
 zVwg==
X-Gm-Message-State: AO0yUKXChwyN5k0Cvi9jaNd2W56dUd+N2AnVSaAU06TV/lXlQixTTSJq
 Dx+2JV98Vpvr5M4W4M8CCuCmsQ==
X-Google-Smtp-Source: AK7set8Zn0RuIZXDYANn9ehg4ks0QxiuDA+hYshyO6duuJfCYDODEZco22k3TmXvqOU9qi2yTLrFNg==
X-Received: by 2002:a05:6a20:3d8b:b0:bc:ce49:798d with SMTP id
 s11-20020a056a203d8b00b000bcce49798dmr32659043pzi.41.1676299270293; 
 Mon, 13 Feb 2023 06:41:10 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:10 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 08/10] hw/riscv/Kconfig: virt: Enable ACPI config option
Date: Mon, 13 Feb 2023 20:10:36 +0530
Message-Id: <20230213144038.2547584-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:41:13 -0000

Enable ACPI related config option to build ACPI subsystem
for virt machine.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 4550b3b938..6528ebfa3a 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV_VIRT
     select VIRTIO_MMIO
     select FW_CFG_DMA
     select PLATFORM_BUS
+    select ACPI
 
 config SHAKTI_C
     bool
-- 
2.34.1


