Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTT-0003ry-32
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoT7-0003j3-11; Thu, 02 Sep 2021 11:17:34 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoT5-0001pp-Cb; Thu, 02 Sep 2021 11:17:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id n5so3496594wro.12;
 Thu, 02 Sep 2021 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTFlYRzsNmSx1w84TAaQNKIszVXBPzQdffXX/N6ByQc=;
 b=binZUo7/bHMGSoxpON5VJ8GEdo3Al7bMt62SwTTxKOxX5oq0oIhUfcLCaFB4Cyuzd1
 LiZmr45oEQbFEm76NnaC0xaAd591rmcBV0A+9j1mRolMSW+PRlryz/xmFYySSfjLUlAD
 hekSncN+3jw2QUQqC3EWxpyhwJHohVwmIG32WpTWLjYf3c9AqpDRnImfTX6c727mGHMC
 u6mWY4WkK5T8Uceh/4z2YugTz7GH4gpqQpYeJnusOW6Xoa5e7h9+w/nbMYwlAER1ZjPQ
 aGTdhNAyvfDz91ZJ+1PKRR8TBqj+toLBAmtmev1hIfWSDL9PmtDS8DilXzu+ShD1jnc4
 SrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XTFlYRzsNmSx1w84TAaQNKIszVXBPzQdffXX/N6ByQc=;
 b=Wsziq57B0M7JGqxp9XQhgDvfX9LcVbnpwemnYMYAirQYWeke4VABdSRWFNXl3kzJMh
 VrRE3VKcicju0yuScaRihSGSKtdvYma4yKkj0mOdXjcPJraBHrMz+M5HzlCqVIJnBy4W
 fwscEI2XPKbEFh96bFdLIxOQG5sNBj7yFYm+OjuRN9b3KyMcrfHnIbXuoL8OVwhvb9Nx
 ezh0dCychgEQ9xhhjgXH5MA/JTa87kg1E5fh4E7BJn1Cp0tePkGUYiJEuUgts+UrCuHk
 GY+oXS8SrOazQ+UZtXLLSuqZl4ZMLvdvuLeftMU8iCL55ucpyBQw7NdHqEoRLq2q1qPW
 v7ZQ==
X-Gm-Message-State: AOAM533oSoft31QGe0LDeN8HoMd9wfxO0BdQIlJhkVCrfRSUiuO47hdp
 gl83mm4GhCjb1iWrHchnb5vvuB7FqEg=
X-Google-Smtp-Source: ABdhPJz+65J2x0mlNjQAOZfmvYaWNxrWT3wUSmYXSZ0hqXdvMzf5FGS79hkN07RU86xwoHWwWCUnXg==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr4319908wre.39.1630595848631;
 Thu, 02 Sep 2021 08:17:28 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f23sm1773453wmc.3.2021.09.02.08.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:28 -0700 (PDT)
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
Subject: [PATCH 02/24] target/i386: Restrict sysemu-only fpu_helper helpers
Date: Thu,  2 Sep 2021 17:16:53 +0200
Message-Id: <20210902151715.383678-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:17:36 -0000

Restrict some sysemu-only fpu_helper helpers (see commit
83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f1..c241bc183d2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1833,11 +1833,14 @@ void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 int cpu_get_pic_interrupt(CPUX86State *s);
+
+#ifndef CONFIG_USER_ONLY
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
 void cpu_clear_ignne(void);
+#endif
 
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
-- 
2.31.1


