Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvlTk-0004Vx-Uo
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 12:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55131)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hvlTh-0004T1-JB
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 12:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hvlTg-0007aw-IE
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 12:41:25 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hvlTg-0007Y1-Bj
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 12:41:24 -0400
Received: by mail-wr1-x444.google.com with SMTP id p13so20997200wru.10
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2019 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHaCdXGh8EVx3YP7Nogh/BDIDsukD0V5+eFPdAJezxc=;
 b=UMFGPkoU2A4+TW8JBjGnCbCQ1uvS4Eh3Mmhb7j8A30QiJ7KeZJ7XUmGP5N6jzwM5kA
 YePjMDh6mdXz7e5FE2SRpix2BlNJ30f6SbSCuIKLo4fiN6SQ05/PlvrtmX7UPRAb1MkP
 JfJ36xm2fy3iUddb6j64Xk3nLhEuOt9DsUs3ZgLKRtG4jc4f1e7yM1KBhiCJP01x5v+W
 lL2qDqDynhlrdgh8KKmytOfnduKPsXZf87YHyWY4hgGgVR+8WsteTLWXNut/WkyMlked
 H/ewRrIDNo8tJ0bPUQG0jShypTe95nV2Pd484MjpUib2r/xvImog9fNuH3gNiXmqberP
 c6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHaCdXGh8EVx3YP7Nogh/BDIDsukD0V5+eFPdAJezxc=;
 b=l+QfzwHNNmpTGWCoc39X459JyHKBV9TRPgor8CbVK2d5p6fk24TK6YwT89MUeYbDcd
 SzjQqy85Ig/W1RJUK1RukCMmBRFmGEzN0oyX7jH6wtftihHI4XdzBCsSztqnXZH4N5s3
 8ypg7BU9Gr80Nnd3ORMaQmIXhvSjts8+cpyUZt6NvY64K9LI6Z1g4jVnFcpY7jtRnDMv
 mFhNTNPfxEIyPHUJ1E7RpTyBkZrkOMWk3hiLzgMsEWdPi3loHYuwvNZyEYstMeF7gCO/
 s52pOVfWke2+88Z4ncVgZmEAlTAHEa1gwLXL02Kir+ncMpbB/UGYBDS6dUu+/77+ZClI
 /BeA==
X-Gm-Message-State: APjAAAVthHpkK7Wdryc78C2+4kZ8Z3iTUDYVSv32xA34Dcj3nFf68ZD0
 WUSzZzmsDCDnEobg5zjtOJe4Td9YH6I=
X-Google-Smtp-Source: APXvYqxq1DKzJ+i4SvL+xtkeP4oNgxjKqitw7robVC0J6Lv/hoxrq56fIjVWcWln5cbjEemguC0pDQ==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr2135215wrs.347.1565282483044; 
 Thu, 08 Aug 2019 09:41:23 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id u130sm4469137wmg.28.2019.08.08.09.41.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 09:41:21 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 188D11FF93;
 Thu,  8 Aug 2019 17:41:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Thu,  8 Aug 2019 17:41:16 +0100
Message-Id: <20190808164117.23348-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808164117.23348-1-alex.bennee@linaro.org>
References: <20190808164117.23348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-riscv] [PATCH v1 6/7] target/riscv: rationalise softfloat
 includes
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
X-List-Received-Date: Thu, 08 Aug 2019 16:41:28 -0000

We should avoid including the whole of softfloat headers in cpu.h and
explicitly include it only where we will be calling softfloat
functions. We can use the -types.h and -helpers.h in cpu.h for the few
bits that are global.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu.h        | 2 +-
 target/riscv/fpu_helper.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd20ad..6d52f97d7c3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "fpu/softfloat-helpers.h"
 
 /* RISC-V CPU definitions */
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f329..240b31e2ebb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -22,7 +22,7 @@
 
 #include "qom/cpu.h"
 #include "exec/cpu-defs.h"
-#include "fpu/softfloat.h"
+#include "fpu/softfloat-types.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index b4f818a6465..0b79562a690 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
 
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
 {
-- 
2.20.1


