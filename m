Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2vZv-00052l-64
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 07:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZt-00051i-9Q; Fri, 22 Jan 2021 07:30:13 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:32817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZr-0003T0-No; Fri, 22 Jan 2021 07:30:13 -0500
Received: by mail-pf1-x433.google.com with SMTP id o20so3604729pfu.0;
 Fri, 22 Jan 2021 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnFyFLY93v03dxNQNml/TQABvBylW/eFs3rss7umCZk=;
 b=fsYzY97R6moUWz+qws+HFyFWQp8RWxHct2fpqcME80qJCL7BxhcQcWVOeNx0XaIXll
 B20kqMN6ONl5IJAVawWUTDW2zI//yNWVpGOrJGYLS59EBwBvaOxBQUHVoLXIewwHu+kO
 wrMC4Abso5nsoL8dmGrKLnTazCNgTw2vToVTzxLSJmGIWtXnd/MyrlEXMTVks0+ZEYdp
 k/0vQJuJeAEPflNYjLxMwl5Z98DQQxTHVnrhPdAj8ifBVqZvaZXaI/CY0Lh83uSRG0uc
 QBYby+q2iobhtMzJr503VRHrPgVGM3uophe/bSx3mGZJSE3jlLUwr4WjnaflQtnnprUW
 Lqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnFyFLY93v03dxNQNml/TQABvBylW/eFs3rss7umCZk=;
 b=aUGpf57D0eOTUMR/Q0Pst2pS1gMkvVwl71LujOWi5FVWREYSMfbjZfrJO/PtMRhxAy
 4sgM8JWxTM9p/A+1Pb1thxHGFvkFlhyNYlK3XwPw4JYmnEifoJJPgds+OKB/HTDZ+q6o
 dpIxPif14HU6llhn0Z0ShtAEsQ+XHurN/84saYU6uU0rNq8brCb/oZo0M77iZz5ZAvKb
 HrYgygsXlONXhZkM+9ytGVDLcn3IIQgN8bDkDk3rzVTWN6Vckq7x1DAWAtlWjkWw7aQO
 BHxhQ3ZMeoe4LswCoieG9E0WAHVCVqx7Tajd3leac27geYh6dkYAtsB8E8AjEKi6iHnc
 +wbw==
X-Gm-Message-State: AOAM532779QGd1zuyvE6u0FI4MZiPD5qwj2ZQ/pkyA5O5gEbv3WSS2Us
 2nko/hhIMJ2YFFMQo2pFPUc=
X-Google-Smtp-Source: ABdhPJy5wJau1qoZ5pBWfFlPjBzeMeWeCwoDmdbGzCAS1HBN5SqIBl8bPbjFCbTDJnL5jC/YlB8Cew==
X-Received: by 2002:a63:4084:: with SMTP id n126mr4490312pga.80.1611318609776; 
 Fri, 22 Jan 2021 04:30:09 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 6sm7894996pfd.212.2021.01.22.04.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:30:09 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 0/4] hw/riscv: Clean-ups and map high mmio for PCIe of 'virt'
 machine
Date: Fri, 22 Jan 2021 20:29:54 +0800
Message-Id: <20210122122958.12311-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Fri, 22 Jan 2021 12:30:13 -0000

From: Bin Meng <bin.meng@windriver.com>

This series does the following clean-ups:
- Drop 'struct MemmapEntry'
- virt: Drop the 'link_up' parameter of gpex_pcie_init()

It also adds the following small enhancement to 'virt' machine:
- Limit RAM size in a 32-bit system
- Map high mmio for PCIe


Bin Meng (4):
  hw/riscv: Drop 'struct MemmapEntry'
  hw/riscv: virt: Drop the 'link_up' parameter of gpex_pcie_init()
  hw/riscv: virt: Limit RAM size in a 32-bit system
  hw/riscv: virt: Map high mmio for PCIe

 hw/riscv/microchip_pfsoc.c |  9 ++---
 hw/riscv/opentitan.c       |  9 ++---
 hw/riscv/sifive_e.c        |  9 ++---
 hw/riscv/sifive_u.c        | 11 +++---
 hw/riscv/spike.c           |  9 ++---
 hw/riscv/virt.c            | 72 ++++++++++++++++++++++++++++++--------
 6 files changed, 73 insertions(+), 46 deletions(-)

-- 
2.25.1


