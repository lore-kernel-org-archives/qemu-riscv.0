Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA0EC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnij-0002Jw-K9; Mon, 11 Dec 2023 16:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnia-00029v-AG
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:36 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniX-0005aC-CZ
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:36 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1f0616a15bso554158866b.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329692; x=1702934492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2w63ljFdqIz1JzgOaJC6yCkuASP8vMkY+wuXlFzHsQ=;
 b=FWaDrIg44cRSF71NBUvTHkYEk8wNlu4+ipuDWl2Fmfnesy7e7CY/V4wIvR5HuY408Q
 d0NJGB3zh1MkyZ+HTDrnqG+Ugq4TrmOpPApWara0paat/fdfUlxsHnIqjRiGNyisOfb0
 1htjqIMRAH/8IfH9kZhYr7kjIwXbaIyPsvH2NEbECX6kXSjkXpHxlGOaOI6Q9oejNLa4
 Ln9D5+3/YqTkER9Hi4WkpU7csGxY/1QWhyJqt65ZEnB5vwMYZH5znXUKnId2pI8nPr7Z
 6oWK9ybH90C0BNPz2YldUmo2xZLXKeQPtYWlnTrYk+ncd5z4hXTZDmyLKdfJtkoUItCI
 vjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329692; x=1702934492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2w63ljFdqIz1JzgOaJC6yCkuASP8vMkY+wuXlFzHsQ=;
 b=giLU5D93DzoW/3aNl/QiKzbVpENIif2EV+NNvE8FBliYR+SXAsTSDDd86rGN985g8n
 sAhZBu1YBOw6MXVw0dnNBayxNS04JgQuX0Q5ey11Ksd/IFZfRgFSNnj0w9MsQA9CY6Os
 HYQLCSwBhLAZD2ioqJXjGiPykBQQr/MpMSC1GP2qIdk9dRazMF97VNH2qokU9alpe435
 ystYdunVD+m3+mZhByAfZse3NlyMs2PK8aPt7avznjPJWHibPSOi5iOXkJutZxNLXwdH
 +azZ5AUSI+BL73Pv0fcPVbEsDt9i1mhG212WH/lACHWaINNUqGQHZfZjR92WtqcURbMs
 ZPJA==
X-Gm-Message-State: AOJu0YyIF9B+ZOtPGQ4bPSpFijtWsNSxvdxcq9UWWc8FpjQsCsHHTrl0
 4P/WtMcS8N/Hoix4UTYD5MvJXg==
X-Google-Smtp-Source: AGHT+IHPiHbU4zyhYynFno5PODyyp6MkmIQrhrcW4VtRL7mGlUhbV9KC4i0etCle48wLlV6QIbSgXA==
X-Received: by 2002:a17:906:b389:b0:9df:bc8d:fbc8 with SMTP id
 uh9-20020a170906b38900b009dfbc8dfbc8mr2584832ejc.37.1702329692122; 
 Mon, 11 Dec 2023 13:21:32 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 mm15-20020a1709077a8f00b00a1b6ec7a88asm5320964ejc.113.2023.12.11.13.21.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:21:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 10/24] hw/misc/mips_itu: Remove unnecessary 'exec/exec-all.h'
 header
Date: Mon, 11 Dec 2023 22:19:47 +0100
Message-ID: <20231211212003.21686-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
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

mips_itu.c only requires declarations from "hw/core/cpu.h"
and "cpu.h". Avoid including the huge "exec/exec-all.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/mips_itu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 5a83ccc4e8..37aea0e737 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -22,9 +22,10 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "exec/exec-all.h"
+#include "hw/core/cpu.h"
 #include "hw/misc/mips_itu.h"
 #include "hw/qdev-properties.h"
+#include "target/mips/cpu.h"
 
 #define ITC_TAG_ADDRSPACE_SZ (ITC_ADDRESSMAP_NUM * 8)
 /* Initialize as 4kB area to fit all 32 cells with default 128B grain.
-- 
2.41.0


