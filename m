Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4FCAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d0t-0004n4-Jm; Mon, 22 Sep 2025 05:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czi-0002UK-9V
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czB-0000fz-2w
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so24400245e9.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533845; x=1759138645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpyzDIWQ5ZoXKAzqSyc2elMY1EE9GCHDwM8UA7OBlS8=;
 b=f06tm7k3NwPN0zO9Gi1LFZpDdHj2DeuJr5L8ry/USP25GeLiQC1e9+SOGQemQoc2U3
 qAm37dwy4tkjEhwPfJ5A83SBx+YX10yC+Iby1OcwNsfddnDyqyq5g6Ql2tPZh8L8h2z4
 OccjcjoL+blmj83PdxCsOfzSQ2f65imjibvOr/d5s1czkeV0THVMCghwUQBa6kewCoIc
 5n5gxbrpfvdmAGh+sliuVcTJELsaiLgNGLE557eh+xEsE01PoYKlXVH7nbq5cfXxlDTC
 hO85x/LcrSjbZM4VHWCRRJyOs0qFMkuWG9V/QcRALkC9mvkaNuY7n2RxO7PC32hizND7
 oxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533845; x=1759138645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpyzDIWQ5ZoXKAzqSyc2elMY1EE9GCHDwM8UA7OBlS8=;
 b=TwY8epwb3lVgrWA+8VmABa9XNDOQMD69tCMdaXhqqQegwRRrxRrQLH0d+HHtG+t6kJ
 y+ervF7n02y/TVu78bdK6uxNDZnFjIReLCUnB51vmPrVhQUC4KG4aK9Dtj4jT2/7+0hI
 Py3JnW8+M8qLMjjCQP7BWhgUZvh8G7ErZHmaX7Euz9FfLVSuw/PrmReoyQt9T6HBj2ja
 zQ//LrST+ZjLPGT/ue+tc+6U0tndp44xgO5Pth+Vlv/2YPdshj34bDhHPF99rP79nw8d
 Qp5ebgQ7ADcUzUV+e3aTtbkOHpCCoZXysvE5cK63HftpMc2C2w8uuHo5UF2PGYdbV1rE
 kq/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ohoYRby0KK0lCGKk+aH3fEJl9SlVawc8lqEBVXgIMpW3RosfWWdsvAgSdirhtcFWbOWFA8HnHJft@nongnu.org
X-Gm-Message-State: AOJu0YzBTVqoEOlp/+Gc+RpkPFqTKHqWXtepzZ0MmgWGKQBKX9QXinfy
 iE29NXnCfatDMDS9DA8IfXQOa4t1kbO2N+pZMSgkqx2+1cITHrQxGQMHTVWJEhuR70cUVSIggKw
 QZVVCLs8=
X-Gm-Gg: ASbGncvKRT2fyQSUEk5mRJmxSIIg03XCkG9RiVUUAMVoxRP9GYkj3P7iqCVkYUd3OhJ
 NlLVvZ9/pXfS2SVlg4yX16mn5lQHZqpCmsCt2kddGjE2b9JQ3LwbwKJ/L3EuD6rGRKLTre6NJiY
 MaM3UhaT8pu615I7OWl+ADEPF3g+OlRXVAw0ahKBefHsIm89Dw/iFklBIzSM+7usdGvP5rVk5De
 vHV3l73wePQgDrD3A/yeJkcZqD5F68nW7+FblWzPiejzdVZzeFLxE+TQF7gw22RDfdG/GQdi/v8
 PapiZfy6Lgjh43VXa3Mvd8nkorTtDkxBc126wdt2n74nHgbuM2eg4mlH+tU69xooW96bEEQ7e53
 VW0mER25lyXBahPB0ZO/bgTHykaUipTO0GQ==
X-Google-Smtp-Source: AGHT+IETT8Vq/rVcS+uTMt32M+EaHEz3SHHsDUWgNHeMwBTMpLOGts4+upLnLj8sq+C7fMc28zMlxA==
X-Received: by 2002:a05:600c:198b:b0:46d:996b:826d with SMTP id
 5b1f17b1804b1-46d996b8a43mr12581515e9.34.1758533845258; 
 Mon, 22 Sep 2025 02:37:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613dccb5e2sm233400715e9.17.2025.09.22.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F23A45FA18;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 15/25] semihosting/arm-compat-semi: compile once in system and
 per target for user mode
Date: Mon, 22 Sep 2025 10:37:00 +0100
Message-ID: <20250922093711.2768983-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We don't have any target dependency left in system mode, so we can
compile once.

User mode depends on qemu.h, which is duplicated between linux and bsd,
so we can't easily compile it once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-13-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index bb0db323937..99f10e2e2bb 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -12,9 +12,10 @@ system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'stubs-system.c',
 ))
 system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+  if_true: files('arm-compat-semi.c'),
   if_false: files('arm-compat-semi-stub.c'))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
                 if_true: files('syscalls.c'))
-specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
+specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING', 'CONFIG_USER_ONLY'],
 		if_true: files('arm-compat-semi.c'))
-- 
2.47.3


