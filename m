Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEACC47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:52:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmSU-00008y-8P; Fri, 05 Jan 2024 10:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRR-0005Ld-Br
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRO-00074g-F9
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d8902da73so12882595e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469737; x=1705074537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9DCMj7pY2pO17D+FqBvL8kwEDleUW00T3E/JGiYz/k=;
 b=U54if9m0B4jYXM4rDTogAYwijQfmaWRbyeNV7pFxhFHddn9l0IDHgqC9Cilhz5VgDl
 bQn7UZX+V4CFJNfZFyhm7isRTf7+aIu9AXB1alsa3icILbPnLv1oyhOXMhzZlLSgi9Z4
 BOIBinMngYba1t1jnPZP805CP73T5tad2dPqgWOzkksGNGezv2eUco/wmNgY5R9a5+Uf
 Mw9BuSBNuYOTc3qGMWOsOFjZwi/mP8UC7zcUgSnJnKoRS9LWQdnr5npbPDzoa6j4EkLG
 x32opXu7JdXwIg70Uivz7cchEEeQIGslAjeCFyDb0zRXUTRYb6/WZszJ0vKSj10N1atN
 ouFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469737; x=1705074537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9DCMj7pY2pO17D+FqBvL8kwEDleUW00T3E/JGiYz/k=;
 b=UvM/AJ9zFC7DUtzMXdpZh7jaljdTHb1JQqeX6ROHmSqWJtC8Y0ZG90BTFPP5Camrkj
 rXsA0LlYygHYllcmMtazBG8DPIJwg96rS1hZjNR3VorybFmJIFt1WzDpHMQe41z32Syw
 b5EM1KVGklrskmDhybioeGz3+ldhCp546hUrXlAFHVf6x9NqARLS12LV4hfnuSIiYWe2
 /mSP+2FUgOoUhABhzh6EJa0OWIrq+ym/YO/zjM3mLkZF2Nl4aw5E+Zvu/VSmPLQelPPt
 bokCiqdgpmqCWAbXaB7hvcigcND8PiB2+RNSLrZJyXD/EisXVoIecfluRrt4n1YMg5i2
 3vlw==
X-Gm-Message-State: AOJu0YxLP89pjtltI3Uob6SSlz4FUDKkvnbsm0ErSZtK7PNnbSA+x9sf
 kOn8l3Fdxpsf0Vxl5pfVQI6PJ48vOgnGMWSKiG9t8F6QO1I=
X-Google-Smtp-Source: AGHT+IFr3rjevgUO39MMi9bFJ/ZWecNNIqMe1MrKSODaM+cLKa+lPF7yzj6ex1uolFUngYScxhl9Vw==
X-Received: by 2002:a05:600c:4a13:b0:40d:8ddc:b443 with SMTP id
 c19-20020a05600c4a1300b0040d8ddcb443mr1540873wmp.50.1704469737001; 
 Fri, 05 Jan 2024 07:48:57 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 az29-20020a05600c601d00b0040d87b5a87csm1965144wmb.48.2024.01.05.07.48.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 56/71] memory: Have memory_region_init_ram_from_fd() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:49 +0100
Message-ID: <20240105154307.21385-57-philmd@linaro.org>
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
Document Error API usage rules"), have memory_region_init_ram_from_fd
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-14-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c39819ec75..48c11ca743 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1406,8 +1406,10 @@ bool memory_region_init_ram_from_file(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram_from_fd(MemoryRegion *mr,
+bool memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index e05d88aa67..9ceb229d28 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1633,7 +1633,7 @@ bool memory_region_init_ram_from_file(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_ram_from_fd(MemoryRegion *mr,
+bool memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
@@ -1654,7 +1654,9 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 #endif
 
-- 
2.41.0


