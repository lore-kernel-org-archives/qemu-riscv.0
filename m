Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoV6-0005os-Md
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUi-0005Rl-Fj; Thu, 02 Sep 2021 11:19:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUh-0003Da-2w; Thu, 02 Sep 2021 11:19:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso1727277wms.3; 
 Thu, 02 Sep 2021 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sa/gUQ6OYKknFZJXebWF3T5b/QwjN7ANr4ohZjqAW3Y=;
 b=j3a0iuyUy4E79T5k3yBsMoOj/6C1m1jTCONb3yKqczOnDrsVZenqpRXrCKuM217KKU
 lWHJQ9caUSi5/emKyOoq3kN2iIt4xnrGo3X6KbBOyrw6k7v7kCXvn10Kq8y0WhRLecHE
 dbcwBMkHl+EfKaP46gUuzJg/An13U77AMavp/GDPoc/S9adEf2VFKNIILFNZz/PLqNwF
 04HYNCmACZfFwTUaLYrDlcA+cttRg2RhQ9z537D8VKq4lOu1P9sqnDhe8kQv89o/3wnp
 dsnfI6iRP2OHPIcxoKcNnDi4BAYeuMNlJWEVP8kfU8GN17k/0GCpOPmSY7ccxGTGMyh0
 tHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sa/gUQ6OYKknFZJXebWF3T5b/QwjN7ANr4ohZjqAW3Y=;
 b=lHgtrSa/jmAEg/awzFI8aopP7ceYRWDTHbyo1nAoKDRMh8JiFQMeBvShyzwtbN9dFx
 rwoylAE5XbGB/ci6VgRUwtVL3wpRSSZM0tKqY6LnSJkMEpDne4cEOzYTF1+7gcS2PqdB
 PwDdUML1lMzotSPk6Z10VPQYXulL6rFBHU87TjQJhNRzpB5vnkjvrs5IPqvhP2i3sQNZ
 n2h8WjIRJF2D8V9IYroee1gtw58/b0/VE3QC6jezu/WQn4ku5qCo4ftYekA9IumlXD9R
 U6a4jtJkPnK3WaZT0jlkSsjNRwLsYK4qA/FxyKDmtPNpHLZ5utvQsgHAfKzpF3kUjjjc
 NjRw==
X-Gm-Message-State: AOAM5307sbtA2RGO974HktBo72OT9vEu5Zn9+TZ8TiFYT8iJXjVHkKoI
 O7OgOmHsNK21jeJmnjNmcTM8RQySvK4=
X-Google-Smtp-Source: ABdhPJwwuyQKfB5c6so0dNubq0TVgPK4gzzPQxLienQhrVD6WNBlMCSXow3/CNoXzZhSUmJsMGjBYg==
X-Received: by 2002:a05:600c:2d45:: with SMTP id
 a5mr3707040wmg.125.1630595945284; 
 Thu, 02 Sep 2021 08:19:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 v28sm2145307wrv.93.2021.09.02.08.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:19:04 -0700 (PDT)
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
Subject: [PATCH 20/24] target/sparc: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:11 +0200
Message-Id: <20210902151715.383678-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:15 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec747..5a8a4ce7506 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)
     env->cache_control = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
-- 
2.31.1


