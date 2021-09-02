Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoV4-0005io-Td
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUq-0005YJ-Lh; Thu, 02 Sep 2021 11:19:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUp-0003KS-3s; Thu, 02 Sep 2021 11:19:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so3532230wrh.10;
 Thu, 02 Sep 2021 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrF5SukyHScHMGv9yUoXnGkzs9h7YkYdd91g+an7xcY=;
 b=euQk/R7VP0BnZrN9o6zV1gs7ds6m9N1lH2AjKEeoccv6ueHciNiN3Y2RszeqbO2FiQ
 L+5eAFzGlhfxt12PRiCu5tgKLil2Ch8ykV6xs5paIcuijNlZf+68kePK/JwIhJ5ak/X2
 hDPC4IiBGzyusQNl6zVnOFHkPbCzgHvRRxfl6bAzdEg+yX6ryPrR+vDQMrE1aQawplPg
 Xcg2tFkELFvXSciz/SUz8DhJEWPX5UhUhylBtwVu9beyR/zKOTxFIH6ud/EwxXeQxcFd
 HDKbRulLLTMoxn/j3j54iyAcc/V+DW9gSJgVpzhSzX7eLEwWjx9u6TcROinYWsmhWSQ2
 iOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mrF5SukyHScHMGv9yUoXnGkzs9h7YkYdd91g+an7xcY=;
 b=F5Kobo9GBNwjyWlPhm2siAIw5aPASXfSN+6pk0TcWZ5MoQN70HmA3gqMEC4qYKV/6z
 3h2b6ZYHdB/Ed3LXkbzw+FGqr78EzRZAtUYvg1xyUpP99UQ7b8oGZXmxfku6WsBf2IxS
 OXTi03WMU5xoV1G/9kOjtdO8IaK7oyAUoUhUpE8H5ocJKbiBPAUhDGAKEz53Zq8e7maK
 7Ib/UZPmWdqNhZmu61To3KxkMy6cS5b3LefLrsWSfbypsLy0nWnslGZ/rD9rWleoHvcD
 nanjUAZftvRHGzsQPXMxsqDZnCP555YKsjNoZiekLH+CWHQjCRcqLA/pZ7Jd+JGFvgNR
 p+Lw==
X-Gm-Message-State: AOAM532/nle2E2z45ayoAfd6Yoc2lFl92YoBphcvFjK8EE2/XLzTH6Gp
 +OFLo8pwY1rfYwqaqeS05tBoPKy0s7w=
X-Google-Smtp-Source: ABdhPJyl4J7zWpE7CdemJYNKMioYPALttjFVrqr/njjpmxFX/FySPTGr6VDFc/bF4XAh0i+voTyL+g==
X-Received: by 2002:adf:f747:: with SMTP id z7mr4521974wrp.194.1630595956417; 
 Thu, 02 Sep 2021 08:19:16 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y1sm2001968wmq.43.2021.09.02.08.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:19:15 -0700 (PDT)
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
Subject: [PATCH 22/24] target/xtensa: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:13 +0200
Message-Id: <20210902151715.383678-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:25 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h        | 4 ++--
 target/xtensa/cpu.c        | 2 +-
 target/xtensa/exc_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 1e0cb1535ca..cbb720e7cca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -566,14 +566,14 @@ struct XtensaCPU {
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
-#endif /* !CONFIG_USER_ONLY */
+#endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a08622..c1cbd03595e 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 10e75ab070d..9bc7f50d355 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
     check_interrupts(env);
 }
-#else
-void xtensa_cpu_do_interrupt(CPUState *cs)
-{
-}
-#endif
 
 bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


