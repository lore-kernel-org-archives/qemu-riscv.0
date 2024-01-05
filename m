Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092BFC47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:55:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRP-00056L-Pm; Fri, 05 Jan 2024 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmR7-0002ur-Hy
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:41 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmR3-0005yG-V3
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:41 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3374eb61cbcso1484460f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469716; x=1705074516; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqhTmAjxaD/BTNoVLzXvd/YAl4zMVPKwo4ul47FACnE=;
 b=hG+QZSF0V851L7X8jojOvd9JZ4d5qjF9niXHq0p9KQj/BkYgySSeSx8M/nvxpE4D19
 nXa2lYEQnTb0aATCyaoj6yQzom6DfeFg2LpcysBT1A1ANiXPCknvfHs6tA9SaeYDF/f1
 U5g1gehpehK82xs48K3kz6+gZ5qhVFVlsf17Tka5pS4YxESQ9A5YmD55OUijQKeIkd3W
 n+BFve+c6BVfjZpdnS9aVeFZ8BUdjQcHKJhYQvRFfTJJFW9NeCJtylw/O9QXqkPLD1PS
 pTqkO/AqkpWGHoRJqxD+a8hRifOEdI83lS7BK27vfGfCFbyvY6iPZRSS59yM9kvI/lCr
 gN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469716; x=1705074516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqhTmAjxaD/BTNoVLzXvd/YAl4zMVPKwo4ul47FACnE=;
 b=bx5S8cTXmmkYPSRfsOewbkjaOA4+A7/mLxifqRhbf4Khe1tTAEVORUg/+GoG8oA2kC
 mjW+j3VYqRMd2juigXpUZq2TreoCCyyYjub4KSmsWkIh/rJ6i0fWKHHniDfF9ZIjKVHn
 RhsQ9Lb9oO11rh2MtJ5e4MdVBHJIHkYC1nuGhm+i2wTHyZ3hcSgSKefsRbv/GOo5FofP
 YiT93+O4HxalMDRpcFNWV/jXfnh1fiBf8IjHBWIcj8FDiFbyjBgedRAmyiuCDudImkez
 mBzYX6J3h0aoobKaUA0wtRsP9w8DusMBcYqkDQpdymTDEeUUAi29lG0mv0+Yonxnpdz3
 AUqw==
X-Gm-Message-State: AOJu0YxI3aN9a/EUDZADug5yXIj6iamWBv2UVEFLOpe1klaWl90i3M9W
 mMMIDL30tzLtBAk8dIVRNd5ZNQ0VXyi91A==
X-Google-Smtp-Source: AGHT+IHK2kFr48UQS0bqpJVz6a1E49DB73EV3GNpMskug7Jop80bPyFSPeLiiJHWQyevrricJnKzIg==
X-Received: by 2002:a5d:6e82:0:b0:336:7d12:caf3 with SMTP id
 k2-20020a5d6e82000000b003367d12caf3mr1547672wrz.44.1704469715876; 
 Fri, 05 Jan 2024 07:48:35 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfd001000000b0033672971fabsm1602690wrh.115.2024.01.05.07.48.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 52/71] memory: Simplify
 memory_region_init_rom_device_nomigrate() calls
Date: Fri,  5 Jan 2024 16:42:45 +0100
Message-ID: <20240105154307.21385-53-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, errp;
@@
-   memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp);
    if (
-       errp
+       !memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-10-philmd@linaro.org>
---
 system/memory.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 8db271c19e..c6562f5e86 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3627,12 +3627,9 @@ void memory_region_init_rom_device(MemoryRegion *mr,
                                    Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_rom_device_nomigrate(mr, owner, ops, opaque,
-                                            name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_device_nomigrate(mr, owner, ops, opaque,
+                                                 name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0


