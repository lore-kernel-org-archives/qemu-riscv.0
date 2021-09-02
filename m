Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLpOS-0008IP-VA
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 12:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOP-00088H-QD; Thu, 02 Sep 2021 12:16:45 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOO-00019B-4e; Thu, 02 Sep 2021 12:16:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so1447230wme.0; 
 Thu, 02 Sep 2021 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umRcFm5z0yg595NbXyjpfnNGeUl5eK5xZLxoXeUa+qc=;
 b=pz/nBk0UJK243d6EyhFjqhTq8St+3bylyw8UsBpEg2waosqkIlwbtba8uBILAoIr7Q
 lNryWY6OK0Yv0ei6QJ6YXdrGJmNPpUHm0iNE4fP7UqEe/h1YNv75NdMU0PYG192jLiEi
 nT8wtIR6GbLksC5eh0yUWGhRmDBX0INOYd68LwmG3Qv1zsVvvdfXM2Eh93Z4wPStdVNa
 KE8qNYenYdeo9Hw6npfh1Orrhaz/BR1l28Y8J4uAZJNC+LNfQ5fwkt6laufXunuUNo9o
 yefdGCG2pUPAo+hQ2RqYEKAbC+KVHHoFEwqvKykz0cg+3b9kRE25Iwy6z1ljbMNpTwU1
 QDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=umRcFm5z0yg595NbXyjpfnNGeUl5eK5xZLxoXeUa+qc=;
 b=FRZE5uMdHMHvoalD2Em+goTIVe5zTDrWAvOOihd3eluoRW9aXWeK6D0muX3DPZQxWq
 ri/uLxEGtk7VATT0ZUOT2/V/ldOj3Ew6gse4cPQj4TnLfQqCTD0c9uBYcFlq811ngdl0
 d8qGr5WwpHfDyMlC2zy8yjPmDC1SZJbRGvqyXlqiLeFEausCtBvvl3lqsETF3aLiMykI
 TIQvefPOVgJcgztj52IPUIbAiy3cHiWGwsvhmzl542TqWSk7xLJQ/WQbFJbvg02wLSry
 lN9jzR5aBX6HeAkuPsL13/1FwDn36C/sHnKUnJGHRljSMLiM8hpIZC+wWOEbnPflU8an
 AELQ==
X-Gm-Message-State: AOAM530U5Kh0OOI2Fg/P+HbRqCZ6ELTkLDXX4TOA2mBPdmDTOi1nVEYH
 q0yBJbCvXmNfEBKVYSFWA9ugJxJbvPw=
X-Google-Smtp-Source: ABdhPJxG0Ekgmsw86aV3vYz0yeffJLjcyX9LXqOx701gt1hpjlWPvR2zb0A5F6AGLmteTS9Julrfnw==
X-Received: by 2002:a1c:4cd:: with SMTP id 196mr4020214wme.10.1630599401061;
 Thu, 02 Sep 2021 09:16:41 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s7sm2278245wra.75.2021.09.02.09.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 09/30] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Thu,  2 Sep 2021 18:15:22 +0200
Message-Id: <20210902161543.417092-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 16:16:46 -0000

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ba0741b20e4..e11aa625a5f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -73,8 +73,8 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -85,6 +85,9 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
@@ -2017,6 +2020,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -2041,7 +2045,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
-- 
2.31.1


