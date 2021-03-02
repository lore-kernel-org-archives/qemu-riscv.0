Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH2G9-00026U-Gi
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 05:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2G6-0001x7-2x; Tue, 02 Mar 2021 05:28:06 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2G4-0008P9-Hf; Tue, 02 Mar 2021 05:28:05 -0500
Received: by mail-ed1-x532.google.com with SMTP id w21so24514430edc.7;
 Tue, 02 Mar 2021 02:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgLtxhW6TCh0Vt3N87A01jn3z88UQCjsPYLiOsnHu/I=;
 b=YlynJAlXKis3xlvlp8b6xXHhq0ZpkGKKUsa//dsaBGpYIxs1ee/4OjZMCRqF7puPiO
 MAwS7tiamXTZgyTqqn62PHPhe+SAStlPIrlUQ8L9EEeObQf+c3mthlsnxKdD3ndP5JbT
 P9s0lyYCSH7V43/m4zpPv9w/CPbWrmcgyuxJk3cNlUoaj5QarlqBGD9FWTk2PgLCjFI4
 wcMnz4FQgr8jldgJckscDY7lK4QlWVWWR0eVlEdNgt4xXJHHVjPDXaj/F5EfwZ4b+KYk
 MrgHJS5hkpgMscFTsK3yejPKqySFuAIca00epUiNV/nilYnhDlsw6jt7rA/Q02j+4UNh
 jPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DgLtxhW6TCh0Vt3N87A01jn3z88UQCjsPYLiOsnHu/I=;
 b=UGLKsqKgfS2R8wvcCqm62B4esHuPfYIPlZ1N9pIvd1OZBLzwyuD+rebqNvt+pYOKBs
 2VifayVVYFptfehbrBIwWmSchhiaCk0kESEb8WHFLoO13wdiKeZexWIBiUCdgjzChpG8
 jsbeFniOO5z7n/Ar6XOMLzfnU765SQYZOsLQYp7xeyv6lkaaL3wzE9J2wbTMlJLu+quZ
 FN5W6FLiSA06mEgUmaaliUMkE43TSU90yOefg4dk3oxZThCeyrp/IxJoVlgkb9Romnyg
 1ymVJFFrBjfE354qh3eAAdp4IQeUVOUuY7rAG0e2mpWc1CqoIT7Npum9U2jX+5ZyYx5q
 PdCg==
X-Gm-Message-State: AOAM530y05s6XZu5LnTQWsiGc2QhD3CIj4z3bqarmkSE2+bJkYnmG+HX
 AHcPttmlK0njBM9FA3oLziQwwmt8Qw4=
X-Google-Smtp-Source: ABdhPJxtBe1JyuD647B2YHW3dOzrYqzhDwPtmH10I8kjKvgq6yC2fTZ+sviIRfIIHi1N2BTa1Atj0Q==
X-Received: by 2002:a05:6402:1d39:: with SMTP id
 dh25mr18074868edb.282.1614680881533; 
 Tue, 02 Mar 2021 02:28:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y11sm17365132ejd.72.2021.03.02.02.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:28:01 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Chris Wulff <crwulff@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Anthony Green <green@moxielogic.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marek Vasut <marex@denx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 3/7] target/arm: Directly use arm_cpu_has_work instead of
 CPUClass::has_work
Date: Tue,  2 Mar 2021 11:27:33 +0100
Message-Id: <20210302102737.1031287-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Tue, 02 Mar 2021 10:28:06 -0000

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
index b8bc89e71fc..d03607c2684 100644
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


