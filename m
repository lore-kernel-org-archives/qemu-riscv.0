Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnZcS-0003ds-8R
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 00:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZcQ-0003dT-LD; Mon, 31 May 2021 00:33:38 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:31118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZcP-0002Jr-04; Mon, 31 May 2021 00:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622435618; x=1653971618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dFRw9VOIaK6NvyjnQOPJdCzeSWkoNsobW5E1dbb9wgs=;
 b=AEDXBSg/wx2JIV+SmjZxQ1ko45gsLvj0Yc2VukitAyQKr9mZkB2RTOC6
 tUrJ848yAy9OF1+szNgo/a6H3iFn32E5UDlHdduuk0d7NP2Z0w6umQ5+O
 jAyYv8oZT54D9t2Ysz9EosiqKNchVeu3lzqFtBJNQD/fC+GhrmeyKAh4Y
 FkIBY81E9/U1TvXrNtLhVnjSJ2z9LSfiES28AIO+dVJMlMO18OIWX/+n8
 xV5eUd2KDky57BsA93o9LLPurgLVhtc6MqpFFcq9gd1/RfiaACn1wCLk0
 sqnCdOMebojhV4pMtw8Yvuf6+VXTxpWko8gciOKK5pS7diWMWILim8Ip+ A==;
IronPort-SDR: hK7PtGX7bZcMTDzNAuv4dvlZeuQXJn68Ehw9N0wL2n9cZ/yLkkExVSAR3a2iGOvGMQzzqm0Qgu
 w7l0qlqM9VCCXpKBZwJDVYzqeC9jdwUpAqDtWvW4xdXJtmCc7hHFag0tG0Wny32JFWhUs/uqgO
 1q7truqwO9uYXeRpBRAT8HvdhtcCXZGOgXiUtH4wENNy58lzHdvmz0raY3R+Ix1OIpTmzsmg+a
 xW9StdQuYHgxm7w2XCAw8yLixVuyQNzuazve5NbqUJaN78ldkXy7gRmptheLm5D/drzEyuMG4l
 5us=
X-IronPort-AV: E=Sophos;i="5.83,236,1616428800"; d="scan'208";a="170639599"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2021 12:33:36 +0800
IronPort-SDR: /2yHRD8sHQfIbozOGumUED5UpW1C3xCicWB/Phpwba1k1szGmksYVVOVNd2hp0NSP1b2Os/wwG
 8qruedRy1JDBRU8Pgvr2NcMyGbOkXqEsCbNFtQnngTzcLnhbbL8+loi/suXHV5AvLN85qOH71w
 9RKhstAxKLz9Ci8piSSZ1PkSMjUEENZXNnkavx2JeCiRU+NfToD3xYI7E51VhEuDsg4nxhcvDS
 hf6w/c72mn5fguTzkt/RTBgtU08SahlvDujajaX6GD2uQqJ7Y5Bj7lsZVdTkfp+esBC2EIc/Qq
 3C3+k2UEdEcLK2br58NrKlND
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 21:12:53 -0700
IronPort-SDR: M6DdY664mFkgYlcN1psgrN+YPEbqkvfhqR4r1Y6sL/0mjSKqxazGw7WPz/pDxid7zm+arcRthf
 gQgBXNbw4+Xv5Ge/YK6j4tZf2PPlZEN1t33pStMqfFfzpYBH93fJtoYh6VWMZWUAzkpKJplwgB
 rVd/1gfs647oj6nUVreK3CiN1joMiyeukCoykEqLq8BGbsHRdoNpiapc56CYohj6wCJjX8P0fh
 5MDGjn3Ama1JquXJzofW5w5gfzkAg7R2f4bysuYS7CnNOrBrGs0nOoQ6yGk9JaVejGVThf4mJL
 rgs=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.65])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 May 2021 21:33:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 0/3] hw/riscv: OpenTitan: Add support for the RISC-V timer
Date: Mon, 31 May 2021 14:33:26 +1000
Message-Id: <cover.1622435529.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=778d471cf=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Mon, 31 May 2021 04:33:39 -0000

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


