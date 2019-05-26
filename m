Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxc-0003us-Pn
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxM-0003S6-Gu
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhg6-0005zm-1q
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:23 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:46116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhg4-0005vu-8U
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:21 -0400
Received: by mail-pg1-f171.google.com with SMTP id v9so690102pgr.13
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=rQikxxt+UmlrWVINybj5QUluVzDygdebQ0Xpvz/1e7k=;
	b=Vn1lii/DcqJI4N58r6ePHjLUZKrSOeQekht3uwv9OzIkLNV9uS8aNtTT4XC3y6LsMG
	2gfs9TPNWpJu4EO4DJRQ8ryjd+qCkL/zAe53PKsntHFyNxBsCf/qgyreuYsggkIlnMd4
	4tdt8D2N8QBp2G9nRNMyVUiMgPF5UG42dJxqpEwtOFqiuak2IV8paI6Of9ZS9aga0noi
	4B+Tl/qiZjq9pplGVBub07fvXPVTusXDM4n/ALDAkutux4uLLSHKJaSQPz7UkwyLmzwF
	eG4ya3tXbmGFFnHhre08CXzvn9GtMhBktGW5liKdF5ESaOF6EoYahKsobi90lh1P4edf
	Y2tg==
X-Gm-Message-State: APjAAAWp8NCV/xB5eS/RnXP2FyCg9I4sHQyN5Rk2mdJQiG/2mddBkb+v
	ccBaN5vMI2xB15yNp8XuwHPwkOUQA2k=
X-Google-Smtp-Source: APXvYqzeNkNqpZeOsUJoHcsQ8ErWv3RvsPgDMQm9i9j+yVlV8Ql51YaqiPnTVnhaG1KPLQqc4OKsFA==
X-Received: by 2002:a62:b517:: with SMTP id y23mr40368751pfe.182.1558833018332;
	Sat, 25 May 2019 18:10:18 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	p13sm9322808pfq.69.2019.05.25.18.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:17 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:31 -0700
Message-Id: <20190526010948.3923-13-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Jonathan Behrens <fintelia@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.171
Subject: [Qemu-riscv] [PULL 12/29] target/riscv: Remove unused include of
 riscv_htif.h for virt board riscv
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
X-List-Received-Date: Sun, 26 May 2019 01:28:13 -0000

From: Jonathan Behrens <fintelia@gmail.com>

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc4c6b306e13..352646303420 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -29,7 +29,6 @@
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
-#include "hw/riscv/riscv_htif.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_plic.h"
 #include "hw/riscv/sifive_clint.h"
-- 
2.21.0


