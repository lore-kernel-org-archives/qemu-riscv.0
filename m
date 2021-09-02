Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoUx-0005c7-SO
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUS-0005M8-Qv; Thu, 02 Sep 2021 11:18:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUC-0002lK-Qt; Thu, 02 Sep 2021 11:18:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i6so3539249wrv.2;
 Thu, 02 Sep 2021 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GktKoVpj+qe0HiWbp4icgBh99dDEcJX34VsG2pZhco=;
 b=Is/bp5Fh3XIA6hA/dzYmAetUcNvoZbT2PMTJXGQenLZN+cEr8VtGUCBay42eDTze3D
 tozqjRYDGa+pvoWsszXjMC44TDjVW/DQ7RVegAPyGORPmSITzcbmFDQeIEXn0HPn8dTX
 /U/pe7aZ5r0VIsEOt1aP52anoSIYLNoIvT0SumWrSTHg+LuNZtDynarj1+o4iLhrF3Fd
 ghRIaQgQ4IEId94u70SN7rVMr7bpy5Cax5wQetz7Pg9VoPxDIMDbm9DAbnsMgSjMYcSl
 aBOM62R7gqMKq5F1pzyNNWWrZTNAHf1veMpmOS1eqWdgfVBX6ygwimJigWGVENkwEPkz
 /OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0GktKoVpj+qe0HiWbp4icgBh99dDEcJX34VsG2pZhco=;
 b=In509hwIg4ergtYncWm5RcON6CHdT2UX0emCt9E+3PEBJ3kr9OJ7BI0Qo5W6QowYTK
 cNg0alb1M1sWon4hgJ1YzwstVb1oWXmyl+JJABtSJm4fgkGbPWPv6xh7JfvePtubgfnH
 7JLcZLkv5/xQ8CuOeHUwF0L2T0Y1EqmzLgoUxwiK1rZA3+LktgZFsYagdw/ZV/2NkUun
 YeRSYs6Ns9n3iCAWwAY8YFZgKs8yUwyHnFxJ/wtCOIvlCIxG/T6cWzNk6q4OPFhkzUFz
 PeBHDso3HLiSrVUoiWYWT2HyHQrDvBKzHGyUDjprhOMzR9tvZACq3P9Ih3uazRlrRftY
 bECA==
X-Gm-Message-State: AOAM531lQs+hEcr0CK18zKEpKRTvWVKhF2aZ65cc31n34eJe8V2KjCbl
 Izy3gIqgpRQDXcCb3rpfmnZtWVgBBqM=
X-Google-Smtp-Source: ABdhPJxF98exm7cfOJwkqDLOJqQCS6DDPr9eL3M6OveGJ6xGChb/WGy6cZX+lWoxEhy/T1+Z2Xnkhw==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr4524803wrr.164.1630595918275; 
 Thu, 02 Sep 2021 08:18:38 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c14sm2124839wrr.58.2021.09.02.08.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:37 -0700 (PDT)
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
Subject: [PATCH 15/24] target/nios2: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:06 +0200
Message-Id: <20210902151715.383678-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:07 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 5e37defef80..947bb09bc1e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     ncc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
-
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


