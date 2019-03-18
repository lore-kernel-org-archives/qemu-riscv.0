Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5kuy-0004uc-0d
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 01:34:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h5kut-0004tM-6Z
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 01:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h5koi-00082p-SI
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 01:28:09 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h5koi-00080p-Gg
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 01:28:08 -0400
Received: by mail-pf1-x42a.google.com with SMTP id v64so10492301pfb.1
	for <qemu-riscv@nongnu.org>; Sun, 17 Mar 2019 22:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=8uyxCFXKVpxieJo55+tTf+yf8lb5MUo5y+B2JpRRujk=;
	b=lK3hL8+aACJ/TZP37q5WMb6kfNbaO9LTo8emNdl1xHVwPSFJ7GJ+OKc3FBLdChahra
	CMtPbK4n9V3m7isvnlNvlhPOsIV03pFLvurcQhIFYYtong06ZrrJ5qpSGxZ5ASPTxCtn
	elHrD4jamaeca5XA0BQPy6n6I6qkMmDFageDFn6ej6GZuOocH3aLT6ZftovsfNaiGSFa
	AqIVXB7wspBZbErsYjllvfuopYlG9rhqavSIiifH7OlU/2uEzImsQotBRbIf7WTmlXnN
	V8i53sWljCJU6bXzAXTjGT0QTZJPsT8oFvayymcGvGbh9XMzVPrpxvvqY5fivCYLtjH/
	MovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=8uyxCFXKVpxieJo55+tTf+yf8lb5MUo5y+B2JpRRujk=;
	b=iTarih0ZKwf9FUmmC8n+AYCMMCi65OwWtQ6oc8YaHEgRtrWqY6ZowCQgCc3I39WWIc
	e5iaXY/lKyWp4i+8ap7a/8ZUQJoEbdK2/MVtoYfpftP4usXYOsQDwQcJVwmeyAUrJ4hV
	Ao5ZmN0JMDFucCVBOLEaWeuZZRoS29zatlsIv/0wF02TjT8af1Zbb5c9/vgl0rIm/t9m
	+MNoRr6jNgvZ+/GOYkdSJDCml+WcZbVflCc0aiwO87naLSLeyZPuepCw5zUSPvsm3hMK
	ejfYWyKq7lAAohH4cKJeV4/xWGL7QNCwCrRKxZIsuwHDaLK8/wU74YcN+ihNre7aqGXg
	9MFA==
X-Gm-Message-State: APjAAAVPsheT3WoRfstkLHixvt5A8gVxFefRltWpiaHv44DfT4lni9uv
	V0zNXxoqJF/+/evFCN5P1h0SfKQ+ycxBliWp
X-Google-Smtp-Source: APXvYqyaejkYksNdFWwT4INGDYYvp79kYtCOBRiKyhIlx2UiI0mFVZC/OGifLf8HplvSzUCNh8/+Ig==
X-Received: by 2002:a63:ed0a:: with SMTP id d10mr16040191pgi.452.1552886886710;
	Sun, 17 Mar 2019 22:28:06 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	x19sm11962372pfm.108.2019.03.17.22.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 22:28:05 -0700 (PDT)
Date: Sun, 17 Mar 2019 22:27:58 -0700
Message-Id: <20190318052759.10860-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-riscv] [PULL] A Single RISC-V Patch for 4.0-rc0
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
X-List-Received-Date: Mon, 18 Mar 2019 05:34:34 -0000

The following changes since commit d4e65539e570d5872003710b5a1064489911d33d:

  Merge remote-tracking branch 'remotes/rth/tags/pull-hppa-20190316' into staging (2019-03-17 14:10:52 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-4.0-rc0

for you to fetch changes up to f330433b3633647b047cfa418c2ca4d18fda69c7:

  target/riscv: Fix manually parsed 16 bit insn (2019-03-17 22:21:32 -0700)

----------------------------------------------------------------
A Single RISC-V Patch for 4.0-rc0

There was a regression introduced by the decodetree conversion that has
a fairly straight-forward fix.  Since this fixes bugs that everyone has
hit I'd like to target it for rc0.

----------------------------------------------------------------
Bastian Koppelmann (1):
      target/riscv: Fix manually parsed 16 bit insn

 target/riscv/insn_trans/trans_rvc.inc.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)


