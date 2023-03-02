Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoNq-0006bM-Tm
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNo-0006Wi-8J
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:28 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNi-0000jk-IA
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:25 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v16so204535wrn.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgR0BafSwr/xFk3Gul6hkEhAD3BiZ8Amj/PZ/fIFDYU=;
 b=CbQ/ZT0faM9y0BcdM4/6VmBVQdaipLI9UP9B1iQ79Lp2b+xsIx29VqLhFJKFZc/Ulu
 I+vQa5AX5fafjTFgTneZVDSJ5fI7Mv0XUwKU/WMCQFPyCVNpVIxeHYK+FpKkNdOrnQCJ
 uVcxVJX/6MQWS83Nyl/ojLyZt9sOXLzhLqO1lFMWVoW89twlu7QaKfjMcr1m7GS5Quui
 +P2G7VxnpzNAM0J/Xd68joRFn24GaOhNZF6J94Pdy5qXeD0NRhMRPjwVhCX/jdFsdqbv
 4VzjrZbgbd4Yk4Pu4pHHXIO9RIodrQHrRtJqsW1d0xGWt29KcgMUw1Eib5ZXMF2Ot+P6
 oOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgR0BafSwr/xFk3Gul6hkEhAD3BiZ8Amj/PZ/fIFDYU=;
 b=liH/l3gyB6WwlbFGSCS/SvXhLozoFlBfEH7HOGa+mSoF7qWWLASLO2ojwxHLoqn3rk
 QvRyGqljixSmsrmopNvoaJMed4VWVfQvkJJvJm0MPsW2CNwB2eenajiPZFsjv/GUglPq
 D2KB+Q2jw/i07z5gEDE8Ho4Yu+Ftp6JCBnue3wCk2y2CGPyg7DyElVhS6m9AnHSLCQJ0
 IEUEltDLQ+jRDzS1Pd+giiwGExnUwCKVtfYaul1aAdX5IoYNwm3oiAfhqv+9wFWt943y
 C8OyNRqgWQ+aOpMWHBvRpWwWJ0O8H4Arzm7/axwV8mYeDjUMxyRqrFJzT67m0+QWah5O
 2fJA==
X-Gm-Message-State: AO0yUKV8ShZoO+ZxhKGnWdm4DIwtH28suThrSqXxuDwbtrII0Tqjb8zz
 EBzanuUaMDBJCdd68OgtCpw+ng==
X-Google-Smtp-Source: AK7set8XhP7Tb7WaUT2oF6JYru6UyUgQidrCsZH6AblGaUVm28R7DrOCkQhKIja81uQTjnsQfkgr4w==
X-Received: by 2002:adf:e84b:0:b0:2c7:995f:3030 with SMTP id
 d11-20020adfe84b000000b002c7995f3030mr7906944wrn.60.1677784460723; 
 Thu, 02 Mar 2023 11:14:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4081000000b002c71a32394dsm143542wrp.64.2023.03.02.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CD101FFC9;
 Thu,  2 Mar 2023 19:08:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 nicolas.eder@lauterbach.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Marek Vasut <marex@denx.de>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mads@ynddal.dk, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 24/26] include: split target_long definition from cpu-defs
Date: Thu,  2 Mar 2023 19:08:44 +0000
Message-Id: <20230302190846.2593720-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Mar 2023 19:14:28 -0000

While we will continue to include this via cpu-defs it is useful to be
able to define this separately for 32 and 64 bit versions of an
otherwise target independent compilation unit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - update MAINTAINERS
---
 MAINTAINERS                |  1 +
 include/exec/cpu-defs.h    | 19 +----------------
 include/exec/target_long.h | 42 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 18 deletions(-)
 create mode 100644 include/exec/target_long.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d0113b8f9..3ef68cd0cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -137,6 +137,7 @@ F: docs/devel/tcg*
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/tb-flush.h
+F: include/exec/target_long.h
 F: include/exec/helper*.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index be920d4208..cd8aa177cc 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -55,24 +55,7 @@
 # endif
 #endif
 
-#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
-
-/* target_ulong is the type of a virtual address */
-#if TARGET_LONG_SIZE == 4
-typedef int32_t target_long;
-typedef uint32_t target_ulong;
-#define TARGET_FMT_lx "%08x"
-#define TARGET_FMT_ld "%d"
-#define TARGET_FMT_lu "%u"
-#elif TARGET_LONG_SIZE == 8
-typedef int64_t target_long;
-typedef uint64_t target_ulong;
-#define TARGET_FMT_lx "%016" PRIx64
-#define TARGET_FMT_ld "%" PRId64
-#define TARGET_FMT_lu "%" PRIu64
-#else
-#error TARGET_LONG_SIZE undefined
-#endif
+#include "exec/target_long.h"
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 
diff --git a/include/exec/target_long.h b/include/exec/target_long.h
new file mode 100644
index 0000000000..93c9472971
--- /dev/null
+++ b/include/exec/target_long.h
@@ -0,0 +1,42 @@
+/*
+ * Target Long Definitions
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _TARGET_LONG_H_
+#define _TARGET_LONG_H_
+
+/*
+ * Usually this should only be included via cpu-defs.h however for
+ * certain cases where we want to build only two versions of a binary
+ * object we can include directly. However the build-system must
+ * ensure TARGET_LONG_BITS is defined directly.
+ */
+#ifndef TARGET_LONG_BITS
+#error TARGET_LONG_BITS not defined
+#endif
+
+#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
+
+/* target_ulong is the type of a virtual address */
+#if TARGET_LONG_SIZE == 4
+typedef int32_t target_long;
+typedef uint32_t target_ulong;
+#define TARGET_FMT_lx "%08x"
+#define TARGET_FMT_ld "%d"
+#define TARGET_FMT_lu "%u"
+#elif TARGET_LONG_SIZE == 8
+typedef int64_t target_long;
+typedef uint64_t target_ulong;
+#define TARGET_FMT_lx "%016" PRIx64
+#define TARGET_FMT_ld "%" PRId64
+#define TARGET_FMT_lu "%" PRIu64
+#else
+#error TARGET_LONG_SIZE undefined
+#endif
+
+#endif /* _TARGET_LONG_H_ */
-- 
2.39.2


