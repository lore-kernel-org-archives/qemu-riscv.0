Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa1G-0006uB-Ac
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa19-0006YK-Og
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:20 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa18-0005U3-8x
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:19 -0500
Received: by mail-pl1-x632.google.com with SMTP id be8so13701000plb.7
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGmMRSpWYKk+0FgEIzjc2vNeSjRQeNBhuoCePce7D9U=;
 b=NfEuSaOBRNvI+pFdEP6tJRyPCwkboPixT9HOGFVCiQnhI+mLDoIXQJ0KDRXeeq9QbM
 QqjwHY8hdfDiqRO98fufqeV7WnW0vX6hcYbCVBniKnsGlQ9MupD/SvlcEyUM1EQF1vAL
 EBQRh+TkD6V2aHsxtQBWKGvtnxX3BpNGRljYH0vSiSSZEOwNQElYmiJ3a7XoC06jqxQk
 GRMMngt7MKWmmCnmUA/0u2KxoJCwOz0b+KOHTF8N0pNH2EAsl2MvbRA3ecYkKftTXmw9
 mL2iBMSnNHZD/JPLKsztUrwZ7RciHmOIl98InIGMNhgoCeCLW9+dPZS/+pyL4JkPpQsJ
 UYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGmMRSpWYKk+0FgEIzjc2vNeSjRQeNBhuoCePce7D9U=;
 b=vgvdU5/jpWZg8u5d0/iJVZZ7KuiDcrpGqYE4vkhcV7y6K2Z/gU/tLPbSN3zbIFe/tG
 6uZ2F1lPK1NfjvTJsKP7PcbWLAM3tjWV4lrX0cbz9I/Ann9uEAkZHN928uu8UxiuuhnR
 TnVKryUXvbLfrISHBRsXxTlgMYp5gRPSgSKz8TdBZAK1n51ltDBvrES/KOiDG08BV4C6
 nAPjJJI2YgTX8pUAcxAlIZQj2c4wtHW7Tfy2AnzfZXSNLpcOcc4AkEKaHOXxqgaXpkUy
 Vtt9GmmJYEjlsgAcLBLcPCb6p/eUvITlo6d7GeCd+tR94yRVsH7rmNLSQmYcKTH69oZT
 QUDQ==
X-Gm-Message-State: AO0yUKXeTGPAuxhkoeFbihmFMPykNKnXdUNvDaUvfuBj/QsdgovHS/OR
 c6Ekq1ZqZrnD+RbbKdLjjZ4MLw==
X-Google-Smtp-Source: AK7set/ief8OMQtIH8lSuS7i2PN/jG71h15gobFZJYOWsMfeKG4R6ZEOXvHxoeLE0qrR7F2G7dRJCg==
X-Received: by 2002:a05:6a20:158f:b0:be:9fff:48d8 with SMTP id
 h15-20020a056a20158f00b000be9fff48d8mr28502482pzj.49.1676299276813; 
 Mon, 13 Feb 2023 06:41:16 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:16 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V2 10/10] MAINTAINERS: Add entry for RISC-V ACPI
Date: Mon, 13 Feb 2023 20:10:38 +0530
Message-Id: <20230213144038.2547584-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 13 Feb 2023 14:41:21 -0000

RISC-V ACPI related functionality for virt machine is added in
virt-acpi-build.c. Add the maintainer entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 847bc7f131..7fb0f1052d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1003,6 +1003,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/virt-acpi-build.c
 
+RISC-V ACPI Subsystem
+M: Sunil V L <sunilvl@ventanamicro.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: hw/riscv/virt-acpi-build.c
+
 STM32F100
 M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
-- 
2.34.1


