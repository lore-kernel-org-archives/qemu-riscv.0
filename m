Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZ2-0004Wk-H7
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZ1-0004WB-Ew
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:47 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWYz-00080e-Mk
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:47 -0500
Received: by mail-oi1-x236.google.com with SMTP id u204so14347186oib.7
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TltEne7D2rlHYQ4qmOkTMVGQSBDDcuOR9RZXwJKC4lU=;
 b=bktHiD++oepzisVEZBF71jic+K+0UyPpJAPuCN5uG2B6CX0w6O8zLtcvv1czeQ/XVa
 iXp0JxBN5lIw0aUUoZj7U1QkrmiZJH71NePngy2oIwYzeKHClOeEkWeCdNbqCZYvq+Na
 5fH4O97277R7ZpT2qQjw2KhUanPMA7z2LMeu8n1NZFRSbi7bleKL5MP/mrqWe7vmt9QL
 Ov91Pz7BqDvTrzOWpV9e2j2/zUmUh13k0zq2LdSjpMjR/ILPUe+7OcMw6v30iYUAxXV9
 UVNjp+GHp6gqcMebAa7QGiNkU8JHeASh3sTbf2qDo+DPjdVt6ChPffleKRJJpXdtdRqo
 BG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TltEne7D2rlHYQ4qmOkTMVGQSBDDcuOR9RZXwJKC4lU=;
 b=WspJLzXHqMWMTR+Qb63wzTrJvwFfVc7Lu0MBVSzJaFkG46GIDuVgTD6jzdtRXnK+TH
 QGYSq10FtoBlkWsuqC2gAA46UQFydCBIcNVq31daenRbnh3HeRh/mo3iE0HYcNGXEPpm
 WVmWStwHjnl9/khXtMaM+6UHx2ueRLgPXfXin5J2xXVg+snxjNRLZkK+dsGp25YOsH2F
 W3U7d7rFCS17gOjWJVuEfXvyMbk30XCRuGDsWOYAsBvgUPh+LweQ2xXFu68ll8Zd9g52
 bkcsjiqu8AGrdEaRVoUx2B0uJosR3cH3VStmhrGR9Zt+oaicEffRwS2GWOgDr81OGEOF
 qD5A==
X-Gm-Message-State: AFqh2krhccg3Ao3OWHC15BKziKsuEqtKdS3R61ssrWTtl3JoLknVrtbx
 q+ZAyEh0dmTrVsM1ustLJV2w3g==
X-Google-Smtp-Source: AMrXdXtLOpdf4nDy9n9s0qc9mhSM98VbhDT8UV4iO254qOXT2o9ZuxUDN9p5MzSwrSfgoGJcsUqRmw==
X-Received: by 2002:a05:6808:178e:b0:35e:cc17:37c5 with SMTP id
 bg14-20020a056808178e00b0035ecc1737c5mr16686791oib.9.1672234424347; 
 Wed, 28 Dec 2022 05:33:44 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:33:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 00/10] irscv: OpenSBI boot test and cleanups
Date: Wed, 28 Dec 2022 10:33:26 -0300
Message-Id: <20221228133336.197467-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 13:33:47 -0000

Hi,

This new version is still rebased on top of [1]:

"[PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity"

from Bin Meng. All the changes made were proposed by Phil in
the v2 review.


* Patches without reviews: 1, 9

Changes from v2:
- patch 1:
  - reduced code repetition with a boot_opensbi() helper
  - renamed 'opensbi' to 'OpenSBI' in the file header
- patch 9:
  - renamed riscv_load_kernel() to riscv_load_kernel_and_initrd()
v2 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04466.html

Changes from v1:
- patches were rebased with [1]
- patches 13-15: removed
  * will be re-sent in a follow-up series
- patches 4-5: removed since they're picked by Bin in [1]
- patch 1:
  - added a 'skip' riscv32 spike test
v1 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg03860.html


Based-on: <20221227064812.1903326-1-bmeng@tinylab.org>

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>

[1] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159

Daniel Henrique Barboza (10):
  tests/avocado: add RISC-V opensbi boot test
  hw/riscv/spike: use 'fdt' from MachineState
  hw/riscv/sifive_u: use 'fdt' from MachineState
  hw/riscv/spike.c: load initrd right after riscv_load_kernel()
  hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
  hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
  hw/riscv/boot.c: use MachineState in riscv_load_initrd()
  hw/riscv/boot.c: use MachineState in riscv_load_kernel()
  hw/riscv/boot.c: introduce riscv_load_kernel_and_initrd()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c                | 88 +++++++++++++++++++++-------------
 hw/riscv/microchip_pfsoc.c     | 20 +-------
 hw/riscv/opentitan.c           |  3 +-
 hw/riscv/sifive_e.c            |  4 +-
 hw/riscv/sifive_u.c            | 32 +++----------
 hw/riscv/spike.c               | 38 ++++-----------
 hw/riscv/virt.c                | 21 +-------
 include/hw/riscv/boot.h        |  8 ++--
 include/hw/riscv/sifive_u.h    |  3 --
 include/hw/riscv/spike.h       |  2 -
 tests/avocado/riscv_opensbi.py | 65 +++++++++++++++++++++++++
 11 files changed, 147 insertions(+), 137 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

-- 
2.38.1


