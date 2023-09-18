Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D554ECD37B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:05:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGiQ-000680-SU; Mon, 18 Sep 2023 12:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGiQ-000678-22
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:14 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGiN-0003w4-5v
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:13 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99de884ad25so624685866b.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695052990; x=1695657790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJh8A0itxnh0qEmv9jrQE8icd48ukduXjwQKR8H2Trw=;
 b=jrhQ3GbnlilvUeYiyHkTizej73YVtm8JTqAX383OkBM7p6aW+Qu9BPzymAa1Dbkujj
 wSnHIFVuHHcp4TTWb66uOhbp4uXuyNvwp6DFoGLhXR9YLAyWPa6BupKnHgtSPG5RVUhS
 k22HBGyxie9ZnTy9bWQmR8NK2piJ4n6pYGATLxbDaAnpFd23/hLEuBySumB0iMHNGxrp
 GOkSnW9GT8gj3E7J+gOAoZ4OCqoAjxuRI1xYtSyInCX9iSGUMnPSZaHywKT9obh8+hMA
 KFbVGQg8HEAOWRCcRRRPF9blCjxlJsKoPZqDjWgT4YzvhAAyepASKt+/WpgCuPUWZ58e
 5QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695052990; x=1695657790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJh8A0itxnh0qEmv9jrQE8icd48ukduXjwQKR8H2Trw=;
 b=Y5vcnTOUsoDfKt/DrhMFU6V/5SXGVbbdmvuOxt4NHWhJuD4MkHNr5+UtR3p5DtpXrD
 fRxTaBLYMsSO84i3+favYBFCW3QDQQACTOJ4hDLMCYH92wEu30e2gm4ilzT0MF1mHhql
 uz1HueEAfR/8wDjE6wgDIc80/YKYr6HkmuW4iPVKQZknQwPyKDoVMtDlhNo+A1TMtnVH
 nHq9jfkpvsvVszIXC5VaIEFqkCFXMqLZku4D9ZGjSv3ldlszQHU6dcY0OP327dC2I8AH
 xlUvNYxHT+bCa6FylDLwT7Ndc2aaD4WHMlO3eVyMTyhGtHp+MtVSkcn7vPz06tbZTOPV
 9umA==
X-Gm-Message-State: AOJu0Yx5p5KacA0KSXDRQ4j6TI2VdzBwdmXsMa/hA9+4Cfb/HZCX5L/P
 2E7dZfQ0FRCFYREWGyjxxQOdPg==
X-Google-Smtp-Source: AGHT+IENcyvi+doZG3AFC4PIQIYrRhEsNXfli8+UC+v7xx7kqnWdf8S7ahUZm+Cso8ML7TazVXsAxw==
X-Received: by 2002:a17:907:7754:b0:9ae:1b64:94c0 with SMTP id
 kx20-20020a170907775400b009ae1b6494c0mr1603066ejc.55.1695052989741; 
 Mon, 18 Sep 2023 09:03:09 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a170906559000b0099b7276235esm6699286ejp.93.2023.09.18.09.03.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:03:09 -0700 (PDT)
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
Subject: [PATCH 02/22] hw/intc/apic: Pass CPU using QOM link property
Date: Mon, 18 Sep 2023 18:02:35 +0200
Message-ID: <20230918160257.30127-3-philmd@linaro.org>
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

QOM objects shouldn't access each other internals fields
except using the QOM API.

Declare the 'cpu' and 'base-addr' properties, set them
using object_property_set_link() and qdev_prop_set_uint32()
respectively.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/apic_common.c    |  2 ++
 target/i386/cpu-sysemu.c | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 68ad30e2f5..e28f7402ab 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -394,6 +394,8 @@ static Property apic_properties_common[] = {
                     true),
     DEFINE_PROP_BOOL("legacy-instance-id", APICCommonState, legacy_instance_id,
                      false),
+    DEFINE_PROP_LINK("cpu", APICCommonState, cpu, TYPE_X86_CPU, X86CPU *),
+    DEFINE_PROP_UINT32("base-addr", APICCommonState, apicbase, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 6a164d3769..6edfb7e2af 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -269,7 +269,6 @@ APICCommonClass *apic_get_class(Error **errp)
 
 void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
 {
-    APICCommonState *apic;
     APICCommonClass *apic_class = apic_get_class(errp);
 
     assert(apic_class);
@@ -279,11 +278,13 @@ void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
                               OBJECT(cpu->apic_state));
     object_unref(OBJECT(cpu->apic_state));
 
+    if (!object_property_set_link(OBJECT(cpu->apic_state), "cpu",
+                                  OBJECT(cpu), errp)) {
+        return;
+    }
     qdev_prop_set_uint32(cpu->apic_state, "id", cpu->apic_id);
-    /* TODO: convert to link<> */
-    apic = APIC_COMMON(cpu->apic_state);
-    apic->cpu = cpu;
-    apic->apicbase = APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE;
+    qdev_prop_set_uint32(cpu->apic_state, "base-addr",
+                         APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE);
 }
 
 void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
-- 
2.41.0


