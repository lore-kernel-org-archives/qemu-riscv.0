Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLw5O-0005Gq-Q6
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 19:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw5I-0005CU-Ae
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 19:25:29 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw5G-0004vc-4h
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 19:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625126; x=1662161126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4tEH87Tt64bZHfL5xDKXGkhl6bKUeaIy8Qiww6HvPQk=;
 b=k90vH3KnOc0JN/su9eShcoBYcAhfQXYax2cO0EonMTs+lyRH6ApRO/0C
 AIrxtfkc3Lugw4J8oKzDOVGcfXxAvr/7idI/lFNK6JGOEKpUpovmt/4k3
 30ryZ0y+W9BFomJFlr7o3F0EfJ7+LV4x1hR235RCiD3WexKyQU29oswQy
 gBFd4wrAQwmwH2MRfWxnBt3zVWdnVqmur6uB8qDZy0R5eUlsoKv3zE5YN
 zu2AAIr22bRYRgEXTxm16e+Wn9T13YOZeO0BCw5L+anyADwZOShw1mmSF
 PjMSltsD+r103LMFtuSfqSihtFjWLVFyGGRg1Y+IVvfm6mbp2mPQCcmBe w==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="179628319"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:25:23 +0800
IronPort-SDR: PmS6ytDhUbCA5+2w5iTq2Jy3poq5+lQqZ/tOEeRI0XeevAZCvptGYQMu9LyPk+dTfXZidUVwfB
 tAOmonODkY1qs5R/Pz/gl1rSow47HyYEo3PbK2Q4ZIiUf8whXE9+86jFMZ1Egh3c4/Q7sm7YHf
 vHJg8tGgk7qOStztJyjq64p7qRe16LbCF3TEQkEx1Oeoe6Kn5YI6T9JuYY+ZRhBSMfLNX8eLQc
 KsWgKRpVSGBR7X89YHR56gNB10tL2sliEQ1cIuvkQpl7nRfNNBC9UX1cyM+v5bFfCMdBud8RRp
 gpvovAKNmMfApiYbqI+xm3Qp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:02:08 -0700
IronPort-SDR: ElTRW6Z3n3QAx8GvMC5HZiOhV+mu4MYuT4gtVwKIO9O56mJAvajE4sARqukvZ7NP4gXs45wk30
 I2bVLXUAqkAYaTsdq5gh3uxwHGO/FcQkfj8bsLpu7WOif460PFtLTy55bkaH9Fycr/yCfKeH7F
 icQy3Qs7S9DBMhr9JSKvORD8Qky4jJTHTcKERMmCFfxETZOeu5vWiOyE+KQ23AHiD4ztg3QOzf
 lPTVtNp5PQNIZzpRROsz78kZ6VmKbv7vDw06Fujldmx02cVSPCJ6wNGryJT+29kaojoshsYCV+
 Ph4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:25:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xqR1LW8z1RvlY
 for <qemu-riscv@nongnu.org>; Thu,  2 Sep 2021 16:25:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630625118;
 x=1633217119; bh=4tEH87Tt64bZHfL5xDKXGkhl6bKUeaIy8Qiww6HvPQk=; b=
 oqyr4e73x1ip2fPL49oRim/nQeZyFmxU+BxY27BJSPIlALGkYT7Tc5gWqi6L/yNJ
 Pguo2bwM+w45Iri3hDGjF4ip3h4QOe0url0aZFVRzFlr8RBPmTfVKuNysHu1ICyP
 heJ48EwYiIPC5w0ZwfY/XJwVR6O6rWxLrrTFWkmuGPPw1iBRVE2+fRPet8Oxd6/t
 Aj9XoSCnM4phtTSUBc3agppOrGw0545Zj9cV0r6p6NYEawnG8lDmZEi/lXISdzFL
 llWGPXERXOXZfakYG5o0ceJENu1IHBRDfX1CpUhsDRDexeta8lDL9DPN3LEis7SC
 fZ1eeFSDUzCXETjIr9mKaw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Dm5rLJHG8vHx for <qemu-riscv@nongnu.org>;
 Thu,  2 Sep 2021 16:25:18 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xqF6Kvjz1RvlP;
 Thu,  2 Sep 2021 16:25:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/2]  Add the SiFive PWM device
Date: Fri,  3 Sep 2021 09:25:07 +1000
Message-Id: <cover.1630625094.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Thu, 02 Sep 2021 23:25:30 -0000

From: Alistair Francis <alistair.francis@wdc.com>


This series adds a the SiFive PWM device and connects it to the
sifive_u machine. This has been tested as a timer with seL4.

v2:
 - Address Bin's comments
 - Expose PWM via the device tree


Alistair Francis (2):
  hw/timer: Add SiFive PWM support
  sifive_u: Connect the SiFive PWM device

 include/hw/riscv/sifive_u.h   |  14 +-
 include/hw/timer/sifive_pwm.h |  62 +++++
 hw/riscv/sifive_u.c           |  55 +++-
 hw/timer/sifive_pwm.c         | 468 ++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig              |   1 +
 hw/timer/Kconfig              |   3 +
 hw/timer/meson.build          |   1 +
 hw/timer/trace-events         |   6 +
 8 files changed, 608 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/timer/sifive_pwm.c

--=20
2.31.1


