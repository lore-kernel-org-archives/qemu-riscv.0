Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358E8C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:03:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNtm0-0002os-WF; Thu, 11 Jan 2024 07:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtlw-0002nk-71
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:02:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtlo-0007Je-La
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:02:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e54f233abso21502535e9.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 04:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704974552; x=1705579352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BIuwPbYdxJMB/pV1cRmbXcNLrWs80/U0Lys0z45UQg=;
 b=j4Nmo328umgO0ft337tUcbwpLadOQftuZn5wcFyxZ+BvxGKYWNj16MDn13oYIfQtQI
 XP3aKyGUg0iFGi3cPc/KM+0EoDPyYDoMzsSyhpwywBqOYkH/PaJURcB3cNlG6V6AYD8k
 jZHftEbjt2E1VlUD9Bk2RnR7Bn/VbkUGvBxwbJE2X+qYTnLXzIi1AxO+ZAP1uusD+ZFl
 gxiAIJnlgpf3z8SJXCQZGkG2+xom6xj12S7WoyfTDRMyAC4wVQ/hgh91ahZKr8g/U0sY
 mkAGF4081pRzLNxv6E2SYGH53JFSUuYqTTCQKDYNkQxfrpvdd/aMscZ7+8ydf+Guffrs
 /HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704974552; x=1705579352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BIuwPbYdxJMB/pV1cRmbXcNLrWs80/U0Lys0z45UQg=;
 b=n/HLi6SlTd6gkM7t36YSNWfU0C/1ObP9Tg8ZC7IdrV17EosOPogSnTx/i9BZgOmOc0
 zm/JDx5Li6EH0OSw4ouSccPdoi+qBvz/heNcJ/Fq830oWiOF0MJyUdWqWUSocdxDHyYb
 jbhBWFoczGHK8EonuXchUlQbA0YX/mRcT+Lcxw72k64+3UWndQaQQJ0PXfQS3R2R8kgG
 h2nehhzGs6OpGt8/KmSOWCC3GVQQNJs2u1Tp9mn/hQJE9s/uwtHB4sfHIrH6av6eA6ya
 2ClJ1KFxqcwFmmnb9Ggo0/tXuP8URPr2v6zG6REn+rmN2ymY+k0DgsmFRGRUTtCNWFaU
 KTdA==
X-Gm-Message-State: AOJu0YxugthPDgbijcwgGnrYUwwrRMgXU9KLgiRvePTpLk1V3af+/+JE
 dvHQh/wrbuWIuhPjMXAnPZoe6ZQm6gbjbg==
X-Google-Smtp-Source: AGHT+IE+hrlD1H9iWgurMjmKWjTj8HDtEoDAtrB8OJN9xImsPHSOwX/Iu1kp8SYp5MziSOe3lDvjYQ==
X-Received: by 2002:a05:600c:4ec7:b0:40e:51bc:6b19 with SMTP id
 g7-20020a05600c4ec700b0040e51bc6b19mr320010wmq.170.1704974552387; 
 Thu, 11 Jan 2024 04:02:32 -0800 (PST)
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b0040e3488f16dsm1679412wmq.12.2024.01.11.04.02.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Jan 2024 04:02:32 -0800 (PST)
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
Subject: [PATCH 1/5] accel: Rename accel_init_ops_interfaces() to include
 'system'
Date: Thu, 11 Jan 2024 13:02:17 +0100
Message-ID: <20240111120221.35072-2-philmd@linaro.org>
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

accel_init_ops_interfaces() is system specific, so
rename it as accel_system_init_ops_interfaces() to
ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/accel-system.h | 2 +-
 accel/accel-system.c | 2 +-
 accel/accel-target.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/accel-system.h b/accel/accel-system.h
index d41c62f21b..2d37c73c97 100644
--- a/accel/accel-system.h
+++ b/accel/accel-system.h
@@ -10,6 +10,6 @@
 #ifndef ACCEL_SYSTEM_H
 #define ACCEL_SYSTEM_H
 
-void accel_init_ops_interfaces(AccelClass *ac);
+void accel_system_init_ops_interfaces(AccelClass *ac);
 
 #endif /* ACCEL_SYSTEM_H */
diff --git a/accel/accel-system.c b/accel/accel-system.c
index fa8f43757c..f6c947dd82 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -62,7 +62,7 @@ void accel_setup_post(MachineState *ms)
 }
 
 /* initialize the arch-independent accel operation interfaces */
-void accel_init_ops_interfaces(AccelClass *ac)
+void accel_system_init_ops_interfaces(AccelClass *ac)
 {
     const char *ac_name;
     char *ops_name;
diff --git a/accel/accel-target.c b/accel/accel-target.c
index 7e3cbde5df..08626c00c2 100644
--- a/accel/accel-target.c
+++ b/accel/accel-target.c
@@ -104,7 +104,7 @@ static void accel_init_cpu_interfaces(AccelClass *ac)
 void accel_init_interfaces(AccelClass *ac)
 {
 #ifndef CONFIG_USER_ONLY
-    accel_init_ops_interfaces(ac);
+    accel_system_init_ops_interfaces(ac);
 #endif /* !CONFIG_USER_ONLY */
 
     accel_init_cpu_interfaces(ac);
-- 
2.41.0


