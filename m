Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTTG-0006v3-OT
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTTF-0006u9-Mj
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:52:01 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTTB-00016l-FM
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:52:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1803412wmq.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvmsaKxAU2/5pEbjF5nj04jG9W5Ow7s2kAzsiToIRsM=;
 b=m0CniPaqVh4isHJr1TU084TGdYE6FN7Voa0sCesASAj6DSaYGfRQecELC0S1Krav2z
 5s9ndZ7N8Tu5KVmd8WxOKKwFJ9NXI+c2Ib8+uP/97ZZkb331GOiy7wDEDg8FN11WcFVg
 bXzEzr9b12b8fOw7NZGGYfpyqIUpWSLtylyOy+aN1G4Z3/Va6NxdpagPWvZnfR7ihRRZ
 +V1VzOwXnOV2XyPL7Yxfcsqfnec9KN9dgpVMPY1kXiig797PSE1EIKsAhL+XJ/7IGpxP
 +aFZKCzzi86jGyOgCYApCiA2JaNINp4Zoi1LHLuqSc/uJUDub55Fh+TLxTzLWJzuqVTL
 21HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvmsaKxAU2/5pEbjF5nj04jG9W5Ow7s2kAzsiToIRsM=;
 b=bHodR2l9QFLRCEHJJahNBa/+dOXQAL68EpjKJQIZXxGysfbE1vZSefOs6xKnj9LnPV
 +o4Ahe+6Q9L1hdtWxZKCwXEW/R1ecMRq9e8/jUTJp67fcbbCvBa6ncNDrxXZFEY2MjiA
 UebqtdBALDmcBWb3bKbguT1rkqJq39mL5s3uo5n1jbYTCaI2xPGuQ1CF9YbMLoabD7NA
 sirkNeiAn+l+bTY9QW2hJMMp+R69jmle6YS0LPuqRVKnR32AmyPnHHreCaOzp7RA+ziI
 40hdtCJvRJrZsfJCTQrto2PV9iEU2IO/BqDDIwmQeSPF4BnrNf0lUCujUiY1K7Y3c0ch
 kupA==
X-Gm-Message-State: AFqh2kqhtQF/tMbhpSiw8EkwjvZkL9q7unc8tHrMTO4bRu6rDQUTt2IP
 lHKNMcXIceV8jSKC/biuC+vVbg==
X-Google-Smtp-Source: AMrXdXsEa9XMonnXQqIpc7CJ/hqbKMHHUwKSOM7eHkALjYz0bGuFE5BJz51IP7KRgoYqOJDp5MUA+Q==
X-Received: by 2002:a1c:ed19:0:b0:3d3:52bb:3984 with SMTP id
 l25-20020a1ced19000000b003d352bb3984mr37898768wmh.17.1672937516079; 
 Thu, 05 Jan 2023 08:51:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm3052269wmb.14.2023.01.05.08.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:51:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E0131FFC6;
 Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 15/21] gdbstub: introduce gdb_get_max_cpus
Date: Thu,  5 Jan 2023 16:43:14 +0000
Message-Id: <20230105164320.2164095-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:52:01 -0000

This is needed for handling vcont packets as the way of calculating
max cpus vhanges between user and softmmu mode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 11 +----------
 gdbstub/softmmu.c   |  9 +++++++++
 gdbstub/user.c      | 17 +++++++++++++++++
 4 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 55f3d820aa..a371373c1d 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -125,6 +125,7 @@ bool gdb_got_immediate_ack(void);
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
index c42230acca..015848358a 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -436,6 +436,15 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
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
index 74f541223c..9556a272d7 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -391,6 +391,23 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
+/*
+ * cpu helpers
+ */
+
+unsigned int gdb_get_max_cpus(void)
+{
+    CPUState *cpu;
+    unsigned int max_cpus = 1; /* global variable max_cpus exists only in system mode */
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
2.34.1


