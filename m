Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbVR-0007lQ-9y
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbVI-0007a1-Tw
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:57 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV0-00043M-NZ
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso4847182wmq.4
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7X5ixi52u3q8mNTsDp+C9raeJcKQAq90J8thOzhSOf4=;
 b=ocbfQBavJ8WLxSRTQ2bnnLROw0gUfzJDpQjmcaxhRnhbKv95/lFgoeVeWmA7qjNdkQ
 sHe9vigPRSVLgYkyD4v4R9WiNSOqNjgUbNY/CDlwLsmz6XWOwpy9OmDGVdA7Ffa2cs5Z
 yaW/J5rSohdQgMnnAi4RXwWwvWCfQ7SHvKoA1QHqk0FW3i+kpZHJhOczr+eumYbQ3JW6
 CW0Wq0+qT3TTnYQCk55QRLWa2KDNp5j7qd+4xdnwaXhBHHznS13fhr1C6UBBjzeI5M36
 DXK8W1sA+L3mUEVnJL+fSc9jQwD2McsMsZ7+wbL+treKAGuEsIFYG6q6gMteUqy7NwgC
 2GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7X5ixi52u3q8mNTsDp+C9raeJcKQAq90J8thOzhSOf4=;
 b=necRcEt3ZRvL8C9EWhK2EyTr7cXkEErxnOMPJykNQSSAnrwExOYB+DF5Z5/b1JGJny
 cE7gx+jZYm3ETLxSsWpa2Sn36yh0JjlS9qzd9edHXmvz/Bt4Y6XoqDn7J8h7TDfPF9nV
 CpIFU8bqhAx1uwpxw5IYSTjRWif4xNM1FTfReVAXk2XbELNCVgb4siUYon8DVreO4EWh
 Xo7a1iK8uTzCpuTslvaHsdIFWOuMRSEpCC/9q30pGRruzEi43yo2LdXfwqtb2W4VGlx5
 y/3/ao29XD99Z3mLlml/dTk5wmJd7QJu8Y5+U0Zq6fg6jg1iX7bqrAG1uzFE0QW5U9kn
 mCyA==
X-Gm-Message-State: AO0yUKXKl85seM5IPlI8x4oBbl1HbHotCSjYc2f/YmhbEreuP5FN3CFt
 sFu3YGoT8WrcW3V/XSWDuGK1dQ==
X-Google-Smtp-Source: AK7set+JzyU/XGz43sRIqzYsTWCqhFzz7JYpeMEKSv8nx7KgeJbFUFpsJiBrw9PUpYT3XNeUCSxN1g==
X-Received: by 2002:a05:600c:2ed2:b0:3df:eda1:43b9 with SMTP id
 q18-20020a05600c2ed200b003dfeda143b9mr4239776wmn.4.1677019956493; 
 Tue, 21 Feb 2023 14:52:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b002c54f39d34csm9059057wrr.111.2023.02.21.14.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6793A1FFD2;
 Tue, 21 Feb 2023 22:52:31 +0000 (GMT)
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
Subject: [PATCH v3 24/24] gdbstub: split out softmmu/user specifics for
 syscall handling
Date: Tue, 21 Feb 2023 22:52:27 +0000
Message-Id: <20230221225227.3735319-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:57 -0000

Most of the syscall code is config agnostic aside from the size of
target_ulong. In preparation for the next patch move the final bits of
specialisation into the appropriate user and softmmu helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h |  5 +++++
 gdbstub/softmmu.c   | 24 ++++++++++++++++++++++++
 gdbstub/syscalls.c  | 32 +++++++++++---------------------
 gdbstub/user.c      | 24 ++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index fe82facaeb..dce7c4f66f 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -193,6 +193,11 @@ bool gdb_handled_syscall(void);
 void gdb_disable_syscalls(void);
 void gdb_syscall_reset(void);
 
+/* user/softmmu specific signal handling */
+void gdb_pre_syscall_handling(void);
+bool gdb_send_syscall_now(void);
+void gdb_post_syscall_handling(void);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index b7e3829ca0..8f3c8ef449 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -101,6 +101,30 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
     }
 }
 
+/*
+ * In softmmu mode we stop the VM and wait to send the syscall packet
+ * until notification that the CPU has stopped. This must be done
+ * because if the packet is sent now the reply from the syscall
+ * request could be received while the CPU is still in the running
+ * state, which can cause packets to be dropped and state transition
+ * 'T' packets to be sent while the syscall is still being processed.
+ */
+
+void gdb_pre_syscall_handling(void)
+{
+    vm_stop(RUN_STATE_DEBUG);
+}
+
+bool gdb_send_syscall_now(void)
+{
+    return false;
+}
+
+void gdb_post_syscall_handling(void)
+{
+    qemu_cpu_kick(gdbserver_state.c_cpu);
+}
+
 static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index 1b63a1d197..24eee38136 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -102,9 +102,10 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
 
     gdbserver_syscall_state.current_syscall_cb = cb;
-#ifndef CONFIG_USER_ONLY
-    vm_stop(RUN_STATE_DEBUG);
-#endif
+
+    /* user/softmmu specific handling */
+    gdb_pre_syscall_handling();
+
     p = &gdbserver_syscall_state.syscall_buf[0];
     p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
     *(p++) = 'F';
@@ -138,24 +139,13 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
         }
     }
     *p = 0;
-#ifdef CONFIG_USER_ONLY
-    gdb_put_packet(gdbserver_syscall_state.syscall_buf);
-    /* Return control to gdb for it to process the syscall request.
-     * Since the protocol requires that gdb hands control back to us
-     * using a "here are the results" F packet, we don't need to check
-     * gdb_handlesig's return value (which is the signal to deliver if
-     * execution was resumed via a continue packet).
-     */
-    gdb_handlesig(gdbserver_state.c_cpu, 0);
-#else
-    /* In this case wait to send the syscall packet until notification that
-       the CPU has stopped.  This must be done because if the packet is sent
-       now the reply from the syscall request could be received while the CPU
-       is still in the running state, which can cause packets to be dropped
-       and state transition 'T' packets to be sent while the syscall is still
-       being processed.  */
-    qemu_cpu_kick(gdbserver_state.c_cpu);
-#endif
+
+    if (gdb_send_syscall_now()) { /* true only for *-user */
+        gdb_put_packet(gdbserver_syscall_state.syscall_buf);
+    }
+
+    /* user/softmmu specific handling */
+    gdb_post_syscall_handling();
 }
 
 void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
diff --git a/gdbstub/user.c b/gdbstub/user.c
index cc7eeb9afb..a5227e23cf 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -467,3 +467,27 @@ void gdb_breakpoint_remove_all(CPUState *cs)
 {
     cpu_breakpoint_remove_all(cs, BP_GDB);
 }
+
+/*
+ * For user-mode syscall support we send the system call immediately
+ * and then return control to gdb for it to process the syscall request.
+ * Since the protocol requires that gdb hands control back to us
+ * using a "here are the results" F packet, we don't need to check
+ * gdb_handlesig's return value (which is the signal to deliver if
+ * execution was resumed via a continue packet).
+ */
+
+void gdb_pre_syscall_handling(void)
+{
+    return;
+}
+
+bool gdb_send_syscall_now(void)
+{
+    return true;
+}
+
+void gdb_post_syscall_handling(void)
+{
+    gdb_handlesig(gdbserver_state.c_cpu, 0);
+}
-- 
2.39.1


