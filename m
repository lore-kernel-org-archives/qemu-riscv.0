Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E67D637D5
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBOQm-0007ZI-L5; Wed, 13 Nov 2024 20:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQk-0007X6-Lo
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:13:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQi-0001yD-Jz
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:13:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso1370605e9.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731546830; x=1732151630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KW25vJBxhufCYPIMuRXQYWgykya5onuISdgtY2NESM=;
 b=BXCGhH1z6w8k5PQT6nBpqrxvkJ/+Ys2CUVoCDAx/jrBXMAWHIInNkvTw5c9dwIbkv1
 riOKJe9YAPjcKhz8pgaTx/wry8uftqtXxKTnyTbXKDWN2J9YhgG4Ts2w7SR7Kuc0wqkL
 GMNA6hOiOKZM6ns1CXn31E04lAZlW/k7hZwc/d623TjkO2zNtyEW9NlJ1LTJqCk/x5ml
 vYCytQCkSJ8jL8Nv6gUg4Lfi5grE+Rn8FDrvfmaWDy2BkPf3PCdbyr3hQolRCemzbBg8
 JSqhCxCdhEk19+9KN5QHpr52R6SiLLZIwQ0cAWjHpjGhaX0H4yusvi83Tcd/h2WJ7LhU
 1rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731546830; x=1732151630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KW25vJBxhufCYPIMuRXQYWgykya5onuISdgtY2NESM=;
 b=E/g7CtuOhdkZS54lLWAMJEsK+ruv+jnCZexvow8Ag4wXPVUsDbTr7ikXBgJjU2DvR4
 hpatKJKpU9L2Imb1ORaZEoUyW9TpOdl9R4Ha2TY76ZRd/LY0HcS/EosBDG/LHktWV+vW
 WSxSAL4PyYEIZtJTOzZVLB6yHAOJrEny87/N8ZDbACmbMQmlV0heLGlMhPY+TzreoS1s
 sAtdrE1i/TSpHvqRVUYEGpikxaCC1pJPiMAQfH3jdGkqGkaCNMlJrJlI+FVNMq9sMeup
 hR1bZxlITdljsJonU8C9WwBDPYrmVazSFPHIY/6szC2ERta9gWuSnWHLL869IIvVN6zw
 UX0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMEF7cMBfN+XJKMbPMwyM67XIC/lwp3fm0JvXApzajIMCG2O35vQMx91XMzH3NCDMYvXGG8PO2+FHC@nongnu.org
X-Gm-Message-State: AOJu0Yz/vCwCIjJCquyUdmziVjzPLiDO9U34v+Wh0GOcKopQ/N61kczp
 pdfuXOGV39Pj9YAyBT80luJwiS/B81/G9x0MM2yCg0xOhPjn66cvlav8HEnRxAk=
X-Google-Smtp-Source: AGHT+IEC5JlJku6XdBSAUB2qj+Uz9Kq0z6gAZgWwRK2JCMYVh8ykSi7sKBQbjuLQEYGTHDnr+1RcEA==
X-Received: by 2002:a05:600c:3d16:b0:431:5c7b:e939 with SMTP id
 5b1f17b1804b1-432da790770mr2673155e9.18.1731546830113; 
 Wed, 13 Nov 2024 17:13:50 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da298c97sm4649995e9.40.2024.11.13.17.13.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 17:13:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/24] exec/translation-block: Include missing 'exec/vaddr.h'
 header
Date: Thu, 14 Nov 2024 02:12:48 +0100
Message-ID: <20241114011310.3615-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

'vaddr' is declared in "exec/vaddr.h".
Include it in order to avoid when refactoring:

  include/exec/translation-block.h:56:5: error: unknown type name 'vaddr'
     56 |     vaddr pc;
        |     ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/translation-block.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index a6d1af6e9b..b99afb0077 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -9,6 +9,7 @@
 
 #include "qemu/thread.h"
 #include "exec/cpu-common.h"
+#include "exec/vaddr.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu/interval-tree.h"
 #endif
-- 
2.45.2


