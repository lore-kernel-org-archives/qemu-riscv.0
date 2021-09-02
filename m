Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTU-0003vC-39
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTQ-0003nq-F0; Thu, 02 Sep 2021 11:17:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTH-00020D-5W; Thu, 02 Sep 2021 11:17:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id g18so3507292wrc.11;
 Thu, 02 Sep 2021 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCmT1/gj4ujp3EJ6HnKnll+PX2FEvZCPZXd6eJGewIs=;
 b=K5H1sTW1GKDrNxhnd1MRkJo2wQvX36QUw+Qh2zrY+4rmjtrOffaaaFEGdTTR6dil62
 giCofM4EMWwoBGwla1naHVMHmrzDda0EkSP1HRrBOQLXCxaNc5xS12fhONL25RtfotJx
 0lO16Vse+JjY3aT7O2bsw7IX7hGJxJSiWWv1NXAJXDO0u8E7CMROU13qf2nLt9eyK8AQ
 kDG7UG5yLnv0raH/qzsLTW4RMiX30ZxIGWpczh9j8bIRtTxw8weEtZYGsvuGBGwqAaSD
 huS0O/w0xB3XKyCV+IR+nv6KCXA8qS72499wpJggFbN8xnthpbkf6D3rKvmc8muhdOso
 f/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rCmT1/gj4ujp3EJ6HnKnll+PX2FEvZCPZXd6eJGewIs=;
 b=k0rAQ074AnjwXfsIc2Zw+8bQUCOuD3s95vz5iNgb5IiOWnXelhC6Utf37JRBQG3b0y
 Vf3qS5Izx8uv0tvFWuGI7thG6vq2qBeIIykaGbFAvkp4KJpvYkKgWbMDo7rJbX/etsz1
 dB4CnZGQG6h1KY8jmfUiea5cIwqJlhxTTpfTLsKvU+wAZZ5dBVsluYecoCJLM0p75FlV
 rFyXxyIifuvoLVUMJpmdObcKGRDeJW7UwSrZUKSkQcio98vjcUEkEhlZb4l6pRgvYibW
 LmyRcJyrzItQ3VHPMQ2tPvogdsiOpuuO48NBPXvrs0F6syz1Mhixwe8LW/xZuaHoxKxD
 JVCw==
X-Gm-Message-State: AOAM533hxpvtI/gSw2h6Z2biA6GzJ3CZSkQ+FZWE16K7zX8CNqVFNBYT
 FYn+Mhyp5GRllw8/cKhYQ/gMN0jPS30=
X-Google-Smtp-Source: ABdhPJxq9OxC39FWN2os/I7b6AoVcD7scypsit0B4vnScWs+gAUgdcSKDB8X90nejHSKyJ9RJz9KlQ==
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr4446562wrc.171.1630595859587; 
 Thu, 02 Sep 2021 08:17:39 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d9sm2033778wrm.21.2021.09.02.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 04/24] accel/tcg: Rename user-mode do_interrupt hack as
 fake_user_exception
Date: Thu,  2 Sep 2021 17:16:55 +0200
Message-Id: <20210902151715.383678-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Thu, 02 Sep 2021 15:17:54 -0000

do_interrupt() is sysemu specific. However due to some X86
specific hack, it is also used in user-mode emulation, which
is why it couldn't be restricted to CONFIG_SOFTMMU (see the
comment around added in commit 78271684719: "cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").
Keep the hack but rename the handler as fake_user_exception()
and restrict do_interrupt() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: Any better name / idea here?
---
 include/hw/core/tcg-cpu-ops.h | 22 ++++++++++++++--------
 accel/tcg/cpu-exec.c          |  4 ++--
 target/i386/tcg/tcg-cpu.c     |  6 ++++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index eab27d0c030..600f0349659 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -37,14 +37,6 @@ struct TCGCPUOps {
     void (*cpu_exec_exit)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
-    /**
-     * @do_interrupt: Callback for interrupt handling.
-     *
-     * note that this is in general SOFTMMU only, but it actually isn't
-     * because of an x86 hack (accel/tcg/cpu-exec.c), so we cannot put it
-     * in the SOFTMMU section in general.
-     */
-    void (*do_interrupt)(CPUState *cpu);
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
@@ -61,6 +53,20 @@ struct TCGCPUOps {
     void (*debug_excp_handler)(CPUState *cpu);
 
 #ifdef NEED_CPU_H
+#if defined(CONFIG_USER_ONLY) && defined(TARGET_I386)
+    /**
+     * @fake_user_exception: Callback for 'fake exception' handling.
+     *
+     * Simulate 'fake exception' which will be handled outside the
+     * cpu execution loop (hack for x86 user mode).
+     */
+    void (*fake_user_exception)(CPUState *cpu);
+#else
+    /**
+     * @do_interrupt: Callback for interrupt handling.
+     */
+    void (*do_interrupt)(CPUState *cpu);
+#endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e5c0ccd1a2a..3e387c944c5 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -651,8 +651,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
            loop */
 #if defined(TARGET_I386)
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->tcg_ops->do_interrupt(cpu);
-#endif
+        cc->tcg_ops->fake_user_exception(cpu);
+#endif /* TARGET_I386 */
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
         return true;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 93a79a57415..dce800a8953 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -73,9 +73,11 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
-    .do_interrupt = x86_cpu_do_interrupt,
     .tlb_fill = x86_cpu_tlb_fill,
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .fake_user_exception = x86_cpu_do_interrupt,
+#else
+    .do_interrupt = x86_cpu_do_interrupt,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


