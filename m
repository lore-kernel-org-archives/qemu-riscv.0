Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9mV1-0001Us-4j
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 06:18:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mUz-0001Tl-Vt
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 06:18:02 -0500
Received: from [2a00:1450:4864:20::336] (port=35612
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mUy-00079H-Dz
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 06:18:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso4983724wmj.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Jan 2022 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHHhRvqhMoS9M7tdur2lIhRR3Zu8vmsJW9kqVPLlT6A=;
 b=FXmUpipu/oMxuIRHq2zpxk+Qcax3C+g7b9G2hPbzwz2sxYrJc6+4/2E4PwPy5u9NYZ
 OiJHurOIL7RpT5LQTP+uY6HtjEsmrk2ZLWe3cudDcREgh6H+VxDFTtR15j0R3vhXL4UL
 afgLJgBLX1xqp1UuPM8wFsywlL0wupQjnu+NkBNHEZamRMsl/XTNZT7opLWri3Z/dBM8
 r6E8R5duj9ppvObAAfg814sbnGBZOzhCX4qhsIRktNGAeMiROcCDzzDJl4qo+1Rt6Cma
 5ZxWkhG96MohQINBcAhy5wAIukOnTbp2C1fLMGbhjZ03/8sAA1wUJ/Yyv9kS8EvSw6Qd
 LrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHHhRvqhMoS9M7tdur2lIhRR3Zu8vmsJW9kqVPLlT6A=;
 b=YVhPr2LMnF07dkrvXTRZFunBksuhGBjvmWFx8NsB9+4B9fUwu15JlK9hPnq91OPuYz
 IkwVbHBO4DXshVUxyCSpRzXGeqFhuyYwG+rW256/9Fnk2lqj7XhWx763rVUSfx0OqUwV
 nM243tUjd8ZqscCY+PiagV0NDuyLiqO/2XK6ZoxYqE8NfkXELX9uXnxwpwCQoJdCg8Lv
 RC2zrqpfYdQamI9MN30UHQ/BOk76Na6PArmoXmEm5E+nbarKI6WWcaYNFoo1c8lsLhrh
 VrojvjezJ2npsFMjPrbNb0xL0rQut8XaOLFl3hbEihYCBpPCcuTU5lCgSf6YNqWCNzqi
 BuQw==
X-Gm-Message-State: AOAM533k1Zatf4RUYJ0ypNXGtiIXDLJW0106HSHA2glMldSMpTzOj4U0
 944CXjTrBeFU9Yw51085vzqAIw==
X-Google-Smtp-Source: ABdhPJzLXgsl44NVrT1dThnyrMNF8Z7rqn6cQfuP7opVS6u1j8/vPHwUMJ85BhRJawOR25ULzfMZtQ==
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr28963105wme.89.1642504677015; 
 Tue, 18 Jan 2022 03:17:57 -0800 (PST)
Received: from localhost.localdomain ([122.167.36.211])
 by smtp.gmail.com with ESMTPSA id p4sm2156939wmq.40.2022.01.18.03.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 03:17:56 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/3] Improve RISC-V spike machine bios support
Date: Tue, 18 Jan 2022 16:47:33 +0530
Message-Id: <20220118111736.454150-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=apatel@ventanamicro.com; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 11:18:02 -0000

This series aims at improving RISC-V spike machine BIOS support by allowing
use of binary firmware as bios. Further, this also allows us to totally
remove the ELF bios images shipped with QEMU RISC-V.

These patches can also be found in riscv_spike_imp_v2 branch at:
https://github.com/avpatel/qemu.git

Changes since v1:
 - Use htif_uses_elf_symbols() in htif_mm_init() for PATCH1
 - Added PATCH2 and PATCH3 to remove ELF bios images

Anup Patel (3):
  hw/riscv: spike: Allow using binary firmware as bios
  hw/riscv: Remove macros for ELF BIOS image names
  roms/opensbi: Remove ELF images

 hw/char/riscv_htif.c                          |  33 ++++++++-----
 hw/riscv/spike.c                              |  45 +++++++++++-------
 include/hw/char/riscv_htif.h                  |   5 +-
 include/hw/riscv/boot.h                       |   2 -
 include/hw/riscv/spike.h                      |   1 +
 pc-bios/meson.build                           |   2 -
 .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 838904 -> 0 bytes
 .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 934696 -> 0 bytes
 roms/Makefile                                 |   2 -
 9 files changed, 54 insertions(+), 36 deletions(-)
 delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf

-- 
2.25.1


