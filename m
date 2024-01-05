Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F29C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:49:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRH-0004BZ-5p; Fri, 05 Jan 2024 10:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQt-0000um-0D
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:27 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQo-0005JL-1x
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3374eb61cbcso1484229f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469699; x=1705074499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJr6Vags3Wq7daq7HscgC4QLRNTQj0/WuTPsCBO9nBw=;
 b=WoeHDscvOsCNm8ZzhcJciSxyZwtp5X+4nI8BdIL/hVQ2ZWtP89Eb/0JA89zYRHFVJN
 UJBFOL44qkYyWQnPJR4Q0b41yrsyyzug+6yHw/sSNiH/k2eg5HVict6ApyGL1f7yzf+U
 hf64CvyjvDNV8vpEfAw0es5IBEt4N1x1jzXxeHpM2anYQmDQYpRXNNwDEuP/jEbQISVw
 p0C8IlfFH6itkvXhQjb2tzGCEMYRjP5fZWPz4oiQAoTLsN85l9GUXzKumWS3fGYNdj/H
 gv31cK8mFKsNVlja+Z7ZYKkHTJi/tCiHRJfS5WRd4zkXa1TkOQkBosY8yk4YX6DPZ0p6
 pU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469699; x=1705074499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJr6Vags3Wq7daq7HscgC4QLRNTQj0/WuTPsCBO9nBw=;
 b=ffkmv7qAsTIKGZJoexLBk2VuHNPvakInSnBmo/LVX109+a1OzomFtUdDsN/6KAK8PA
 NBTykJtU/aK3mnec2JxQ78p8FiKc8oe3k6qxyqq3kfQ1vatnQ/4LKq5YkoBbjU8rXa4r
 nmQWI8wV6lMB7sXk2Z3QQzg32R20Ahg+vlrqi4J3CBSiyk0ih8D8y286s+saTELjHasI
 /Q5CLpRPGnoU9sXqMake8UdIleqwTUZ+g8arA9D1evNgS2TfPaJfWJKYtxkOyyshn8ME
 0LTLYOrWzKG4LX4m8DuaLEE2Pgqw+ZllzH1wf7kPDg22fEr6LSqR03eHEa88yyWqA8sn
 ZL0g==
X-Gm-Message-State: AOJu0Yx+t6NhuX5BdXb5yKA+KrEdkhvAO/n8nDi3hc4ZtTncQWINe9Ia
 XUZ6GNsZdIb9dCmUVfAJEWdW4/MLU+yntANJbTA9khW+FnI=
X-Google-Smtp-Source: AGHT+IH7c0vJCsX6VB9nR0Ty+mmpsqszbfiJHyAsBdkZFBLAM8gnBBrceboVk9m+JdOiVe0HbH8hhQ==
X-Received: by 2002:a5d:4489:0:b0:337:2b76:30fe with SMTP id
 j9-20020a5d4489000000b003372b7630femr1274977wrq.37.1704469699264; 
 Fri, 05 Jan 2024 07:48:19 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 h8-20020adfa4c8000000b003375083ff8esm1626753wrb.32.2024.01.05.07.48.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 49/71] memory: Have memory_region_init_ram() handler return a
 boolean
Date: Fri,  5 Jan 2024 16:42:42 +0100
Message-ID: <20240105154307.21385-50-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Document Error API usage rules"), have memory_region_init_ram()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-7-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f3a4a76817..b2dce73e7f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1582,8 +1582,10 @@ void memory_region_init_iommu(void *_iommu_mr,
  * give the RAM block a unique name for migration purposes.
  * We should lift this restriction and allow arbitrary Objects.
  * If you pass a non-NULL non-device @owner then we will assert.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram(MemoryRegion *mr,
+bool memory_region_init_ram(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
                             uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index c1374e9968..45ce6fd6c1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3570,7 +3570,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
     }
 }
 
-void memory_region_init_ram(MemoryRegion *mr,
+bool memory_region_init_ram(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
                             uint64_t size,
@@ -3579,7 +3579,7 @@ void memory_region_init_ram(MemoryRegion *mr,
     DeviceState *owner_dev;
 
     if (!memory_region_init_ram_nomigrate(mr, owner, name, size, errp)) {
-        return;
+        return false;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
      * We only want the owner here for the purposes of defining a
@@ -3589,6 +3589,8 @@ void memory_region_init_ram(MemoryRegion *mr,
      */
     owner_dev = DEVICE(owner);
     vmstate_register_ram(mr, owner_dev);
+
+    return true;
 }
 
 void memory_region_init_rom(MemoryRegion *mr,
-- 
2.41.0


