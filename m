Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlm-0004Nm-Le
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkK-0001Bb-A9
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkJ-0004Do-6Z
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:16 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:56213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkJ-0004DL-1V
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:15 -0500
Received: by mail-pj1-x1044.google.com with SMTP id a18so545170pjs.5
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=sOuvBFhPv/kwJR/8QhMZSZ9InuC6hPqeS5I0fULBuX4=;
 b=DsmJk9dUntPVoqJZiusvbKW4ROIOnGNuOgN3TP79QuYy4CLDpP6rqj0dQW/zBpcAdJ
 T/1fb3/K3R5E1PujPFF+O84D2S5zWK4Yilt0IvYYSAEPcjv7J1RHUEb1um7Lkenyf3sO
 pfX0huMsOeQUlePlfzBBVeNzOH/Mx7dp+DYOxrFX0urXbCsbBJgZmmLGp2thGPOuuqQi
 N7yewYciDi18qNJUHP5TB8HD5gn+46N6KsL0P7cKWWm9vfiVeRrioDn+2I8cY3CHooZy
 y3K2mVOIIlJHv85eh4rjVT2N+NwLeuDYEbGb1wGAE+o8qaSMakWttC51e/0WUS51Ej41
 T5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=sOuvBFhPv/kwJR/8QhMZSZ9InuC6hPqeS5I0fULBuX4=;
 b=dymdRpFJHhXZqwsZNvV35cZ9npo6lsdB7VT0hIB+T7V0IBsHSRyxe6QI93H2ghZ/Yb
 TaPYY1IYreW3Iy7pYC385vAYF19WkfJ7Mj+Ss5kYdEqVLsTXYlAM39M1GSXgvsdesO1L
 gKMUoRa8PHAoXK6c298ya1C+W8ASn3Ow1YVEIr/M4Fn6yaol05Om2PeCPL29FBYHEHP5
 yDmD0ur2xHAccbEIXqtqB/j3T066g9nUqhiTZ2Mdlf2IJ+RwlL467qDij82MTrBC6pwY
 lYtwD97PvlDHLE6hhlNN/6034SiexioVYaH732a/39mUhf4StPpS0psGBtfqQcnZ/WRM
 30cg==
X-Gm-Message-State: ANhLgQ1ZOQk9P3R35ne9GxK6/z+fKF/snDVdbV5i/xaploYyJhwcMm4g
 BLrvvNs4NyZ1k4Z25Z9NmNIJlRgpQEgxQg==
X-Google-Smtp-Source: ADFU+vsoE0xW4YEyJo+Ixu49VdqHIzwRn5/Icw9GJECu09YrG+Fjs0+qfr00IX7yOH9Z9lSQ8LeFQg==
X-Received: by 2002:a17:90a:a48b:: with SMTP id
 z11mr1239018pjp.1.1583196553512; 
 Mon, 02 Mar 2020 16:49:13 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id x6sm21814784pfi.83.2020.03.02.16.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:13 -0800 (PST)
Subject: [PULL 10/38] target/riscv: Dump Hypervisor registers if enabled
Date: Mon,  2 Mar 2020 16:48:20 -0800
Message-Id: <20200303004848.136788-11-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:17 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Dump the Hypervisor registers and the current Hypervisor state.

While we are editing this code let's also dump stvec and scause.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f7a35c74c2..44ad768a84 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -228,17 +228,50 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPURISCVState *env = &cpu->env;
     int i;
 
+#if !defined(CONFIG_USER_ONLY)
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
+    }
+#endif
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstvec);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsepc);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
+    }
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.25.0.265.gbab2e86ba0-goog


