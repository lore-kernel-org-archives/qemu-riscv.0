Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lS1r6-0003TD-2m
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 14:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS1qi-0003Mv-Ss; Thu, 01 Apr 2021 14:15:26 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS1qX-0003Y1-Vz; Thu, 01 Apr 2021 14:15:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617300900; cv=none; d=zohomail.in; s=zohoarc; 
 b=Sb5rhDZC8bOTBNKNw7YUTN9rEiAHSSgaTnt6NyvLbL9qeCL5OgxnpttDuzwG90i2SCUDmeGVMPiA6Kly0UFSeKBuDtVPpiaTfpnCXyDSH1fP6JodL3yw4BA8JHtQDAzrzEbA8OnANnMjVxmQESmVA1Sok/ME35OvvJ6Ga9KWtKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1617300900;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=gpNvWb11klRaX3ZQW/T/0R6XxaJ510x8GYvqivdKx0U=; 
 b=RleI/utt0MTC1xYZi/rKw5g8w3WFUDyKVBKIGaJ8PwJKyw1SzduttVm+9Yl1m31Nge/SOJAEzx5Yv/BLgI6iOoLZPCFObZRYJnfFBnxPqgCEYquBwBczXsgMVwdBGbJqTW8kyTm0hJYT4BPZlr/iXEhqUPG7QoZBlIOOJS4K3XE=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617300900; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=gpNvWb11klRaX3ZQW/T/0R6XxaJ510x8GYvqivdKx0U=;
 b=KaLxw8V5F7p0H0Xhjs3d2RNQrikTpHY1gsK5F9KAEtvwPIWDQQkuBfc11B8YPClG
 YMF/+GyMjTGFIMDFdpW+5y5OZp81fYH2oHCID1NDr0bOI+2yvnfWyE4Sh0dRcrueRp7
 Og0/fa2bsxsWJpiWCMASIjrKQZa+cDEKgz8dNfAU=
Received: from localhost.localdomain (49.207.218.164 [49.207.218.164]) by
 mx.zoho.in with SMTPS id 1617300899344966.5717957986967;
 Thu, 1 Apr 2021 23:44:59 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210401181457.73039-1-vijai@behindbytes.com>
Subject: [PATCH v3 0/4] Add support for Shakti SoC from IIT-M
Date: Thu,  1 Apr 2021 23:44:53 +0530
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 01 Apr 2021 18:15:33 -0000

Changes in v3:
 - Drop SHAKTI_C_DEBUG register

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
 hw/riscv/shakti_c.c                         | 178 +++++++++++++++++++
 include/hw/char/shakti_uart.h               |  74 ++++++++
 include/hw/riscv/shakti_c.h                 |  75 ++++++++
 target/riscv/cpu.c                          |   1 +
 target/riscv/cpu.h                          |   1 +
 12 files changed, 540 insertions(+)
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 hw/riscv/shakti_c.c
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 include/hw/riscv/shakti_c.h

--=20
2.25.1



