Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8922DC46CA1
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:06:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGjc-0008Rq-KR; Mon, 18 Sep 2023 12:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGjM-0007E0-5S
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:13 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGjK-0004GW-6E
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:11 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9ad810be221so615650866b.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053048; x=1695657848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpBrxdgyPGajszRQj4tnQ2gfsy466T4SLwv71ztnz3k=;
 b=Gr++Q9e3lQr6z74NJXlK0bU56at5bUOJdk1RCVGeUUFGNElgIe7PLjNloLrsj5l6+2
 +1qZS4pYX1KN0Kfopgms0o2yuHhP0SM2X7ilt0actOVDOqbwt8sEInO7iLbu2e7kDgBg
 GLGdP3tflPnNCNs6GCjXdG2pcYx93ie8ofZPAnyTAd30lVgDf2Wmkf86rnrMKCc8Tl/h
 Q8mjo0I+cpOdgARdt3nlgXU53OD2DbaH60YJMrsa6Ep8naHBcep0AKPIModWH4REYc4u
 nz4JsT+XgUTI/zq5X08ObVBg1OyVLhPq26rPEdV6eg95pMbn9BpI86RtnmfHHViHC6lN
 Ozlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053048; x=1695657848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpBrxdgyPGajszRQj4tnQ2gfsy466T4SLwv71ztnz3k=;
 b=r7c9yYFVtbjqg5rL+tqtlHafs3MkuBCetnCjQPx93QBhRybfEq9jWi+/uQ8ydTbERT
 sCH4voBULLyuiO+4EGxgqgZjeo49IUvys/51B/27YWHkAVoAOWoGDggDODQsPewp6kyz
 RDCsbC+88gJcxjatni4Mmo+dgHnCEFnPc9FhKegTGpeHACtIha8SRwwOTtuiJ4e85ENC
 XFxDDgzjboidVT07fQ4VEzkYC1dJuDQ0xzNofwWV0kNxFDneIz8blppR3zGr1wC6HVbz
 ujqf1JpCFHjNzNG8qQe7SRWf/TWExeTDr6O3IELa7JVKXexycaahPuj2VvWa5nFcUiGa
 tSIw==
X-Gm-Message-State: AOJu0YxVTN1M/fbzUnvnoDE5DtmWoamvqD8grcG88ydv6Vpd9T4cPRn+
 dbsS/aGVbSMEa9WRAYc0K01+bQ==
X-Google-Smtp-Source: AGHT+IG6EnV1NPtLa02ojf1AOOFHw9u/ZZVKTH8rmKjYxc3URy3huazjFDCLq8lcPx0zxuOm3uW8nA==
X-Received: by 2002:a17:907:2cd8:b0:9a5:c9a4:ba1a with SMTP id
 hg24-20020a1709072cd800b009a5c9a4ba1amr8408544ejc.59.1695053048266; 
 Mon, 18 Sep 2023 09:04:08 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170906088400b009928b4e3b9fsm6613541eje.114.2023.09.18.09.04.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:04:07 -0700 (PDT)
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
Subject: [PATCH 13/22] target/xtensa: Create IRQs *after* accelerator vCPU is
 realized
Date: Mon, 18 Sep 2023 18:02:46 +0200
Message-ID: <20230918160257.30127-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 300d19d45c..bbfd2d42a8 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -162,10 +162,6 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
     XtensaCPUClass *xcc = XTENSA_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-#ifndef CONFIG_USER_ONLY
-    xtensa_irq_init(&XTENSA_CPU(dev)->env);
-#endif
-
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -174,6 +170,10 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
 
     cs->gdb_num_regs = xcc->config->gdb_regmap.num_regs;
 
+#ifndef CONFIG_USER_ONLY
+    xtensa_irq_init(&XTENSA_CPU(dev)->env);
+#endif
+
     xcc->parent_realize(dev, errp);
 }
 
-- 
2.41.0


