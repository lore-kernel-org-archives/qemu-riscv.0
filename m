Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH2G2-0001o6-Ps
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 05:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2G1-0001kJ-8J; Tue, 02 Mar 2021 05:28:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fz-0008MH-OI; Tue, 02 Mar 2021 05:28:00 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so34251066ejc.1;
 Tue, 02 Mar 2021 02:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGeOm0jundDRZ1ITFIsaK/vmviPguy9Zg4MX9Tcr6Ys=;
 b=FxCLDzNz6QdYCdDoY45WVE53tN9ZvFhJ/jwMOjKC8oaESrRhF7MIdsPRyP/PtAqm45
 +BZBOuCyrnW5MPhOgWZOSzYbh3paahSGCRQ+BUaZ/UmeZwaxbQHWfRjDf0fp35Qy5HzU
 a5e3aNUGk0z3rcrp+QAVUaIgdfatSvwNKaa6crhUO6Eun7l2V52NtDQz8pqtKIGUwUZ5
 UIbY5lwY9ekZLR2GAVIaVLQqThMZlAqVGbXaJK6LQZzC03NFPWcwpCqAPA7gUflYxFGE
 bglfG+HwMOaZQ0gTvyITMOTpR1XZLX0vzBOgSXey+rBfV9NgonVfkwBMPHQzeJjiLxUf
 +WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CGeOm0jundDRZ1ITFIsaK/vmviPguy9Zg4MX9Tcr6Ys=;
 b=J/plKPfx+V2CR390kCrEtH6IIn1t3Eb4N7LEvbWpWgNbYAfjEyx2rKVYdsd/SLu91S
 oMV+6cM6/r6dbfrBFFKkB5DCSZ7ATdr/+d8BCC59RaUcqNxWpR8CkwFEqmWbv//KXbHN
 ERxb/3LF4VdUt6Rz2XdSlomyTxeOi33rVDR58uYzyLefVqHQl/L4c1spYbwChsitEPtt
 EdybTHuZ4Lpq/HmD1uqblUkRTsoEFnwRB+fkTaBMbrfeNXLTeIuyLyauujbFskgROT8S
 3OVs283WPI6/5pKh8gQ/V9+offiB/SXITLZShUjrBj/y4AZtDcvj0Rr5+7z2o0h6Hk/9
 yCpg==
X-Gm-Message-State: AOAM533ovKuyotdGjkjHq7dsUPqU91k5VZbhC8wm+sHN/c8aaeWg0LEc
 Ov8WjABiAtwx9R2KZU5jBgKqnXK2kqQ=
X-Google-Smtp-Source: ABdhPJzO+Jhty7XbLj0/S3RSIAptV1dIz+4q3kpugmP/ye1w47tvloBRfq5MthO7lqIoxawRs1hMKg==
X-Received: by 2002:a17:906:1b54:: with SMTP id
 p20mr14852707ejg.307.1614680874854; 
 Tue, 02 Mar 2021 02:27:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l61sm19862564edl.37.2021.03.02.02.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:27:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Chris Wulff <crwulff@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Anthony Green <green@moxielogic.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marek Vasut <marex@denx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 2/7] sysemu/tcg: Restrict qemu_tcg_mttcg_enabled() to TCG
Date: Tue,  2 Mar 2021 11:27:32 +0100
Message-Id: <20210302102737.1031287-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 02 Mar 2021 10:28:01 -0000

qemu_tcg_mttcg_enabled() shouldn't not be used outside of TCG,
restrict its declaration.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 ---------
 include/sysemu/tcg.h  | 9 +++++++++
 accel/tcg/cpu-exec.c  | 1 +
 tcg/tcg.c             | 1 +
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..7f57e57464b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -454,15 +454,6 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     }
 }
 
-/**
- * qemu_tcg_mttcg_enabled:
- * Check whether we are running MultiThread TCG or not.
- *
- * Returns: %true if we are in MTTCG mode %false otherwise.
- */
-extern bool mttcg_enabled;
-#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
-
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index fddde2b6b9a..c16c13c3c69 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -17,6 +17,15 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
 
+/**
+ * qemu_tcg_mttcg_enabled:
+ * Check whether we are running MultiThread TCG or not.
+ *
+ * Returns: %true if we are in MTTCG mode %false otherwise.
+ */
+extern bool mttcg_enabled;
+#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
+
 #endif /* CONFIG_TCG */
 
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd8..7e67ade35b9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -39,6 +39,7 @@
 #include "hw/i386/apic.h"
 #endif
 #include "sysemu/cpus.h"
+#include "sysemu/tcg.h"
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197bf..4a4dac0bb3e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -65,6 +65,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
-- 
2.26.2


