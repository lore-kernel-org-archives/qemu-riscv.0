Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPEY-0004PN-N5
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEW-0004HR-DX; Sat, 09 May 2020 09:09:36 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEV-0004CM-Gc; Sat, 09 May 2020 09:09:36 -0400
Received: by mail-wr1-x442.google.com with SMTP id v12so5106876wrp.12;
 Sat, 09 May 2020 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DgGlmxYDgp0TKp/P6BFoo5PGVwzBhcu5AKwXK50jX8=;
 b=BvcBFgiQIUD1+RziJDhNMsQ7Ucuo0HzKzddEWCkSr5wWeMkPLjf9T3YUgVn7TEZUW8
 BeHtatd35QLZX1SyVZBXps154vdDu6tocL168dUDhvR6IdCcR/lyBozEOsD7vkG7qyXF
 GwQ4iLBTJ8MjVfX6GmIw020VUza87GqXIP2ErisDDxUDaiaV0WTXD+24msJH8VGk6ZZ9
 KgqXgJTJbXg6vRCdSTcREyPVonO1iyvU+21nhXXeCrqDLTbo6JpzO04xrj3l4yq1T0ZP
 4MviTafrpBKVsPxCgh618jx/It7wV31V6+Gz1rx4tYch2/z3kVArsHxues7KCOZvW/Jq
 aPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+DgGlmxYDgp0TKp/P6BFoo5PGVwzBhcu5AKwXK50jX8=;
 b=Hp0HjKAhwObViqI0WIrlAIsgnMbXtX52v7AwDnRrGEx0a7PeFovGC+OuEclqwfLLB9
 ynBND0bTuRuxqV3VB1MU/YHN4xIjatn9el4J8IFqf9j2kGtxK1JN1nqo13rwgkze7Ej+
 T1Bq2hytpK6TuF+58+fCcRDrs8+xooKwrVEusP5+zR2dUCarGgA4p65Azvp8wXBgbTHY
 8Zq3s37gEia1VY3X3GZow7kmppikt3iGezjLCIjl4/A6JyPdBI0VVqHG00I8j0uVpJA7
 Jtu7s4LpUPYRCPF3jAHMc8XrC7asQn46ZfCHPXb1LW9dUUFKwzBizk42p6T+ufEAaaK3
 dT3w==
X-Gm-Message-State: AGi0PuZZDL96Z+15PxPkd1xPxc7IuY/c6JHPztkrMo2zkPDVuBMOo8+J
 TpMIpJ+OzRUqYROAn5bPoDlOlOr2G0o=
X-Google-Smtp-Source: APiQypJmQJFMZiRR9DoMibdtr9JH+Z1Pn1cDFuHjz2glYTE1zO+Rwp2YknwOdohPGFoSiQItW5g6mA==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr8019146wrs.279.1589029772695; 
 Sat, 09 May 2020 06:09:32 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:32 -0700 (PDT)
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
Subject: [PATCH 06/11] target/s390x: Only compile decode_basedisp() on
 system-mode
Date: Sat,  9 May 2020 15:09:05 +0200
Message-Id: <20200509130910.26335-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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
X-List-Received-Date: Sat, 09 May 2020 13:09:37 -0000

The decode_basedisp*() methods are only used in ioinst.c,
which is only build in system-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/internal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 8c95c734db..c1678dc6bc 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -204,6 +204,8 @@ enum cc_op {
     CC_OP_MAX
 };
 
+#ifndef CONFIG_USER_ONLY
+
 static inline hwaddr decode_basedisp_s(CPUS390XState *env, uint32_t ipb,
                                        uint8_t *ar)
 {
@@ -225,6 +227,8 @@ static inline hwaddr decode_basedisp_s(CPUS390XState *env, uint32_t ipb,
 /* Base/displacement are at the same locations. */
 #define decode_basedisp_rs decode_basedisp_s
 
+#endif /* CONFIG_USER_ONLY */
+
 /* arch_dump.c */
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                               int cpuid, void *opaque);
-- 
2.21.3


