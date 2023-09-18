Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F62CD37B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:07:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGkX-0002Ah-Fd; Mon, 18 Sep 2023 12:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGk8-0001mT-QQ
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:05:04 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGk1-0004Su-Eg
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:58 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-502153ae36cso7504813e87.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053091; x=1695657891; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMzTvk0FEO6I+ReA5ceoXcLeA6ER1WjzLpFKcs1vmU4=;
 b=Q28rRDoYQuL4rLCoPBaZaDNC9N3PiNlMicDVPslVNuMOPnrcL419E3BZeqnkOwh95M
 Vve6dMrNUVVkiYnW8qZjUubmA0jWZyJxWPt0m3iBI96LqWilYx2YEe9A1R4kIB07i3tP
 lMWE3AAmDeuUvBg4K8DcV6CszfOvlAeT9Fv0KewarW+ln5T9Pgike9TD5REYmndjajJO
 /FPGoqVuKDewqmSBHa82D0Bn5EiHWYm8WuiYwEeM+hP07ycJVmnaE4IYLhQ/QBTRGU4V
 /5qqEhxTDulmO8ylCeXSevFvoslxxtSMF+6wvi/kFQvTMFy8zW9BxZSfkSfMC4gfckVF
 +/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053091; x=1695657891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMzTvk0FEO6I+ReA5ceoXcLeA6ER1WjzLpFKcs1vmU4=;
 b=vJfcFQRVhX7WYTrBqgeKXvYP6H0q1Nd1qjaTfGIJ3Ylk2xCpAF4SHNJtZqEZcIj/ck
 lTDq7s5Ep59uLThALj3VNWBapgJNClCu6rPsALqbjikfPN7IXzwjj49sULoCKBDCel3O
 EYnfB629nR1fuHvp4uDJ3dVh5lGkL5KywwCDn4jtHiVzq4fyF6+LjrF+jBDx80KDn8Xo
 2A5rWJAdliCF8teLM/mFB+JSCkLFOIjHrveNaBF0l+mnefd5sDemsMlzlmevuKbUoWkX
 pBRCpxAjpRFDxRv27vkXtl8AoTQR+t/uKy1aQmm9UQMs8EhIr1sa6EtMagPrc1G5pFPu
 +tPQ==
X-Gm-Message-State: AOJu0YzYvjwB9s0SXODuLAZNtq850tnOzi1dPP4DpkZAgLRW1t2zDvi4
 +CA5SECMhZs/2qqrMpUl/UlayA==
X-Google-Smtp-Source: AGHT+IF2lowlwslUXKPMUOsRhTSe1sID6DU3fFY6oz4zaM9BZXy8URyT0npkn+KMnJlFujwR995gHQ==
X-Received: by 2002:a05:6512:3f8:b0:503:95d:f2bd with SMTP id
 n24-20020a05651203f800b00503095df2bdmr4180507lfq.34.1695053091074; 
 Mon, 18 Sep 2023 09:04:51 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a0564020f0800b005309eb7544fsm4528407eda.45.2023.09.18.09.04.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:04:50 -0700 (PDT)
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
Subject: [PATCH 21/22] exec/cpu: Have cpu_exec_realize() return a boolean
Date: Mon, 18 Sep 2023 18:02:54 +0200
Message-ID: <20230918160257.30127-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 cpu.c                 | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1e940f6bb5..3dc6968428 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1014,7 +1014,7 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
-void cpu_exec_realizefn(CPUState *cpu, Error **errp);
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 
 /**
diff --git a/cpu.c b/cpu.c
index 84b03c09ac..96ae440b81 100644
--- a/cpu.c
+++ b/cpu.c
@@ -131,7 +131,7 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
-void cpu_exec_realizefn(CPUState *cpu, Error **errp)
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
@@ -142,7 +142,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     }
 
     if (!accel_cpu_realizefn(cpu, errp)) {
-        return;
+        return false;
     }
 
     /* NB: errp parameter is unused currently */
@@ -169,6 +169,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
         vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
+
+    return true;
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
-- 
2.41.0


