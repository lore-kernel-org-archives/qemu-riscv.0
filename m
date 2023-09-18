Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDAECD37B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGkF-0001uP-0Y; Mon, 18 Sep 2023 12:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGk5-0001jR-FH
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:05:00 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGjk-0004P0-W8
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:51 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so74557201fa.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053075; x=1695657875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLYCBr4NSqb4Srk/T+P7jn9AmbCAT10Txre246ezJ94=;
 b=Zi3uk1jy2ZOjCgSultSkYdqb7MNl0gMoYfhwy85tmx2zrC3C8ZljeIe765Cwx+rghY
 06Q21koXYPZ1G3tQDE3J/H5ZFsgZy0y3XIwJYXCbucujHzbaRGD9daOlqr8UwUXTFPGt
 134R5+eqKwJ7/oSYRpxG1FUtCOsYaFiKvuy3SBvhrf0jYni2CxWbdbw+DVmbjMebQ2jI
 2+uARZAtQ/eB74WmQrx3ygpeXvd9YmzQMeOG+BQ0lZECtnNb0r8SXNX+/kYC8op7Um7T
 akV1rrlI4jyqRVOQ1lXEi63S5MJUXmxd2na2p4tx9ScJrcMCLM8Nw1U0jY8ViKDtD2k6
 k1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053075; x=1695657875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLYCBr4NSqb4Srk/T+P7jn9AmbCAT10Txre246ezJ94=;
 b=FygQydZ0yv/IEuonNwGbg/teL7VUTxlwvV+TBgO//VT9CYa9OoDxsCZNAcHXQMpgqM
 kQTbQOJmsBIKrQvV1hsw1trnzyi7Y5Mdwg5sQbozcL2wzO82d07hLhEW/fsXvrEePkCS
 OPHrGH5gQvQIqfEXVZsZ7s1+4CjZi9BLAoYSE5GRydvdMHpOXH8+E6r82m7PNnAIJ0Q9
 hMzJ5B/zIG7XHrkasMcEBhIk+5BP1nwIepnMqyX3w6tHjPs7iBdl0Uf3oWvWrSDdgMFe
 cqkOMH8GMOAMsws8e0sBNy3YWx3W64DXf6KK4Hvb+SyztWJWnJpKInYfZOzcBkACr4Gi
 /YaQ==
X-Gm-Message-State: AOJu0YxWfmi1BYRz0gSAbnY56J08o+7YgSYaTFVu9R/wTtBu4LZ/IoAr
 VtctkNY3hPmqBqfuc7+Uvtdkog==
X-Google-Smtp-Source: AGHT+IEszpq6z0T8KHVLe1aYl3TXIxtDx0wMS/QiHJe0YDjbBZ7toGFiwcuS0GxUEQgehFRPXlIxjg==
X-Received: by 2002:a2e:8046:0:b0:2bc:b821:84ad with SMTP id
 p6-20020a2e8046000000b002bcb82184admr8047755ljg.16.1695053075234; 
 Mon, 18 Sep 2023 09:04:35 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906560a00b0099d0c0bb92bsm6569110ejq.80.2023.09.18.09.04.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:04:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Marek Vasut <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Brian Cain <bcain@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alessandro Di Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Luc Michel <luc@lmichel.fr>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>, Stafford Horne <shorne@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 18/22] target/s390x: Call s390_cpu_realize_sysemu from
 s390_realize_cpu_model
Date: Mon, 18 Sep 2023 18:02:51 +0200
Message-ID: <20230918160257.30127-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

s390_cpu_realize_sysemu() runs some checks for the TCG accelerator,
previous to creating the vCPU. s390_realize_cpu_model() also does
run some checks for KVM.
Move the sysemu call to s390_realize_cpu_model(). Having a single
call before cpu_exec_realizefn() will allow us to factor a
verify_accel_features() handler out in a pair of commits.

Directly pass a S390CPU* to s390_cpu_realize_sysemu() to simplify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h | 2 +-
 target/s390x/cpu-sysemu.c     | 3 +--
 target/s390x/cpu.c            | 6 ------
 target/s390x/cpu_models.c     | 4 ++++
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 825252d728..781ac08458 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -241,7 +241,7 @@ uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
 unsigned int s390_cpu_halt(S390CPU *cpu);
 void s390_cpu_unhalt(S390CPU *cpu);
 void s390_cpu_init_sysemu(Object *obj);
-bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
+bool s390_cpu_realize_sysemu(S390CPU *cpu, Error **errp);
 void s390_cpu_finalize(Object *obj);
 void s390_cpu_class_init_sysemu(CPUClass *cc);
 void s390_cpu_machine_reset_cb(void *opaque);
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 8112561e5e..5178736c46 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -122,9 +122,8 @@ void s390_cpu_init_sysemu(Object *obj)
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 }
 
-bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
+bool s390_cpu_realize_sysemu(S390CPU *cpu, Error **errp)
 {
-    S390CPU *cpu = S390_CPU(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     unsigned int max_cpus = ms->smp.max_cpus;
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 416ac6c4e0..7257d4bc19 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -237,12 +237,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
         goto out;
     }
 
-#if !defined(CONFIG_USER_ONLY)
-    if (!s390_cpu_realize_sysemu(dev, &err)) {
-        goto out;
-    }
-#endif
-
     cpu_exec_realizefn(cs, &err);
     if (err != NULL) {
         goto out;
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 98f14c09c2..f030be0d55 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -612,6 +612,10 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
         cpu->env.cpuid = deposit64(cpu->env.cpuid, CPU_PHYS_ADDR_SHIFT,
                                    CPU_PHYS_ADDR_BITS, cpu->env.core_id);
     }
+
+    if (!s390_cpu_realize_sysemu(cpu, &err)) {
+        return;
+    }
 #endif
 }
 
-- 
2.41.0


