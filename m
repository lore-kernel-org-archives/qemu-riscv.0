Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01E6C4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:31:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXRR-0004eQ-01; Thu, 18 Apr 2024 15:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOm-0007y8-Vj
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:23 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOl-0007T3-AF
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:20 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a52582ecde4so116943766b.0
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468378; x=1714073178; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLjP+56aWYnnkz1DDDJchrnGcEe4NhmJ8So9/v4UjQ4=;
 b=ParLr1xCZ+NwFQaJIoKYvwj8nn1OnnhSqfv4v3rt2koBwPPNZh1u6rDxvG9owbfj2k
 S+880aDyVEfTPHmITZP4lnH9z8s3pzWjjke4MmziuxCa7JddgubhTnERenhAuIRCJ1uF
 +pDcqm59V/jzJlAhh4dEzrTT+cUY8jkC50mS19sqp/J6jmy/glOhcoB2zvf+IbUQAsOr
 uyqoqS6NzSWk/27+PMA/eafcGhko0q1OVVBJCIY/qM+qg9enrEYdkL1haltbK7eazq00
 nC1keygEBxPz6ldSrLjJ6Cyz9r3h1BBS+4LLNrIhwnfrfa0UP26y5UX66ObLkCQiokbj
 8BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468378; x=1714073178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLjP+56aWYnnkz1DDDJchrnGcEe4NhmJ8So9/v4UjQ4=;
 b=suqtMPxsGz7rkESrWZg1e9HS1/gxzN8FKkdnAiJlmntAK6B1Er07vp4G/91H0zoqJQ
 s69npnPhScMZP78T4ZFT57nPxSeSHQr05X8713TCcBjxufcKwUsIqre7PB17rfRNoHtz
 osiCQlsMIWswUnKNxqZgJjutL6O1ltY2NjIBCLDQx6JquXHrmdcEM4plIeSmaBj3FpwE
 qkyrHGRnVmKCguA0iBjt04uE3HMGlI8s3kiY/ARIeFi2sU7Yejp8Mero639oY77KTIu2
 PV2uP9OWKA1h9iwmlt5svFjr+GKphrGqCBORxeK+GyTI7JZeomzO6GqnyElAk2jakbj1
 KoyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYSAW41U4wlVSy5uYc2oW67R0VyNpFIFYIy37LLsFZ7FM+6NRxjTlbssms5C5Ez7XPllVoPlVoO3YyJf822quy8UJY7mc=
X-Gm-Message-State: AOJu0YxAc/XKfHX8gyGUcfDQPsgUIQJ7kUMwPtenfyywkEF4be+sv3ZA
 y2YuG6yZGR2+FJUK97+QzVeFKkgVJgoYbV9XqOgOf/WU+hJncjundABUrPK5L4M=
X-Google-Smtp-Source: AGHT+IGIyJcuxTWVzJ5A2zRDxQxrv2YI3QEWh/QF+lto57+gXutKQjVp9+gj3KNHJecg6m3omxb4CQ==
X-Received: by 2002:a17:906:19cf:b0:a52:6fca:9151 with SMTP id
 h15-20020a17090619cf00b00a526fca9151mr48443ejd.49.1713468377872; 
 Thu, 18 Apr 2024 12:26:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1709067f8500b00a5559f0f9dcsm1275997ejr.79.2024.04.18.12.26.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:26:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 08/24] physmem: Move TCG CPU IOTLB methods around
Date: Thu, 18 Apr 2024 21:25:07 +0200
Message-ID: <20240418192525.97451-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

The next commit will restrict TCG specific code in physmem.c
using some #ifdef'ry. In order to keep it simple, move
iotlb_to_section() and memory_region_section_get_iotlb()
around close together.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 50 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index dd7b222942..cf6334f3a3 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -736,6 +736,31 @@ translate_fail:
     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
 }
 
+MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+                                      hwaddr index, MemTxAttrs attrs)
+{
+    int asidx = cpu_asidx_from_attrs(cpu, attrs);
+    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
+    AddressSpaceDispatch *d = cpuas->memory_dispatch;
+    int section_index = index & ~TARGET_PAGE_MASK;
+    MemoryRegionSection *ret;
+
+    assert(section_index < d->map.sections_nb);
+    ret = d->map.sections + section_index;
+    assert(ret->mr);
+    assert(ret->mr->ops);
+
+    return ret;
+}
+
+/* Called from RCU critical section */
+hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+                                       MemoryRegionSection *section)
+{
+    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
+    return section - d->map.sections;
+}
+
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr)
 {
@@ -957,14 +982,6 @@ bool cpu_physical_memory_snapshot_get_dirty(DirtyBitmapSnapshot *snap,
     return false;
 }
 
-/* Called from RCU critical section */
-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
-                                       MemoryRegionSection *section)
-{
-    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
-    return section - d->map.sections;
-}
-
 static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
                             uint16_t section);
 static subpage_t *subpage_init(FlatView *fv, hwaddr base);
@@ -2434,23 +2451,6 @@ static uint16_t dummy_section(PhysPageMap *map, FlatView *fv, MemoryRegion *mr)
     return phys_section_add(map, &section);
 }
 
-MemoryRegionSection *iotlb_to_section(CPUState *cpu,
-                                      hwaddr index, MemTxAttrs attrs)
-{
-    int asidx = cpu_asidx_from_attrs(cpu, attrs);
-    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
-    AddressSpaceDispatch *d = cpuas->memory_dispatch;
-    int section_index = index & ~TARGET_PAGE_MASK;
-    MemoryRegionSection *ret;
-
-    assert(section_index < d->map.sections_nb);
-    ret = d->map.sections + section_index;
-    assert(ret->mr);
-    assert(ret->mr->ops);
-
-    return ret;
-}
-
 static void io_mem_init(void)
 {
     memory_region_init_io(&io_mem_unassigned, NULL, &unassigned_mem_ops, NULL,
-- 
2.41.0


