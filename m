Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AE4C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRO-0004qL-1k; Fri, 05 Jan 2024 10:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQh-0000Zq-UK
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQb-00051a-HE
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so16210615e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469683; x=1705074483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bo0EnTBB3RSA39/U6I4CQ9tWQh3q7HE8iXyXM+NS6g=;
 b=zysmM0MzPDmI2w6M74MLyNnQMRZxVdkG59Hhf81CuNJDkx1ELkQ9yqyi4EmGn+AcDc
 l5W07oKCdBQXI6AHyZ1SPm9rEJhL0BGuDnQCunnNQqvwT+12ml02is3J6rynkarxg8d+
 FBJ1EfSqok6ztz5ZKy2NglkCeILhA6JYZq2ueONHmf57iqB+E4cHB3sFnSb/53KvchVS
 ilOy06iIP0MOf+jU4K13yIDU+vK2ZbJ52rRZEz3+kEDvQNS4Rj+29xolz0noHHlfxKCp
 opBOVoYf6ms9v4YjtDvUoI1qSqZrahxH9M8UZn98kqGw5KWcAIobDqyuP3vqcQWS2IPM
 Ha0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469683; x=1705074483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bo0EnTBB3RSA39/U6I4CQ9tWQh3q7HE8iXyXM+NS6g=;
 b=pjfj+jQVfkarxoh5y/tz0AGBQMMpOgpSyprk0gtDpIg+vHXkmuiEE8RqJWEQLd09Bj
 gG+ShKhrl46QZRJfC1l8GhhoPU1zoJdY8OkyDkQHU5GCDS/2mWA12gE+ry5Ix6dH2KMb
 qwzT2pCXRKuahEPWr6+6wqwojR8/R2McqbNUXmmXCZLru0InmtxwnO59MTSf8IpyY48W
 Mw38e0BfD2pQGybzC05l3Hl+OX9BnGcatnZrSLVVZbYGIreE4PBDm40Wy8dvxqRFkzuf
 CkaOAKRupidj1+xG8dkbJr+kMwcB3/8GOAtr4KSp1DRINhXnXecHABuqe8xZuEx+zVHZ
 3cKw==
X-Gm-Message-State: AOJu0Ywyg66PmhZXxGn9rlh37NoZ7maliMTpNS4dBIK0gZ9CELijgppk
 XRKQ4MPFnBSw7a9wldpLGJ2HfJsNyuv4FA==
X-Google-Smtp-Source: AGHT+IGuPlvhP7jxhH421R1GBJlA97HhyOkxxKfAI9qNkDSzT26h/FWxDS0gQQneiyGkph+0VLkwKQ==
X-Received: by 2002:a05:600c:181b:b0:40d:3a32:7d51 with SMTP id
 n27-20020a05600c181b00b0040d3a327d51mr1222446wmp.119.1704469683198; 
 Fri, 05 Jan 2024 07:48:03 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 i16-20020a5d5230000000b00333404e9935sm1615796wra.54.2024.01.05.07.48.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 46/71] memory: Have memory_region_init_rom_nomigrate() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:39 +0100
Message-ID: <20240105154307.21385-47-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Document Error API usage rules"), have memory_region_init_rom_nomigrate
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-4-philmd@linaro.org>
[PMD: Only update 'readonly' field on success (Manos Pitsidianakis)]
Message-Id: <af352e7d-3346-4705-be77-6eed86858d18@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 413fbda089..f3a4a76817 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1498,8 +1498,10 @@ void memory_region_init_alias(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index f9e5ae22d5..72c6441e20 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1701,14 +1701,19 @@ void memory_region_init_alias(MemoryRegion *mr,
     mr->alias_offset = offset;
 }
 
-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp)
 {
-    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
+    if (!memory_region_init_ram_flags_nomigrate(mr, owner, name,
+                                                size, 0, errp)) {
+         return false;
+    }
     mr->readonly = true;
+
+    return true;
 }
 
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
-- 
2.41.0


