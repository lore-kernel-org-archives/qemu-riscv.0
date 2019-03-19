Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EU6-0007hO-CA
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ETy-00078U-BQ
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGd-0005MV-Ms
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:56 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33563)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGd-0005L5-H5
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:55 -0400
Received: by mail-pf1-x429.google.com with SMTP id i19so13635946pfd.0
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=R9yteLw804vBup5WfAuerJM1e2X1gT1roHQgAWe0O4E=;
	b=k+KJ3H8FXEmRI0hs41b7l9GkR6JNBT6W3zZTrMhyYhv3jWQeBFQzKalGOeo0YaVQ3R
	erVwXEC27e9BfeWwIRdHKbQmscdyddJmbGumr9G916FhuMA5n0ZW+dAY3HqgL9Ojp1fy
	M+KtuDWj9DhmIhBHd4tYyLEcw0shHKu6srSuN0S676y1yzTlksi0+zufwl4YFibqbMs5
	gpt1XkzvAg8mSKGpw/ivgB6/+bTVqVhpCUmxb1pRY5Zqmq3P5vbQpWv0sVEajbzFvM9T
	9q0YyqL2ElckbnEaFn0DcJiD6Z8RPIsntv7T1DGlLfAZ6MPgf16zw1PnqZEFNJQE+Jw8
	mwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=R9yteLw804vBup5WfAuerJM1e2X1gT1roHQgAWe0O4E=;
	b=ppbZm+cK3d0Yl7/IsVEFc+sEKwRaCb303EsfZ9n0tuSwTVUVgl/RCJYzYseEbgNjS0
	+2b8osSt7eJixpw7cD6T3NK6hVXgHWsW4hyfYH22PspR7EFtnak6N97RXlqTf+4mh9b0
	aT86ifB1XLMVkCUNPMl1oXZleRVASEhpEEoM3ctDjc4m93lw5TfMG6AeDoW+PNFG/sBZ
	49C4V4w8hJdiVR2lDpVsfi7S1OkNyGf71WJy+qkJNhukIhjdG5LnowopvvK2HQcjHJ5R
	8TmpDJlLX3i2WPrOcfjH0iEYcs/6waLlwX8qNcg15ckSLXlhlIMz9IuE+DrnI9n5iupC
	dbpQ==
X-Gm-Message-State: APjAAAURDEItBSPJ+0NFLlxys5i1IyPX9wkPSd4SHqSY+jP5d4E2sf+X
	6/oVBvENrw7rQwKkgGubhDP9v3xfgarFVecc
X-Google-Smtp-Source: APXvYqzNnzQD09dYcVBz+JgWeVqQviotRmkmo90NHuKkD2MRXmj4C7Qy99II9jrb1rBA3geph4MrDA==
X-Received: by 2002:a63:5515:: with SMTP id j21mr1794141pgb.244.1553000093943; 
	Tue, 19 Mar 2019 05:54:53 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	10sm19931256pft.83.2019.03.19.05.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:53 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:58 -0700
Message-Id: <20190319124803.13826-15-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-riscv] [PULL 14/19] RISC-V: Convert trap debugging to trace
 events
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:43 -0000

From: Michael Clark <mjc@sifive.com>

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Makefile.objs             |  1 +
 target/riscv/cpu_helper.c | 12 +++---------
 target/riscv/trace-events |  2 ++
 3 files changed, 6 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 72debbf5c5de..cf065de5ed44 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -186,6 +186,7 @@ trace-events-subdirs += target/hppa
 trace-events-subdirs += target/i386
 trace-events-subdirs += target/mips
 trace-events-subdirs += target/ppc
+trace-events-subdirs += target/riscv
 trace-events-subdirs += target/s390x
 trace-events-subdirs += target/sparc
 trace-events-subdirs += ui
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a02f4dad8c00..6d3fbc340165 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,8 +22,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
-
-#define RISCV_DEBUG_INTERRUPT 0
+#include "trace.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -493,13 +492,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
 
-    if (RISCV_DEBUG_INTERRUPT) {
-        qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": %s %s, "
-            "epc 0x" TARGET_FMT_lx ": tval 0x" TARGET_FMT_lx "\n",
-            env->mhartid, async ? "intr" : "trap",
-            (async ? riscv_intr_names : riscv_excp_names)[cause],
-            env->pc, tval);
-    }
+    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 16 ?
+        (async ? riscv_intr_names : riscv_excp_names)[cause] : "(unknown)");
 
     if (env->priv <= PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
new file mode 100644
index 000000000000..48af0373df6e
--- /dev/null
+++ b/target/riscv/trace-events
@@ -0,0 +1,2 @@
+# target/riscv/cpu_helper.c
+riscv_trap(uint64_t hartid, bool async, uint64_t cause, uint64_t epc, uint64_t tval, const char *desc) "hart:%"PRId64", async:%d, cause:%"PRId64", epc:0x%"PRIx64", tval:0x%"PRIx64", desc=%s"
-- 
2.19.2


