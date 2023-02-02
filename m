Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNa1j-0001Yw-LA
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa1d-0001Wt-S7
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:53:17 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa1Z-0007XN-Sy
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:53:17 -0500
Received: by mail-oi1-x243.google.com with SMTP id p185so1474870oif.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JeHkLWbWJslXjM1ij2IkLLDw73ufxiwNdc+5UsgYMus=;
 b=K7Gb+b0BoOXgs7qTMtigKBkYH6SmvNnjXeScO1ykJf6pt1fQHF6HG4UMns7V6P/AFE
 GWm5+s5PLRC9+NnR+3F3WfY7SU/4o1CqXJpQ16jKoxyrZtxsezqWgSiJh8TimJhiEMIp
 rY/tW3CMcFLwGDNkJaH5c21s4+RfqUjvOoHyh0V0XZTg4ZURowWrJqx97zN8yhOZDSD9
 6mUDwk8URqjgFepbCzyRxzhvTNXqXO9VXcMpJv90zYDt9A7XddYZAXzrYAAwmjhve1pc
 hpJKGceuqeP24yh60ocxHmQ7goAJpAFDIPohMZzDNqRDXLj7dLyc01UZM284stdnL9MR
 FOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JeHkLWbWJslXjM1ij2IkLLDw73ufxiwNdc+5UsgYMus=;
 b=zOIRaxleARy4MRKp13ByNoePzQHC/a68z4upFk/GmNRKcmCNiDFV9CEM9qFnM9MDhU
 oh1DcdK6e8pSc+70MYT+4ww7Hrq+u+gagfPIgGowjJnGXZWzLIvOOtcgRGwPyFsJdS4j
 /bWS3nAcDboQZWfR4+I4mvSTluNrPLhoMT0IjfMq7kOa9PdUIIz4RnjaTQ1NZN1ZWg2k
 vClfKrDGZf9B1SF4Eh1nKBW8AvseguIBluS6y31gVFK168LvFj7qFiN9QC+8W4rQ2lAl
 kDTfJ+8J9r6bP3wwl1Yi6a/eXTmYGN072Cr+6+d98LeGFpeFG1SjznNt+2Esm4RC5mgg
 nFbw==
X-Gm-Message-State: AO0yUKUYgiZdblC5+YEdUx1fTp68doMypwY6rXXpjc/5C5UksLONBQ8g
 vqZ+mKm79qoEyEVO+yHwOfZL0g==
X-Google-Smtp-Source: AK7set/V6TRfnoJsz+LUhLz2CeTEyFDfKncYq7krh1NLfoSJE3fJdiG06jt3G6xNqhMgs3DEK4WwXQ==
X-Received: by 2002:a05:6808:1b0c:b0:363:ea5c:25b4 with SMTP id
 bx12-20020a0568081b0c00b00363ea5c25b4mr3502504oib.6.1675345985629; 
 Thu, 02 Feb 2023 05:53:05 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 45-20020a9d0330000000b00684e55f4541sm6547416otv.70.2023.02.02.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:53:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 0/3] 
Date: Thu,  2 Feb 2023 10:52:54 -0300
Message-Id: <20230202135257.1657482-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x243.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 13:53:18 -0000

Hi,

This new version removed the translate_fn() from patch 1 because it
wasn't removing the sign-extension for pentry as we thought it would.
A more detailed explanation is given in the commit msg of patch 1.

We're now retrieving the 'lowaddr' value from load_elf_ram_sym() and
using it when we're running a 32-bit CPU. This worked with 32 bit
'virt' machine booting with the -kernel option.

If this approach doesn't work for the Xvisor use case, IMO  we should
just filter kernel_load_addr bits directly as we were doing a handful of
versions ago.

Patches are based on current riscv-to-apply.next. 

Changes from v9:
- patch 1:
  - removed the translate_fn() callback
  - return 'kernel_low' when running a 32-bit CPU
- v9 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04509.html

Daniel Henrique Barboza (3):
  hw/riscv: handle 32 bit CPUs kernel_addr in riscv_load_kernel()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 96 +++++++++++++++++++++++---------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  4 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 12 +----
 hw/riscv/spike.c           | 14 ++----
 hw/riscv/virt.c            | 12 +----
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 76 insertions(+), 81 deletions(-)

-- 
2.39.1


