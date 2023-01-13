Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGNh3-0001Sv-PG
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 12:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNgz-0001Qq-Sr
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:18:15 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNgx-0001JG-Nl
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:18:13 -0500
Received: by mail-ot1-x342.google.com with SMTP id
 f88-20020a9d03e1000000b00684c4041ff1so2874128otf.8
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hJBrxLI6QmmeeITsOzUvZaX/VcVW/UkeGDy9RzOvnNw=;
 b=bi+he8/9ip9JE8Do8cE3WvPHlrPyDBRdi5m51xCgYTEA+EHeKD3bmlDRQRdd7E4Clr
 OofxQVk3yqV2DjPg4BIsqBMU++23/TJNvf8usEJdHcfa/5Fw0LqasV7HIVHnS/drt8LV
 WC5gaBm3Mr0AJ6IcMaRw9cCknkSd4ol8RzsWu6RU0HalWxhbn5E20cHKjthMz96tO0fv
 oVw/XJrOF/XgPDii1E5TIiSxAKbH5/EibId8aUQBuqvvAlKsCm1X5PZo+mw0+w4SmvoS
 lieCDqQKREoaQ6BcdywyUb7o2VcZG+QnO6tEkKnS1gzuYemSrg1OZrrvXQtips9aPk+B
 tvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJBrxLI6QmmeeITsOzUvZaX/VcVW/UkeGDy9RzOvnNw=;
 b=Ilf1BTK0ygK5CS6wZUFU7q8zVbq95zdsd/g8SWH4SdBIianzV3NQQS9e27Zk3gZtEa
 HYExTNAJ3+DazAq3BgHHZsUr3qLIlkIWfeKo0cIHtJH2J+/QuCOsecGfwOOIfWqP8jIU
 RC8xKXpwwaw+Nbg2cXNbONe2vKsF7+e4gurH5BeWqymXGErXUKHVeHxy5qYFJAMFjncd
 0JvJqSWinQy5Qs6uCd5YFIfOdOe40kQk9UccAdqAkqTr4dzEmHr3bfkiFddrbO0i/DCq
 HGdT4UC+HYa2SPvPc2ECH4H1jtwOuUTTdJIfqs80Gsato8WntEPFEWRbD9KvjLK0xCnp
 yMYw==
X-Gm-Message-State: AFqh2kpWVnpF1nV8026KHFAHDcCp6MpPTcq/3E1o9ocLV5ek+flO1r4h
 XmL8XKGpFHrMLWt5hYOF4Q0x8g==
X-Google-Smtp-Source: AMrXdXtJk8eyNnj5qxKu3U5oACPJ+Vp67zXOx7zqHqf5goEV3gqJ4UBcpG+1/yVVart/iWYjfato8Q==
X-Received: by 2002:a9d:6451:0:b0:684:c8ff:8844 with SMTP id
 m17-20020a9d6451000000b00684c8ff8844mr2588992otl.12.1673630290203; 
 Fri, 13 Jan 2023 09:18:10 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 v25-20020a05683011d900b00683e4084740sm10695872otq.10.2023.01.13.09.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:18:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 0/3] hw/riscv: clear kernel_entry high bits with 32bit CPUs
Date: Fri, 13 Jan 2023 14:18:02 -0300
Message-Id: <20230113171805.470252-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x342.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 17:18:15 -0000

Hi,

In this version I followed Bin Meng's suggestion and reverted patch 1
back from what it was in the v5, acks included, and added a new patch
(3) to fix the problem detected with the Xvisor use case. I believe this
reflects that there is nothing particularly wrong with what we
did in the v5 patch and we're going an extra mile to fix what, at first
glance, is a bug somewhere else.

In patch 3 I also followed Phil's idea and used a translate_fn()
callback to do the bit clearing.


Changes from v6:
- patch 1:
  - restored to the state it was in v5, acks included
- patch 3 (new):
  - clear the higher bits from the result of load_elf_ram_sym() using a
    translate_fn() callback for 32 bit CPUs
v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02630.html

Daniel Henrique Barboza (3):
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static
  hw/riscv: clear kernel_entry higher bits in load_elf_ram_sym()

 hw/riscv/boot.c            | 111 ++++++++++++++++++++++++-------------
 hw/riscv/microchip_pfsoc.c |  12 +---
 hw/riscv/opentitan.c       |   3 +-
 hw/riscv/sifive_e.c        |   4 +-
 hw/riscv/sifive_u.c        |  12 +---
 hw/riscv/spike.c           |  13 +----
 hw/riscv/virt.c            |  12 +---
 include/hw/riscv/boot.h    |   3 +-
 8 files changed, 89 insertions(+), 81 deletions(-)

-- 
2.39.0


