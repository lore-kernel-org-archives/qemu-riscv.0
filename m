Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa0j-00065z-4F
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0h-00064g-9h
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:51 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0f-0005RW-N7
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:50 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gd1so1348112pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l49v2a+f6jJfyAmwBZFZU1/DlBxv+sfOE9Smp77Jgfc=;
 b=deLR9/BMaJM4voq1pTiWmCXuScmxuZlK57fjUvvabO9kplE5l+r7hmmiYFxIrE8dFA
 e2p0EvJA1+1Y0cNq0YH9EPOwEdKKDttc5+PfJI1y3jUbkqZQSYdkqYD2yNDUM+akCa/3
 5nZQnfByYrbkmEQI/iLFMNvED61wnM4jhYVAAvB5Lxo6I7cKKuwgN2KJNrXW8XtckYc1
 6Q+fPzkYScuFUlg3BpbK4CG1VzkRwYtoX9Q6exygyhoI71pioc7P2CKco/QtjLF4lozA
 sf/Alo2M+90dFaiJKiGf9GsFxwjGdSsDEsrBg9/xRLdGvLDJxtlrZSIhkPdrWKV01fzZ
 RNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l49v2a+f6jJfyAmwBZFZU1/DlBxv+sfOE9Smp77Jgfc=;
 b=XOX6KXEVh3Qw0C/lAWAQF7Ck0IBjHbydRJaJ0aWC8t3tggH76UsZZYdKmsC3n+bsOW
 eUrHB8PDXK739asSpWkSQctR0d3UshBIpLN15xKw7SLCZuId4etiK/fxY/iw0mLB/IoB
 826wlA6oBG2h5cr3TJEr0eoA2MiJqKUV89A4GwpbLBFP7I0kHY1AwvREFmWvExFYeRnN
 fygFHt0vAUAhf0aNOGFTwNf4bAFNIBKLuMmtNp04iO32mjwVr+kEDJs5utaJZS1LVMX/
 eC29z1/Um6B4Xb/S9mffcV3jNc9OgM6IA/yWqRnedy0ImQbVpyLNI/opygOkvoxTuyJi
 hUpQ==
X-Gm-Message-State: AO0yUKUYnI8lcdb2VfeV+oqm1W5x7ffa1L9by/uUKpDdUlDjPrSlPQf7
 0PGeZlVLNNzjE2y+TyWSs4/5bA==
X-Google-Smtp-Source: AK7set8nbmRGk+3M8HTrT8fpl3qgEL4THYfYa4N6gDf4hJ5I1tTm2tSrRUoDcb62DSW6Vdb9wdYtIQ==
X-Received: by 2002:a17:90b:3b49:b0:230:f96d:4bad with SMTP id
 ot9-20020a17090b3b4900b00230f96d4badmr9026789pjb.2.1676299248497; 
 Mon, 13 Feb 2023 06:40:48 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:48 -0800 (PST)
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
Subject: [PATCH V2 01/10] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Mon, 13 Feb 2023 20:10:29 +0530
Message-Id: <20230213144038.2547584-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:40:51 -0000

ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
in the RISCVVirtState structure and initialize with default values.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..fb68cf81e9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1504,6 +1505,9 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
+    s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+
     /* create device tree */
     create_fdt(s, memmap);
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b3d26135c0..6c7885bf89 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -56,6 +56,8 @@ struct RISCVVirtState {
     bool have_aclint;
     RISCVVirtAIAType aia_type;
     int aia_guests;
+    char *oem_id;
+    char *oem_table_id;
 };
 
 enum {
-- 
2.34.1


