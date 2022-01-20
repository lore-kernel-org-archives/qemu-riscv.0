Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAW4I-00054M-Ug
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 06:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nAW4A-00050o-Lt
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 06:57:22 -0500
Received: from [2607:f8b0:4864:20::62b] (port=35334
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nAW48-0002jl-7o
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 06:57:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h13so4466289plf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 03:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SeYw/zdn0VDmDCtTgfePm62N3jA7S5AzMCpF+RcwUTI=;
 b=Wodo8PXqym+6xEsyBMDFaXwEWQyy94s9Htw3M/cFK1r5XO3ly+0ppGY/onfJ2TJYY5
 2vOmPWHOeInEz+jN5PSLQOWE237arnWmTIUPPb+dhHhWMJ4+QzNm0ocmAG8UzAibMDfc
 pYxlSyB7iX7KoaevtxrTXvKzwt4ylXPUR1/cns+XbabLeegVEj1cBSceXAq3iMZ+e+oY
 /urgHYXx6WhKTY8+6oPx/E8H92ekjazqYxaAtlfHYyHF+yjRDu20ZU60TPqomQA4Z+VV
 ifZQ6W6FDUQ2fXfqC5SHKWLn4XUWDI74/5P61saQ+r57q/3X7PykboLUtnX9OSKJhC9f
 mu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SeYw/zdn0VDmDCtTgfePm62N3jA7S5AzMCpF+RcwUTI=;
 b=5MqyfNzxVBPytqjHCZRvcXp3FgKT5xcDFzJXwtBDHG2j0T8XbGBTgRilGrKaB/sFdj
 RLsNh/hMVRud9Asm3bCYE8moOxcGYX5jMJESEABT6j4WmFG+ZCEWk3xLHJmq/3iPrCbw
 wnySUdRRCQ6S2+gW6u1gFh0YxtV4x3WcPv5OuNl69bYddtnBmDOJFMSNJNJ2zO87oq7I
 ZG5xNIPIktuarw9iav1TBFecm0giZO2/xauC9FRehsWNivURQSCmCjWXAarcQRg5uVK7
 kBqYTBNW97t8hquMNcG6+QWhx86FbPMJsSMnUSgHPCzOIUlyioLlYWPRc85UDRUnoe6G
 fx6A==
X-Gm-Message-State: AOAM531T8jr8qri2UKwVrPh90SYljVsB9WHkUZGIeNqbhmcgkMPiSzIV
 oPhBPeSIPNxc0oGP8t/zxeGEFA==
X-Google-Smtp-Source: ABdhPJwgPHv3sEZe8zamQ385pvMU+61+Ag3dQQnOYnM2UCQD+E/Y1ygE8f/S6BEVW4afpoutSSwkuw==
X-Received: by 2002:a17:90b:f97:: with SMTP id
 ft23mr10427938pjb.6.1642679839058; 
 Thu, 20 Jan 2022 03:57:19 -0800 (PST)
Received: from localhost.localdomain ([122.179.80.139])
 by smtp.gmail.com with ESMTPSA id c2sm3465694pfv.68.2022.01.20.03.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:57:18 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/3] hw/riscv: Remove macros for ELF BIOS image names
Date: Thu, 20 Jan 2022 17:26:55 +0530
Message-Id: <20220120115656.31686-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120115656.31686-1-apatel@ventanamicro.com>
References: <20220120115656.31686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 11:57:23 -0000

Now that RISC-V Spike machine can use BIN BIOS images, we remove
the macros used for ELF BIOS image names.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/spike.c        | 4 ++--
 include/hw/riscv/boot.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 597df4c288..d059a67f9b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -260,11 +260,11 @@ static void spike_board_init(MachineState *machine)
      */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
+                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
+                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     }
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 5834c234aa..d937c5c224 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -25,9 +25,7 @@
 #include "hw/riscv/riscv_hart.h"
 
 #define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
-#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
 #define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
-#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
 
 bool riscv_is_32bit(RISCVHartArrayState *harts);
 
-- 
2.25.1


