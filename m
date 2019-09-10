Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwA-00083L-43
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw2-0007t6-HL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw1-0006b3-FT
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:06 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xw1-0006aV-Ad
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:05 -0400
Received: by mail-wm1-f47.google.com with SMTP id t17so2327321wmi.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0zhLpxGbfvJYXKDT6JDUoSPfFak+q70sNluuZCqQPHw=;
 b=gbFwoK9nc8F72qSHlPuc/GYieMRozLT4d2zPmyufs9arotd9LiE770WGqYwNHVfEi3
 pOlDvSgZ9a+mobcfhYg++hQUkNCieP5jNjib08HEnlgTBX93J11v25rjXQ7nLinQr/Sb
 jRxnBFl+6Ao7cvRv/aQcj1lElcsipOSDde466o39XwTrtRKjuajknA2ZDPwLaTwNCT/D
 XN/lrQYHPihfdtyWJEowcObb4MarcxF11X8/B9JLvNb8AsJ6H4rnFNd06W3I/bnWGXGe
 RXkGzcfNoxBGLlIwRvxBzV7rxISWrmZ59V5vRgIM4Rft4k3EQVozQ8KP1sU3G7NKDY2h
 BrQg==
X-Gm-Message-State: APjAAAU31u8RmWq9Yo1ptvkgoVzE1nUoGbXw9CJ1HBXRFu85EIPIYcnu
 UvNWJK0YMymAF003acK8VwemL+PHI6UUyw==
X-Google-Smtp-Source: APXvYqzM5/Y2LKArQlJacpDa9q5tJDwufts+l7/1u5PKAO1U1GIbmK6/1nbI5glE/i4h0CQ0vyu0AQ==
X-Received: by 2002:a1c:cb83:: with SMTP id b125mr2997937wmg.43.1568190303900; 
 Wed, 11 Sep 2019 01:25:03 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id y12sm12645165wrn.74.2019.09.11.01.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:03 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:47 -0700
Message-Id: <20190910190513.21160-22-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.47
Subject: [Qemu-riscv] [PULL 21/47] riscv: roms: Remove executable attribute
 of opensbi images
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:08 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Like other binary files, the executable attribute of opensbi images
should not be set.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
old mode 100755
new mode 100644
-- 
2.21.0


