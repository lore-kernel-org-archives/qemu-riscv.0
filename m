Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8jGr-0005QG-TX
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 06:25:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8jGm-0005MB-T8
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8jGl-00039o-JS
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:25:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34990)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8jGk-00038u-Pg
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:25:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id p19so1416756plo.2
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=HPMC97COCHetZCY6MUZbGb1dwr1E0VtzPlPVdxYRLjQ=;
	b=BNBXj5PVE8cL3x5Ij1zgmWwnXmZ62bIpupEfAz3VO5kt91P988Lu1MtQZYj292qysh
	HKjOgJ5AiANE3JMrohTSHUHcL4M3KzG20Fpe+HUhymTLuC9U+HlAKtmBt0L83uDofo0i
	NH6l1T5cR8ieWM5r4s/ur6Wpxr5W2dSQEofk5PkJIm+oMsWnc54GZwp4jnff/rUoFQzF
	YkG2QVztGXJ6MsvTUo6tRwBxDd5eTFUGtlNzK+5gikFvC7zcpZvrZ9N/YbDuE9MfHbQU
	uZvML2xCQJnHIEa82ZQPAjsiPuBTT+oFPRDWSspUItzPwX6VidWbqasyLXIskNIcBmKA
	d5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=HPMC97COCHetZCY6MUZbGb1dwr1E0VtzPlPVdxYRLjQ=;
	b=Qm4x1D5svXQn1ogS7pbXFNELDpbW2tGqXFIQfe94uPUDB8fGF/xic156Y7QwNWDeM4
	JdjDfTkCYdBmu85Y1mz7clNiEyAc4WcAHtHQHMrfieJGDNcVlypqG2B5Vu4Klaw3/7Z5
	30CrK8PwOG7v2NLDW7ND09gSW003JEsnnvetu/aj5HS8ij1m24AtXYr/7ER0tobgnEvJ
	xLyi+LtG29TRBK29ZXA2eVuJ8zGQ78Y7uoiHCMLXVf0t+knvUdFfV3q+iFB7wZSuiPNu
	aaw8imnR1podDdLHtQiS1v80mKnJ4I9GD+0oiPc3C6tQ9opk9Ev/q++OdRh+dAXptXKW
	nxeQ==
X-Gm-Message-State: APjAAAWTCat7Vfj5V/F9y4xj60APMWcYAYqiIOZiINN6QlJTdjFmkbPb
	dbcMT+6sUffbDHwEAmFqFGxcNA==
X-Google-Smtp-Source: APXvYqx1/O3Q/BPqVYFo7ARYnZngb9VSV4Z3c3CvZdZgXQH4Pr48LE2BozmmgDDnlyxQll6y0+Z1Ww==
X-Received: by 2002:a17:902:26f:: with SMTP id
	102mr29832888plc.175.1553595921201; 
	Tue, 26 Mar 2019 03:25:21 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
	[2001:b011:7001:1270:b809:36ef:31ed:7980])
	by smtp.gmail.com with ESMTPSA id
	b26sm21493242pgn.4.2019.03.26.03.25.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 03:25:20 -0700 (PDT)
Date: Tue, 26 Mar 2019 03:25:14 -0700
Message-Id: <20190326102515.7071-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::635
Subject: [Qemu-riscv] [PULL] A second RISC-V Patch for 4.0.0-rc1
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2019 10:25:25 -0000

merged tag 'riscv-for-master-4.0-rc1'
The following changes since commit 4aef51963924fd58ffe88daebbe8055a360d7c10:

  Merge remote-tracking branch 'remotes/palmer/tags/riscv-for-master-4.0-rc1' into staging (2019-03-26 08:51:35 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc1-v2

for you to fetch changes up to 620455350a8da7cc62ae82cb69dd5c556f744136:

  target/riscv: Fix wrong expanding for c.fswsp (2019-03-26 03:17:30 -0700)

----------------------------------------------------------------
A second RISC-V Patch for 4.0.0-rc1

Sorry for sending two back-to-back pull requests.  It looks like I
misunderstood Kito and there were actually two patches necessary to fix
the GCC test suite runs.

----------------------------------------------------------------
Kito Cheng (1):
      target/riscv: Fix wrong expanding for c.fswsp

 target/riscv/insn_trans/trans_rvc.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


