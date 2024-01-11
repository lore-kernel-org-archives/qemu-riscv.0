Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9EBC47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:05:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNtmx-0003Jn-DN; Thu, 11 Jan 2024 07:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtm4-0002qD-KX
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:03:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtlz-0007Kk-Dp
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:03:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e62425c60so1343745e9.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 04:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704974565; x=1705579365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oDADZ7OQkBJhilNI7y3OkwoRjc/uWOL4l0/5ZjzT+c=;
 b=hrWEwSN3xaVIO1pzvQBlZOIGNyMX3cNp84yVaTPgWuGgKyvub81M0dfT2XTFZFiLTM
 xOULxOekq0fMLb7tH/PWhIORjYvF2DMq9qP6sPRN2Nmi9jXbCjR6t9VgGx6thsrO5y/z
 Hm0wjb8zk77zSfDsA3XySu47BeVAxJn6oIDT31byEVpL0c8PItuAewqX1byTV//SsVb0
 lpjePB27K9f2SbR50ukwvTff/febyarvDyPfNAnfYM0nqsgnDcKsE8OndKNSzO8wIS3U
 6DmwgkrqmahsQ9ON7B0gekuXBMMy/IVU+mScBZLELlz+XVS60Z4tPfqAQUwlO+qE3q35
 Hv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704974565; x=1705579365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oDADZ7OQkBJhilNI7y3OkwoRjc/uWOL4l0/5ZjzT+c=;
 b=Rf/2MLGVSfOa94ZOBzsUBU1O83KwinSI3kLhy5xMEkDdMyYqnC/5dzs+1qF9BZiSpV
 aeVTtf+j53hZMHgbu9FYXLZwbwmKtjMT5XIGEBJfOXrWmlFDz1kR07xSJOmX3FswALt2
 CQgko10Gau5I+dXSQ61FIuo4qLm7QFUs328KFsRUauNTbbusflfohrKDycrWT8hQG6QK
 xj+uAZHIqfsQOQ7IhSXtwRCAlstFUzvm+1U+iQTvf6f3m78q84aOb77PTdyQco0jRCAx
 ErSiY/AJDm+F3DeQwnKymn4O1zdrY6glWnwJPOB7x1g1ovLBKEzR9eK/wVg1ssHYBeft
 Se3g==
X-Gm-Message-State: AOJu0YykiLbi8lxQN4AHiIbBP2MCYjs27BisKGQM5BSIjSzCkMCV/fFO
 rxtkO0Mnj8NKYLkHx7cqQOSeRBIIUSg4WA==
X-Google-Smtp-Source: AGHT+IHUy2rDKzOcAGPqrz1cWpY8bjDMaLqeYdAZU4p19oR22q+kOJSKHkxiRPj8CF6RdVzDH6fu6Q==
X-Received: by 2002:a05:600c:3515:b0:40e:4e48:513b with SMTP id
 h21-20020a05600c351500b0040e4e48513bmr359496wmq.12.1704974565669; 
 Thu, 11 Jan 2024 04:02:45 -0800 (PST)
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b0040e48abec33sm5550904wmq.45.2024.01.11.04.02.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Jan 2024 04:02:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/s390x: Rename cpu_class_init() to include 'sclp'
Date: Thu, 11 Jan 2024 13:02:19 +0100
Message-ID: <20240111120221.35072-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240111120221.35072-1-philmd@linaro.org>
References: <20240111120221.35072-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

cpu_class_init() is specific to s390x SCLP, so rename
it as sclp_cpu_class_init() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/sclpcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
index f2b1a4b037..fa79891f5a 100644
--- a/hw/s390x/sclpcpu.c
+++ b/hw/s390x/sclpcpu.c
@@ -73,7 +73,7 @@ static int read_event_data(SCLPEvent *event, EventBufferHeader *evt_buf_hdr,
     return 1;
 }
 
-static void cpu_class_init(ObjectClass *oc, void *data)
+static void sclp_cpu_class_init(ObjectClass *oc, void *data)
 {
     SCLPEventClass *k = SCLP_EVENT_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -94,7 +94,7 @@ static const TypeInfo sclp_cpu_info = {
     .name          = TYPE_SCLP_CPU_HOTPLUG,
     .parent        = TYPE_SCLP_EVENT,
     .instance_size = sizeof(SCLPEvent),
-    .class_init    = cpu_class_init,
+    .class_init    = sclp_cpu_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
 
-- 
2.41.0


