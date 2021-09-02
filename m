Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTr-0004Dz-BT
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTd-00040N-8l; Thu, 02 Sep 2021 11:18:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTb-0002Dt-II; Thu, 02 Sep 2021 11:18:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1639984wmq.0; 
 Thu, 02 Sep 2021 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qUI/GEcrThYL7vzCuO0R9Lw6aoERtFPxgcZzSbFzqgM=;
 b=iVe+9QqLylnt44FCv/N/bfyTajQ514saaLhXAzK5EeFT9xMeKMd1jEbb+vjCPqN5qN
 Hj6EIuaGURXyjORJmhtVPYv94Uen8vqsnqGTFcyOfRVX05r5frtEsMm5Pwi1nqEmK4/O
 X6p+NfV0JuQBExet9c7uVyJWb7XjxUfREWMA3BDlKCVF4Y4ZWpSP1QOErtpS28if2IQT
 h7KNQi0PSAFp1Pi6U1g93GYTTxirckdTDakyIKakBGWTT+g0v08azAwFuQHSj5+KPw0y
 O2ZbvWidpUAZ11OdgEd2kG5sJ4RF9TdP5/KngToSbEA5Uq1sG5Lt9nQdav43sDGf53yJ
 IrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qUI/GEcrThYL7vzCuO0R9Lw6aoERtFPxgcZzSbFzqgM=;
 b=EAA8sjjIo/kkn5NDT/5402tQdLT9w1EJXuNSo1HsDl7RYnQE2avIb0+9IS7t6DrfpM
 B+4VvLcCdm+vH5zW3AtLyYaHDkGEgcmLtBF/R+NyjkG0CQ5ZIDQmAxl51kvZRbcA36CD
 +HuUCX1sY+jx8YphvqpBIIFsrfKWfYy9BIjDw8LkY+/p2Eb85CZUfaTe/mhy04ct41rL
 BYavp8OpjAV2UwBKqIf9j5I53UthRyelWnBlOAjLmdr7A2j3BfLdzRNCXkl51Ej0pf7C
 y0zjQ9OK9BQjGxYl2MnsQCP6aMj2GmwbStCQCBma9V71fv+kWBHX2Uy09hgKE7/RX4KB
 O/bw==
X-Gm-Message-State: AOAM530ZJ7VFPoSP+wuZFyeBylIHZDDIO80mRSFSYFZYWLSClMGH3Cna
 KWVPkWYkf6sEEV34FMVToLzchInV1iU=
X-Google-Smtp-Source: ABdhPJzAnp+XZLE18wcnuwhy0fp4/okghnI04S0wrtOup0uMFI8bALRUb6vI89KXsNrtVvB7SCNy9w==
X-Received: by 2002:a1c:4686:: with SMTP id t128mr3601905wma.183.1630595880991; 
 Thu, 02 Sep 2021 08:18:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c13sm2120248wru.73.2021.09.02.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:00 -0700 (PDT)
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
Subject: [PATCH 08/24] target/avr: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:16:59 +0200
Message-Id: <20210902151715.383678-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:18:10 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.h    | 2 ++
 target/avr/cpu.c    | 2 +-
 target/avr/helper.c | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 93e3faa0a98..6f8c0ffd770 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -156,8 +156,10 @@ typedef struct AVRCPU {
 
 extern const struct VMStateDescription vms_avr_cpu;
 
+#ifndef CONFIG_USER_ONLY
 void avr_cpu_do_interrupt(CPUState *cpu);
 bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index ea14175ca55..e9fa54c9777 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -195,10 +195,10 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .do_interrupt = avr_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 981c29da453..84e366d94a3 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -25,6 +25,7 @@
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
 
+#ifndef CONFIG_USER_ONLY
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     bool ret = false;
@@ -91,6 +92,7 @@ void avr_cpu_do_interrupt(CPUState *cs)
 
     cs->exception_index = -1;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
                             int len, bool is_write)
-- 
2.31.1


