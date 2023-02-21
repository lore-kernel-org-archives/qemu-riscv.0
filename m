Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbVQ-0007l5-Vc
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbVI-0007ZW-GH
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:56 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV0-000491-Lg
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:56 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c5so6718330wrr.5
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI9cg5uSLm9j6ge6jYumeZR69TGqjGanrthhEwm4YK8=;
 b=j0hYg/kU6sMKln7Nhss2ddhhdJRo1ytldg/zuxA/xqUB7CIbQdu4t9eaY5HUCVw4TM
 Gl0wIr0TlUh7NGukaAgZ9NTUcd6fPo4jqpaCXZJ588Ts3gIyZ5/sYJ4ywqUJ7ock9xRv
 viRS5X6ox3WV90YQJ5Hl1zr+oJrL2HhXCBmYwpl33KVjVMWjqpRwCY27nsOyNq+4fPTx
 9wrg7eHc8Mw9lTzPMSYZb4Nli1IBhSN6XNGqtQaNxi9oBbj/z0d/M8JrDlIgU/42wMRE
 2/94QFk84/TcLM9Z0tsDqtXjZa/tpSjsK8SD2jj+CGyWN3OF5s0a6rK1efjBHv6+pCA3
 meHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI9cg5uSLm9j6ge6jYumeZR69TGqjGanrthhEwm4YK8=;
 b=dNXaMMOOERlZ3tVIDmkNgK+MfpZMlLhaNxLBhNSylYJ6+jjVk/3xizWyncFKmxFTEi
 tqkWcmwJzIb+XiSjj9Ca4/9dd2jwzjM5+O5rg95YINJQJ08PLmfl72Zj+PKEiZ5TS/As
 F4cSGSULYkF8yzLPmFORd25RLpYZpWh2+0W89M+v+J1UInsy+dE/ZzpVk9dZA/VcA0FO
 NKGIENufHniBc/r/QKZdba7jY6fpPC+2P91tySCSDLHVbrVCzWgYCEJs1EPYBaJy00EM
 GgSeIRRvtoJDG2489sH36t7eENvhTCueyBsR19mNuN0I/abTQJB/ZTcg2qlIZyjiDpR8
 HBAg==
X-Gm-Message-State: AO0yUKUma6GqjR+TmdPCsx4sWN3+QUxa9Z29gA8a6nBms+FxTCbS0n8r
 C8xOG/iX4MSsnj7TgtjURIjCHw==
X-Google-Smtp-Source: AK7set9Xy/0nhOChalYF+K+fQGROPBbJvFajJvW30rUwPbfDlHcJNw58aI5myPLa6p7R5KH1f4Anjg==
X-Received: by 2002:a5d:4d09:0:b0:2c5:5048:8a6a with SMTP id
 z9-20020a5d4d09000000b002c550488a6amr6579824wrt.60.1677019955459; 
 Tue, 21 Feb 2023 14:52:35 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c54f4d0f71sm7003887wrw.38.2023.02.21.14.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 627521FFBA;
 Tue, 21 Feb 2023 22:52:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 15/24] gdbstub: introduce gdb_get_max_cpus
Date: Tue, 21 Feb 2023 22:52:18 +0000
Message-Id: <20230221225227.3735319-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:56 -0000

This is needed for handling vcont packets as the way of calculating
max cpus vhanges between user and softmmu mode.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rm out of date comment
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 11 +----------
 gdbstub/softmmu.c   |  9 +++++++++
 gdbstub/user.c      | 17 +++++++++++++++++
 4 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 9de995ce3a..90069a9415 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -127,6 +127,7 @@ bool gdb_got_immediate_ack(void);
 CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
+unsigned int gdb_get_max_cpus(void); /* both */
 
 void gdb_create_default_process(GDBState *s);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 91021859a1..f9950200b8 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -624,16 +624,7 @@ static int gdb_handle_vcont(const char *p)
     GDBProcess *process;
     CPUState *cpu;
     GDBThreadIdKind kind;
-#ifdef CONFIG_USER_ONLY
-    int max_cpus = 1; /* global variable max_cpus exists only in system mode */
-
-    CPU_FOREACH(cpu) {
-        max_cpus = max_cpus <= cpu->cpu_index ? cpu->cpu_index + 1 : max_cpus;
-    }
-#else
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
-#endif
+    unsigned int max_cpus = gdb_get_max_cpus();
     /* uninitialised CPUs stay 0 */
     newstates = g_new0(char, max_cpus);
 
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index d9b9ba0a32..65aa2018a7 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -433,6 +433,15 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
+/*
+ * cpu helpers
+ */
+
+unsigned int gdb_get_max_cpus(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    return ms->smp.max_cpus;
+}
 
 /*
  * Softmmu specific command helpers
diff --git a/gdbstub/user.c b/gdbstub/user.c
index b956c0e297..15ff3ab08d 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -388,6 +388,23 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
+/*
+ * cpu helpers
+ */
+
+unsigned int gdb_get_max_cpus(void)
+{
+    CPUState *cpu;
+    unsigned int max_cpus = 1;
+
+    CPU_FOREACH(cpu) {
+        max_cpus = max_cpus <= cpu->cpu_index ? cpu->cpu_index + 1 : max_cpus;
+    }
+
+    return max_cpus;
+}
+
+
 /*
  * Break/Watch point helpers
  */
-- 
2.39.1


