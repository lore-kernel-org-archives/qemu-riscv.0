Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD7sT-00006U-1m
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 10:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sR-0008V4-8j; Fri, 19 Feb 2021 10:39:31 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sP-0008Lh-Kb; Fri, 19 Feb 2021 10:39:30 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lu16so14130531ejb.9;
 Fri, 19 Feb 2021 07:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oqvCS0GH7OR1zvxo227jB2azAu3DvssVHwHbd4r70w=;
 b=DwFaVwJEBrtL4Tkb02sIivOnGu65X2BW0MkMAsMHpRSAL3Qib6L2ZbAwYKfOu9YBJa
 u6E2Fg160BOlhy+orv5Ui9i4ElG7fBc45Ey0DVveoaZHMwYh5p911O5zdVrD4LqFxdas
 Cjj53FH4cEJV9b2laUezpQR6Ckmm5WmLlMEQO/iEIiqj8tWr8EjJjonHhvlauU8d/LFO
 XEvITfsmQ7/GRf8Kobg2gDqEKc1ol7shfqdfvt8c6zXA0PbJ+9E2bm9ptbrhEpAnd04u
 B+OYQow5YZI7iK6SQJn1d1TbKNu82E0mFyjLKAN1cPaxR+/Q2LUWA5XLrffNIMPcbERC
 YhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oqvCS0GH7OR1zvxo227jB2azAu3DvssVHwHbd4r70w=;
 b=pklD2Y+65lRDV9c3n+qu+Xry6vv9lHG7NJXexUWCmJkSqjxjPnxD8HOn1fmtsckEnE
 rzpe+45G/oa70Pf44+153cZ+TnUoa/WDk+j6T47vanRsBArXHEY9R508DtlIjP/Iry+K
 kF4tMCaONv3NBUOWL+WiInobpDLj8az/eoxKxPSl2vpd5i4Y+DZIOksd1w+HJihVkjLi
 xkNE/mfPUlj7JwAIlk7cPlW9Z1uwBWt4E7R4VRtMYJAmp9j8t+JKDN2Xuwe2ACy12Uow
 pzKvCfMwGYgGFvFou7XtWyMEHkCLQieD4xM+PZGNwegmAmqPHz+0CMNuftqtYqGnnGTg
 4OVg==
X-Gm-Message-State: AOAM530vu+BfxnmFNQLub4+zN7o1zZ85tcgLbx2EE1K2GQ5Ra0yp2H1L
 oNmqVABiETcUA8R1YcJGB0o=
X-Google-Smtp-Source: ABdhPJy8zrR3HzPEowj+dS44+Kw9nz73CzW/NFHTJVDYCpjoODJLtpzvZJHgJUhLBKvOn4FxvWajVg==
X-Received: by 2002:a17:906:2bd7:: with SMTP id
 n23mr9384752ejg.502.1613749167457; 
 Fri, 19 Feb 2021 07:39:27 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t9sm4580314ejc.51.2021.02.19.07.39.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 07:39:27 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 0/4] hw/riscv: Clean-ups and map high mmio for PCIe of
 'virt' machine
Date: Fri, 19 Feb 2021 23:39:11 +0800
Message-Id: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2021 15:39:31 -0000

From: Bin Meng <bin.meng@windriver.com>

This series does the following clean-ups:
- Drop 'struct MemmapEntry'
- virt: Drop the 'link_up' parameter of gpex_pcie_init()

It also adds the following small enhancement to 'virt' machine:
- Limit RAM size in a 32-bit system
- Map high mmio for PCIe

Changes in v2:
- Use a #if size test to only do the size limitation for the 64-bit host

Bin Meng (4):
  hw/riscv: Drop 'struct MemmapEntry'
  hw/riscv: virt: Drop the 'link_up' parameter of gpex_pcie_init()
  hw/riscv: virt: Limit RAM size in a 32-bit system
  hw/riscv: virt: Map high mmio for PCIe

 hw/riscv/microchip_pfsoc.c |  9 ++----
 hw/riscv/opentitan.c       |  9 ++----
 hw/riscv/sifive_e.c        |  9 ++----
 hw/riscv/sifive_u.c        | 11 +++-----
 hw/riscv/spike.c           |  9 ++----
 hw/riscv/virt.c            | 68 ++++++++++++++++++++++++++++++++++++----------
 6 files changed, 69 insertions(+), 46 deletions(-)

-- 
2.7.4


