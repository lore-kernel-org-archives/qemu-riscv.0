Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTTI-0006xO-3n
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTTG-0006vM-Qp
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:52:02 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTTB-00016d-Ip
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:52:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id g10so14675453wmo.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDdf4UWRF61GNUgMwfJ+g0rGybMbaOrqfqaFUxYF2gk=;
 b=rFW1A6DzD0C2iDWkmMmUhLMtRYqR1ISIGld6Zj/Q4GjylCE7dlHtAObh1RYHRWORS6
 MEbGC93jbgrlyPhp5OP9VDgSwz/RNlxv94lLEvSW8XlOY71gbhalA8vMSXsVAiUEbcKK
 Pn3hH3VYuLKK90XHMSlW9GnPXJB/nFMfcCJ+0jz7sJqvLZeNuDr5x2i2knhtrfuCIVgw
 2jyAmVi8J0wYfa901EXtTZpVHWN7RWekRbJili0vR3FB7dqWA0HKXELcZFTzUQcQ3kYk
 E+VYuW8eJ4dMDOrqxUDbp45Dow9OAX3HwGbDMWVjluyxo808LLlcddMP+KIOMSNvpEuf
 hMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDdf4UWRF61GNUgMwfJ+g0rGybMbaOrqfqaFUxYF2gk=;
 b=uyIjS6RAX94jx5Ikb8Z/f1AN8HWt+GNB+BOnsDS/c1MRxcCMggeBuVcqV4OGEFYOra
 dANv11qUQIfX2Zm4hGUQtDCuROs4crKz1e8pd/XWJjdLqcbSEuB4J/Z+ZcJLgtgc31ZD
 RoV/pS0zlYoEoc24FsEm17Ru/q0O+bzc/XXwwMC2KWYhy/vMABtR1eJtF1Ha9vWFGv9S
 X4t5mPuxeM6rpbuUuWkKp8OYTRbkdttZWwzuElkALd29ZphQ99OoFQjrpOc1wRzLZG4Z
 4hSss+TM+i8kHwkdeMwXsOoFksFLMFvLiLczdrsg+7Mz/xkAvomygriuEyK6S2n8+G1F
 WMQw==
X-Gm-Message-State: AFqh2kr8Jdu4s5vwXRAIAeZLOPmWP+Q3h7N0q7fjjXmDMXJHS/wOshTu
 dLMtV2r5UhZPxHyu7LbiWDqQsg==
X-Google-Smtp-Source: AMrXdXutHexv6rwTXhO7FXr15GZy3LuDOHRtRk2AUNSvvYEeGLw0u81qVl4A/7j+p3BQmDhVulvO9A==
X-Received: by 2002:a05:600c:4995:b0:3d3:4f43:fbc2 with SMTP id
 h21-20020a05600c499500b003d34f43fbc2mr37347589wmp.41.1672937515856; 
 Thu, 05 Jan 2023 08:51:55 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm3447341wms.17.2023.01.05.08.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:51:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CF4E1FFC7;
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
Subject: [PATCH v2 16/21] gdbstub: specialise stub_can_reverse
Date: Thu,  5 Jan 2023 16:43:15 +0000
Message-Id: <20230105164320.2164095-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:52:03 -0000

Currently we only support replay for softmmu mode so it is a constant
false for user-mode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 13 ++-----------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index a371373c1d..1def9dfc9c 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -126,6 +126,7 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 unsigned int gdb_get_max_cpus(void); /* both */
+bool gdb_stub_can_reverse(void); /* softmmu, stub for user */
 
 void gdb_create_default_process(GDBState *s);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index f9950200b8..c293b8e43c 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -113,15 +113,6 @@ int use_gdb_syscalls(void)
     return gdb_syscall_mode == GDB_SYS_ENABLED;
 }
 
-static bool stub_can_reverse(void)
-{
-#ifdef CONFIG_USER_ONLY
-    return false;
-#else
-    return replay_mode == REPLAY_MODE_PLAY;
-#endif
-}
-
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
@@ -1307,7 +1298,7 @@ static void handle_step(GArray *params, void *user_ctx)
 
 static void handle_backward(GArray *params, void *user_ctx)
 {
-    if (!stub_can_reverse()) {
+    if (!gdb_stub_can_reverse()) {
         gdb_put_packet("E22");
     }
     if (params->len == 1) {
@@ -1558,7 +1549,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
-    if (stub_can_reverse()) {
+    if (gdb_stub_can_reverse()) {
         g_string_append(gdbserver_state.str_buf,
             ";ReverseStep+;ReverseContinue+");
     }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 015848358a..ff18611ce7 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -446,6 +446,11 @@ unsigned int gdb_get_max_cpus(void)
     return ms->smp.max_cpus;
 }
 
+bool gdb_stub_can_reverse(void)
+{
+    return replay_mode == REPLAY_MODE_PLAY;
+}
+
 /*
  * Softmmu specific command helpers
  */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 9556a272d7..ccc73683de 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -407,6 +407,11 @@ unsigned int gdb_get_max_cpus(void)
     return max_cpus;
 }
 
+/* replay not supported for user-mode */
+bool gdb_stub_can_reverse(void)
+{
+    return false;
+}
 
 /*
  * Break/Watch point helpers
-- 
2.34.1


