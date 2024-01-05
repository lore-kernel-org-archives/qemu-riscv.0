Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0428CC47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:52:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRU-0005kl-ME; Fri, 05 Jan 2024 10:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRF-0003wu-NS
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRD-0006cG-Pn
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:49 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337520892f7so392642f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469726; x=1705074526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS/EWIqcckkOMDkJJEhaku50ApzyYMzhGT/LMkqQfVg=;
 b=TQKmNGjJDide/9Oo07D/i+Oegvwn/RSRSI59Ceub2ho3TaO4cn2Trm+/h85KIULEd1
 uDo5PXFPKWCOEzscu1P9ttuVXBZbwVNDAyjazNoxIz6bs9uh5n6L9Wdbk53e0vIKic2f
 56NfS7iUqm11yTHxUGYKJUF8SckZo04uXXfIZ4tmhaZw9du/4fhE+RzBZbQHatM/GT/q
 1l3E2+VlQ5P/PZBdTbGquBCt56l9XE/7Ec3IarLInKDq7MNcp1TPMIcC/6LOgfgrNhCm
 inJoRD0PGS3Nbrybxa58hlv+Y5GU2V3V5+8gambOdZszPyG7T+QBcOgIzR1cpMbP2v5K
 O2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469726; x=1705074526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KS/EWIqcckkOMDkJJEhaku50ApzyYMzhGT/LMkqQfVg=;
 b=MZ1sR8WRNBzO9UoMwtZ5JsEieKYFu9MY0yePOrvJ1fOsTzqKSlWqIkQ7am9OYgg7oQ
 h0oIFa+LT7WBnnpqYn4eoxVG2DJx1QRdbgOxkax9181NCg5kWCEe8gP1B2kvT+fNyjQh
 yQ3wIBPzjQxe/cN5iOvSB26bP5iK5iWclbeCCc6nGgpvYkZarcbTcqqfh7whoWE7dK1R
 9vuOl8+hg3kH/rhV6gRXEz2/Xv3BaFpDTNHFn58P0tEBxTbXR8x2JVCJVtJEBKBOlGOe
 1WAtoJsXYf5kleefaWQcWnCrZpx8byFyq1T3UMePDtPIm5zJGVwpEQXEgxHn4eoxc1Io
 moLQ==
X-Gm-Message-State: AOJu0YyNf2JW0lDsmLSRHmWnh1fDSQBGX649E2WttPYphl0DfeIJBfxD
 PIN5Fy2d+YaZQVjIjygfVOPC9NS7BwxoXQ==
X-Google-Smtp-Source: AGHT+IHCMZopN7QkaYjwbRy6R//U2x8WCEhaSSdxcgt4jsVJjXGRov5SRbnQWWKvsRXafcE/p4r2fw==
X-Received: by 2002:a05:600c:1ca4:b0:40d:8bc8:3566 with SMTP id
 k36-20020a05600c1ca400b0040d8bc83566mr1247666wms.145.1704469726365; 
 Fri, 05 Jan 2024 07:48:46 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a05600c54ed00b0040d86e89abfsm1891493wmb.43.2024.01.05.07.48.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 54/71] memory: Have memory_region_init_resizeable_ram() return
 a boolean
Date: Fri,  5 Jan 2024 16:42:47 +0100
Message-ID: <20240105154307.21385-55-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_resizeable_ram
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-12-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6209458f56..faddf8f073 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1342,8 +1342,10 @@ bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_resizeable_ram(MemoryRegion *mr,
+bool memory_region_init_resizeable_ram(MemoryRegion *mr,
                                        Object *owner,
                                        const char *name,
                                        uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index e5193d4623..75303484e1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1578,7 +1578,7 @@ bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_resizeable_ram(MemoryRegion *mr,
+bool memory_region_init_resizeable_ram(MemoryRegion *mr,
                                        Object *owner,
                                        const char *name,
                                        uint64_t size,
@@ -1599,7 +1599,9 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 #ifdef CONFIG_POSIX
-- 
2.41.0


