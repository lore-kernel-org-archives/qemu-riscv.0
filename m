Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78265C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:32:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFE8-0005il-Kj; Tue, 21 Jan 2025 09:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBy-00025Y-Ng
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:24 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBw-0003XK-HN
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso3030409f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469519; x=1738074319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMSIk5ncDu4g6LHPrdwoX7hzFMRJx5hOXsfdQDScvts=;
 b=j8o5i5Dom/lccFaL456KIzUvG+PkY4QhV+dVu++b5d/5l52Lry3+l/G6oGrlkq90XP
 gCedCX9SJpDOo95Eu73dwyZdEoYT1cYfDETOx+SiP+KaikiykBPebKBxq6UvAgR0FXHW
 KZMWDV8b9ilvupBvimBdK5Oz0k4dXTXC8cEqZu5bUm+vztWiTA4kbH66gqNahuQfmh8n
 Qx4olRVuCesI3j2subUXxUuWgYPhjNwjto6YerIKC5Oz164QUapfjUs9QIiMjipQBRRM
 cIGCjymPNcgu4Hw/aW2i5a//WgbMA/YQt+XZKlPlDMKBqOYtqmI5gC+jU5O8l0XiCtsR
 CQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469519; x=1738074319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMSIk5ncDu4g6LHPrdwoX7hzFMRJx5hOXsfdQDScvts=;
 b=GJUe0Oz7xzRNuUvp/sogBRqflNBP7EbDqQ4SEX2JXOulPobwKvRvCF+9Dq3Q3o7yQX
 Ric1/03AOJIQibhKm9Z9ZNfzE/kuRvV5uWaQIAh3bL0impRivX3Hp0O7/A75PgaWgcVK
 wzkBthHSJ5W03QiOOC3iLnty7yS0w1a8LHyaCukCwaT2RKIdmCVFzBh0HcADnalGiuBY
 GjUBmVwJRgq31PPdB3exagCMFJARyM0e5OCJG6G9qAoRfKF90CcEgTzr9qjatQo7ZU7F
 0xTifh2MeIZY/VoHjBUjOFgPzE1Okl8WvJDt/s056PpXAhVICl4ZXMm9qv9MggC0FICF
 ynUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsAmc4EwPGKCrx2jkz/T8LTP3n1ACIw74ztR+T/aGZ/s12Prx8JFiDYdvuzUxIPQJC3Tx6ppBl/uDB@nongnu.org
X-Gm-Message-State: AOJu0YysubWljHlHZNf1uUFAXtlf95rF3FfNetxmny33VE44Bu6ILa6K
 g4t3TvEaNkMgP/2qyce8CB9nXB3sj8NurDShlQAKkR58j4q/BFWwrqL6vbLqfNs=
X-Gm-Gg: ASbGncvFBzkQVdRtODdp2j3E/OqTMs13deBwyzITFWsZ4XvSWBkLcGKg1VzwAiQ+t/x
 KdXwJXKG0walPRuQ0CZaU9KlY845LUgE/GEW6UDgST9ut95LtEAbB7E0z2FLD0r8maHxxWgqzNb
 q50laGDJAH1lUWtuY0cbeswJcIP2wMml4HCfUITJgJMXu70GCXhm2n2ucRUX9nUa6SGKtkVoN2Z
 ZzP3AaUg3g3XV8oTsg6O12Zh3gne85mKHjldLkB5dE6PMFnybH47h011StgFa1eGipvjFHpeISL
 Sx1+KFAXlp82wmdUqrW6Fr7lGkyCd3mLikfwVALcOXxO
X-Google-Smtp-Source: AGHT+IF5jZgttv+LZ0wXfptSGAYls5/Jm+rh3KFwCcEvh2S2Zke/7/oH+7hnKV7UQYeCQuZJLTuIcQ==
X-Received: by 2002:adf:a343:0:b0:385:fcfb:8d4f with SMTP id
 ffacd0b85a97d-38bf5788966mr13313679f8f.21.1737469519203; 
 Tue, 21 Jan 2025 06:25:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3214df8sm13543832f8f.4.2025.01.21.06.25.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/28] target/riscv: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:33 +0100
Message-ID: <20250121142341.17001-21-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h       | 9 +++++----
 target/riscv/internals.h | 3 ---
 target/riscv/cpu.c       | 8 +++-----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 97713681cbe..32e8e064f36 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -552,10 +552,6 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
 uint8_t riscv_cpu_default_priority(int irq);
-uint64_t riscv_cpu_all_pending(CPURISCVState *env);
-int riscv_cpu_mirq_pending(CPURISCVState *env);
-int riscv_cpu_sirq_pending(CPURISCVState *env);
-int riscv_cpu_vsirq_pending(CPURISCVState *env);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
@@ -576,6 +572,11 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
 bool riscv_cpu_option_set(const char *optname);
 
 #ifndef CONFIG_USER_ONLY
+bool riscv_cpu_has_work(CPUState *cs);
+uint64_t riscv_cpu_all_pending(CPURISCVState *env);
+int riscv_cpu_mirq_pending(CPURISCVState *env);
+int riscv_cpu_sirq_pending(CPURISCVState *env);
+int riscv_cpu_vsirq_pending(CPURISCVState *env);
 void riscv_cpu_do_interrupt(CPUState *cpu);
 void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 67291933f84..86def39aec2 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -142,9 +142,6 @@ static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
     }
 }
 
-/* Our implementation of CPUClass::has_work */
-bool riscv_cpu_has_work(CPUState *cs);
-
 /* Zjpm addr masking routine */
 static inline target_ulong adjust_addr_body(CPURISCVState *env,
                                             target_ulong addr,
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..4a7e02d9a99 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1010,9 +1010,9 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
     return env->pc;
 }
 
+#ifndef CONFIG_USER_ONLY
 bool riscv_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     /*
@@ -1022,10 +1022,8 @@ bool riscv_cpu_has_work(CPUState *cs)
     return riscv_cpu_all_pending(env) != 0 ||
         riscv_cpu_sirq_pending(env) != RISCV_EXCP_NONE ||
         riscv_cpu_vsirq_pending(env) != RISCV_EXCP_NONE;
-#else
-    return true;
-#endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int riscv_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -2912,6 +2910,7 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .has_work = riscv_cpu_has_work,
     .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
@@ -2933,7 +2932,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
     cc->mmu_index = riscv_cpu_mmu_index;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
-- 
2.47.1


