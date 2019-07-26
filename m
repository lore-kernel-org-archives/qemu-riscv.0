Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr9fK-00031m-PD
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 19:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hr9fI-0002xI-J8
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 19:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hr9f6-0007E5-8j
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 19:30:10 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:33592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hr9eu-0006N7-5K
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 19:29:58 -0400
Received: by mail-pf1-f176.google.com with SMTP id g2so25196421pfq.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 16:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Axm7ivFjIrAfDYo1sQiW0wWkU7rzfGqUzIpwsnxrpE0=;
 b=ezFQAU2XE2BkgUF8HyahAFHOKN9gBQBaWlElF6uM7eAnIGdV5PHz9iQFfza1w23Pia
 bPWheqakqqkem1CliCJl4G8nX3k/1VoFGMompN/pQTmXA8jEjuMc//x7D83r6ZJ6vzUi
 GLarSlP1NKiTzSsJq9MIk1BSRRrhwnnoxKRmKVBRG0l0bE8Mw4PBIDsKtZ+ReyG0Aj5z
 waRwXPqVTBo/XyR3us0QFBNqps0kbrOUxgaXF1x4ntf2vZOOTaANFc8WZao0pslDPjbe
 rE9R+mVXxHKUP4pk65Gy81l+iymcvbwqgyTgqHn/keRlsIFEk7yL7lpJXRimbsnje1hu
 Nt/w==
X-Gm-Message-State: APjAAAXkfzH0IbDxaxiwVKdxlNrxl5x1BCPrNAjjkHHRWL0YF3dXgYqx
 GU04L6mLSu3R/U0TFAbUeRY=
X-Google-Smtp-Source: APXvYqxr9EYC/coCqPGVVRoacy8HSgNwV5h/e0RjZcQFfAcqhm2aNvKfekerW+sp2OA0LtASrw6w5Q==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr24433808pgq.55.1564183671227; 
 Fri, 26 Jul 2019 16:27:51 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w3sm46899489pgl.31.2019.07.26.16.27.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 16:27:50 -0700 (PDT)
Date: Fri, 26 Jul 2019 16:27:30 -0700
Message-Id: <20190726232731.28572-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.176
Subject: [Qemu-riscv] [PULL] RISC-V Patch for 4.1-rc3
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
X-List-Received-Date: Fri, 26 Jul 2019 23:30:21 -0000

The following changes since commit bf8b024372bf8abf5a9f40bfa65eeefad23ff988:

  Update version for v4.1.0-rc2 release (2019-07-23 18:28:08 +0100)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-rc3

for you to fetch changes up to 75ea2529cf09aa4630c5357f9814f04b6697e8b7:

  riscv/boot: Fixup the RISC-V firmware warning (2019-07-26 16:03:48 -0700)

----------------------------------------------------------------
RISC-V Patch for 4.1-rc3

This contains a single patch that fixes the warning introduced as part
of the OpenSBI integration.

----------------------------------------------------------------
Alistair Francis (1):
      riscv/boot: Fixup the RISC-V firmware warning

 hw/riscv/boot.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)


