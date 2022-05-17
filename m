Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqoYK-00013q-1U
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 00:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYI-000135-Dp
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 00:11:18 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYG-0001eh-5i
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 00:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1652760675; x=1684296675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7sp12aZj9Q5YMEmWuCn/cOh5t1R5y1uiNcYYD9x/+wg=;
 b=D2HLR5FJ/EIy0H899GODQxKQnw7evuiA2ppZv71MpmufHyE69pbl83ut
 dIIRZhZ6ubfwKL50+P1JIPxeIwBEP2LxLjkdfK97+wbWXuRxSdizib7+Q
 XzJilIILElfjuB0rYaB3wI8zvjZef+34OlI0RB/zJpvJkDQ57iOtBJFpe
 ADHwptjHhRlUaw1e2+jx1O6Y6L+5YVe4uWmUL5RPZ65/pFlpWvPaEt/FJ
 TN9HrprjMaEaOD2jZ0pl+sIFQY1T837PaYsJ0r+lPRVfcsfV3PMnB9EIv
 saPgAD5hLJ4OsOFPtB7OJ0FXLJgZTzhg6yTmlMf/7HdwuYuYWw/O0SLQR g==;
X-IronPort-AV: E=Sophos;i="5.91,231,1647273600"; d="scan'208";a="205370369"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 May 2022 12:11:10 +0800
IronPort-SDR: B34737k8bm/0ABYdmIyyGiAODnUMuPs4MW/FLY/OeJuk7Uz6C9MCJrWNgZbhEjBh+QcOKa4pEk
 oiayBpnrCD55Cdm/MNrVjqq4gYF+VQppAQ0INt8QxUQ7bS/v/9W6hsLa2CfPCBdfNMw391DJqw
 TmycB5408s06zTo8d/fTYrF1uvPRak4ZkFDkLzysTsOAA0rhhRSQAHUhTibwjtArO3Nvv+mDfM
 2kUj4YaafXIsuC2pPSej3yX9WuMoPaWJ+cYCb4y8yThnTF0acviaL+mUOITKAPX9uI+zoRjFvK
 d7+tD9SNEgtjoNOSFJRh0FI+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 20:36:51 -0700
IronPort-SDR: 8XCF0+ajBmq1/SMdiNReGzMBKJtDvu0Th5HRF2ft2YKZoxPUvFOnStRvapH+h7FY8AUiMQceR8
 5pxjkTskfsZZT/VjbwhZK+oGAXLaC4EUltu1/jmzb8rZYMWKs/T7TXIcp+BMnMsrBZ3FxC0ZM7
 KF8MVx6noyvJqCBGpNb8JdYW3GVRU/W54UiYVIF3vHqrj2LcJ6M+SvlHUr80tm9m9fxoB1SWIb
 Vpam/B57NZZ6yAZA9ChZKM18n9QQCvHkWeyd6wx7upa3EuaebE+buKt96BbxrF5A65dm+aXlkv
 gFo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 21:11:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L2N325gMFz1SVny
 for <qemu-riscv@nongnu.org>; Mon, 16 May 2022 21:11:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1652760669; x=1655352670; bh=7sp12aZj9Q5YMEmWuCn/cOh5t1R5y1ui
 NcYYD9x/+wg=; b=LakkouJd7wEKfjdgx0zPYBJyUErN3tVXVONxmb9bXgBIVf17
 A74Tg1wyasKwkzZSA1xqsWKh83r1koMbaGe6OXqMafSaFFuPrQ7VFc4Hxg6heWAO
 j1zEk1hcdrfKX3SETNV8xjF1mpoxKvm2wyWiKZXqZBqn8ogyDKIMN/OT0892XSfq
 LPDsZY2g4YdfRE8y1c72aVhRbWuTWlLc9eXxnwMOVcYkmFS1pQO3EVfDnwx+8dRg
 qLdj9HXr2rYVN3Eq9kuR5Atxt3YVCMOONjP31Dd16TQXS+eYDZqJYlWSLnyyLUbY
 eW0/Z6g8xHx6rwtdKR7BTvAy9QZxM6s0yf0qyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DYTbeIoN_oHS for <qemu-riscv@nongnu.org>;
 Mon, 16 May 2022 21:11:09 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.2])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L2N2y0yK0z1Rvlc;
 Mon, 16 May 2022 21:11:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com,
	palmer@dabbelt.com,
	alistair23@gmail.com
Subject: [PATCH 0/2] target/riscv: Cleanup exposed CPU properties
Date: Tue, 17 May 2022 14:10:58 +1000
Message-Id: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=129fa4c84=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Tue, 17 May 2022 04:11:18 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The RISC-V CPUs have been incorrectly enabling features in the named vend=
or
CPUs that aren't enabled in hardware. This patchset changes this so that
named vendor CPUs are not runtime configurable.

I was torn for the best approach here. The other idea I had was to disabl=
e
features by default and instead enable them in CPUs. I ended up going
this approach as I felt it made more sense to not expose configuration
options for vendor CPUs, it just seems difficult to support now that we h=
ave
a large list of CPUs

Alistair Francis (2):
  target/riscv: Don't expose the CPU properties on names CPUs
  target/riscv: Run extension checks for all CPUs

 target/riscv/cpu.c | 217 ++++++++++++++++++++++++++-------------------
 1 file changed, 125 insertions(+), 92 deletions(-)

--=20
2.35.1


