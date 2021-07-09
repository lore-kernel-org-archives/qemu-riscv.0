Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hLY-0006Yw-PH
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLV-0006Xh-B7; Thu, 08 Jul 2021 23:38:34 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:47727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLR-0001Hy-TU; Thu, 08 Jul 2021 23:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801908; x=1657337908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sDhj4FQFPRFqgsrv21COZV4eKOp8O1Hf58tzemRYuTM=;
 b=i/1v1FUoViP7YX0FVpjb/JdgRArF3naxjZLedkTwHAKtYR9mg3Ae1PLw
 Ut53cRQEK5cMmcOuPdfmRX88crkAJaMwD9cU205BGCFL8SICdemMS6tAs
 11QyWq7Azypco7pfEk8T/kheb02KcSjWhId92bB0lj1Gw67NGV+nd4ons
 g6rYnii6xbCze9MhyHymBvN6q5G4yFCKqmetE/vUJVrMg8/ShcmIriN3g
 rAM+eqdQM3beUG6luZKSdbc9KLl7ihexq/8ddpnVOoaFon4MWxKfNoL0o
 ZFHXDs9E34t0GYq9I0WLRGieVAv3qrrsyuKXj5nJQTTe1jO2u9KeGqkxO g==;
IronPort-SDR: gvp31i92CvzHxnNsRW1QgrjsBFJ1tj+pgOq202drzv0DBUZwqfAiQRgCPVXZqYlFtEIb1t/T57
 WMY42c/ql0AAbuSNvhmnYY7X7W7D6fN2doV/2gqgUtfEr2zYjCQAxBHG3Zquk873864/KrA5+y
 2YTygwdQOKPsgiikBoqrxOzMBehpeGTo79+pFI178eR1kcQc23cBBbYzQ93IMHyjxEZSYvigK1
 sxw4JIAqJMec0Oh+egMrs0uXfPHvqmh0pQDC1J/xMAeeAs6vU76Fhf8Y70ys67DctM6yGuYQ3Z
 n7w=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="178928230"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:38:26 +0800
IronPort-SDR: +Ir4iflk87zCBTPjrH+t6zU8FXEP0TovjXoSC6gxFNBAaETXyiXNb869V84iqKsH5WjfTq6cLd
 TMVYKxiPXc7brdDXWZvymbZAuwUWTkXKRzqVI7U1M/6x3YhVEntvr9VOf0zombzq4R1hSmhqpp
 119sv/hGHbUXgF5XYuyV9q3m2Mwrpx0m1udDWAOVEhUtLyYxy9gvjwb/3ZhOj9Ne+W28lL4cmb
 DSHA6pJTTpHHUig3F1U1vpDcuzZaqDqlW+pIL2+2d+iVc51BoBu/sx/H/dm2D9+HvPMHoqRke0
 ws0ARqoQfULLAbwmIRo70sZ9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:16:39 -0700
IronPort-SDR: shZeVzH4Ks2AwQxOvJTH0K9f9w01PBZBQcErhl9VU0l1zV/p4hchFf0XCtGEo+cA/xMVkEGO/1
 dmW4D0nWKND94Oux7rCH1Nl19diCHkldkZfb229d0MigggTnSM5YoYtRg0c7OabguLsU7Iwc09
 6pnjaHZL7FvFXdp8m4QWdJCpf2qX5UBTcQEUh+gQOPu9XUZvIaEiRrWOd+lp5HF9apEQ7u1ClY
 /ULstMV5v5njUtwEOtozYPWMsKa1Gu0LQn4fMNCnepHfo/aF0ei2VGiKfKrxddCKaIrFyvkhxX
 8oA=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2021 20:38:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/3]  Updates to the OpenTitan machine
Date: Fri,  9 Jul 2021 13:38:21 +1000
Message-Id: <cover.1625801868.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Fri, 09 Jul 2021 03:38:34 -0000


Alistair Francis (3):
  char: ibex_uart: Update the register layout
  hw/riscv: opentitan: Add the unimplement rv_core_ibex_peri
  hw/riscv: opentitan: Add the flash alias

 include/hw/riscv/opentitan.h |  3 +++
 hw/char/ibex_uart.c          | 19 ++++++++++---------
 hw/riscv/opentitan.c         |  9 +++++++++
 3 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.31.1


