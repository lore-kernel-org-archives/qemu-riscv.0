Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH2GL-0002ce-N6
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 05:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2GJ-0002Z5-Uz; Tue, 02 Mar 2021 05:28:19 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2GI-00006V-Cg; Tue, 02 Mar 2021 05:28:19 -0500
Received: by mail-ej1-x636.google.com with SMTP id w1so34256820ejf.11;
 Tue, 02 Mar 2021 02:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=McvAeDL2KZLDlk5j6C9DReDRrG7DxVQ7/lNaBCKmKts=;
 b=G6+H7LPveVxfZYZ4gAzuBUFPrN0eUG3vlxbvzuWjj9a5rM1GHBKzhzr7xM0a03Negb
 M7K7lvV84PeIbZuTo4kWojNmt50zInB7lqPRMqLKGUFlR9h5PwRFGYJvmYXSbDGXkbez
 8JkR+MBODwLDJe2NGYoKuJh8jYdABi74jL5t0y+DiuRmp6kQ6YnTKWlN/d+rMzi/SPdc
 ZRBvTVv7yhTzlEgHn0IAjCUpicK5mYWfnFOs2OvxcajSzsXaYwf3Zr/hW8/1nOqDCreu
 bcrKPbr93FI215bxmZ/o4L96+mcy14rQcvP9eE7BR8sfdmnm6H8fnF6eiyY/3MD0Hsqx
 1IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=McvAeDL2KZLDlk5j6C9DReDRrG7DxVQ7/lNaBCKmKts=;
 b=YFTpAPUjU5ntogEyXxwvYD8VPQWbImD6y3De4ylEf1MQGI9zSu8tJgSI1WjBuERwbS
 ZEt+c9BgWeIDXRnsipElO2w/rNePZYjAzKATOVk3CKLncD54TMEL9olpynq6LfMysdjE
 1aN3MpTCeg+Kk2QMguvods5+Bg9EyLXXoxyvZMJwp8crZXUh0nWgs96yS0yDeqch6Cjz
 mZ4er0KpwH/tvlRDqI8KOvNGTfVtoq0be+CydX3Qoro2KRoinXMj+QPwAYO2rNoeEi3w
 HrWHkGMtWn7D/HPTXWCfvpguCNRF2Up+e3o06Dw9nhM75rDPAQgqVx0sfoQ77GnotQN6
 mr+Q==
X-Gm-Message-State: AOAM533b6844Ii6gF9zcsCePPOSRjevhqF6q+w0DnNLVqwhhnD72f0TJ
 9KggfeAZ+4Uhx2Ot3IkZZLCG2nYyeHk=
X-Google-Smtp-Source: ABdhPJw//ziXTJz7Q/EFqJpyZ7pQZeJ1NZOZgWZypYXWr+13jH12R/7pcyIqxOe7iCzcxINofU5HJA==
X-Received: by 2002:a17:906:73c2:: with SMTP id
 n2mr20178765ejl.224.1614680895260; 
 Tue, 02 Mar 2021 02:28:15 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v8sm8806466edq.76.2021.03.02.02.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:28:14 -0800 (PST)
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
Subject: [RFC PATCH 5/7] cpu: Declare cpu_has_work() in 'sysemu/tcg.h'
Date: Tue,  2 Mar 2021 11:27:35 +0100
Message-Id: <20210302102737.1031287-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Tue, 02 Mar 2021 10:28:20 -0000

We can only check if a vCPU has work with TCG.
Move the cpu_has_work() prototype to "sysemu/tcg.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: could another accelerator do that?
     can we rename this tcg_vcpu_has_work()?
---
 include/hw/core/cpu.h | 16 ----------------
 include/sysemu/tcg.h  | 11 +++++++++++
 accel/tcg/cpu-exec.c  |  7 +++++++
 softmmu/cpus.c        |  1 +
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7f57e57464b..ed23ed9f5fb 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -670,22 +670,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index c16c13c3c69..3d46b0a7a93 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -10,6 +10,7 @@
 
 #ifndef CONFIG_TCG
 #define tcg_enabled() 0
+#define cpu_has_work(cpu) false
 #else
 
 void tcg_exec_init(unsigned long tb_size, int splitwx);
@@ -26,6 +27,16 @@ extern bool tcg_allowed;
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+bool cpu_has_work(CPUState *cpu);
+
 #endif /* CONFIG_TCG */
 
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7e67ade35b9..b9ce36e59e2 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -447,6 +447,13 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
     return tb;
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->has_work(cpu);
+}
+
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
     if (cpu->halted) {
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index a7ee431187a..548ab9236f1 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -42,6 +42,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/whpx.h"
+#include "sysemu/tcg.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 
-- 
2.26.2


