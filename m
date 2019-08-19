Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzgbU-0003EC-R7
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 08:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1hzgbH-00039s-St
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 08:17:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hzgbG-0007Gv-Ff
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 08:17:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38262)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hzgbE-0007B4-8w
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 08:17:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id g17so8500466wrr.5
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2019 05:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KWGpM2yFitmukAYRZPxrR2ZBIZTL/Or6P8Yp0GX2SU=;
 b=sSi+7gsKqtKPpyTyOFyo8hmsuPAruLqIR+noqR8QEaYN4LSeq8GhoVlEfebZ77AHO6
 NjI3W+comt9NigoZffxDP31PPok368ujseNULyvvy5GBKY5XH6rb4QCU5D9mDDJgIajc
 atEM07UgjUYlP0q5q0diPh6qI0QA+tNodGTaCe6JrxZc+tBeeMHvPjxG8ZHrsNqQ929O
 /jfl0Atn7C38oeIITbb6m6qwAm97+Wqpy0GyRkFkpv/E5ZGHrXiHd2htXex4Jb39Y5SJ
 K/r5GOo6R9MStPgt4AwlkzQfRgIxV9Wt8bSv5iXPTTKSZkxTNz5IMPeHW7QWgHqnakGy
 c9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KWGpM2yFitmukAYRZPxrR2ZBIZTL/Or6P8Yp0GX2SU=;
 b=sbZjepjeerfpsJfaFoCHbIDwI5fI9YFlYo4SYka6wS3tJYBcCnbpRoVYtyTSke2CV1
 Vk06iUSvG4sggS+w5MXgRmQMakH20XvjWz57P0i8+hd8OnQPWLSv66VIk4p3FjVtjiml
 SeMyoF7qGjjze+uDLQjE7bH+uUkekOj9PqxrVlVQv0B0aayp99NJfqe+fN9IUNSyBcYQ
 Z6JuoKKRld/GGKuLBADHGZ4Us298Obb3pIRNvfDIuGgyrkAUM1X/dHICnH07qgpckLFj
 0VWQB6C+cTskRGlXaNRlZjDgsCwfDfEu1FP6V90eaywTU8wFHCtkuZ4F7eu6UA/aRndr
 Nn8Q==
X-Gm-Message-State: APjAAAVpE7KBA3pLHsJdaKc/qOma5STqK5NAlkOxS2MX4ttgj0sTmXE2
 EYdhA1NOmYjQrI7S9fyR8e0/Ux42JAE=
X-Google-Smtp-Source: APXvYqwEy7hadn4nFPQBjIACGWP7GLdFGRt5iUGa5E6Eeg6xe+c8cfVHSfRnAiFteYih+XAW6xV4vg==
X-Received: by 2002:adf:d187:: with SMTP id v7mr17120942wrc.33.1566217038428; 
 Mon, 19 Aug 2019 05:17:18 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id t13sm15361389wrr.0.2019.08.19.05.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 05:17:15 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE19B1FF9B;
 Mon, 19 Aug 2019 13:17:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Mon, 19 Aug 2019 13:17:08 +0100
Message-Id: <20190819121709.31597-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819121709.31597-1-alex.bennee@linaro.org>
References: <20190819121709.31597-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
Subject: [Qemu-riscv] [PULL 11/12] target/riscv: rationalise softfloat
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
X-List-Received-Date: Mon, 19 Aug 2019 12:17:36 -0000

We should avoid including the whole of softfloat headers in cpu.h and
explicitly include it only where we will be calling softfloat
functions. We can use the -types.h and -helpers.h in cpu.h for the few
bits that are global.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Palmer Dabbelt <palmer@sifive.com>

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


