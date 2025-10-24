Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CC3CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNNM-0003XT-PJ; Fri, 24 Oct 2025 15:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNNL-0003Wr-9V
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:22:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNNI-00008u-FR
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:22:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-471066cfc2aso21914105e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333775; x=1761938575; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGrNlmgEfDKog95M9ZVss58H7CcoVe9WzE/h57EW+cY=;
 b=ZYYHRzQRN9trJu+hSBH8YxTGwPyraba9RNqX/F7K1jNkXnwdUMYQWrkImmjmaFIlBu
 L7twyGf0WHstuoq2UqvxvImEc5b/GRJg/2hRB86ITnXvZOBHairAxILiFeCVasEHzFlI
 pg6YuKqpxMSk3eERK5Ojvyg/azrB1G4TOhTRp3msA5oW5K6qsA5C5btgm/3Wa3JIh5vS
 pHVhTPROn9VaeZ/e8n9zSr1TB9W+q8ZdxwQUkPRewWsT3z8nmE1gK59PteP8oyolcQds
 coUgqMpIw/ZAwz56jFOKmtqDPnh48WCm/vgpCkMtteKgd88fyaL3XyECILy8PUVbvJce
 kyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333775; x=1761938575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGrNlmgEfDKog95M9ZVss58H7CcoVe9WzE/h57EW+cY=;
 b=Uvb1Agkv0t7/nCiMKrJfnA2LnRNsBGHvfADE59Ifszw1aB/skGej8OqGsD2xfL4Wzt
 yO1TNv5yexyKxge/e2nhgFSHPRT3XZ3S/DjfoXL1pVqeZa3y3Sc8ewJ+276ei2+pf5qX
 6Yd9j35PPTUHwJtrXHvlUmt+utJ7yUCLFYeCRqrU9qyT5N2ecKk/K3oBvm2IVes/kypT
 +6XpBae31s2GuNzeHtUGFMFFDJ4PSM33hiBYySdmN1KrOoiErdDAcBcZkZ1ddsUUIU/d
 9u28wGqPnhTnjeRM2FbZoei1p7Z495keZ8RMHyyJ7Lcw+pcNpcpPT2j6yNBr2wc4fUvy
 +1UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+7tjfZFecXYgPLWq2DqBEAj3D4pueF/FEBEOZfAhP2Jp8GX3RpPDSlsGkQ3pVw8YpyGCc68Jxg1A4@nongnu.org
X-Gm-Message-State: AOJu0YwmlfKqiV9ccSGUqejuSqM3E70njjqwKC+OGkBZqUvvW4EvJko6
 qNf2tkJ4hYO5w0Zuy4nM8Y/ZFkE6QLrVqnOZSAsGGSl8VV+pECq5AS/RiBp19tmVdWQ=
X-Gm-Gg: ASbGncs6vGhhH0KQahr/rhfK8cUb50ISVuKqOLCjNMMnGSmzP6cvBwQT2h2qPEu4oct
 xf/xCxfQH3YisoDZd2WC6rtHWEDO5AZ7ZY3vE2NJsl+GJRP9NvCB6vQh9GKovfXNv00c7IWL92P
 I4Xp72RBau8v9CnXHB+aG5FliQl+Nyq1yN63TBvLtFmaWtydl2RYRK5emGF1IQc4659I7buGaDt
 TFueZok0dmTsXdjR0PKm61hB7YfiGKP9GmMEjuFXw2ciqw/9hZtiOkuX0j95quLz0kTSg2+NFTp
 c9WYsRWkBVh0hY5+/HbvLM+H7gIjVCQez0kzj/u6RvEIxNaOnRgbnHL/mQW5PI8F1QiSML4QVRH
 4GM51PstgXygSh3fOs0cKPFQbPULiZIGPUIdnshDh4wfXPqDYdEKeieZPBKLgGwY27tlQGUk07a
 1AOiUhow9fUJirJOaTGj9oRcWlLqtcHRBcTLiBSrApgHeqkebhlF13tYde//8j
X-Google-Smtp-Source: AGHT+IEFnDI3ledJ0LfrIPwH2sO4YMX3+BMmj6jZc8PUQduOy7lvc4bZAI4a4cAswh095gb5WNfapQ==
X-Received: by 2002:a05:600c:548d:b0:46e:436c:2191 with SMTP id
 5b1f17b1804b1-47117903f96mr228552875e9.25.1761333774875; 
 Fri, 24 Oct 2025 12:22:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57d9sm11118596f8f.20.2025.10.24.12.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:22:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Ani Sinha <anisinha@redhat.com>
Subject: [PATCH 12/27] hw/misc/empty_slot: Include missing 'system/memory.h'
 header
Date: Fri, 24 Oct 2025 21:03:59 +0200
Message-ID: <20251024190416.8803-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  hw/misc/empty_slot.c:26:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     26 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/empty_slot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index 239d7603207..1cc3bcd9050 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define TYPE_EMPTY_SLOT "empty_slot"
 OBJECT_DECLARE_SIMPLE_TYPE(EmptySlot, EMPTY_SLOT)
-- 
2.51.0


