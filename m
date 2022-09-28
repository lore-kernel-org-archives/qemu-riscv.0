Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odPKC-0003aV-SM
	for mharc-qemu-riscv@gnu.org; Wed, 28 Sep 2022 01:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPKA-0003ZN-VK
 for qemu-riscv@nongnu.org; Wed, 28 Sep 2022 01:09:34 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:60015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPK9-0005vk-FR
 for qemu-riscv@nongnu.org; Wed, 28 Sep 2022 01:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664341773; x=1695877773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EBCB0u0v1hk4WKN8ssQnjB19ZfAevYgCFVsNwtv6Wcs=;
 b=G1qDti4f4dBtHZfqb039wqqkZp8mGSmoz5SMZzG7ioTzQ0/X5rbokdoz
 hMb6xLJJlWLuEFKd4V7BJ2oWEfLCCiyVQ54JJn/vlkUcRqY/e+pHFOit/
 EgNQIClEVYKfWNnD3cOXDn2q6s0Sr4Y8zuEteJOLeVG9w+vhINMgZLkoE
 4SWS2HdXvUhxQ1CBYEqLopO4FVLXtfEGfO6g2L90FPQWMlJNTb6kT+Mf3
 FjDysj0rmefbABQudamS+xyNjNkqGMJmelwKQQr/8pXtQSXMgXC2KZpu4
 PPBj83glo5dswfvR9b8lqEj4TmuBxKZnC3zsyf+Q3aLRgNkdVwrSh8/sZ w==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654531200"; d="scan'208";a="210817936"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Sep 2022 13:09:21 +0800
IronPort-SDR: WrvAglzz6aeoH+BRG9ApWOVx26nxRP1/UV1ioqCohPmrcI0dN8o3PL92TVuIpFc7JBpexI21km
 p6Jn7PSgNTtWLe93mhat+24xT+yh0DN38mLHYQT+631v55Ss3XawiMzdrclNv2855+BVMycPbV
 aoFkZDyfLo0Q92J47v0Bh564V1uucrEZgexQBlvxL60RNUpDySPz1b5xQGSO9sPRHDl1Sy+/zT
 qioXR2Z+wKKwdcE9YZRB+P6KouaIRw/FOiuwHGAY3aS6Fm37rOhvnyse5dE0xxoJ49kI0nWEa+
 5w7ts1gPv0bt0N1eGpiTEscw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 21:29:18 -0700
IronPort-SDR: 4ns6enZohRGL3caLdqbt1L86Q/YQms+IuzvHQEAzAMBDx2QO2lT82/Cl1mknjl0wxdxePu5I5l
 jSoadwtizwF2PMEoOGxKiQkIt9JOeP/XBc4jIgqzMYxRJRSCqHYG2R8yqSnxhrdWxG9TpxIBwk
 mUQJgmqyFXGPnxNjg3qJkFUdMXORHacP4EQBSLWUWVfuC+TlObTNGe1ZXO3TAVjhOc9gddKWph
 JqR0rRcZ5CIVbUonqNpl0fwVs1enU2Ly5RZX0fgDQi08uRtBscRRCL2H8Q/uZQCfCBWW/gnGOT
 QcM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 22:09:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mcl0K10Bgz1Rwt8
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 22:09:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1664341760;
 x=1666933761; bh=EBCB0u0v1hk4WKN8ssQnjB19ZfAevYgCFVsNwtv6Wcs=; b=
 McVHDImLLLYz5uNngkBsNdE6yPmjCT5B9Uw0D2OMxl0bkl7y/5oG8vP70zeo9T9I
 mZS8IrU53av3HfB2vgbvyVF1MDYo5Le+F1Z3KKRX2UG576oHzb0Jh58DLIfgZpL2
 2K2zupQcvelHd9p4HXy/Uxv5Uu1R+Jg78jq4x1AwrMoGYFIzI7dkA2AfpvipiRJy
 AVsM5JvjxcmJkc5R8Lvhn+8IuExCnZ8dq1fOn+LE/2UezykMB8fCVb2sbH2L05Z3
 0OiFHnCimSWw8ELycN7JNqqz2/EV9FHZPvTJiULE4Ku0o7iI8OKQgJA4uHn2YBO+
 cIMsnsBgU123UneHcxdcyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Rcd9qef_o2U5 for <qemu-riscv@nongnu.org>;
 Tue, 27 Sep 2022 22:09:20 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mcl0F4kfvz1RvLy;
 Tue, 27 Sep 2022 22:09:17 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v1 0/2] Add OpenTitan lifecycle controller
Date: Wed, 28 Sep 2022 15:08:26 +1000
Message-Id: <20220928050827.319293-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Wed, 28 Sep 2022 05:09:35 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This series of patches:
        - Add OpenTitan lifecycle controller with basic functionality
        - Connects it to OpenTitan

Currently in OpenTitan, we skip the `boot_rom` since is has become more
complex and we do not have all the support in QEMU to use it. One of the
missing pieces to getting the `boot_rom` working is the lifecycle
controller. There's a particular `magic_value` that is kept in the
`LC_STATE` register which is checked by the `boot_rom`.

With this basic implementation of the device, we can get past the
lifecycle controller in the `boot_rom` check stage. Testing was done
using TockOS (running QEMU with `-d in_asm`) to see how far in the boot
rom we get.

End goal is to add support to all device models in QEMU that are
required by the OpenTitan `boot_rom` such that we can use it as the
`bios`.

Wilfred Mallawa (2):
  hw/misc: add ibex lifecycle controller
  riscv/opentitan: connect lifecycle controller

 hw/misc/ibex_lc_ctrl.c         | 287 +++++++++++++++++++++++++++++++++
 hw/misc/meson.build            |   3 +
 hw/misc/trace-events           |   5 +
 hw/riscv/opentitan.c           |  10 +-
 include/hw/misc/ibex_lc_ctrl.h | 121 ++++++++++++++
 include/hw/riscv/opentitan.h   |   2 +
 6 files changed, 426 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/ibex_lc_ctrl.c
 create mode 100644 include/hw/misc/ibex_lc_ctrl.h

--=20
2.37.3


