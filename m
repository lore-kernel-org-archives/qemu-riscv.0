Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4F3C3ABA5
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 12:59:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9kXX-0002OM-14; Tue, 29 Apr 2025 08:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9kXV-0002O0-Rp
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:58:21 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9kXT-00007B-I7
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:58:21 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-736dd9c4b40so6104810b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745931497; x=1746536297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t/LgXOBw1zWEbDJGFqPRnwnOmBB92EJ5Bio9Q1mrJO4=;
 b=Rn6mQSZF97SUU9xS/skHJMYl1X9uGxUwJMpDUChwd+/Xynks6JhE9K0Ufb9VYNHJfx
 xv0j+sAGrC+dF/ellwFMOJkO1Lb/sPBIhmh1CcVpNlvB0ZYbpg59cvvJHiED/wFI660r
 31RU56qN5qYvy0NyqXrSLhGLJgQafCn0OmiSNjXE9SriwttZDRAhKT1TjaesOmaQ6rXS
 /1B8Diwr3KmSs8mx/nPPLPu2YQTs5IN/WRY++pP/lb7RM84MvJWj/2+4MlEuPst6h5TD
 1hYfiHXTF7JgCIV0nU9A6s2Vvn2GjfyCZYTFeBOkTMTn4aT5HlzrYzzLAYaQMjloHATr
 lHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745931497; x=1746536297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t/LgXOBw1zWEbDJGFqPRnwnOmBB92EJ5Bio9Q1mrJO4=;
 b=E9cgJDxQ8KY68lcKDbTtbpQsoZE+a5FFesfljjlqACiz4XP1LT05ca7u4N4GPIEck9
 n0jYdg5aPU35Zdyxtw+KJvghJVgDR3Puoa8IF8V3wUE3xHW5wOeVFjmfgk/K6fsAoEL/
 hyPrC4c0BvzNbWzSLtQeHcxwIhsJSugkrzirATPG6VTijtZiSWx/A+qQOIJWje2q4Xzo
 VsK8eZU7sL8d0sIa0K1jp2VETu6rjOQgWq99ysqr7PShipgRT1ydTUDjgBI4tYrR9OYN
 pHXT96XrektnrRmtBQvNDoV3R7qrSINwc5w9Ee4iFFxhUQO8Q8Ntc9yPzkyEGD8x98kT
 MQrQ==
X-Gm-Message-State: AOJu0YxJwS1oa2zlV4Cl+garcoNUBxDc0vaD7ysno8SI94loBcB2Cuil
 CJQyGU8uq/TkZ9KUY93MIoY0/Bz15xI63qDBMUnOumMhWDUcxH+Sz+nCTHjRwDQ=
X-Gm-Gg: ASbGncsK21UkPT98Yy21SGAMcQWFDT6Rm3wyA3uoL6FH5qnGvjilS5L66A/McF72cFa
 ly6WSMxz1KJPITggNeUgNVPZoyxHdtc0POuJ1+hRlCd9228hqx/za+FJ63cTz7grgRvsFcilnST
 bjsxjXYFaaqJBdidHVA7jo1a1kxmA8yTfpDetDcjnP9UbJ+RmG1W4I0iXUIsufkuB+ON6TIIpGU
 g1S4fOSOdp8hapso4ClkP12XKKR92NPdQ3VofgF9f7A5NKVyj6irame1sVlZq6aA3jJ2YH0Ig4d
 x9CGBWmNzqCRg872Fctx7mkUP/L057l9pXHKU+oqFu0qsOznlN/+cw==
X-Google-Smtp-Source: AGHT+IEwDV8TR2cvLzdRg8XSqtpFdbZUd44ioSrA0+KauRelfXFqZxX/CNe/bLsCcRSyYEBucvjKZQ==
X-Received: by 2002:a05:6a21:3183:b0:1f3:323e:3743 with SMTP id
 adf61e73a8af0-20950247304mr4128958637.12.1745931497560; 
 Tue, 29 Apr 2025 05:58:17 -0700 (PDT)
Received: from grind.. ([152.234.125.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f7fb7e54sm8889440a12.30.2025.04.29.05.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:58:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, joel@jms.id.au,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/9] hw/riscv/virt.c: memmap usage cleanup 
Date: Tue, 29 Apr 2025 09:58:02 -0300
Message-ID: <20250429125811.224803-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

In this new version a small change was made in patch 9 after
discussions with Joel during v1 [1]. The idea is that we want to be
consistent (as close as we can) with the idea that a
memory address is a hwaddr type.

This new version does not conflict with "hw/riscv/virt: device tree reg
cleanups" from Joel [2].

No other changes made. Patches based on alistair/riscv-to-apply.next.

Changes from v2:
- patch 9:
  - in create_fdt_socket_memory(), change 'addr' to hwaddr and use the
    HWADDR_PRIx fmt type
- v1 link: https://lore.kernel.org/qemu-riscv/20250423110630.2249904-1-dbarboza@ventanamicro.com/

[1] https://lore.kernel.org/qemu-riscv/d404d535-fc04-43ac-a7a7-2f216cad993c@ventanamicro.com/
[2] https://lore.kernel.org/qemu-riscv/20250429061223.1457166-1-joel@jms.id.au/

Daniel Henrique Barboza (9):
  hw/riscv/virt.c: enforce s->memmap use in machine_init()
  hw/riscv/virt.c: remove trivial virt_memmap references
  hw/riscv/virt.c: use s->memmap in virt_machine_done()
  hw/riscv/virt.c: add 'base' arg in create_fw_cfg()
  hw/riscv/virt.c: use s->memmap in create_fdt() path
  hw/riscv/virt.c: use s->memmap in create_fdt_sockets() path
  hw/riscv/virt.c: use s->memmap in create_fdt_virtio()
  hw/riscv/virt.c: use s->memmap in finalize_fdt() functions
  hw/riscv/virt.c: remove 'long' casts in fmt strings

 hw/riscv/virt.c | 272 +++++++++++++++++++++++++-----------------------
 1 file changed, 140 insertions(+), 132 deletions(-)

-- 
2.49.0


