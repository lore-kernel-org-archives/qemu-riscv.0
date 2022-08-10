Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqik-0005tc-2X
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqih-0005nd-J6
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqif-0007GB-SV
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q30so18701625wra.11
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=nszYKA+Wn9xuhz+k0iviOE+oX3YA6MMJGPbw9qg4mUQ=;
 b=D+bGATHkhF0dkAypX0Wg/9uVqtvaAxsfK7oJ/WhaffXKsIURPk7G5ewlN1qcL0BBo2
 1/x6nejFPw/rCqBa8wDh5LLlcakLthHfkRW4G7QlD29WM6gPFv3GORqvkBN2Do9heGur
 TKQgsrK5ZIimSUT8Uq04k3eXU+f9bzIMMSVBqVy5ncvFGArVKWH57Ds5dl8z4Mm789PP
 s/6hHPDXnJPkZpCErscRolu48YQDO42BF7aoZv3ZbW+XIcS50lQOJKgLHjy2ltYlNSOY
 PxoXeX2GglLqm3joFlCx05vDatlQ5t0OU18NleoH+o1wTOKpxdjbLGUcVL6prcdyGEys
 WP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=nszYKA+Wn9xuhz+k0iviOE+oX3YA6MMJGPbw9qg4mUQ=;
 b=XK45HbBSCFXzSGJoYWtM6jOgCPgu6d189Eg9yDEMZmwBcYmcKOp4pgV8NuqAfyD0tJ
 lT2EBxUFjobv8EL5XkkHA/V4qFDndQULFtNQGJkcnunyD5xnjtC41f2dk6l6auxsTF3H
 ClQE0TaOGmVDcQqOXrsdAWsX96aVjObYzeK2uHKS2yVDbBPbS/k89jzmATi5P/Ar4QJL
 /+6Sb6G+85ibn/1oM7ywUPPNSQf3QAHj90qGxyFVwOg5VTkUTxvyf2jJ9Th95+vslDl6
 3udmQ5y180UuQ3Nvlx6zM7allJT4sWPVY77gWT29CoAgxUHqOi7w4XhOUQ9Gy3AQfxdq
 2xeg==
X-Gm-Message-State: ACgBeo2GUVSmmzXFFTpWPqh7qxv2bSC6Od2WA0ZnhYyLomKsXypjCkwm
 e3WfaSxPbWbdp/rFNaIie+mkMw==
X-Google-Smtp-Source: AA6agR4lftJ4rR1enjLROy20IwJTTV2mtwSG+GS7NWTbpXZhAG1kqQkAn8L7RaD16xE75EHUvj0Sng==
X-Received: by 2002:a05:6000:987:b0:221:7e59:45ec with SMTP id
 by7-20020a056000098700b002217e5945ecmr13407125wrb.64.1660157175809; 
 Wed, 10 Aug 2022 11:46:15 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:15 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Wed, 10 Aug 2022 19:46:08 +0100
Message-Id: <20220810184612.157317-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 18:46:20 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

I mostly opted for what appeared to be the smallest change that would
fix the warnings, partly due to my inexperience with the QEMU codebase.
A "sister" patchset for the kernel will clear the remaining warnings.
Thanks to Rob Herring for reporting these issues [1],
Conor.

Changes since v2:
- move the syscon subnodes back to the top level instead of into the
  syscon node
Changes since v1:
- drop patch 1

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

 hw/core/sysbus-fdt.c    | 2 +-
 hw/riscv/virt.c         | 8 +++++---
 include/hw/riscv/virt.h | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


