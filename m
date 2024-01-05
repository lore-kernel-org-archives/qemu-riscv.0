Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F23C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 16:01:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRV-0005ve-TU; Fri, 05 Jan 2024 10:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRA-0003JI-Vx
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmR8-0006LX-H4
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336c9acec03so1302920f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469721; x=1705074521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7B3Mf2i+vPlyYoqstgqm0gsIkR8x0JtmN/V8QC/eVg=;
 b=cdLnvVqlynralpvs1HCYe6v256jrxlMu+z79oOS/fgwnfJMv3D7f38wmCsBG0oSPvW
 pdCXlhwHrFqZe3RkuEh23fi/jq0gG0zW3ht2225OLehC8oxO4O+ugXUfRkNjyKCpCHRi
 HjBwxRSOfos1jAoa4TzBFJiE/0poYZiHJ+KwLwebj1zfuPskmDX0oA9Bwvg8zJGoU5Z6
 eg+R0EBYynKmiADOH9TBtJ2gYm+UvPOd83eBZXWRp/jDmIcUrJmWpdc4H44HvJ/YRJyM
 T/MXuEI3Gm2OJNSfJ08vhfI4KOHLk8jjalmesmw3sB/PrD19W8BaBBT9NbbuFaqtDieb
 NjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469721; x=1705074521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7B3Mf2i+vPlyYoqstgqm0gsIkR8x0JtmN/V8QC/eVg=;
 b=BvMUyRRhW8ocQWXOA7q8HeZl6d+J++sqkBE3AAS2hg6CqstL4r/JjlDs5yZSHOYDvk
 yPf0diEJHalaKd7d6TzlP4dIr4bZB0AFL3BBKkDHhVSooWnC5YPm2Wmd68TW9NOLUU7E
 8yYS4eAzOiw3V5o1hXBIgIrdX4oyAbazo0flLdJExgLYYiESOqJA27wsxO4e4kQ8pwMz
 ZApoOvO7w6egBSPqNPX5xM14j6O+tno/XN85xnK4Z1p2+esXzcBKJDnnmppSuzNBcV3k
 /Cxn6Q1eVAr5psVtFeESxE/alHLh89c9v6mU0mhpXUlxsTsNTuGykBTqCC388b/p4p3y
 lHMQ==
X-Gm-Message-State: AOJu0YzyDcPPql6LhrpTzI+977510gpy/QdFK4UkgvO3G/7L+RnrQIjR
 2EGz5845Sfn0C7grbAyQpHdz3kj7W7agsZ/wAa24od/mKds=
X-Google-Smtp-Source: AGHT+IGjsaNn11HIHXu5l/67ymJSXi89A/jUI+cc5iuTHU3kZDHmxbR0YIafbwTnw9lVegrp8MN72w==
X-Received: by 2002:adf:ef81:0:b0:336:70ed:4cc with SMTP id
 d1-20020adfef81000000b0033670ed04ccmr1129456wro.95.1704469721129; 
 Fri, 05 Jan 2024 07:48:41 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 df14-20020a5d5b8e000000b0033677aae2e2sm1601439wrb.107.2024.01.05.07.48.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 53/71] memory: Have memory_region_init_rom_device() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:46 +0100
Message-ID: <20240105154307.21385-54-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Document Error API usage rules"), have memory_region_init_rom_device
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-11-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6d7b49b735..6209458f56 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1646,8 +1646,10 @@ bool memory_region_init_rom(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_device(MemoryRegion *mr,
+bool memory_region_init_rom_device(MemoryRegion *mr,
                                    Object *owner,
                                    const MemoryRegionOps *ops,
                                    void *opaque,
diff --git a/system/memory.c b/system/memory.c
index c6562f5e86..e5193d4623 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3618,7 +3618,7 @@ bool memory_region_init_rom(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_rom_device(MemoryRegion *mr,
+bool memory_region_init_rom_device(MemoryRegion *mr,
                                    Object *owner,
                                    const MemoryRegionOps *ops,
                                    void *opaque,
@@ -3630,7 +3630,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
 
     if (!memory_region_init_rom_device_nomigrate(mr, owner, ops, opaque,
                                                  name, size, errp)) {
-        return;
+        return false;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
      * We only want the owner here for the purposes of defining a
@@ -3640,6 +3640,8 @@ void memory_region_init_rom_device(MemoryRegion *mr,
      */
     owner_dev = DEVICE(owner);
     vmstate_register_ram(mr, owner_dev);
+
+    return true;
 }
 
 /*
-- 
2.41.0


