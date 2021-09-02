Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTN-0003mC-Fk
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoT3-0003hG-CZ; Thu, 02 Sep 2021 11:17:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoT0-0001kX-0W; Thu, 02 Sep 2021 11:17:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id e26so1539804wmk.2;
 Thu, 02 Sep 2021 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzANSLmsGdJwadQ2kXgbZKI1Q8VNrscDKhhidFGsH+0=;
 b=Z9k4vsPonRy5FhjiFYfve2//ax9zYfyyVD5a9Cugem8J8WsROLTUdxZhjQFB3fG7QL
 sF8pK/9U253NoTliZREGwIL5xU/HTdrvfwZATynAdrFDf1Oe+v6ovXnPzIwYG9U1myxB
 T+xcHCUrk19Oie+upTR4GwXVKPit/JG8EJu2v4/Vjp2yguR6XjnRYwoEyparRbJndYQ/
 p43ara3grrooC7fr3CTKdaFEjlBBtgKk2Opczzode5eea7w5PrHD85pJa6PPKyOGYEF0
 1e/3eV34c+knvvn3gFyAglCLRJ4MKFqF3/QWNxmPX0LfhiJa0kv8uleIl7riSopsOR7F
 f6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bzANSLmsGdJwadQ2kXgbZKI1Q8VNrscDKhhidFGsH+0=;
 b=n4rIgcHV69D5bY8Zo8Kue2aNN8n22EfC6b5YxQ5TkVRNE8T6qMB/ZxKnMZ5Dt3nylG
 7/jUVjy4Pjd4NsqDOAVNiFOKg5pVsc/My9MoLLnIUsaFPvMZWfZMFxJUaselgYiGdEYn
 wuuPyGcb8qZm1g572759AMgpEr4cNxbOnU6iQ6AyJIV84fdKr47+8mDjR2GhxcWgzU1Q
 BDAxssr/AEArCElUr8bZnoRq0ch1gTzGhbYCP4qkAs6+krxW2QsY+e3U2rBJoikHN2TT
 0i8a57vqh2WbRoKECwcZG6RrKH1HgYZbSJHicURZmRmuXH0+z/cv/pTZ0rVmnhV8VhUn
 55Mw==
X-Gm-Message-State: AOAM533l3FAa7JN8lvuN5n+DtA9PJQPRRiic7TLrMkL8oeWhMS2nBJog
 F4HBsDLO+PUyRz3Yvo1xbL9yFyH8e+A=
X-Google-Smtp-Source: ABdhPJzMo21Pzl41j9dPeTF/HOgeSp6Vq/rN5gij0WhUptIJSXfvP67peFo+YjUwUaQEAxUKbLSroQ==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr3761544wmh.114.1630595843307; 
 Thu, 02 Sep 2021 08:17:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u9sm2193592wrm.70.2021.09.02.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:22 -0700 (PDT)
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
Subject: [PATCH 01/24] target/xtensa: Restrict do_transaction_failed() to
 sysemu
Date: Thu,  2 Sep 2021 17:16:52 +0200
Message-Id: <20210902151715.383678-2-f4bug@amsat.org>
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
X-List-Received-Date: Thu, 02 Sep 2021 15:17:34 -0000

The do_transaction_failed() is restricted to system emulation since
commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c79..1e0cb1535ca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+#endif /* !CONFIG_USER_ONLY */
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
-- 
2.31.1


