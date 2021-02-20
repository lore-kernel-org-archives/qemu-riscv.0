Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDTYY-0006vF-FT
	for mharc-qemu-riscv@gnu.org; Sat, 20 Feb 2021 09:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYX-0006uw-AA; Sat, 20 Feb 2021 09:48:25 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYU-0003VS-Qw; Sat, 20 Feb 2021 09:48:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id c19so5454308pjq.3;
 Sat, 20 Feb 2021 06:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6ktkXRzVhkYKPUfSXpY2YX92Wz+LwKUKzZGW6ksM74=;
 b=mb0SBiGNwHcZcE+EEF4MEMPjPt491/xygHOn54yyTkjHSTBP8fCEzrQ8F9o7se+D3h
 OgzWXej64VIgbshjgWslqojwbvmf32a+r98l3/9CF8V97qSfFxfkH9OLv5egUMXnNLTm
 5HR2hma2HadvefGJD4bAGALZZLqCeMeedEHWRik5mJNliaAgV5AUumHLZMzAi84sid8Y
 ymTjMV1DpE5tRF9L9NNZGw+yFiToi6Ya04zsR9jEjoByBDppmYevP2GOlfIh2q1Qw5i/
 5UVTbFROOVR28QtQ/lN5f+DRFwt5SbnCvxyYKiOoW/VFKda/bW7KftGc7sTEhlD1BVWV
 U7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6ktkXRzVhkYKPUfSXpY2YX92Wz+LwKUKzZGW6ksM74=;
 b=jHm4zyeY3wLu7aAJgNDHsLoAwfhVB0q/z2DjTWJJiCWfPaf+BLlivkF/5p60Ny9SYw
 hnOiMC9nsT1tcQjVZJFjGu8ekEhBbxfw41Miwqyr0lxTdtcBOeijhWxpFZZHRnaVNcl2
 1wURH9p95E5IxOUq1Be2unpbfzN15DGAWBWmfpYQEPlwq/OIKI5z5hh6tZMe/z2Cnbg9
 h7A2SFSTLEhl69eFUyjYz+C/kmWhWGeofnb4P4N7u/pKT0p7YLYBfMsVEJ5s2+NkDU7s
 C1Ca7/0gmVMMUq+JLEFb9QyBDbTW1d6eMYq0JTnyNdpv+fV4B/3JhMs4ppFOZsZGDuM/
 LKpA==
X-Gm-Message-State: AOAM533huJTa9U0ASwCGAc2YI7BhaqWCrfT3LbPUc0iOGqh03+qQwUP4
 Xhi24HOzxSwNxsJG1BGu43c=
X-Google-Smtp-Source: ABdhPJwhJvb9M8t0pRae9AW35D+QHJAvkTvQ8cnkBsY4+jotUs+vDai6iOG4wG14gSClNqgq2gu/ww==
X-Received: by 2002:a17:902:e750:b029:e3:a720:f4c with SMTP id
 p16-20020a170902e750b02900e3a7200f4cmr6870404plf.31.1613832497614; 
 Sat, 20 Feb 2021 06:48:17 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d16sm3100480pgb.12.2021.02.20.06.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:48:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 0/4] hw/riscv: Clean-ups and map high mmio for PCIe of
 'virt' machine
Date: Sat, 20 Feb 2021 22:48:03 +0800
Message-Id: <20210220144807.819-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Sat, 20 Feb 2021 14:48:25 -0000

From: Bin Meng <bin.meng@windriver.com>

This series does the following clean-ups:
- Drop 'struct MemmapEntry'
- virt: Drop the 'link_up' parameter of gpex_pcie_init()

It also adds the following small enhancement to 'virt' machine:
- Limit RAM size in a 32-bit system
- Map high mmio for PCIe

Changes in v3:
- Fix the typo (limit) in the commit message and codes

Changes in v2:
- Use a #if size test to only do the size limitation for the 64-bit host

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
 hw/riscv/virt.c            | 68 +++++++++++++++++++++++++++++---------
 6 files changed, 69 insertions(+), 46 deletions(-)

-- 
2.25.1


