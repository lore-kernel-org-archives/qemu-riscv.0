Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8uw-0003KX-V5
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 03:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=79658353d=alistair.francis@wdc.com>)
 id 1lu8uv-0003KE-Ho; Fri, 18 Jun 2021 03:27:53 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=79658353d=alistair.francis@wdc.com>)
 id 1lu8us-0005YI-7O; Fri, 18 Jun 2021 03:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624001269; x=1655537269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1M+8sRRxoWumY3IwbhZZrqyjRexYAu9D0uJvyWnWSEQ=;
 b=iFD9fr/jWuZgoq2Igeafgqmzb9vIatVga52flO09l5XuX9Nmjy1iv/Ue
 slhdaH9XQZMBwoSftXxtCmfd+2rwgsZPnUiGRKuadLlKe7P3HdO2croLy
 QIvf5zr4OZUih0rhSrDPCq8S4njGazKGJ2r1tyIlrh8LNz5EMNq+y8N7N
 wrsjjgndtLqsRz1bfg/qLgX+kLwM9qbApQC7NSDwew8CRXYntoW/thEXC
 Aghn35NHLG6u6mp1PvNx6bQNJYT4PVK/iZ9C74LQX2e30HeaD0E8G43aY
 WNU6zch+hlFFI9iR2lcnTK1zJwwXrC6faACVKvVpGULpHA3bY1e+Tq0MW w==;
IronPort-SDR: yFDJWqRKPvEIda2yS+JxaaOGvy/PxBmuJYhiLCQt4/h21RiX3WzwWKtwJryu9OJX4dxCRPysRR
 BoCpgzPhh/m51LBnlVoikIU8jfSg5aApDVFLYFwNNinluuKHeS4AQSRjcN1JnGb7XwogtA+HVa
 7Shgyb4ZwOe7QVGZ6GlUDtqNSJ0Bcgr1hSdZCsU7V1ZJbg622Wn/WKJkZt2ag9e2Ss1sBswGSG
 n5QN5CxhYjP/2uCSQEyvnY0CnC9tqaI4kcrcnSSIPOtAtoWutyfCq4ZhTXfNaBhhIcEhyHHVYb
 Th0=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="172284349"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 15:27:44 +0800
IronPort-SDR: uQnfqRgmUcuErk4mRXQgZj5x/S26uRdpQ6+HBsXXugkYAxL96HbTjWJRjOQzFcXC3dRHm7sDAz
 2QD10KbVtTKbYvZH+U6Rfy70NraFf+NwCcdxe0sVzlR5+s7w+S9/c2kMlBwRVrrJ7Y/NLrli0c
 V7soeSvzZ/er60UPFC3D0WZqtiV4g/VD1iXr7fGymO41ao2isEd1L8w2zHewEME4yToByWFA2M
 WSgZOOo30EUUFoKoXSVqoLHwAFpSLPdWJ/Uipse0HspLdSZRAO3NrhCYX0zMxOEBRQi+QxCeCt
 VNsB948Y6EMoA5n0WWiBvdFb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 00:05:11 -0700
IronPort-SDR: G4Sx5HdqbfnU/LTHA3WzFRCGhxI/LAbljacRXNBNJI9p7gQEjn21BgDiTe5db46eKjakZ+5+ME
 DA2A0q8gUnJYLUJ4noTPgCnh++HDdYJGcNXVBPpmHCYrbCrUtmEKm+V/NnYsSeSnmBu0afwT8d
 1Zm6Ijgg6fcV7rqcffa1XIL1WfEef8FtV14JKwzK3Rb7Wmwh4zaX10wrS7VQnYaHFVKSvNTsMY
 p4vEVWR8f9Acmwap1STPvHhFzg7HE2BKCB6EbHj/yIhNX9IAY8XMWV4RtcP6TAhg+icSP3cpS7
 30w=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.95])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jun 2021 00:27:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 0/3] OpenTitan: Add support for the RISC-V timer
Date: Fri, 18 Jun 2021 17:27:40 +1000
Message-Id: <cover.1624001156.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=79658353d=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 18 Jun 2021 07:27:53 -0000

V3:
 - Fix the value of the "infinite timer" 

Alistair Francis (3):
  hw/char/ibex_uart: Make the register layout private
  hw/timer: Initial commit of Ibex Timer
  hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer

 include/hw/char/ibex_uart.h   |  37 -----
 include/hw/riscv/opentitan.h  |   5 +-
 include/hw/timer/ibex_timer.h |  52 ++++++
 hw/char/ibex_uart.c           |  37 +++++
 hw/riscv/opentitan.c          |  14 +-
 hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   6 +-
 hw/timer/meson.build          |   1 +
 8 files changed, 412 insertions(+), 45 deletions(-)
 create mode 100644 include/hw/timer/ibex_timer.h
 create mode 100644 hw/timer/ibex_timer.c

-- 
2.31.1


