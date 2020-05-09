Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPEe-0004iS-PH
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEc-0004aQ-9s; Sat, 09 May 2020 09:09:42 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEb-0005Q0-HU; Sat, 09 May 2020 09:09:41 -0400
Received: by mail-wm1-x341.google.com with SMTP id m24so3357702wml.2;
 Sat, 09 May 2020 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIEEHUjsrjg149IdCnCJKS5PWD554RDC6FHVKmSpxnE=;
 b=Nl0CXBPpXNxQ0v8jKUxF1Se16t8u56AbbYFOXIfPtb3ZUkfj0ZUg/dU3Thk8Lr1Q7t
 kabpZj03s+ZUNpvujY4Zy+nYe12FYxm2JYH0Sat58Kz7SFKvyQ3iMSG3y1MYqATHFUve
 XyfFNfP52J7d35j7A/kxh/ByzGKFK/Wgnz3+tTUgFcDTmF7jMtKEdpgxQ5PP4ZMZjUd+
 EH1224KiMOCijg6RGClqqyea+dKpk/2QfqW51WcpNx9UN98xYL+BD6Ueqm040CnlBCEx
 dKrqgMaikR6NN+CpCvHMTBA3/73OgPdGOl6ZD8FHNRWIL1RhGB+33Jxa+5cdqfwouDCs
 SHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IIEEHUjsrjg149IdCnCJKS5PWD554RDC6FHVKmSpxnE=;
 b=H6cMrgyIKSxWy1xD7Wz0qKFu3NyPRonjAiTJ0O4HKfWwD4ofhhzIeChYouFjSpFXnI
 07hm98z4p+YsEu8g++pBlSOLgT8iLuHb0fh2pXmDJokf8XgW1A6rG/qNjunvoloq435e
 tOzAH4OhCxxks+K/YM5YbFtIuMlTxTfC9uX5KyM6j4wX9PndNOYWozXhkxRZ/88IzlQc
 exP92mp6vz89XNfshuJduvN+sEMLejDdzafVyv/iSa0EvQ/kpGZe2Z3mO2KKoL2nj2HU
 bD9nS2QeC5m/XBa8cnORvPY1FbyK7gxIYv83vCyyr5jtRs+TOtGYUYhgOcneNS/6yF2k
 pcXw==
X-Gm-Message-State: AGi0PuYOIiBwJlGjWSZBCfomI7eS8VGeO85WtFoV3XJiDAfbKKLNmp9d
 fDiq5oiVLaqqffcB1JApYkAykf2WlQk=
X-Google-Smtp-Source: APiQypIQv5dktkJhLCJa+f5nseiL+K4OPMQciaBIjnNe4IrHVAf2DQjQGyL8101k14juuCgRuJvDfA==
X-Received: by 2002:a1c:2e4d:: with SMTP id u74mr22275473wmu.145.1589029778450; 
 Sat, 09 May 2020 06:09:38 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 08/11] target/s390x: Restrict system-mode declarations
Date: Sat,  9 May 2020 15:09:07 +0200
Message-Id: <20200509130910.26335-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 09 May 2020 13:09:43 -0000

As these declarations are restricted to !CONFIG_USER_ONLY in
helper.c, only declare them when system-mode emulation is used.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/internal.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index c1678dc6bc..ddc276cdf4 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -236,7 +236,6 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 
 /* cc_helper.c */
 const char *cc_name(enum cc_op cc_op);
-void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
 uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
                  uint64_t vr);
 
@@ -303,18 +302,20 @@ void s390_cpu_gdb_init(CPUState *cs);
 
 /* helper.c */
 void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
+void do_restart_interrupt(CPUS390XState *env);
+
+#ifndef CONFIG_USER_ONLY
+void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
 uint64_t get_psw_mask(CPUS390XState *env);
 void s390_cpu_recompute_watchpoints(CPUState *cs);
 void s390x_tod_timer(void *opaque);
 void s390x_cpu_timer(void *opaque);
-void do_restart_interrupt(CPUS390XState *env);
 void s390_handle_wait(S390CPU *cpu);
+hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 #define S390_STORE_STATUS_DEF_ADDR offsetof(LowCore, floating_pt_save_area)
 int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch);
 int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len);
-#ifndef CONFIG_USER_ONLY
 LowCore *cpu_map_lowcore(CPUS390XState *env);
 void cpu_unmap_lowcore(LowCore *lowcore);
 #endif /* CONFIG_USER_ONLY */
-- 
2.21.3


