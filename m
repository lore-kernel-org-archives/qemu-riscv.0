Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIMoc-0007Do-N9
	for mharc-qemu-riscv@gnu.org; Thu, 01 Nov 2018 19:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoa-0007Cr-SH
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoZ-0005Gy-SP
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:52 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gIMoZ-0005G7-J2
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:51 -0400
Received: by mail-pg1-x543.google.com with SMTP id s3-v6so96203pga.12
	for <qemu-riscv@nongnu.org>; Thu, 01 Nov 2018 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=CFyilsJ4zBRmNwmLuX8k666TGyY+hBpyn5KMF6kl5Qs=;
	b=Lle6y7UUPcwqNoW/DBGsi07tdrCfEvdKufvro8pa10wlQ0visDYEqou+2u46Q5M2zt
	FC8vYpZFV4c/zswPWXIoji4G+fizaHD73B3Gl7nDPzezJYAf851YziesUSVn3vR5fIkj
	SK1hIi0UVNirC/x7cgxSngIKrIC9iUN1jwBq2Z5csQgLEG4KEoEdeltFQucAj+Q+oXLn
	2djA2U5PLcC2RIf1RO2Vo+YACfW0IZNqN0/a19LnP0xyM6KMoIXW67BncmzUe9/8BbJc
	nUTHTT6RAeXkauIrPQYx4WDwsLej3p3FUUnnFdamMBy01i4FfAamzXCH4TrXwn03LIHH
	0O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=CFyilsJ4zBRmNwmLuX8k666TGyY+hBpyn5KMF6kl5Qs=;
	b=dn9Ozj9w2fqfWRIyD7RiwpJMZ4BtsAEpUGd8bQr7EOXSfljTTYMupjUzqHXu6dOfcC
	50ckV8WCkfflLBuHoOwwgTAgxhxC7lPc9946Hwob80mHyW2qFmq4Mq7zzExEYkuJ/5oX
	exGJREqgREst3yabWbHQDJQVSkBPeCnV69FDj0uBVxXJibFPFjRGHtDWMs5+WWPPvICp
	+Qf2z0bV6dHRGyzYxpX5FgDm8mq2b7sncVw9uOUqK6QAvBZIvX+lfZNbRW5aQVtGtC6A
	VKVk80wM2BAcy7i0cQI6wBuuyXteJhtPIefRWqWzB1xqvz8Gl3B53Niyl37Auzci/WSr
	yFGg==
X-Gm-Message-State: AGRZ1gKEgsXh2tgWKtteyhi1SlM/tLWQNT3y2IfbUzod4GlkKy9k5ONy
	DnjajAQxy1gXD9Z+WC1KW3j7BKw6SIk=
X-Google-Smtp-Source: AJdET5fooqVSArYuIzjtpC0x8c14+o2BnGlL2aq6FYk6oskOBhAMRbmBcdvAeDIOPvqMMS0W4k26AQ==
X-Received: by 2002:a63:181c:: with SMTP id y28mr8727934pgl.75.1541116550144; 
	Thu, 01 Nov 2018 16:55:50 -0700 (PDT)
Received: from localhost (198-0-202-11-static.hfc.comcastbusiness.net.
	[198.0.202.11]) by smtp.gmail.com with ESMTPSA id
	b18-v6sm11935667pfb.96.2018.11.01.16.55.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 16:55:49 -0700 (PDT)
Date: Thu,  1 Nov 2018 16:55:24 -0700
Message-Id: <20181101235525.29042-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181101235525.29042-1-palmer@sifive.com>
References: <20181101235525.29042-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PULL 2/3] Add Alistair as a RISC-V Maintainer
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
X-List-Received-Date: Thu, 01 Nov 2018 23:55:54 -0000

Alistair has been contributing to the RISC-V QEMU port for a while now
so I'd like him to be officially listed as a maintainer.  I've checked
with the other RISC-V maintainers and there are no objections, and I've
also checked with Alistair so he knows I'm volunteering him.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d794bd7a66fe..d550fd8b809c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -241,6 +241,7 @@ F: disas/ppc.c
 RISC-V
 M: Michael Clark <mjc@sifive.com>
 M: Palmer Dabbelt <palmer@sifive.com>
+M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
 S: Maintained
-- 
2.18.1


