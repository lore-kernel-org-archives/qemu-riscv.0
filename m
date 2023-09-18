Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EA5CD37B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:06:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGkD-0001qf-7x; Mon, 18 Sep 2023 12:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGjw-0001aj-8p
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:49 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGju-0004RZ-Ij
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:47 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a9d82d73f9so582748666b.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053085; x=1695657885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7slh/pNTWelLfh1FzXsOutH1+zxCT/FLHdOf8nTB6I=;
 b=kIaVVI4i6Ci1jWg3hOfeFjm7XJ1cO63lBFsvfE3UQtDL798H136yi6kUxNHRxl0to+
 I+1wRNLqHLnSdK6q2zZ4/Q4/XkstVT/EJYsyO4xPV3GtFYB2AiTv9LzWLKr6aEXGOJGY
 GOOy3L6ePYOSiyg8sYGbR1ooasQBcD7CvSqltkbQTRlJEAuc+eOOgxLzvGe5vXzAqP2G
 qY7bDIRjOGThX6EkFAYRdy/6VjoUPVuklCQBAOZHQXbk9dcC3eLVKF6zUf+IsxFYUjxh
 7PzyhgFYYYvUk1ciJIFmCQLtsFEQl3KG4ICes7sRhesxh7ZfL7qwf1X+BZdUOJnPbivl
 nRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053085; x=1695657885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y7slh/pNTWelLfh1FzXsOutH1+zxCT/FLHdOf8nTB6I=;
 b=jEMqAEDKMWfR/a+nHSAS0oc6R3K35VnTcloDQ5yHDgDuEplj0eIiNhQ0nylyOArw5C
 uKxuITnX1ApZnbPOum1CeIsGl4bYWDLm13uZU5qN+/owO1REwq8MZri+y0LJm/jmjmBZ
 E8iJ5dwwH/n1SOiCjr2L3W+dCHXguohOqUJCrQ1nyOuSdw3JqjqQoy0HjROlI4K0AASU
 f/meQW02k7jRYun306fHvCHUZTMAaUYBFmzIMeQA6/uFMYglnkW6XMrIY82wbmg+Jnsx
 g9BbywpA9uOqL6Ew4zK39etC47lIYrEUa55Mw8HM/8eUZ3nOR7mRtK+gtK9/+6mJeM6k
 T9Eg==
X-Gm-Message-State: AOJu0YzMEWTcJqQiE/HHpvYjWZNC3zH7xVfFaEMwjgoOxEFuxdGjewQn
 35KSAIHDHaC3D0uHUKVW0ZUwkQ==
X-Google-Smtp-Source: AGHT+IF1uzqoMGcGEAlyaETsh01GEqG5TP+8vhZBqOT31xYKgtT4aKTdO73/67eFYWfUVkYSZ8Rjqw==
X-Received: by 2002:a17:907:75f1:b0:9a5:cc73:a2a5 with SMTP id
 jz17-20020a17090775f100b009a5cc73a2a5mr6784701ejc.1.1695053085243; 
 Mon, 18 Sep 2023 09:04:45 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 lt10-20020a170906fa8a00b009737b8d47b6sm6568567ejb.203.2023.09.18.09.04.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:04:44 -0700 (PDT)
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
Subject: [PATCH 20/22] target/s390x: Use s390_realize_cpu_model() as
 verify_accel_features()
Date: Mon, 18 Sep 2023 18:02:53 +0200
Message-ID: <20230918160257.30127-21-philmd@linaro.org>
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

s390_realize_cpu_model() checks if CPU model and definitions
are compatible with the KVM / TCG accelerators, before realizing
the vCPU. Use it directly as CPUClass::verify_accel_features()
handler (called from cpu_exec_realizefn()).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/cpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 1a44a6d2b2..983dbfe563 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -231,11 +231,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     S390CPUClass *scc = S390_CPU_GET_CLASS(dev);
     Error *err = NULL;
 
-    /* the model has to be realized before qemu_init_vcpu() due to kvm */
-    if (!s390_realize_cpu_model(cs, &err)) {
-        goto out;
-    }
-
     cpu_exec_realizefn(cs, &err);
     if (err != NULL) {
         goto out;
@@ -329,6 +324,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
+    cc->verify_accel_features = s390_realize_cpu_model;
     cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->query_cpu_fast = s390_query_cpu_fast;
-- 
2.41.0


