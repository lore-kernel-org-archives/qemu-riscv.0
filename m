Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHwOE-00080t-By
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 17:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwOC-0007wL-61; Thu, 04 Mar 2021 17:24:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwOA-0002eR-K7; Thu, 04 Mar 2021 17:24:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id k66so11160338wmf.1;
 Thu, 04 Mar 2021 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fX6hEXkHOn0EDIH5ppgTAZxEG1tZNK4v7KhIUlmGx5M=;
 b=NmsARctxdUkxORvwpGrzrQBVLeNzc5ZUXeZNDaRJMDGsGYiiepheAAeenQx8XJkWG0
 V6DQv6qOlw9kCHbaM40nZ95uRgDrFEM74p3NtTXaUFxeYzPtYEY+/8buH8VD1g6Z64z9
 Y1/j5YnIRV8TWYzbnM/G+CHCU0nnPlfO6OYaqxsPrCdpPwwHEJOD8EWrxWcxdemXwK9D
 JnXOiRmTvl6H4cteMVFBQ3+TLc0ueTbXcQSZKsK/wQALoWndsvwOe4023JDnq+Lioxxk
 W94rxO+oT/+zmHb+qDgrOD8V6m0EzWs6IeHb8lETIoqONVLMTDwHxelhMvZjiMlKN24u
 XLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fX6hEXkHOn0EDIH5ppgTAZxEG1tZNK4v7KhIUlmGx5M=;
 b=tjCpmOptBw+P7gP+iKY8nolbZFbIdxfvqO8YL86JBHXRH2+UJahEUa7OULBOvY+Xvv
 TqfkmGcVu8DO7DMivKBeEM7rv9TDhrcXazKTwzoJTikeOiLHhiRI/7nDEE3trL5oncNg
 J3FAtXn6x5DCgJKjgFP25zitQKiyi87qwg+P7bQIACKEJ3m1q/lfHRun66eTmYhAKMfT
 AEy0Yof283c8gFkt8RxPDFZ1dmDRZ3pB4DToaPmE8FokrtWN+6P7GjCzDFOcSgqfu4YE
 cpwPUgX5gFgpzaNA0BtXqwfCz/pYuvCV6JrVn/uFIZxmrN5BS9MU39YLdf91ksTWKxCw
 Zi7w==
X-Gm-Message-State: AOAM533VrFtl1trLUZdZ6m7/eNBd0qDrPDwRBzdIFNz10al4P01n1o7U
 8DYr8wPySsBSq3u3OwZfbx4V4se1w9E=
X-Google-Smtp-Source: ABdhPJzosXqnrg30Glb/e8pVNWp2DurBv7xYuCw8ER1o1ANc+KLu/D+uVw2qnceBEynPCG5A6WFV0A==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr5768799wmk.123.1614896647799; 
 Thu, 04 Mar 2021 14:24:07 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n66sm1250102wmn.25.2021.03.04.14.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:24:07 -0800 (PST)
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
Subject: [RFC PATCH v2 8/8] target/arm: Restrict arm_cpu_has_work() to TCG
Date: Thu,  4 Mar 2021 23:23:23 +0100
Message-Id: <20210304222323.1954755-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Thu, 04 Mar 2021 22:24:13 -0000

arm_cpu_has_work() is only used from TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1930be08828..db81db9bf57 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,8 +172,8 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
-bool arm_cpu_has_work(CPUState *cs);
 #ifdef CONFIG_TCG
+bool arm_cpu_has_work(CPUState *cs);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7181deee84a..02db969c00f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -74,7 +74,6 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
 bool arm_cpu_has_work(CPUState *cs)
 {
@@ -86,6 +85,7 @@ bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
-- 
2.26.2


