Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D186C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:49:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRU-0005ni-VM; Fri, 05 Jan 2024 10:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQi-0000Zv-Vg
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:19 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQh-0005BS-6i
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:16 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d8902da73so12874105e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469694; x=1705074494; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6o3ekhlfh/+CPANGecFeiASb4d6bBwdSECTd289TNhk=;
 b=DQ2QHVerxwTlhr1DqwDw79ObknnhCQxFTaaeZuBVVYMFATrYKkTM5ov94YvUVSbC+s
 r4OfWgetYJCN0rvRqkwXfpB/GFKjRN2PpVDvO3Jw7lACaRBlcJvahrqNexRnJ4fCcmVy
 hE6I99OAkXqylZ4Wyuma5VSqAD9t/bQOeOv/6vBLFQeNoIiaPXxFMphm6Bg4ZO3MOPy8
 v0gjaVImO96C8xzzUgDHWzZBCZmEdqwgCorsKJ/pDYBQekiuUNtAC2AyqQMS9u84LXtG
 7iG6x7g5lESq20caGsdyR4vvdThmeVmraLFKbGkImHhVuar87CANvafTDSgegrtmJTHH
 cdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469694; x=1705074494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6o3ekhlfh/+CPANGecFeiASb4d6bBwdSECTd289TNhk=;
 b=LPkk4TgbvH+8qH+6P3Ym7CL57Bj3w0SYrn7ienwxsrjD2WcTHRGQESvbbmy0lWMYcj
 vCvXuv7HeYGCR5d882SCd53JK7ZEAyF5LOyhkDmJ3jh6Xws/96gcixtmbJBhpat16oD2
 oyGiMPGd8ie0gqd5ma84TpPO2YsqYBY0dttN+XZZrro5uZzx+RERrjm8lcE0kkyHtQcb
 F0yhYInylUwrSv5nO918OHKVuybB+SOF5/7HbRhEZHsdL8ghkJDbvU+R+p7dIRrLBXiw
 v/H/vlxK4z/OfsGLpDiAVTlyRtrlJF+o+dl17JilqymmSPr+v0gD24jTVN4JI+8q4/gk
 jxrw==
X-Gm-Message-State: AOJu0YyJQTuysD2yFDU0fzbn8J63XSwM9ag4dE7O2J2OwPg3r1L6Y2BS
 XaA5yce9mdIBm26OJIerjUMgICD8lZPhOg==
X-Google-Smtp-Source: AGHT+IEVGT+tdyoug5yxzjTjKQjcUaDiSAs47WQNs2RTCBbWWg2OgCTyf3aQofocalOeLeGM2MPLjg==
X-Received: by 2002:a05:600c:4f51:b0:40e:3a6f:9b1e with SMTP id
 m17-20020a05600c4f5100b0040e3a6f9b1emr370957wmq.109.1704469693840; 
 Fri, 05 Jan 2024 07:48:13 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 fc12-20020a05600c524c00b0040d5a9d6b68sm1952853wmb.6.2024.01.05.07.48.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 48/71] memory: Simplify memory_region_init_ram_from_fd() calls
Date: Fri,  5 Jan 2024 16:42:41 +0100
Message-ID: <20240105154307.21385-49-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
expression mr, owner, arg3, arg4, arg5, arg6, arg7, errp;
@@
-   memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp);
    if (
-       errp
+       !memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-6-philmd@linaro.org>
---
 system/memory.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 3997ac5928..c1374e9968 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3577,11 +3577,8 @@ void memory_region_init_ram(MemoryRegion *mr,
                             Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_ram_nomigrate(mr, owner, name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram_nomigrate(mr, owner, name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0


