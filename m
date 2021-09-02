Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoUl-0005VH-Ub
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUS-0005M9-Qx; Thu, 02 Sep 2021 11:19:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUI-0002ql-Fy; Thu, 02 Sep 2021 11:18:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so3503385wrv.13;
 Thu, 02 Sep 2021 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oW3Bx/jZHjrRjkjqV/XQakbdfMLoBTULf12/vibH6+0=;
 b=QU5qFe/i6VEoDMLVb8219jT/WtLTbQVyXNjZ+cedE0IXhZ/2ceBCu/K+3FWm9DzyYV
 mFVagGw+zjYAohDrlOvqkLyylUda6Gn1cFWe2AU7qKZu4EdyAwuMGf4d45zI2fgJz7+0
 3zeOWtZUHZtpsfctIKwBu/u87R3XYppWiJWnm/bF1ar5pXunuK1Vfqa5UtGTHcqTmtKE
 t7rqj9NemiYOGJmryDvnJB5Ept1r85a/ZOhLPZ92+bvoGY7937uSjNTjzZ6If1wVOaTE
 +EfT4l7awhYYa5xRVbUdlZwAPsT66W/er1r/OEiWgH9nKTOqOaT67l2nQy/xtJL4RSzs
 YljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oW3Bx/jZHjrRjkjqV/XQakbdfMLoBTULf12/vibH6+0=;
 b=YuqHiBIyTXS3tqYxGNxhIu6ItdyXNcaGFn3xH5i+w84mB777/WgBcNBeieZgV/VTDB
 RdNoLs8o6uf7+yZg3/sQycWv9wO8/JU3MiVKJL3Y2syUgDTkL8ix+ZjhjmZTQHvtZcFM
 6Agw4XAEjLicIIEoWJW60rrtX5Cslr4NeuXdNMx8Lw06+Qdxu/tDNyB1inmQlxIb8lHD
 9wy6lWBBeIaX+zZ6lbe2GKt9E0Gc8S1TeWcCDi9Pw53he5BRJKCNAfigvwVHPVcDL7OJ
 fRYmiKh8RBSKM856dpD9SynXD8lc/BiUg/zeY5cgiMWvhbZtMIKZvcbsenDMIfM4vCXd
 WkCw==
X-Gm-Message-State: AOAM5335mf9obfJWycFK52vcNsvPy2LeYPN5k1qb5zvezfzPo4A0eV3r
 7vaJSMUyX3bz04k7OBiCzgY/E2ISDHE=
X-Google-Smtp-Source: ABdhPJybEEYGgmzrncqPIMBrrmG4v326knpnDTKtu8KRXXp1XjQri0YIUz9e2bk93vsqIIz//ycB8w==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr4509687wrk.235.1630595923879; 
 Thu, 02 Sep 2021 08:18:43 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y1sm2000763wmq.43.2021.09.02.08.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:43 -0700 (PDT)
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
Subject: [PATCH 16/24] target/openrisc: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Thu,  2 Sep 2021 17:17:07 +0200
Message-Id: <20210902151715.383678-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:07 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/openrisc/cpu.h       | 5 +++--
 target/openrisc/cpu.c       | 2 +-
 target/openrisc/interrupt.c | 2 --
 target/openrisc/meson.build | 6 ++++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f84..be6df81a810 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -312,8 +312,6 @@ struct OpenRISCCPU {
 
 
 void cpu_openrisc_list(void);
-void openrisc_cpu_do_interrupt(CPUState *cpu);
-bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -331,6 +329,9 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_openrisc_cpu;
 
+void openrisc_cpu_do_interrupt(CPUState *cpu);
+bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
 /* hw/openrisc_pic.c */
 void cpu_openrisc_pic_init(OpenRISCCPU *cpu);
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index bd34e429ecb..27cb04152f9 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
-    .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index 3eab771dcda..19223e3f25b 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -28,7 +28,6 @@
 
 void openrisc_cpu_do_interrupt(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
     int exception = cs->exception_index;
@@ -96,7 +95,6 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
     } else {
         cpu_abort(cs, "Unhandled exception 0x%x\n", exception);
     }
-#endif
 
     cs->exception_index = -1;
 }
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index 9774a583065..e445dec4a00 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -9,7 +9,6 @@
   'exception_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
-  'interrupt.c',
   'interrupt_helper.c',
   'mmu.c',
   'sys_helper.c',
@@ -17,7 +16,10 @@
 ))
 
 openrisc_softmmu_ss = ss.source_set()
-openrisc_softmmu_ss.add(files('machine.c'))
+openrisc_softmmu_ss.add(files(
+  'interrupt.c',
+  'machine.c',
+))
 
 target_arch += {'openrisc': openrisc_ss}
 target_softmmu_arch += {'openrisc': openrisc_softmmu_ss}
-- 
2.31.1


