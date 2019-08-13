Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxWMQ-0005dx-Qi
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 08:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWMK-0005bb-Fg
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 08:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWMI-0006NF-Ha
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 08:57:04 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hxWMH-0006Ll-Rk
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 08:57:02 -0400
Received: by mail-wm1-x343.google.com with SMTP id l2so1367115wmg.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NhU5Jn6aRhUkVeAxdLRNRjvBS88J8AMxyLyTZHIDgUs=;
 b=y34tfAgMEXrAcjHKNjsPdgKQTfH4+EMkXrl+0P4gcDAmKfiXmOEcpIcehyAwQiPxp/
 WuWKU7QdLHUMGPAPruPWDyjNcmkDFubxKNhV3Tfug6SccpAEgZ2Cub3lCkKagPkTkBDE
 Oak67/25MeG626YoiU5eV93gat2u6JVg6RsyShIAHxSTQYIs72BRdRQ5zMH59SQyFVKA
 Y2U1gLfUW1KAhZYFBxrVR+l3EFUSk9mKGRBuNP5YV8K7i4wD8Xs185hCQ3lpgNwfQ48C
 D7js1P9qjLGmwyEUD3h/t/TAdPlRuVnfIcM4szBqjCBC/wwe1+B/QAbfnF6N5991mxER
 2g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NhU5Jn6aRhUkVeAxdLRNRjvBS88J8AMxyLyTZHIDgUs=;
 b=sopPs0wO9XPpbd+HnZN48cRwfhQKt4p4l2pAWac5wOpqj2Y5jh/zjHABtpLMgJIc2a
 MsBbbolsH3IrO8Xr+wOz9qTzVke30k/k/9N6N051f3CvmDvRp/fVvqG4ACcUAwilhEaq
 kB9tHyhlo9QfXhzOOhYxXJj49mzheXAmTzaXtPa6LWH/n82QNdpYuCsA5/nqPCA0CElS
 pUN+wgMpqFgfCRvSmjrziCiknMDeIFzozO6qXHqMYdX5Km0sh/B7TuNOHP8rz1pbcYlR
 Kl22XVYcWoKL/ABMzv5UTa4ea6FNvQxa2q6NIlRcH4ZTe8fyPGWaZVPzrVbO8JTL73EZ
 ZHew==
X-Gm-Message-State: APjAAAW55JgIUgkMWilavYrt8tBzcGVsHfAKUGH3mcHPN3JZixIV1ESv
 sfSKtl754Eqc8RBqvJD6TVFDhQ==
X-Google-Smtp-Source: APXvYqwmAf6c6Jqe1j2TM6xrZp3G0tCkAl3u7jBxvAlDJcddN0VIeRSucCSg7gcV+RhflhVmEgLOiw==
X-Received: by 2002:a05:600c:207:: with SMTP id
 7mr2950991wmi.146.1565701019569; 
 Tue, 13 Aug 2019 05:56:59 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id j15sm8296188wrn.70.2019.08.13.05.56.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 05:56:59 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 067901FF9B;
 Tue, 13 Aug 2019 13:49:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Tue, 13 Aug 2019 13:49:45 +0100
Message-Id: <20190813124946.25322-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190813124946.25322-1-alex.bennee@linaro.org>
References: <20190813124946.25322-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-riscv] [PATCH v3 12/13] target/riscv: rationalise softfloat
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
X-List-Received-Date: Tue, 13 Aug 2019 12:57:06 -0000

We should avoid including the whole of softfloat headers in cpu.h and
explicitly include it only where we will be calling softfloat
functions. We can use the -types.h and -helpers.h in cpu.h for the few
bits that are global.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


