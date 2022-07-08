Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9jo2-0000nS-BL
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jul 2022 04:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jo0-0000mC-W7
 for qemu-riscv@nongnu.org; Fri, 08 Jul 2022 04:57:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jny-0004Yn-Rl
 for qemu-riscv@nongnu.org; Fri, 08 Jul 2022 04:57:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id b2so15822640plx.7
 for <qemu-riscv@nongnu.org>; Fri, 08 Jul 2022 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jn+bFSsVswx38izVfqrD35XdPG8lzZ2KkKEOUOF9vuQ=;
 b=YeIE83IDvX89SfaqvQ4vyzcWOpWCHaS8pNykS6NFMMLP6cqLmlZh9pt/jrOUm2jUJ6
 VJnIAnwJ/If7wcVestPQSvW5nxncwEpTliAaoRiDl3d4Ilsz2SV8Nk+4QQpOPubOmcDr
 fXXFnjj5b6YEO58yUDqKCnhg3gfRFkQWTgfa/FYdtH3gyWs29KgInhWXJIByu5x66JjC
 nflkB4xKLMmofql6JiIYcKf3MVsMs10J7bxSY9/QiNLyca/NTwDK+YLutDTd8pGR4TIA
 dZeyD36U3wX8BxIJ1cxBUG8STHs6aOECOrgO5UhSP6JRa6PqbcooWqYiz0zOLBpYUiWC
 abZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jn+bFSsVswx38izVfqrD35XdPG8lzZ2KkKEOUOF9vuQ=;
 b=V+zGmAon7Znqe52Ao3NFp7Dy++IDzKdBCMFJ2jB6A3S8rGmQXHQbRuWFvxU2P8T7mc
 DYwRdgSH2b74Hr8bRJOjLRq48q+qMNT6E1XrQwWflzzmPxQboZROZig5Pg3yIKm7jl9M
 qLG7nHk4KvOxV7BD3cS4mx3yb3t9Alc5FSyF/UN24gu60udFOy4mbKVzAFW1YYDow7Yu
 Itf9IYwYLm/6SwNFOJoE/BEUS0lyTZVAcY54/lV07LepYavlad0cRGK6Of5fe9gzrovG
 kuCquSwoGx/6w71s5jxjcTPV07/MERpstWxMQAQmJFkBVJWZGK7D8O4WAEbkbApf/peA
 vDPA==
X-Gm-Message-State: AJIora+ZYh9LFSZBiwM2/QhQ8SW5hM7ooCcQiZbN6/CTcWxhON40O4Z1
 M+PGxLDCj5c5T5ECk+T/GO7h4w==
X-Google-Smtp-Source: AGRyM1v4zuJGDtd1OBbT9t7Tbhsmp3tiKGxTNgyidT2mm+Q9EvZron5ps/U+aWYJ8waPgkAe9pouIg==
X-Received: by 2002:a17:90a:a384:b0:1ef:da60:9577 with SMTP id
 x4-20020a17090aa38400b001efda609577mr7620589pjp.36.1657270660954; 
 Fri, 08 Jul 2022 01:57:40 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k27-20020aa7999b000000b0052ab5740130sm71854pfh.37.2022.07.08.01.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 01:57:40 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn,
 richard.henderson@linaro.org
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH 1/2] util/log: Add vu to dump content of vector unit
Date: Fri,  8 Jul 2022 16:57:35 +0800
Message-Id: <20220708085736.94546-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=kito.cheng@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 08 Jul 2022 08:57:45 -0000

Add new option for -d vu to dump the content of vector unit, many target
has vector register, but there is no easy way to dump the content, we
use this on downstream for a while to help debug, and I feel that's
really useful, so I think it would be great to upstream that to save debug time
for other people :)

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 accel/tcg/cpu-exec.c  | 3 +++
 include/hw/core/cpu.h | 2 ++
 include/qemu/log.h    | 1 +
 util/log.c            | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..2cbec0a6ed 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -221,6 +221,9 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
                 if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
                     flags |= CPU_DUMP_FPU;
                 }
+                if (qemu_loglevel_mask(CPU_LOG_TB_VU)) {
+                    flags |= CPU_DUMP_VU;
+                }
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 996f94059f..7a767e17cd 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -535,11 +535,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
  * @CPU_DUMP_CODE:
  * @CPU_DUMP_FPU: dump FPU register state, not just integer
  * @CPU_DUMP_CCOP: dump info about TCG QEMU's condition code optimization state
+ * @CPU_DUMP_VU: dump vector register state
  */
 enum CPUDumpFlags {
     CPU_DUMP_CODE = 0x00010000,
     CPU_DUMP_FPU  = 0x00020000,
     CPU_DUMP_CCOP = 0x00040000,
+    CPU_DUMP_VU   = 0x00080000,
 };
 
 /**
diff --git a/include/qemu/log.h b/include/qemu/log.h
index c5643d8dd5..49bd0b0fbc 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -35,6 +35,7 @@ bool qemu_log_separate(void);
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 #define LOG_PER_THREAD     (1 << 20)
+#define CPU_LOG_TB_VU      (1 << 21)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index d6eb0378c3..775d122c2e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -441,6 +441,8 @@ const QEMULogItem qemu_log_items[] = {
 #ifdef CONFIG_PLUGIN
     { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins\n"},
 #endif
+    { CPU_LOG_TB_VU, "vu",
+      "include vector unit registers in the 'cpu' logging" },
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
     { LOG_PER_THREAD, "tid",
-- 
2.34.0


