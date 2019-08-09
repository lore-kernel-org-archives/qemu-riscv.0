Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hw13u-00064S-4Q
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 05:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48073)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hw13s-0005zl-0e
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 05:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hw13r-0007e7-11
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 05:19:47 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hw13q-0007cu-QE
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 05:19:46 -0400
Received: by mail-wr1-x442.google.com with SMTP id g17so97562692wrr.5
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2019 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECv7P3HJHBY/e1Rr1VXbOKCzKrV4OGAXQsEe8ka+MiU=;
 b=POyAZCZo37L7qmzJ2UiFAtXuV52U+/+i4UscFsPLALzPiWP9jFiCZO3Z415eD8TNgN
 egZ9HD9uJUJzs/lBfi7+PHYOpKqOm8toJ90fSrkPlbTNYxPU0UUGNkFVXzMVehUuSYUj
 KaTOYp/nN6S9NuEozulvRnjJOUFSkKGtGOv5J1MqPZfm4ekfp+ZDOyObGnHem3Lz7D6p
 DpIjSsFaJw8ee3zcLbGU0BwjGQZyz3DGjPr8tNWEh6v1EBQOLtEYOeGPFtNzcemRFLMP
 LpKlIc9a7RyESKZEQWPtFSi+EWvc/3+Vd/QO4j/I+ytSLNC68xEt3NqYmLaf0LlZ2K3Y
 NHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ECv7P3HJHBY/e1Rr1VXbOKCzKrV4OGAXQsEe8ka+MiU=;
 b=aoQ8aFxAbAsNQ+2+he/W+ryU7aPFaRYscKHeV50fU1/3DSd2ZWFlsWtEpw94otTFNL
 MsJsgZQsWW+RD1ZuASsF89k15GfK9pzImXrFVpSJAcPxhnr1eD8xIWsHUjsOqMlttyyP
 sGi/BFD0lDj5Q0gcMn4JRgfK//qPFG+CNVh9hTNLewL291obYymijW/o7ZlGk9EN2NV5
 J99/bSdawB0GuQFK9WFnLQsPttyJaghXHNcMwIPjjOO6FAAu6/+DTjjjIQMsHQEyQTok
 ppXTuDdt+fhSUFuE2c2IIbcANS0g8Lu8VDta7v8o6izh7NYzTuRgfE3cO94bTy2CN5yO
 PC7Q==
X-Gm-Message-State: APjAAAWhHwTEYYcBf9oN0KWcXzHpTBKIVqHNLvfsMQbLEkb/TQshen2O
 99gc7nKHhzslqGydbGU7iaaNqQ==
X-Google-Smtp-Source: APXvYqwhVWDecAFxQcrBYFm0lfO3vwJQhv27lTk4b+5Vsi3ylJv7VFX+Pv5lsAWnAr38LSHPgMQl8A==
X-Received: by 2002:adf:eb49:: with SMTP id u9mr23604502wrn.215.1565342385660; 
 Fri, 09 Aug 2019 02:19:45 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id q18sm121726388wrw.36.2019.08.09.02.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2019 02:19:43 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70F571FF93;
 Fri,  9 Aug 2019 10:19:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Fri,  9 Aug 2019 10:19:39 +0100
Message-Id: <20190809091940.1223-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809091940.1223-1-alex.bennee@linaro.org>
References: <20190809091940.1223-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-riscv] [PATCH v2 6/7] target/riscv: rationalise softfloat
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
X-List-Received-Date: Fri, 09 Aug 2019 09:19:49 -0000

We should avoid including the whole of softfloat headers in cpu.h and
explicitly include it only where we will be calling softfloat
functions. We can use the -types.h and -helpers.h in cpu.h for the few
bits that are global.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


