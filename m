Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6h9e-0003SH-CS
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 19:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9W-0003Oo-0Z
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 19:31:23 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9S-0004Nu-SR
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 19:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656545478; x=1688081478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Be68EkZQO9ktIYjlhKsfGrMZq6JAr7Rlr8a7xiTOo6w=;
 b=qyBDibmep+r5jpaz4O3Ngd2lHqnHzFcY5MsM5T1m499e2WXdzOe4Cp5S
 4xNA5nAkixkcJx0WhYvHH8stX7C1Ubw2fVseB/x/ZK9Fe12K9msxO3IKD
 +zRSUyOUzC2ZkD/z6VKhch1gtguyLy9cPcL6rtyANi0yQhOnhWlCIGt1T
 CpRa7E0xAs4rFfnKcxN4pvpPvVOHX0FGTRBucZmgvPmttrp/e1twQO0fp
 z78hjvRhyYRx1wFtlQVmZsxKV77EZwzfl0ZEk4KjLnkLsBkuvOdcxkbGj
 +XHMQ617faUwDDsp4zkSBMx63mw02sv1sCIQfTSBg02Hzyw8VOUPVhwur Q==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650902400"; d="scan'208";a="205161709"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2022 07:31:13 +0800
IronPort-SDR: HZ+VE8QipgHx6X5XxrMA4qwIidvr/vyrryB8Vk8HhwvvEl4w0CqGI8/wH+iIfAs3Q27zrqLc8T
 4DjdriWSdckG4D2B6SYbkcxFr4T9akr0SEaRJ/imiFFxcE8UL/LQzCpiAc0q93aX8sUntbUUR9
 CpMLDqfFT8eF59ZKsyN2LBo8oRqMnjKh5NccFCs7dqvQjPrBMl9pTctuKACc/vGa4H9RPyd/ce
 q2/dYc0oUyo/4uVEz8MHShbbXHWr0krv4+lS163ehyeqI5+hpQjHBYRD7dCoYbzJbA6f8QW4Jx
 Oor/xCQbAig9COOH7uVcamVy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 15:53:32 -0700
IronPort-SDR: q6fffGG2z4nxEFJpbV1aM/+GA0B7smZk+SI/HhiKKhzn9BJ0lBl3zEuuWzPgC9RosRVOmwyFoC
 fVqRzUy0GFcHEDEzpgsIq/g5j8/9eAIlAV8QpjHd83jvX92iJoHo+5NoZKHqYBAnLg4hXHhoPv
 spElkpZj98E9YIzWjEX+j552MCFQBX4OZ6NRmvXcKNY8pQjV1sZ/9dJEJObEPFXpoZHrQm6nu7
 T5xmYwAkraiEEPWFpjT4yLu9ANTavPFD9gGWP+baFaWbOJIES8PlwDp+fSQBt6sctah7SBn5ZL
 VVk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 16:31:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYHlh6Qwsz1Rwry
 for <qemu-riscv@nongnu.org>; Wed, 29 Jun 2022 16:31:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1656545467; x=1659137468; bh=Be68EkZQO9ktIYjlhKsfGrMZq6JAr7Rl
 r8a7xiTOo6w=; b=nAmfSrfavCWsFEQnLWllPkyPjHRSilYzHKR9I3p1nCR9lGjk
 Tc/Kv4V7TppNHX8DGZTQ64ero94TJ+T7yPiDwnB1g70zfKopvvrvKkL1Ez4EM844
 xrtCQRh+LsWgpIjPK6duRIt7PdUndY/JZqkR03nwn4/YMvrdDKp0bQJN3kKqIU1G
 X8KnH5+k0OnYh7tGhjVVr3DPh87+wrCO8B46y5swp86ZkUD78GuRCW1F4dA79HGH
 lsTGhr7eTxd3+nv+qo9Ktz9cWI5HPDmXIn/xlq6V4BdRZkrIGT9oXDj680MPeZw3
 s5h5Y/Jn/kyjgruKo6UYL4vyfvk0KeuTGEXHgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Rh_IX_15g7rw for <qemu-riscv@nongnu.org>;
 Wed, 29 Jun 2022 16:31:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.111])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYHlY50lFz1RtVk;
 Wed, 29 Jun 2022 16:31:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH 0/2] target/riscv: Fixes for Ibex and OpenTitan
Date: Thu, 30 Jun 2022 09:31:00 +1000
Message-Id: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1723d02fc=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Wed, 29 Jun 2022 23:31:23 -0000

From: Alistair Francis <alistair.francis@wdc.com>

This fixes some issues discovered on the Ibex SoC when running OpenTitan =
tests.

Alistair Francis (2):
  target/riscv: Fixup MSECCFG minimum priv check
  target/riscv: Ibex: Support priv version 1.11

 target/riscv/cpu.c | 2 +-
 target/riscv/csr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.36.1


