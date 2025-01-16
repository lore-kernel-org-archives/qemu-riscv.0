Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56174C02180
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 13:49:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYQFP-0001Oj-13; Thu, 16 Jan 2025 08:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1tYQ5v-0006SM-Bl
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 08:39:35 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1tYQ5t-0002aJ-MK
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 08:39:35 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-43618283dedso8646605e9.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Jan 2025 05:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1737034772; x=1737639572; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=llUxeNJKP/XQHTffNIR29Mm0dRvcJWC5YQl+TF4tqT0=;
 b=Bc56XJRcqfvRNWd8KwAGHR0kMjH0JsYfLexlmtt1fmWJXp/4OID/b/5i2BWa7PcGoB
 G9Pwnci5FF/Uc6EzlHnThb+gaPHPym8Kccj4a4o82VOCw7ni8aFnjNy2l5XjdTDz95Sf
 Nj01GF8hsTk0TXyk3WawvUqFtapXcYXRoIyYaApEZi8T5/UNpWjqv7JyyQdBfXlrsNwx
 xeT5DropDxzUmQL7asY7yJ6J2CBkIsCWGadBnbEK9Aq0DEzSIEBK9gNJM1Mt4VKZ7Dbn
 aExFBAr+bAwloP7uTj/Amqn7MKm/rvhOeKpNG4TSgdRCASYJSzV8CAdJtcyPOW+Aa6uj
 HBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737034772; x=1737639572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=llUxeNJKP/XQHTffNIR29Mm0dRvcJWC5YQl+TF4tqT0=;
 b=E5RxyXhAuFZ65KPQV+cOzcICU2vzemqiyaoQKk6hG6Zc5uDn3UCJCXMT/D7K3t//FP
 qR5Fg2ZtaYyufOXgd0sO138jgnShHZyiJXEkdgIEEgb6Wy36r5Y8O+PfY90pakEEwMaq
 CeAEZvM4iPM0ooOLHQp8L9tLGvBvj029GsE2BudD3G3uhjV5kwzbOvtZcqyku0J5kfeJ
 S+sZQbBM5yK08STvthNS/dYud0bzke+WnDz1zbmVT1T+LVkcjkzIc+e3/B5outrpRjBV
 94R8pBNrOZQniLJPcE2XN9AtWEJAQtSGFU/I/wkORUgbME6cvnQapAAycFrMBv8XBXuV
 8xoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9/nKVOQtJ9rMrvXwpkXuMSbgrxSDFI/Ewa8WZREPWwPv7PBzqroat19cVTLN0E38HzMueY0jQND+7@nongnu.org
X-Gm-Message-State: AOJu0YwCtLx/NqL9py9QmPNeKh4HqKLg6EMUFjK01ljaRUTtYQvYv+HM
 0BqPlRTbPEzfSN80PKOE8wOitDFnAaVZk95moWLLsVXg5gd6wqabbvcKp/Q1yfk=
X-Gm-Gg: ASbGncu8o3/xH4Yh8vufqiEXi9TzejVa5Sd+rp4jKvSv/r0UbnrWKNZikxdk8bL44fp
 pfru2AzSuVzP4Bcr8CTGQe01mbBuQmRDTcrlZIE03sMo4B5FhhZ8h/fGpV3m0Y+P0PiBVFFFB0Q
 Gn2idYTl6zcQR6YgVNtfbaHqHZdH6QWWTKXOba19TzJ83T/cvUkwZ8clzIYxsZ/OmP4DBB3vXqU
 6Ze3Fmv7PzDzk9e2nhfsOrtQ8u/y4zEOA1csNZl9QAWyzkBe9rL+kd87ft9LC452+5IYJXFvihl
 2j9OfeWY
X-Google-Smtp-Source: AGHT+IFEDq1HlvLzo1BZOWWGBpfXF7rO0XuMfa24mLM3QScVMcAmXeLI150bhaPDuUMiMLrLmSFaDQ==
X-Received: by 2002:a05:600c:3b9a:b0:42c:bb10:7292 with SMTP id
 5b1f17b1804b1-436e26aed9amr247869085e9.1.1737034771684; 
 Thu, 16 Jan 2025 05:39:31 -0800 (PST)
Received: from localhost (ppp-2-86-138-70.home.otenet.gr. [2.86.138.70])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-437c749989asm61496735e9.2.2025.01.16.05.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 05:39:31 -0800 (PST)
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, jason.chien@sifive.com,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 philmd@linaro.org, Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: [PATCH v2] hw/riscv/virt: Add serial alias in DTB
Date: Thu, 16 Jan 2025 14:39:27 +0100
Message-ID: <20250116133927.37227-1-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=vliaskovitis@suse.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:49:21 -0500
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

This patch adds an "aliases" node with a "serial0" entry for the
single UART in the riscv64 virt machine.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2774
Signed-off-by: Vasilis Liaskovitis <vliaskovitis@suse.com>
---
 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2bc5a9dd98..fb1928cebf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -971,6 +971,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 
     qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
+    qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
 }
 
 static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
@@ -1180,6 +1181,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
     qemu_fdt_setprop(ms->fdt, "/chosen", "rng-seed",
                      rng_seed, sizeof(rng_seed));
 
+    qemu_fdt_add_subnode(ms->fdt, "/aliases");
+
     create_fdt_flash(s, memmap);
     create_fdt_fw_cfg(s, memmap);
     create_fdt_pmu(s);
-- 
2.46.0


