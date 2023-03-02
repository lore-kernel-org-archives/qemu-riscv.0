Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezh-0004BI-Nr
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezg-00046N-1D
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:56 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXeze-0006FJ-0B
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:55 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z2so16831429plf.12
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgHDmQnuC0ohesXkjuU3Tp9ntNJhpkJz30khys/nojg=;
 b=POf5lDVWrgDnI00pdsHqfak12z61bs7Ck44vaFKPRp+rjsmILnioOu8L+Sf42VDfMc
 CEURMHg4n3oVnxFAXqIrEnS7o2Kw99aDeZDNNEMg88t4SsHiK3kjxVxd+rw6y/Rs1gje
 WBFEqnzwflj8y4R/qgkv0qQRUzDR5y12KlER2ChAQyK14RVrmerJQzrFP1izglGi3Ovi
 UtcUsRCcEaYsAymeW/jewfdK2zpaHz1aCeH31E37NySbbB1vzdSFwnpCdnZ3BJKUkBqR
 VGDkK0U17W6DwK+PmKB+niCdJ8qB+uYzOoDvFv+pSpqaNGRdnkSRt+xN+UsInbxUKHBM
 kJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgHDmQnuC0ohesXkjuU3Tp9ntNJhpkJz30khys/nojg=;
 b=FptjtnBDbv//OGcfaA9BaQrnpC98l1mifgQ8ehs9JmJUb61YLQIdBLjazxnT+Xo/fx
 f0iBSKe7nHZZgKKdUxzUjgci/I6/Q563+WSqfGatPHaVJpeu3GMTLH7G9/GRQuRqxd1W
 2za5hH5c2QISIctZwISd9b3/rer7YLHZUnUL8wJeDWIRPrRylJ5LuHzfzqRbq7m5WsGE
 pnXvmFG3ax9OCYlPdZcN+5EvZO6Cp1qTBQoRoYa1DLB/T6QthrxhRj/lvzaZ5LWTB4XE
 tBjcDmETYdGJJc6XY0lFZcQTRZxlgM0NQjlFOC+0un8LY+vCjXEXEs8b2XtaIP4AGe0l
 gkVQ==
X-Gm-Message-State: AO0yUKU1ixvCGfg2jxpgAo/t8Xd1a78WsjwICzAczPOfTjKRv0I4u8U1
 NSUPTBd3bA0qzV67Tl2PWaq47qoI9tRNW14O
X-Google-Smtp-Source: AK7set8B92TYWEnMi5z//wnelwPvN5S0mRhyfpmmCKqwTLYj4mIZM+oE3jFBMmZQy5wqj9I2AmPJtg==
X-Received: by 2002:a17:903:40c6:b0:19c:d6d0:7887 with SMTP id
 t6-20020a17090340c600b0019cd6d07887mr8106425pld.30.1677748372374; 
 Thu, 02 Mar 2023 01:12:52 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:52 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V5 7/8] hw/riscv/virt.c: Initialize the ACPI tables
Date: Thu,  2 Mar 2023 14:42:11 +0530
Message-Id: <20230302091212.999767-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 09:12:56 -0000

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


