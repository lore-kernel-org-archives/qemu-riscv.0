Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F8FCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoZ3-0001Ua-2t; Tue, 28 Oct 2025 14:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoYY-0001Bp-6x
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:36:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoYN-0004m8-0z
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:36:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so35562645e9.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676572; x=1762281372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDDIpY5DBZefLzt1zYAEWbfOSaDV/iJd8y/kxVHu9fE=;
 b=iXdrD0KzpeskL7GUL+WFhInBsjK7TOjCVQ2nqxAvSw1YEAlr9ZabssbPr6i+fobDqz
 sZr4TAqGYt64YJQlrXHsBI1TC35M2D5n69mSmF1sYVWETE38xKw3fTE+Dq35gs0OmT00
 Smk6Q7PTa390DwQF7z5IUsdCI273HicECuYjcM8LBp7ZNBTNbr2K/JVjhDR6oiWbaqgi
 QASNQfOFIWJ2jrM+AcSL8cCLT1UqbpV7dn5VGRKn/iKHSI/6KorgFvsfQyxrIhd6yvNW
 1wS8kMULWQwfuAoltr3BsUujCoYQN68Y2dWmTa59DfnMixmaJH6e1mRh1g9XydJLI0Zc
 CDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676572; x=1762281372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tDDIpY5DBZefLzt1zYAEWbfOSaDV/iJd8y/kxVHu9fE=;
 b=qHqk7OxDl5YewU6R8DXZzLj9ds3g/MLEO4unzkNi3aBYliXuU6SaWFo6ipgK6ldJzq
 mB0Z+H2qLUQo55t6QGdLBgFYsEJ5oPtpxY0LYmoh60ghs/XQHbwls1FzyDcvFc0YV31I
 yYVKBOlNYlqu27bbsmAoLYgnrDuK/Y6d7p7i0+5F9f/16t0YBfeaoA6lepqv1t2z1r5y
 pBOQ+80iMUKmVH/cbILrac296bxQLQ/dkHQgRh37Qrns8YjXOYz9anfuNEeN/VjIjmk3
 /xrN8FZbbW8JHOL+dznTxJ2eP236Frn6TMcGYD7OA95hKOhO+R+mgiYOsILoqjcAymhh
 Ejuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Z13AV614rXM0rcze8OAcEeCm6kw+7g2OJgFtGyV7XTT0V6+yqZVRUZnFYPRpAX/hbPV6obL69Yis@nongnu.org
X-Gm-Message-State: AOJu0YwE/eqBxxp419IFprAGxrtz8dQ3glqJp/ff44afptfutVQVANkZ
 9X4BZptlkYyQnodguqJjGGJyvFjmTIqcviqjnSFQbH9Ce9dqPCoN4iMfhthQJhANmRw=
X-Gm-Gg: ASbGncveawxB3OpZJ6bW4fYP2RkDYTI3XPE5pN1dpg3XUNxOGkIQILHD2sHHCDoXyq/
 Gf5rVhHqA/I4eBbhl55r0vzWFD3mlOHdP/+ZctePLqiYhdldxhPuBjVcHKj/HTaaM4w+2X8Zm12
 dg5SqTPdF4wGPVLKpJY9g05lgjz0sTlUQfFcK05rsYI1Ila86JcWg0Q21O5hJ2B09kqiDC4lccV
 ed6AbuJur5ZASMzF7WOkhFkJbA0GqwZYj6yXWoaQl50Ic7a//Q19cv1dSoVIb628DQXYgja5Q1I
 iHgsMsyO0NjMS6+G9RBLFrCRSmuxx9c0v8r3WnV6jAy2a43pJmbI8+OXwb8Kj/3pL8sbtHuLVkB
 TReb9ExtxG3kMI9CkOT9O9Ce74TH02NcCiIJF4D5mxz1tZIxD/gndmBzEB2LPjN9MFWFRTzUVYf
 1yZDqjWigyMCZBZWpMMjQflwxh6TtIwfP+bBXI/H5qseH+vUdiiA==
X-Google-Smtp-Source: AGHT+IEQHBby75ghyQxhJs2H+uO0E2xg04ykfY1VExJwXzc1JWKcrYMUPxFAIHU+uZPdSQ4Ux37r3Q==
X-Received: by 2002:a05:600c:820c:b0:477:e70:592b with SMTP id
 5b1f17b1804b1-4771e16e792mr5356505e9.2.1761676572454; 
 Tue, 28 Oct 2025 11:36:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3b9994sm4335315e9.16.2025.10.28.11.36.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:36:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 20/25] system/ioport: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:54 +0100
Message-ID: <20251028181300.41475-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/ioport.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/system/ioport.c b/system/ioport.c
index 4f96e9119fc..9bb8df5e757 100644
--- a/system/ioport.c
+++ b/system/ioport.c
@@ -177,17 +177,19 @@ static uint64_t portio_read(void *opaque, hwaddr addr, unsigned size)
 {
     MemoryRegionPortioList *mrpio = opaque;
     const MemoryRegionPortio *mrp = find_portio(mrpio, addr, size, false);
+    hwaddr pio_base_addr = memory_region_get_address(&mrpio->mr);
     uint64_t data;
 
     data = ((uint64_t)1 << (size * 8)) - 1;
     if (mrp) {
-        data = mrp->read(mrpio->portio_opaque, mrpio->mr.addr + addr);
+        data = mrp->read(mrpio->portio_opaque, pio_base_addr + addr);
     } else if (size == 2) {
         mrp = find_portio(mrpio, addr, 1, false);
         if (mrp) {
-            data = mrp->read(mrpio->portio_opaque, mrpio->mr.addr + addr);
+            data = mrp->read(mrpio->portio_opaque, pio_base_addr + addr);
             if (addr + 1 < mrp->offset + mrp->len) {
-                data |= mrp->read(mrpio->portio_opaque, mrpio->mr.addr + addr + 1) << 8;
+                data |= mrp->read(mrpio->portio_opaque,
+                                  pio_base_addr + addr + 1) << 8;
             } else {
                 data |= 0xff00;
             }
@@ -201,15 +203,17 @@ static void portio_write(void *opaque, hwaddr addr, uint64_t data,
 {
     MemoryRegionPortioList *mrpio = opaque;
     const MemoryRegionPortio *mrp = find_portio(mrpio, addr, size, true);
+    hwaddr pio_base_addr = memory_region_get_address(&mrpio->mr);
 
     if (mrp) {
-        mrp->write(mrpio->portio_opaque, mrpio->mr.addr + addr, data);
+        mrp->write(mrpio->portio_opaque, pio_base_addr + addr, data);
     } else if (size == 2) {
         mrp = find_portio(mrpio, addr, 1, true);
         if (mrp) {
-            mrp->write(mrpio->portio_opaque, mrpio->mr.addr + addr, data & 0xff);
+            mrp->write(mrpio->portio_opaque, pio_base_addr + addr, data & 0xff);
             if (addr + 1 < mrp->offset + mrp->len) {
-                mrp->write(mrpio->portio_opaque, mrpio->mr.addr + addr + 1, data >> 8);
+                mrp->write(mrpio->portio_opaque,
+                           pio_base_addr + addr + 1, data >> 8);
             }
         }
     }
@@ -335,12 +339,15 @@ void portio_list_set_enabled(PortioList *piolist, bool enabled)
 void portio_list_set_address(PortioList *piolist, uint32_t addr)
 {
     MemoryRegionPortioList *mrpio;
+    hwaddr pio_base_addr;
     unsigned i, j;
 
     for (i = 0; i < piolist->nr; ++i) {
         mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
+        pio_base_addr = memory_region_get_address(&mrpio->mr);
+
         memory_region_set_address(&mrpio->mr,
-                                  mrpio->mr.addr - piolist->addr + addr);
+                                  pio_base_addr - piolist->addr + addr);
         for (j = 0; mrpio->ports[j].size; ++j) {
             mrpio->ports[j].offset += addr - piolist->addr;
         }
-- 
2.51.0


