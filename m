Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BECC54798
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 16:39:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdYZF-0005Kj-TE; Fri, 23 Feb 2024 11:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJz-0004JY-V6
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJW-00069L-Jh
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4128fe4b8c8so7314845e9.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Feb 2024 08:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708705337; x=1709310137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xq3bg3O489fduJkQRD4v3a7EWyBdeXHXm96vjazL+zo=;
 b=MIK0d9YU/+uEF/HLW/C5QTSGMEhMoU2796qkHHDP3PSQdS8DvjJs/3xeYN+VbEyUs1
 i2t+06rlsjhnscoSUdZE4WYk79O+ZXBQa/QDyo78XTchSU43pLdLy4D1NxJTssmXbjhq
 9SyJAIrLxv8P7xFOdTIlevkAFy3X6NT5cs612XVD+yWNjwq8V4UNehrgZIjk+eMhaAKv
 gpokbvhZImoNs85NHA11HDRGc9t9D7rbHX1js0gY0h/Gi/KFghrnJ+hlYpLlnABSuRQH
 J3NVKrJoXYCqXRVlsp4GxgjqZVi/AGAkDLAD3lAyBXscpuSC2OHRixwuQ+8710LF6WTR
 dD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708705337; x=1709310137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xq3bg3O489fduJkQRD4v3a7EWyBdeXHXm96vjazL+zo=;
 b=XADJW9YjpALbblnaXDmDIP1+lKUDiPPhySxpNP9Uu5aw61AcY8R+KMm2D4eTKIu8Y7
 +Z7X3yNgYBDPcL0eLLcoEDOxmCiMiYlw4r62aIB0TaYlnPaJvwA0OfloFdl3CGGy0cf4
 XHAQMUxR9uJLQZ/dNE4o8d3PxVgYBTGLRdxf4oRUFMBIamJ4yBsNw64Kl9YUYWyNUpAk
 stJ92m4GwmR54V31uXno5YwVo5+4HftMrxbFB63KGyRrirNsH884gSyjBaxkE1//STbY
 vQuSaOnc36i1lJ3MgVM6uUM7ifw7f739pOiMt2p8fWi19/0Dkceo5XnuEg5+uXKFKTGU
 5P6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNJ3RaBQWUfUeduUjjBR+N8k2WxT8JLq8LPG/rQE6zSoqow4VO1MErUL6+EERcD2heYvQAvG4BN/V/Hy4MSAb/ttsY1mI=
X-Gm-Message-State: AOJu0YxmuJN25ev641wsCelJ6WOEYoLQZHgJINmraxc8XrjyhD9Deg6N
 FpHNqdzfeb/qBDEIOZgro+eGZqPO4dISoMN6Z3x9yG6aUqprzt0scM+fjMWFIpI=
X-Google-Smtp-Source: AGHT+IHUoWsoQPBJE5WysWi1/w2FG/FEByV23K29KRZtnX85r4fuBoTqKM6Fm4br13XuD/TPAT8Xhw==
X-Received: by 2002:a05:600c:4894:b0:412:952d:3c66 with SMTP id
 j20-20020a05600c489400b00412952d3c66mr218886wmp.38.1708705337016; 
 Fri, 23 Feb 2024 08:22:17 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b0041276d96351sm3030020wms.3.2024.02.23.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:22:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 073655F930;
 Fri, 23 Feb 2024 16:22:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 15/27] plugins: fix order of init/idle/resume callback
Date: Fri, 23 Feb 2024 16:21:50 +0000
Message-Id: <20240223162202.1936541-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We found that vcpu_init_hook was called *after* idle callback.
vcpu_init is called from cpu_realize_fn, while idle/resume cb are called
from qemu_wait_io_event (in vcpu thread).

This change ensures we only call idle and resume cb only once a plugin
was init for a given vcpu.

Next change in the series will run vcpu_init asynchronously, which will
make it run *after* resume callback as well. So we fix this now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240213094009.150349-4-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index caa66311351..2392bbb8889 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -391,12 +391,17 @@ void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret)
 
 void qemu_plugin_vcpu_idle_cb(CPUState *cpu)
 {
-    plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_IDLE);
+    /* idle and resume cb may be called before init, ignore in this case */
+    if (cpu->cpu_index < plugin.num_vcpus) {
+        plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_IDLE);
+    }
 }
 
 void qemu_plugin_vcpu_resume_cb(CPUState *cpu)
 {
-    plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_RESUME);
+    if (cpu->cpu_index < plugin.num_vcpus) {
+        plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_RESUME);
+    }
 }
 
 void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
-- 
2.39.2


