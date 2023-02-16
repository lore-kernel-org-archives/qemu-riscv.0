Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pShKY-0004rX-Hv
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKX-0004r2-D5
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:57 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKV-0000Z9-TD
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:57 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 kk7-20020a17090b4a0700b00234463de251so6401270pjb.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgHDmQnuC0ohesXkjuU3Tp9ntNJhpkJz30khys/nojg=;
 b=VJsLW2K0s1uCs4tf0n5PwtFqkR22pPFgHQGBzuSTDuLWZnKoQiiFSXDZ528K4U2YpV
 hBRilNWK5uBWpR361fx7wPA2XFeVreIWZFQyGDyX5pDYDWVQEq2n7A1thnBD0b9IrCt2
 cfZG0puE9cGr6iw2OtA9FpUbbs7lYg8eybPwOO1DpKbsVtbTDKgQfD1I8xL+BT6Y1glC
 ODdMkB7gVI3DtU7PUxS79ku2e5yeCFlGpMhvl5EL3fjnJ3NnsI3BmzMcCWEA2Mx/EzY5
 L6HkLK4NZlYCpMmAuo5+B+nCDRrRttIR5EZM2ygxlErXigV6dp3EmW1lkZt/z4HEBSQo
 BOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgHDmQnuC0ohesXkjuU3Tp9ntNJhpkJz30khys/nojg=;
 b=2gbTPv5zDU4cT8c8jeuaTzhHQovG5vMPa+QGWMusaAk9tCnZ4OuQyP55fNtYZuu8Rj
 94rz8enpu6FV7xzKtFdzEBRnbQm1SJ57b+d50IhBb1LuEImohCMbNhwYLHYvLZWaISVU
 Mm+sxlkGqkX9zYL9nSzadHXquL1BfrqtBrQYTfnDSxnZgNS/O/7evXoFVcQardeMf0jx
 NYJaav+4JElPtYr+wqJHNOp54uP4tqeD6aqGLjiGV1n2PWBV5zyMoSwBG5IV1LRMbDvc
 Inm6H/NJj35qFVOf3xFwMvY/4XbXSpD3e87WFW6vnH9vuTDh5X2uzuNDIO9dhhmldYUZ
 2Dnw==
X-Gm-Message-State: AO0yUKVqdVjC8FPdEGjv2yXnmYa1THOGEPpTd6KP8e0XB3Mg/XDOiPxI
 sg2bavu2nsp+bxyGfcJs3JTs3g==
X-Google-Smtp-Source: AK7set970iXiDj1evP26y3ZjYa+Hu5glvhDHJzjzER7v8v13iYISQqyidQdlmtdVBJENN0rLZeH+nQ==
X-Received: by 2002:a17:90b:4a11:b0:230:f7c1:10c1 with SMTP id
 kk17-20020a17090b4a1100b00230f7c110c1mr7257307pjb.41.1676565714779; 
 Thu, 16 Feb 2023 08:41:54 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:54 -0800 (PST)
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
Subject: [PATCH V3 7/8] hw/riscv/virt.c: Initialize the ACPI tables
Date: Thu, 16 Feb 2023 22:11:24 +0530
Message-Id: <20230216164125.1945633-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 16:41:57 -0000

Initialize the ACPI tables if the acpi option is not
disabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 9b85d5b747..8329c477a7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1316,6 +1316,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
     if (kvm_enabled()) {
         riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
     }
+
+    if (virt_is_acpi_enabled(s)) {
+        virt_acpi_setup(s);
+    }
 }
 
 static void virt_machine_init(MachineState *machine)
-- 
2.34.1


