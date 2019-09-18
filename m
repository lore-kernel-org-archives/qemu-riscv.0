Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsJ-0006rp-Nc
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsE-0006j6-Bf
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsD-0006fD-5D
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:06 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:44365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsD-0006eu-0d
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:05 -0400
Received: by mail-pf1-f180.google.com with SMTP id q21so180928pfn.11
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EmC0jz3GTl2BrX2tWMEAqndIZJCvRtbADNjHP8GTEXU=;
 b=I3hFBIw1cOZmsi+IdBb6IMEwpU9QZMkKk6dK/x3NKrWfNzPcdgpA105J/5noWDwveC
 TTMhNgZv/6HF5xootzXOlPdEY5HhwCgIfeajwOtw8JHrNd7+mbwFJ01nFuqjkvn0/naw
 d9Bj3r44WzbqQoMBTDObOSGV6j3t6Jgv+iSwLPZrtprQqA+2BGwW9N5L+0FF7bOmJJqF
 f9fOLnxen2Ke0c5wr8LBdITyIA0hQg8wLlgfc/MzlqqOE7nzYFqJmFSfIJkE1GDFd5ib
 2J9hm5bjaJocWMYYiHSCNuuXcqoA/lA4BnL7I7uqJWzD+MfdfbGymEkPsUeBhLlKOXcw
 GF6w==
X-Gm-Message-State: APjAAAXewn7Y2HcOu3A3RhmqSMFB4yRsFtg8l07lmFZMPzUT4r9ddGQ8
 1ieQxyF42UywmJ0aiE4CASGwuyVhVZc=
X-Google-Smtp-Source: APXvYqyxP8Dx+q3aWO2zM+Zsmg68F/He/iMX6soMeNmsSgOAi9FcdlHFhbmd2IaqykAnN4Rcf4KsUQ==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr4314838pjg.80.1568820483582; 
 Wed, 18 Sep 2019 08:28:03 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d190sm5765349pgc.25.2019.09.18.08.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:02 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:06 -0700
Message-Id: <20190918145640.17349-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.180
Subject: [Qemu-riscv] [PULL 14/48] riscv: hw: Remove duplicated "hw/hw.h"
 inclusion
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:09 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Commit a27bd6c779ba ("Include hw/qdev-properties.h less") wrongly
added "hw/hw.h" to sifive_prci.c and sifive_test.c.

Another inclusion of "hw/hw.h" was later added via
commit 650d103d3ea9 ("Include hw/hw.h exactly where needed"), that
resulted in duplicated inclusion of "hw/hw.h".

Fixes: a27bd6c779ba ("Include hw/qdev-properties.h less")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c | 1 -
 hw/riscv/sifive_test.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 9837b6166f..562bc3dc4c 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "target/riscv/cpu.h"
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 3557e16701..711740939e 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
-- 
2.21.0


