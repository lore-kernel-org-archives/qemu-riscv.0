Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D983C46CA1
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:07:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGjv-0001XF-Lo; Mon, 18 Sep 2023 12:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGjs-0001JA-6d
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:44 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGjp-0004QK-Pe
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:04:43 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso76832971fa.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053080; x=1695657880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ikcGGGCIJyFk0iGLkDvtO0LMxTWmhw6kUdLFh+619DA=;
 b=mv3ja5W3XcPXcetv5Y/VtVb/CDeg90J4JMJfi7D5cQ/hhrqsoyhrgsortPLqULs198
 AP6NgorKqlO0k6sNJQ4dgTWWl4/sLyhxU5mLle6x8zCz+zFKtIvHILiBLVpjoZuQ++mB
 PZTh16tqfzHulfXHi5wiifqMleWqVcRSjF4HzE8ViejvasJ0EyWm7fTj6fzLu553vnaR
 AdLaktXRWsSQACk0OkAs1oSXw985JTavGiYA777p9i4qOsn+dvxNJU/pW91BgBq/uNun
 UbWOc66plS4bp1SnOMUIPMksHJyiK4ulIu2DrIPthtsreVNoRtY84dKHsAOkkpbh+3Pe
 kdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053080; x=1695657880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ikcGGGCIJyFk0iGLkDvtO0LMxTWmhw6kUdLFh+619DA=;
 b=na0WScGuPVaNGAeSKYVzjqUZcomSTWIw9nlQtBsejlMJHqQzBJA3oSqdFnaqPGF9No
 1kPiwWWYwo1YDKdBmiEGP76FSygNajquxoLOWeHeWgCFzb6Kb0O+UzThFVqZ7SPPrqgU
 aZ44q3bj9YGshrCLpiWrFvkG14cx3+k258MreheSS7rJjYbSY1u6xRxE78q1WFbaHOYP
 F3UWu9GBl7gFI5eSqX8jJhVaWOZtJoOaxorZT8d2KrIyrluzKwQ05rIHoH6WoxBSS9ds
 hcwZLaR7zCtn4cuh9YHIUOH5z3K0EaC3InFkvYDMdo+Jbmze6F+pXTTCbzBNkzhD405D
 prnw==
X-Gm-Message-State: AOJu0YxPlHUP1Vp0UBU9TNfy3KGurCou9K5lWs4NocieFAh5jTGUcRas
 X/PJurNUQKR8GBZenHWfk78BNQ==
X-Google-Smtp-Source: AGHT+IHPFOPTiS8G0DN7xrPnBYP1slspvTMlXj8JaMLUiuGi38+IN9Um/ZAXVcnl3VSwqkREENA1iw==
X-Received: by 2002:a2e:9d42:0:b0:2b9:e53f:e1fd with SMTP id
 y2-20020a2e9d42000000b002b9e53fe1fdmr7980710ljj.34.1695053080249; 
 Mon, 18 Sep 2023 09:04:40 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1709060b5800b0098951bb4dc3sm6599465ejg.184.2023.09.18.09.04.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:04:39 -0700 (PDT)
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
Subject: [PATCH 19/22] target/s390x: Have s390_realize_cpu_model() return a
 boolean
Date: Mon, 18 Sep 2023 18:02:52 +0200
Message-ID: <20230918160257.30127-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
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
Document Error API usage rules"), have s390_realize_cpu_model()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h |  2 +-
 target/s390x/cpu.c            |  3 +--
 target/s390x/cpu_models.c     | 12 +++++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 781ac08458..67f21f53a9 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -260,7 +260,7 @@ static inline void s390_cpu_unhalt(S390CPU *cpu)
 
 /* cpu_models.c */
 void s390_cpu_model_class_register_props(ObjectClass *oc);
-void s390_realize_cpu_model(CPUState *cs, Error **errp);
+bool s390_realize_cpu_model(CPUState *cs, Error **errp);
 S390CPUModel *get_max_cpu_model(Error **errp);
 void apply_cpu_model(const S390CPUModel *model, Error **errp);
 ObjectClass *s390_cpu_class_by_name(const char *name);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7257d4bc19..1a44a6d2b2 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -232,8 +232,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *err = NULL;
 
     /* the model has to be realized before qemu_init_vcpu() due to kvm */
-    s390_realize_cpu_model(cs, &err);
-    if (err) {
+    if (!s390_realize_cpu_model(cs, &err)) {
         goto out;
     }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index f030be0d55..0605073dc3 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -567,7 +567,7 @@ S390CPUModel *get_max_cpu_model(Error **errp)
     return &max_model;
 }
 
-void s390_realize_cpu_model(CPUState *cs, Error **errp)
+bool s390_realize_cpu_model(CPUState *cs, Error **errp)
 {
     Error *err = NULL;
     S390CPUClass *xcc = S390_CPU_GET_CLASS(cs);
@@ -576,19 +576,19 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
 
     if (xcc->kvm_required && !kvm_enabled()) {
         error_setg(errp, "CPU definition requires KVM");
-        return;
+        return false;
     }
 
     if (!cpu->model) {
         /* no host model support -> perform compatibility stuff */
         apply_cpu_model(NULL, errp);
-        return;
+        return false;
     }
 
     max_model = get_max_cpu_model(errp);
     if (!max_model) {
         error_prepend(errp, "CPU models are not available: ");
-        return;
+        return false;
     }
 
     /* copy over properties that can vary */
@@ -601,7 +601,7 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
     check_compatibility(max_model, cpu->model, &err);
     if (err) {
         error_propagate(errp, err);
-        return;
+        return false;
     }
 
     apply_cpu_model(cpu->model, errp);
@@ -617,6 +617,8 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
         return;
     }
 #endif
+
+    return true;
 }
 
 static void get_feature(Object *obj, Visitor *v, const char *name,
-- 
2.41.0


