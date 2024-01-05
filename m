Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC19C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:44:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmM9-0004SX-OB; Fri, 05 Jan 2024 10:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmM6-0004PO-Dx
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:30 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmM3-00030P-Sj
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:30 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso17950785e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469406; x=1705074206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfCx4/gtR4YY4ivQoLXNfOFMl7NDjjAvmzs8gXTbe8k=;
 b=pUhC2F9fWeiAW4HljsTiPYeOoM69zTLlFisGRC9T5nR52G8chwGncaBbHWAs4owznH
 yJ76w7XWpHvcLa0nVeDSPjO6g9rE0dC+dxreiuOwGj1K1mL48DnScxHs4zV2iXg1cs8F
 6fYfuLxJlcrNM2LAbcr2zzJWuKlFVLEup2UhiZxifxK2hyKjFYnK0cnSFWes713vrG8D
 Jmxu5paBVlQ3DbqPYpoMhdyJ9k46T1jIBg1DrFmu7mHMtKftw0IOWbn3EJtowPkgTdWY
 fQONH2H9w21hXWsFPNX0s3lXFvvSCIbTBfaSwCOBTxwoefeR6n2C7n1XkdP6YXvq06Ao
 h0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469406; x=1705074206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfCx4/gtR4YY4ivQoLXNfOFMl7NDjjAvmzs8gXTbe8k=;
 b=rJnLdLHLqLPetj0G6xv6VOi+UwefzgHSUwVwRoYPf15RsG0m30759yUeTcKlWLZsDA
 cyhBK1N692a9kvzL588JCPgFqcYN5URqDSmBZIp6SDaSfkIUtOh297Bury4M0oAcmAQr
 qlSqqKTe6IYkts939CJKSnYAvY0n8ZlR3G0g5b/q+ZILHvu4zbVd4tzSJiaq1QyE1n5P
 cdLzjNzbhpdt0ZtFQ4zrmK384K/FrWEW8r0lShjH5fviZ1/PGSW6FdmHBi5maebhkgJZ
 N7ywEhhJ7BlkL98mo5a9HrfnZs8CxfVEfgJ3KTymImPoKsNOLRbuO689AOA5zEhjF0SB
 8WFw==
X-Gm-Message-State: AOJu0YwDMuHIcftDBQeQy9wKLRIDEIZxGk3Vbu3asRJa6NKVEei1QjMd
 y/8tD1ZOo4B1WwL0wJP6Ok657joyRn/W9w==
X-Google-Smtp-Source: AGHT+IGV9c/0JqFZKWsNy6fQZ9HeRwPQrwzjMLkJcB7pd1haJWgZF9t4P74YhreIQe3AS1/6Dv6uMA==
X-Received: by 2002:a05:600c:1910:b0:40c:91f:506e with SMTP id
 j16-20020a05600c191000b0040c091f506emr829441wmq.126.1704469406291; 
 Fri, 05 Jan 2024 07:43:26 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b0040e3804ea71sm1941923wms.10.2024.01.05.07.43.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/71] target/hppa: Remove object_class_is_abstract()
Date: Fri,  5 Jan 2024 16:41:56 +0100
Message-ID: <20240105154307.21385-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Gavin Shan <gshan@redhat.com>

Since commit 3a9d0d7b64 ("hw/cpu: Call object_class_is_abstract()
once in cpu_class_by_name()"), there is no need to check if @oc is
abstract because it has been covered by cpu_class_by_name().

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-3-gshan@redhat.com>
[PMD: Mention commit 3a9d0d7b64]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 04de1689d7..e3e7200b1d 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -162,9 +162,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     g_autofree char *typename = g_strconcat(cpu_model, "-cpu", NULL);
     ObjectClass *oc = object_class_by_name(typename);
 
-    if (oc &&
-        !object_class_is_abstract(oc) &&
-        object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
+    if (oc && object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
         return oc;
     }
     return NULL;
-- 
2.41.0


