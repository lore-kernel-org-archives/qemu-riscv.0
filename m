Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIcb0-0006Fj-If
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 16:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcay-0006FS-ED
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 16:37:17 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcaw-0001no-08
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 16:37:16 -0500
Received: by mail-oi1-x244.google.com with SMTP id s66so2838842oib.7
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 13:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRotMhtHnKBAO6t2X2uPrp0RVjEDypTQfmHvure0DIU=;
 b=diJp3OKys+kObtFlzg5ZLmw3ZRlmCctSjDOrNUW1RhrxpC6F2RvsvH1jUeJF1zByTz
 84OUkgRPX1x1AYsPFQFjpxPRZLu+OnB9VLoGfRLT6Hj/H/D3A8EVva1DLnx7OJkl56h3
 8sXOXG0zMb2Qhq7hdsxMAy8BwHZxOmxAa+YFRX5YM18Dysjxw0BuBgHfdcYmq8Sd3YnV
 ElVZp2Brkz4gzvCXsNLueV8k27S6CyXE+3IrEVYuzOhGOvAbHPKTDYWekEYKmH8o7eJZ
 vywilixfQ2zC9K7LWADQFmeio/ZhQcPacOUmv2+j7KFBLwA80EUCMMGATFf/EyEjtyoP
 ulmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRotMhtHnKBAO6t2X2uPrp0RVjEDypTQfmHvure0DIU=;
 b=FeHdv8+9oV5D+yVxAo6ZQz0uPnAd/Qn/3HJO/VJ/zMyFBGt5xz0nyseNt+noh8ZVL9
 SOj82AfN5P00701pSt2rJSRbIvlzZ8Pr6bKbAyqKTlbQMzF/n248MPFv2y0MeMGDj593
 IRXu5Xu6FRvad84sPoMvbH/I6vZr2Y+tP89DVnxPkvGMFsf4zj4GTpPDMuRALfrC99/d
 iPpfarugDDw6RyFsUSKt/PXFnkLli6J2e0LuQsDweiA1GcfNQOw4o1Q8JnAfHjlexDCC
 RRHbimRzNNa1EdnD8bz0ugg8EqwTdgopjIi3T2rjW9N9a26HzYHCXQ1QOtbKUDRrkmIx
 /FJw==
X-Gm-Message-State: AFqh2kq482YrSuGFOxHtpduF/lAHL7o81KBrLUEcN8tJV9mxWtdAD6RN
 wTa334jLOKyI3/DDxTigoWoVxA==
X-Google-Smtp-Source: AMrXdXuUTfclmD9rOdEeDXq5bSZr5NmmZjRG+7Ov4whzmRHGegiuwipzgbAA0Pn6bEccmRV3QO/ulA==
X-Received: by 2002:aca:5bc1:0:b0:367:18a6:eb26 with SMTP id
 p184-20020aca5bc1000000b0036718a6eb26mr4894316oib.42.1674164232001; 
 Thu, 19 Jan 2023 13:37:12 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 c132-20020aca358a000000b003646062e83bsm13664472oia.29.2023.01.19.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 13:37:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 0/3] hw/riscv: clear kernel_entry high bits with 32bit CPUs
Date: Thu, 19 Jan 2023 18:37:04 -0300
Message-Id: <20230119213707.651533-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 21:37:17 -0000

Hi,

In this version I changed the patch order to avoid having a patch that
would trigger the 32 bit regression Alistair observed. Patch 3 is now
the first patch.

I've also addressed the comments from Bin and Phil.

Patches based on riscv-to-apply.next.

Changes from v8:
- patch 1 (former 3):
  - comment changes
  - now open code '32' instead of using a macro
- v8 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg03254.html

Daniel Henrique Barboza (3):
  hw/riscv: clear kernel_entry higher bits from load_elf_ram_sym()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 96 ++++++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  4 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 12 +----
 hw/riscv/spike.c           | 14 ++----
 hw/riscv/virt.c            | 12 +----
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 82 insertions(+), 75 deletions(-)

-- 
2.39.0


