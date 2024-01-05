Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A093CC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:54:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRY-0006En-1Q; Fri, 05 Jan 2024 10:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRN-0004iM-9y
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:57 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRJ-0006pQ-9Y
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d87df95ddso14955225e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469731; x=1705074531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dn8kXCOFTNbdwpGvjXbfKLmnnB9Pg2Sf7+jbS80Xsv4=;
 b=yNiFcMBIatYGftSM5AGjnqdqSpfEHnDy0FfkdPfkcA3QBAZqmMnGBqeBzlsFTr2uQA
 IhgxgWfVc9rCH7BBJTfpjlcrVGgw0l64eNy4TFI6L+8I+jpZV06K1GBtBYD98GkLEAXD
 qGT4HFCkKhvspbG5gm8GeP1CNPhSg9oX84gGMvSZl0n2UpdFYLMSLsMXCBtO0xGQnLut
 tYxq82Ldsg2P2ZwEwx3Tun/iuoVrz3Jp3iAtvaq4GRvpFtqJOf6FslqMHWfk7owGRQXb
 yVrdQQ6UKNKEmnCA18hpoqfl0yZKMi8BZCHQApcWUegyXfVju59biFNGDKnT3l6a/Td5
 mJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469731; x=1705074531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dn8kXCOFTNbdwpGvjXbfKLmnnB9Pg2Sf7+jbS80Xsv4=;
 b=fKSwX6/hPNgMyaYKgZQDhzDPhvJ9iSC/cg6zwH8qUL9y1c2wEZbjG4TSlmh/pAMRzs
 jlHCl8me/r1RnZHy/wD2vBdZmPipTAZyujHRaHcSN9umrXGkjGPVCz/2rmnhz27eF+xJ
 LGgl613pIhZPJSyDlT9tay0vDdD92Z3ngaiGi7iADja9TR2/XO9/J4IIzFC7LOLjoL2d
 HbQPIdJm8idTlI+NW8wAj/z4ISMlcLz7LtHjGrbDBoILhPegHemIMx/htjCinOXvYCFQ
 6CzgJo9fOosXRfHM79VBDWr1qGAbRiWcrm6ay2030p8jKLSBVZmzrkJi4yVoML1XvnGP
 fw7Q==
X-Gm-Message-State: AOJu0Yzd+UserB+6kq6+bX3Tq7x9jjOsL3XFz6sAhrmgvZCmu3Rx7veN
 2JfW8goVMLSrZTcFcLSuunUgPLZ/AV4uMw==
X-Google-Smtp-Source: AGHT+IFD7DyB4xxIwWnwejyKUiMk9ET1/qEMLxKpFrkBYKfHXFKCm93a1wvJdQnG9Qtn/KNLDMdcQg==
X-Received: by 2002:a05:600c:5188:b0:40e:375f:6929 with SMTP id
 fa8-20020a05600c518800b0040e375f6929mr311928wmb.40.1704469731598; 
 Fri, 05 Jan 2024 07:48:51 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b0033680f7be5fsm1610144wru.87.2024.01.05.07.48.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 55/71] memory: Have memory_region_init_ram_from_file() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:48 +0100
Message-ID: <20240105154307.21385-56-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_ram_from_file
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-13-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index faddf8f073..c39819ec75 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1376,8 +1376,10 @@ bool memory_region_init_resizeable_ram(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram_from_file(MemoryRegion *mr,
+bool memory_region_init_ram_from_file(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index 75303484e1..e05d88aa67 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1605,7 +1605,7 @@ bool memory_region_init_resizeable_ram(MemoryRegion *mr,
 }
 
 #ifdef CONFIG_POSIX
-void memory_region_init_ram_from_file(MemoryRegion *mr,
+bool memory_region_init_ram_from_file(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
@@ -1628,7 +1628,9 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 void memory_region_init_ram_from_fd(MemoryRegion *mr,
-- 
2.41.0


