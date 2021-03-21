Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNqLW-0005jR-Da
	for mharc-qemu-riscv@gnu.org; Sun, 21 Mar 2021 01:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNqLS-0005cq-Pq; Sun, 21 Mar 2021 01:09:46 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNqLL-0007Wu-OG; Sun, 21 Mar 2021 01:09:46 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616303370; cv=none; d=zohomail.in; s=zohoarc; 
 b=LAs5Uq6D6VxPTOQ41Gdn+6ES9fdvnJkxXLVYWJAVDfYnQQ5W1+qwSZ96AwHKtWBgOomi31+wxGyKTN1onWr5dhdV/76+KXoGIGDzCDmjm2czLcaO7Z1PebaBRccHjdl/mDp4y6OyYyEiw3dz1UCBIQVigBHdd+PfiOU2wT1RBkg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616303370;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=5bRP4L//4Exgj7NPKQzNEJEQ+iOVqSLtJuWd8R2//B4=; 
 b=XWNYpW1gXKx8ceoFCHXwsIUDc284rwWg+qS3mbIm4jhH5ybLOKYzZBT4U0WMrqmyejVIyY/SFWg2E8jILcJ9hCn03yZbhQ35LxTwbBhiRkFQwLMLyAiMT30McQTDvvflgxPFHCFj8DMYDdxlMd79MyhxX9jWynfDZfJrrCq0lfA=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616303370; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=5bRP4L//4Exgj7NPKQzNEJEQ+iOVqSLtJuWd8R2//B4=;
 b=mW9AYcx6a9xe3WQJROiQu6k+47rr/0Gu2tOPg8tOAe93uRd+1o4ApbPucLoo1uas
 QChr+RHR8LAma5DKlWdowxIL5NTocEEwlTzfhrXvtxoPdZxq44xiHNWCy5I3y8bCKGF
 HBV+/Rh9fKRvtwqAt2dFBx9R6uqT2PLOHBfrNx5Y=
Received: from helium.Dlink (49.207.205.35 [49.207.205.35]) by mx.zoho.in
 with SMTPS id 161630336727313.11427119923394;
 Sun, 21 Mar 2021 10:39:27 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210321050917.24621-1-vijai@behindbytes.com>
Subject: [PATCH v2 0/4] Add support for Shakti SoC from IIT-M 
Date: Sun, 21 Mar 2021 10:39:13 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sun, 21 Mar 2021 05:09:47 -0000

This series adds initial suppport for emulating shakti soc[1] running
on arty 100T.

Shakti SoC uses Shakti C class core[2] and Shakti Uart[3]

[1] https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.=
rst
[2] https://gitlab.com/shaktiproject/cores/c-class/-/blob/master/README.md
[3] https://gitlab.com/shaktiproject/uncore/devices/-/tree/master/uart_v2


Changes in v2:
 - Moved CPU addition to a separate patch(P1)
 - Use riscv_setup_rom_resetvec API to setup reset vector
 - Dropped unused DPRINTF and unwanted break statements
 - Fixed uart_can_receive logic
 - Reused sifive_u_cpu_init routine for shakti
 - Error out when an unsupported CPU is specified
 - Addressed formatting changes pointed out in review

Vijai Kumar K (4):
  target/riscv: Add Shakti C class CPU
  riscv: Add initial support for Shakti C machine
  hw/char: Add Shakti UART emulation
  hw/riscv: Connect Shakti UART to Shakti platform

 MAINTAINERS                                 |   9 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/char/meson.build                         |   1 +
 hw/char/shakti_uart.c                       | 185 ++++++++++++++++++++
 hw/char/trace-events                        |   4 +
 hw/riscv/Kconfig                            |  10 ++
 hw/riscv/meson.build                        |   1 +
 hw/riscv/shakti_c.c                         | 179 +++++++++++++++++++
 include/hw/char/shakti_uart.h               |  74 ++++++++
 include/hw/riscv/shakti_c.h                 |  76 ++++++++
 target/riscv/cpu.c                          |   1 +
 target/riscv/cpu.h                          |   1 +
 12 files changed, 542 insertions(+)
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 hw/riscv/shakti_c.c
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 include/hw/riscv/shakti_c.h

--=20
2.25.1



