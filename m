Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTV-0003wq-IL
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTP-0003o1-R7; Thu, 02 Sep 2021 11:17:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTN-00021b-Si; Thu, 02 Sep 2021 11:17:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso1623304wmr.1; 
 Thu, 02 Sep 2021 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRVRoXmNXmCs6STtexNfP5aqtjz1BCQVthgUFpmXOsU=;
 b=EBlgQ7na5GU7TfCjhJOxtvlaJv/6+2seEqh1hD9lUOY8rAGpCNyI/X8q3C/kC6iNu7
 y05gARaHBO7gR/CxagKwyxheW9EPWEU2KWmMPgTppkLRs3omrcg++9Q0C/lJ57q/T8qs
 1PjJ7XdyMwImmeTQttV2Pysl/x1R+rsC665j7YdyvYPsNdGxOGAaIISz3pXw1gupS7Ec
 KLvbgUpCM5yWv9Ozrd3P+WxMVUtVWNkLZlPZZh4fLBCxbwz+4rkV1NSoGidtYyokPmen
 KcbF0cdAsBi6qiiG2uorvXkt8CmCZSSzTHFhZpDWChTTyq5PY+pDkMiGorFGuIxsflfJ
 J5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BRVRoXmNXmCs6STtexNfP5aqtjz1BCQVthgUFpmXOsU=;
 b=YZvOmV1gkThb4f2kHoJ+Iu5DhhCjq5dkZWt8tPk4mPECvZNrrIjYwRJwgvLqMFZLZD
 OPDd730HnPE/RuOGtgEtH2a9Y/ZE3Eoo/A3vkNRIiilFrglArORgxQXBFu5FoKtiJGa8
 2L9uniKLd5o6T1ndKSWI4Dwefk/AnQRitqM52bLaLWaBACqlyKvqYdH1yGnkpYWMIoHi
 V9ESEGkBQpAISE7FafF/ps0CnouDaWXsHS/0dIXN6WIoCWx2wjP6JZlGzrXYzB1L8NWa
 Uew95b7hsfsgC/TRMxqKTwavbPiqBKfU8zO4kUHI0l1hDqEfxMEMqr7n0Hl7WhaulGO2
 Rp3g==
X-Gm-Message-State: AOAM533dUXq08BDuuwpMqtBQivqi7/pliDvgEHQ0d7g33OM0xHhQ39Ft
 xZZxAJ+h8nqn2LQExJLJ+lujDyRa45s=
X-Google-Smtp-Source: ABdhPJyUdZAO2VPuTAsej3+6kg3AOgh1R0QibZA0bSu1aty+aW8LszLySdtE0oBt4Ij6cQlS8ef/Ug==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr3704527wmi.50.1630595864791;
 Thu, 02 Sep 2021 08:17:44 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 v5sm2036419wrw.44.2021.09.02.08.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:44 -0700 (PDT)
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
Subject: [PATCH 05/24] accel/tcg: Assert most of cpu_handle_interrupt() is
 sysemu-specific
Date: Thu,  2 Sep 2021 17:16:56 +0200
Message-Id: <20210902151715.383678-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:17:53 -0000

To prove TCGCPUOps::cpu_exec_interrupt() is limited to system
emulation, start by asserting it is not called under user emulation.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 3e387c944c5..5f4836946c1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -725,6 +725,9 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
+#if defined(CONFIG_USER_ONLY)
+        g_assert_not_reached();
+#endif
         if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
             /* Do nothing */
         } else if (interrupt_request & CPU_INTERRUPT_HALT) {
-- 
2.31.1


