Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHwNo-00075J-7H
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 17:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNl-0006yk-PO; Thu, 04 Mar 2021 17:23:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNk-0002T2-4D; Thu, 04 Mar 2021 17:23:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f12so25577162wrx.8;
 Thu, 04 Mar 2021 14:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sy2H6EddRIKWB1GSb3aR2E61qw1Oji422a4IED5nUFk=;
 b=mhBQEJUjEnB/YIfFNMe++iCNWz0lJM5t4I45IW7gGw6pz4iPRjTY1kAOLOwqDZL7ot
 Wx6nDJEaMvdheasiN9HYKocpqofzOsYa6I9yN1m8YReMdvKynY8+wujDG65Dj6IX098p
 k6JYfFDivampkjG3tsfEA1KmoNyGSfrG/M8MigxnAEPnhKwY4+/zP1jjPXo7acXe4AYA
 TOwZP3ZM17VgTe1jvAEzCBdzewFmVfSuRLmAClJ3jCN6LTWOnBm1hmpgbip1RqQ0BYyP
 xBrgN+hVJKOAwXYAwIDNGgunDGyGfP/KSz6SAnwFUq9yzlHIYY38BES3bHNHoQAUNUie
 JDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sy2H6EddRIKWB1GSb3aR2E61qw1Oji422a4IED5nUFk=;
 b=Fz/DDcWMhweGUFdmSLt7LsB/jHx2aHgkno7ggjMuG9ODQ99TwU0wv28DtIXkYllBc0
 xX65c+8M+5sD8pjdEQvrP/tq1MKKoqzb8RAkGbGxf0L1xihT8q6N4799ydlBBsDkVHiK
 Axtch0q+lEqu+If+GUpywVkoYwlXctQ0LFIiV30N4azJSoetHu/8wJoraWadsMSafBqQ
 STUYdpCx/VEv5gQaDCDFTrlPs0c4BgwNjp7GzvjEJWF7lo9LNjoDlt3SzzCHNng6WoUt
 ZRO9BZmUxaE3wLeZgIfD2ldI3ojS9YQw+xuSkQt929qXOUrD0+6us1DEaE56KEMMN9np
 yQ2Q==
X-Gm-Message-State: AOAM533cGBz1ZW97vwhl7YNSaC6wYmuEx9GE+/VQFGrfoIPKHCrH1Tlt
 FGCTBv/gnrq6v13buW4No0/7RD1COx8=
X-Google-Smtp-Source: ABdhPJwlQm7jfaSajGyc50qshmJurkslHzterzoVGYe4xgchSIPRbdA//wesm2yYXPzLC2j1BiGmUg==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr6088176wro.337.1614896621247; 
 Thu, 04 Mar 2021 14:23:41 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y9sm907051wrm.88.2021.03.04.14.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v2 3/8] target/arm: Directly use arm_cpu_has_work instead
 of CPUClass::has_work
Date: Thu,  4 Mar 2021 23:23:18 +0100
Message-Id: <20210304222323.1954755-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Thu, 04 Mar 2021 22:23:47 -0000

There is only one CPUClass::has_work() ARM handler: arm_cpu_has_work().

Avoid a dereference by declaring it in "internals.h" and call it
directly  in the WFI helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 1 +
 target/arm/cpu.c       | 2 +-
 target/arm/op_helper.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 05cebc8597c..1930be08828 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,6 +172,7 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
+bool arm_cpu_has_work(CPUState *cs);
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5e018b2a732..6d2d9f2100f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
-static bool arm_cpu_has_work(CPUState *cs)
+bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 65cb37d088f..a4da6f4fde8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -289,7 +289,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     CPUState *cs = env_cpu(env);
     int target_el = check_wfx_trap(env, false);
 
-    if (cpu_has_work(cs)) {
+    if (arm_cpu_has_work(cs)) {
         /* Don't bother to go into our "low power state" if
          * we would just wake up immediately.
          */
-- 
2.26.2


