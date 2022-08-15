Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNQb4-0003c6-RY
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 23:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQb2-0003ZI-G5
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:16:56 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:1255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQb0-0007JJ-Oc
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533414; x=1692069414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RLgExAGTAe/A4djJXCQYBsF1VwKpdUXA7qTwU2KoB4U=;
 b=mkK3O0dM5WnrhEFaqHNKCYKlSzHeafJTdkFdNX2UPISlzuBDgiKLbYh5
 RQ9tGV3RzRQUCiyDw2VVvd73tDAHeqsJF5eLlGpcm73+/NqzBwbtMdTad
 /49bjGVIJFxS5BRRmhL+WeyVVmBq7yl5Vtn0Z9iZFWWjseGhMpMtk8IyA
 ZVgbWldOtBtM1Do2W+EfjOQgP+asnvIo2nla2n223tm1c9kw4RMIwrtxa
 2hHkjibRmqfML7BIeJmFDVISDxJrIzF5d3ZwsGkkBfln785G53L6T2Qav
 7WpdXsCx1R/5VxJyNnNrr2P/nUIOT9wqKLbb1YSzmUH8FnveV0HOMHknC A==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="209232499"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:16:45 +0800
IronPort-SDR: LfwuXLFE/M7F6taA3Bsz7b0GnuHZIsjeXusmoz8PI1Vt+EJOIDxV8zJIDV97Ve21zjotXdebCZ
 zTdQ5F7Qw1M24AULNy4CkpJ54CBwpDL2gvKWlmpLstrSCOM+YgEkzXe9soO3Dv14IBqnrHg42A
 bJm5Tl8mVMn8sAOLJoSZEImsoeVIBHIU7vuiN1J5+r0hlRZR6HoVfRAP2CxqFX1TN9XGFEQgHk
 RdzZ7wwBrG7z7zpAsj/aE4Xfk4qaFURqRE1aj/0u02QxekI6+vFfsscvShdroYGCYpW7hsRb0N
 0QcxDIIjJ6ehIEt1blPfcEgN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:37:35 -0700
IronPort-SDR: qq5uVijrMHZuawmGjAhB59inTCHbFpLUPJOw9VidRPj/r8rvof3uQXoLadbY760fEDUdSWCzmI
 66XZsJ3KLtKwb6hvaIjk5WOhWv0ObbvKZAcR74Wzr3WS9nIyQejLM+dC8HXCyXcFVM+2/I6hBr
 XFkvphIVYXNextkW4Qh5OjX30aCnbcbg+vIpFRUiKQ6Tf86yx7vIVQwuBlBjpWHdB/uFRNSdrt
 7/K6TbxnKeHwOUi/5vDm04lAjyXL+9wGrBLz+EvnNQJKtL809MUz7njW9+fOf9DvXEpXzNlAho
 lgc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:16:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fZj3r3dz1Rwnl
 for <qemu-riscv@nongnu.org>; Sun, 14 Aug 2022 20:16:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1660533405;
 x=1663125406; bh=RLgExAGTAe/A4djJXCQYBsF1VwKpdUXA7qTwU2KoB4U=; b=
 VDbvDNi7o0SUWf53MhC8fYtG4g5nfALDcLzXzetvyK+zm94a+wlk/y2P+h4B9mYH
 hh00Nfqrn4mVowTW50h3bnQXKrz6UsBAlECTaVe6ueC1JQ0eitpN8Ef+TvX1B4m4
 uUw2nzsHT9LBLwdTcSoSEZ/qcupC6zOZw/d+836rAHNFz2/dF8/6B101JIXF+ZwB
 XgeOr0U9PeZc0jtWckiOh1ssONne5T/l3pFIMJ4oe2k1U5Jw2L5H1M7izYbVNb5W
 UtTF0oPr04VesXEI4qCeUQVZxEzdvzD4E5Fw48/r5uOBR3pmu67rRAECWHnwrYtG
 1mdifkcrZp67CS7DVbhg7Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3_BxJ7WBhP-m for <qemu-riscv@nongnu.org>;
 Sun, 14 Aug 2022 20:16:45 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fZf34twz1RtVk;
 Sun, 14 Aug 2022 20:16:41 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2 0/4]  hw/ssi: ibex_spi: cleanup and fixup bugs
Date: Mon, 15 Aug 2022 13:16:21 +1000
Message-Id: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Aug 2022 03:16:56 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch series (note V2) cleans up the ibex_spi driver,
fixes the specified coverity issue,
implements register rw1c functionality and
updates an incorrect register offset.

In V2, the following changes are made.
 - New patch [4/4] to isolate the register address offset update.
 - Adding the `ibex_spi` tag to commits
 - Split the register update to a seperate patch
 - Address all style suggestions made, to improve readability

Testing:
  - Tested with Opentitan unit tests for TockOS. [OK]

Wilfred Mallawa (4):
  hw/ssi: ibex_spi: fixup typos in ibex_spi_host
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality
  hw/ssi: ibex_spi: update reg addr

 hw/ssi/ibex_spi_host.c         | 170 ++++++++++++++++++++-------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 103 insertions(+), 71 deletions(-)

--=20
2.37.1


