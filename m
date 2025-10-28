Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A094BCCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:04:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDeg1-00061C-N9; Tue, 28 Oct 2025 04:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDefy-0005zz-Su
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:03:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDefv-0000o8-6R
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:03:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47109187c32so30443265e9.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638602; x=1762243402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=UMfETVQOdyLejXM+bn0lXHRmLNYaPXRrl0gur2oUg0/hF+y80ManCvk1IsOGtf5PkJ
 fZCoBPMIYF+cz9HgADD6p8hqL17vHeD39aQXT0fANz2gAHXQpt9NNm2/czGSp73TB5YV
 UDLq2vis7IknDPMHwZsQtGqVl8smFHtgo5lXQ4cJuFi6fwzw0ehn/J76J3Nz4vSMQ77b
 HDAEwa4qZnERoYQ5EOClX/ZtQ7YZyYrjD7y856lf232PvUXO75r17ZtEV8ZzQY8AO725
 du08puqQ4h9FLEFIaYJGT/YR4C3WM2r92i+UlWjWScIRaaj+eyfLNTqSUl2zPPVo1r3Z
 sa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638602; x=1762243402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=eoVALUPe2paCsGZBPOIMtKvkxXCUPy+Lh9PcDPTnWVuzSmYh1BjmrdcRmHGzK+n6Bi
 oRIl8h5AsDmRfXgLtVtQ7TEEtUyHdkW9y38xDOAIsoxytN48MXBCkHXj1bF6pjPK5FAi
 5zeUtHsMBFCRq4nAjNi/JWq3+ijGQEvo2CFI8x0wmcRTOoQoBk2H/4BVUVCmYbHbrhaj
 AMEKHeo7RVemY2pxpzG9fTA/MaHvZT7D5mr8F/nzlGcXRHXqE3PWro9FNF1FzLSfCEwY
 gxHpyHrD6jkKftSqbWStat/j3jNL/EbtfosG+sOcI0UJkgjmYGV050+89EADNa3Ea/z5
 1wwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbHSiz/XpGVs4dcBVYrNyghsqetJQt3MsLdwGVVEOSfNHylA1Nn0DVB1azMl/G/z+lDLYi3OmwdSe9@nongnu.org
X-Gm-Message-State: AOJu0YzJfqUenq9vMPwpOFC6aYWzlzwg9rF+gpOTpLwow7ei2IxyzuVz
 Ac7NfleA1JM+8KVoufm4dDXmf4sM2FNkULpTxB+E9L06mlpdI3pjPi2W/WyhJ+2br/o=
X-Gm-Gg: ASbGnctyREAh7IpFyWwlT4wb1PWQsLt6pJCCZxw/zeCW+fSlOtenxd120de378mc7JB
 JdWk1HD4EIRQzGSJOxXLGaI4N+kKTj4zCKYGJeh0toROu5uOcvdJXQZCaD9GVmQEP55VS5toYr3
 0g9QLC7gMz9KcWeFqJlgISO2XdBSMa5ddfIKt8OM7N/9FnZnLW0dxNSKZc5Mrw4SubPkIaJDWc7
 JkWM6QtDrQRDime8mICyy1YKU/AKSGGcJyRV9vSDoWrPl+Vdr1f6wbe+e5f+wHgePmvAWaIMSoP
 +d/XarS3xXTtRPGpQcVnUunqRgdRqwLxN/EtK5c98RjeoEoASihxHiuVh92qFAHvpqTJ9UQFSlP
 M9i0SwiHNWKzhmNPXj5Y4wn1egNNemidhMOIciBSDW+km8fyLXe4Hc6red1vgWjnR+REqDek/2w
 wyGwYGvA0oQXc/68RScJOfIzUjCDQ5+e2tCdjLTOroJDHVHj0RcYxbHEs=
X-Google-Smtp-Source: AGHT+IGu8tAz7QNSfENwh5DhebxcpB0Uf+T7MY5mWmoV8QBJEMMaI05N0PzFr/4r9vD0c/yed5mTVw==
X-Received: by 2002:a05:600c:1554:b0:470:ffd1:782d with SMTP id
 5b1f17b1804b1-47717df6c74mr21252585e9.6.1761638602070; 
 Tue, 28 Oct 2025 01:03:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd035dc2sm184181795e9.5.2025.10.28.01.03.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:03:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 1/7] hw/sysbus: Use memory_region_name()
Date: Tue, 28 Oct 2025 09:02:51 +0100
Message-ID: <20251028080258.23309-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

MemoryRegion::name is kind of internal. Use the proper
memory_region_name() accessor, which might return a different
name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ae447c1196a..d33be6b2b52 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
 {
     for (int i = 0; i < dev->num_mmio; i++) {
-        if (!strcmp(dev->mmio[i].memory->name, name)) {
+        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
             sysbus_mmio_map(dev, i, addr);
             return i;
         }
-- 
2.51.0


