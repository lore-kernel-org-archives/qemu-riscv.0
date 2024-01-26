Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFFBC47422
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 22:05:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTUJH-0006wv-4t; Fri, 26 Jan 2024 17:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUJG-0006vx-D8
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 17:04:26 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUJE-0003NR-Ay
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 17:04:26 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cf4bc44ce1so10356081fa.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 14:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706306662; x=1706911462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44vj1U77cG8ByngsPLkvtVP46j6F/SEPuSA1albtNLM=;
 b=Qdg5POseFn96pizitSylgPijIrzKPtAg0qpl8eWI0nT7Z/FgAQsngbiFY//li5o8L+
 klriDw5oNLLb890mf1Xp4lD5lOxg+IZDaxaVS9gv4OkIQc5mdkqMiGsXUqu3EwT7c40A
 fP9CXIvDOerUomCyx3PlEFmjkavPI7R1QSlki+DeLucz6y1KyL80rY8ZnXkPnOYg0yjW
 dAKdwXmy3RGXPrKZ5UzD7oqMtezV9fhClDnfDbEh33CHq3HjWtTaC1gxY47zVVO698rl
 Kjb+g9fGUh1L7Z1OPVFyZUozS7bMs4dqBknTjfv4vOGVeC+eiRD3BjMuC8wCjQ/80+DC
 VzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706306662; x=1706911462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44vj1U77cG8ByngsPLkvtVP46j6F/SEPuSA1albtNLM=;
 b=Jsjaj8pU5Q3fRz5bGvq/igp3DBaYBjeTgtAjepJxnLlCagAaEtPT3y5wB6M7URl8UN
 nTgg5C5l3ADbOL87qvTrzMQTrZqkvzLOjdafjxmjeRa2mr/CcUeEib0Op72QzPMEg0Zm
 2yx+GSCd5bkML19PMEy+AN25/rHMlJqw398rahnTr7tLq0R3icL2zGU4oo0J6R6DDs8S
 sAdz+ATIlrwvdQ65viX04jyPRJs/dqch5747eoDVjAG/9Plfmln7ZKBBTBQuJcnAT/s/
 nlu+DZ4khb3ix4fLi5olUzthudg6zTjtw6vus9MTiq404lGG9GSjjFOtVlW48N6xPgXN
 ZgWg==
X-Gm-Message-State: AOJu0YwCZ3QvEICaXM6QPXq//wNL6++g1d0EKo1HYUVD0gxF1l5eOL3X
 jzJTdr6XtzHvqmGVVQbTAT95UMr8cBXtbXzgXU35S8tcptkDPjQ4qBbV97lNFw4=
X-Google-Smtp-Source: AGHT+IEnfgWYNd5eOLvLxcXg8k3YinEkfDQvcjv1CL6+umhezAI8wEelphIMVoflH/5EHRA+97EafA==
X-Received: by 2002:a05:651c:1a29:b0:2cf:127d:a79f with SMTP id
 by41-20020a05651c1a2900b002cf127da79fmr334833ljb.51.1706306662283; 
 Fri, 26 Jan 2024 14:04:22 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a056402180e00b0055920196ddesm1004348edy.54.2024.01.26.14.04.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Jan 2024 14:04:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/23] scripts/coccinelle: Add cpu_env.cocci_template script
Date: Fri, 26 Jan 2024 23:03:44 +0100
Message-ID: <20240126220407.95022-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a Coccinelle script to convert the following slow path
(due to the QOM cast macro):

  &ARCH_CPU(..)->env

to the following fast path:

  cpu_env(..)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                               |  1 +
 scripts/coccinelle/cpu_env.cocci_template | 92 +++++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 scripts/coccinelle/cpu_env.cocci_template

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e..1d57130ff8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -157,6 +157,7 @@ F: accel/tcg/
 F: accel/stubs/tcg-stub.c
 F: util/cacheinfo.c
 F: util/cacheflush.c
+F: scripts/coccinelle/cpu_env.cocci_template
 F: scripts/decodetree.py
 F: docs/devel/decodetree.rst
 F: docs/devel/tcg*
diff --git a/scripts/coccinelle/cpu_env.cocci_template b/scripts/coccinelle/cpu_env.cocci_template
new file mode 100644
index 0000000000..462ed418bb
--- /dev/null
+++ b/scripts/coccinelle/cpu_env.cocci_template
@@ -0,0 +1,92 @@
+/*
+
+ Convert &ARCH_CPU(..)->env to use cpu_env(..).
+
+ Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
+            cpu_env() is its fast equivalent.
+
+ SPDX-License-Identifier: GPL-2.0-or-later
+ SPDX-FileCopyrightText: Linaro Ltd 2024
+ SPDX-FileContributor: Philippe Mathieu-Daudé
+
+ Usage as of v8.2.0:
+
+ $ for targetdir in target/*; do test -d $targetdir || continue; \
+       export target=${targetdir:7}; \
+       sed \
+           -e "s/__CPUArchState__/$( \
+               git grep -h --no-line-number '@env: #CPU.*State' \
+                   target/$target/cpu.h \
+               | sed -n -e 's/.*\(CPU.*State\).\?/\1/p')/g" \
+           -e "s/__ARCHCPU__/$( \
+               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
+                   target/$target/cpu-qom.h \
+               | sed -n -e 's/.*(\(.*\), .*, .*)/\1/p')/g" \
+           -e "s/__ARCH_CPU__/$( \
+               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
+                   target/$target/cpu-qom.h \
+               | sed -n -e 's/.*(.*, .*, \(.*\))/\1/p')/g" \
+       < scripts/coccinelle/cpu_env.cocci_template \
+       > $TMPDIR/cpu_env_$target.cocci; \
+       for dir in hw target/$target; do \
+           spatch --macro-file scripts/cocci-macro-file.h \
+                  --sp-file $TMPDIR/cpu_env_$target.cocci \
+                  --keep-comments \
+                  --dir $dir \
+                  --in-place; \
+       done; \
+   done
+
+*/
+
+/* Argument is CPUState* */
+@ CPUState_arg_used @
+CPUState *cs;
+identifier cpu;
+identifier env;
+@@
+-    __ARCHCPU__ *cpu = __ARCH_CPU__(cs);
+-    __CPUArchState__ *env = &cpu->env;
++    __CPUArchState__ *env = cpu_env(cs);
+     ... when != cpu
+
+/*
+ * Argument is not CPUState* but a related QOM object.
+ * CPU() is not a QOM macro but a cast (See commit 0d6d1ab499).
+ */
+@ depends on never CPUState_arg_used @
+identifier obj;
+identifier cpu;
+identifier env;
+@@
+-    __ARCHCPU__ *cpu = __ARCH_CPU__(obj);
+-    __CPUArchState__ *env = &cpu->env;
++    __CPUArchState__ *env = cpu_env(CPU(obj));
+     ... when != cpu
+
+/* Both first_cpu/current_cpu are CPUState* */
+@@
+symbol first_cpu;
+symbol current_cpu;
+@@
+(
+-    CPU(first_cpu)
++    first_cpu
+|
+-    CPU(current_cpu)
++    current_cpu
+)
+
+/* When single use of 'env', call cpu_env() in place */
+@@
+type CPUArchState;
+identifier env;
+expression cs;
+@@
+ {
+-    CPUArchState *env = cpu_env(cs);
+     ... when != env
+-     env
++     cpu_env(cs)
+     ... when != env
+ }
-- 
2.41.0


