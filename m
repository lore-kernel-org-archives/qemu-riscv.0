Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muqfu-0002DA-Bc
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 01:43:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfi-0002A3-Ip
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:23 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfg-00067o-J6
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945801; x=1670481801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PKWff+Pe2EtVOWjZkAtZdxWr4jpx7WP2Bh1904pcvvM=;
 b=MrnTgXZZR2nn39AFXfn/2la3+h0/bq92CBtwTnO2ejl57RuP/k4GHy4s
 KsmX6KLxNNV+BTSl80bM2BPOcomGHP0L5tvt+IfXNR30CF/N/8xZHIKaW
 YlKCvR4LO9vWO1pHIGvZolpQ9OGCwdQCZxZsltoZv7pnYGl0/ytdWFaf9
 O8kbja8mzrjUoAs6ZI2Qd1WgAUoki286vnhzuWU4xRy07XKsxHGbEme6X
 Hpt06mRCd/KIhhmeq4zLxbOcWMeOorhWZ4T7yDGZw+O/pL/cO2SLr84Nv
 nVzjnYsa2Q1lVNWeCgp3ZVnIoQygxX+W3BZjwMIZMlZxKnM7yDLgY1BLK g==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="188732814"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:13 +0800
IronPort-SDR: 0VL+ydu3WsNp/KrbQ9avRSDq2zRfyQ3cf5WlL+qXaRvgddSXqa1k0xN4faU5zWqSBlf2xA9rB9
 Fv1k/FUeDkyWKKhHOiHvO7S/NW2Bi1hSJshjd0QKm2sXw5NvjEnP82AHl031kC8ssT3BArzis8
 tMjtfG3KvQD2e2EO33ryws4xwKT7ik8K1hFFUdThf/zsQG6DjYLCa0Xqnc+aS2oWalRTq4eErx
 Dl8b1oHl/bcjM9imHCbQqxloKYsCfsphDORG/ghTCpgZj7nL7/5CmvPsEJf9x89VXXVsbNGB3D
 jofR8Xn6eEs+F/iEP2lnpJ8B
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:17:48 -0800
IronPort-SDR: GhAkFzFQHJaozYqfQASMsw5A0BnFFZy2run1WM18DOFGmjLFOxI5e/cPu2+LtnAFnNez3F+YTM
 N1ily18H0PvB82+Q9DcnPV7a12TsqApmIqHuzKHQX4fWqtPZ8pYS83LiiSOA7CLiSjbEKxYl14
 wlCidd8flnV3M5cZH8omtqMpMeGRIQMWOIZPgWEkmAQPzZ7Ebe/Sz6x4rS1XHzmlGCqSoHABJj
 lZnWEP/FXxc565fnvGTB4hL57dOyP5pN1rBUQTCT0UdqS7egnzy7m9NAbkU8Ql1XJVyvuc02Z0
 zBk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870J34Wqz1Rwnv
 for <qemu-riscv@nongnu.org>; Tue,  7 Dec 2021 22:43:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1638945791; x=1641537792; bh=PKWff+Pe2EtVOWjZkAtZdxWr4jpx7WP2
 Bh1904pcvvM=; b=nWI8aubS7EKypA+ExHhnt0OtSCtrWFr4GvPWUjy+gHimUL23
 FOwDoA4oJJGo3RNPA9dU5FGUxZd3MT1DgEInbW3fCBIMMoKOfFSUQTennlXiyHYB
 KCOch6Yav1qGz9npBxwBum8xtphg+az6ixv8oiRfe1RHiu8FOfbGLnjKF5ikd6Zh
 V7CGNjmcHHW5ieTxetBcZIhUVNyqk0/LGCl3e4wgUbZH5LK3xPlCYnUeqnGWxOX1
 5urLtqtsYfa1vCWqLFgWyYjUU8jd+bweYRCXgeRfoqWvo+0Ja97DVgnYL0x9/JFT
 jvpQGN2Gt0EcREdBxe1wYyOLCtEanQoVzqqExg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cYUeVHeaeRA5 for <qemu-riscv@nongnu.org>;
 Tue,  7 Dec 2021 22:43:11 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870B4DrWz1RtVG;
 Tue,  7 Dec 2021 22:43:06 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 0/7] A collection of RISC-V cleanups and improvements
Date: Wed,  8 Dec 2021 16:42:45 +1000
Message-Id: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 08 Dec 2021 06:43:23 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

This is a few patches to cleanup some RISC-V hardware and mark the=0D
Hyperisor extension as non experimental.=0D
=0D
Alistair Francis (7):=0D
  hw/intc: sifive_plic: Add a reset function=0D
  hw/intc: sifive_plic: Cleanup the write function=0D
  hw/intc: sifive_plic: Cleanup the read function=0D
  hw/intc: sifive_plic: Cleanup remaining functions=0D
  target/riscv: Mark the Hypervisor extension as non experimental=0D
  target/riscv: Enable the Hypervisor extension by default=0D
  hw/riscv: Use error_fatal for SoC realisation=0D
=0D
 hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------=0D
 hw/riscv/microchip_pfsoc.c |   2 +-=0D
 hw/riscv/opentitan.c       |   2 +-=0D
 hw/riscv/sifive_e.c        |   2 +-=0D
 hw/riscv/sifive_u.c        |   2 +-=0D
 target/riscv/cpu.c         |   2 +-=0D
 6 files changed, 81 insertions(+), 183 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

