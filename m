Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E55C3ABBE
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:43:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uD1Wi-0004k6-BG; Thu, 08 May 2025 09:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1WU-0004Py-Fj
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:42:50 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1WR-0004jX-8q
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:42:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2264aefc45dso14507535ad.0
 for <qemu-riscv@nongnu.org>; Thu, 08 May 2025 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711765; x=1747316565; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gg679U0oeTq/CrQiB/JmPwYk2e2+O7nBapgQj4COJfQ=;
 b=VCLuXgvoFb4mjBA3mHRP7790++foWnuIb8qexm19n/uuzXW3ybcunp9TonNPNGhUw2
 b9itChusjpb6dxe6CiIjlUeLZTyEHfp+FQbrxBa74cNw+hgY1OBOBRXXuqEkTsUvVE14
 PK0/xPHFJZw1HwRw180/adto8dysyMSZmH5l0vf7+ceA6PptajxTBlAFtC9wtjrGBZSv
 4lzAm1O5fjAbWtfgjMp2c8oygkHmJ9stlYvbSA1E7nwpb85L5I8eG2NkqTBWB9CnE6GV
 AazqTUkRrdeUxgQi8mZD76xFg6mU/5nPmJW4YbLT99GWQc9VCgdHZYOWbBUYKsgxk21V
 iTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711765; x=1747316565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gg679U0oeTq/CrQiB/JmPwYk2e2+O7nBapgQj4COJfQ=;
 b=ZUGd1qUq/8QIlwcC+NqKyhmoUtdjm913pPgjPoiBoBs+y74cF3ILnXqPnp0ruabj7N
 9OIezFIFENJRW9j2HsEvYObAIeViza/KOY3hYQ1ozB/w5X2SU7/hlMqUNPSYye+9dSM1
 JGJEp9Anrobqj5udt7r4Yf6Jypqh3QjNDkDpulr0iMU7x8XltnojjeidhDcDrRxJCIYS
 hVg9LU3CvpPd9ISL6D3/x20/wBE5iO4MoJcomvH3WJfg1E856TGqa2FLRYzD5UBwTY3U
 cZrb7hVrPqVJlR0Y9hB1QqZCNjOH8JoiZKHvKCVn9gtMb3pKZjAPND1Yfx38luzhe1Hw
 LgFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUft5oUMb8Gsp27rZ1ibP8tMD+Vrs3V9KEElgOOE25qf453qhREnoczrTeTwy24yBYDSGW2pDwUVRo@nongnu.org
X-Gm-Message-State: AOJu0Yz8/uA6arV3bUxCtbkEcOx3P9HP2xArMKAxJdtX0HWTqG0Ekwtw
 16brS/sJJ+S7dDsVc0zVXE38RTdIDXFaz5BKrB//ISiwDxKeWCwUjG8sKxojjXo=
X-Gm-Gg: ASbGncsIPtdRWXpnhgaKaURFOrhc9KMXHHsBZnM1FSkNP5KnV3J6Rl1luaEdXsw3REq
 tzOlI2r8PviJHPQK0ILilvdAIVJ5IKWJK7h+13pYe4aRIxXW0PSqGoCPWV3sPX5+YhPRksoeA+y
 nvZ79zrf484O1WcU3eq4TuwGQJjmzHgrtOuza62EPscLbqXB4/4OsSsTutHF8XrdQbuV3ILz017
 7+FE/huF+5AhMUkpWwyS0rL+SOdZs5cvf/pGo3AMhpbrVkvpGF4yP0nWaeqYe7ITFp/17ALt9iU
 dieP68l6lU719hOg7le62Xm6E9oXtgRt4cTnUZvI+1o4XQAF7+/mzzpCsmdQczAiSaXm9hNRWKU
 UluIYjfY+Rf5UouK5bhKa3950lA==
X-Google-Smtp-Source: AGHT+IGd2BdAYJt/pgnYduHUiEhOTqQEnoUCxH7HrPCg6BSmtWJTrp7/DQ1i/MuAD3g4No1s3jElvQ==
X-Received: by 2002:a17:903:41ca:b0:22e:421b:49ad with SMTP id
 d9443c01a7336-22e8f0b60a9mr53754775ad.46.1746711765042; 
 Thu, 08 May 2025 06:42:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15232655sm111626845ad.259.2025.05.08.06.42.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:42:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v4 18/27] hw/i386/pc: Remove pc_compat_2_7[] array
Date: Thu,  8 May 2025 15:35:41 +0200
Message-ID: <20250508133550.81391-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62c.google.com
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

The pc_compat_2_7[] array was only used by the pc-q35-2.7
and pc-i440fx-2.7 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/i386/pc.h |  3 ---
 hw/i386/pc.c         | 10 ----------
 2 files changed, 13 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4fb2033bc54..319ec82f709 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -289,9 +289,6 @@ extern const size_t pc_compat_2_9_len;
 extern GlobalProperty pc_compat_2_8[];
 extern const size_t pc_compat_2_8_len;
 
-extern GlobalProperty pc_compat_2_7[];
-extern const size_t pc_compat_2_7_len;
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, \
                                                  const void *data) \
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 65a11ea8f99..c7cdbe93753 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -241,16 +241,6 @@ GlobalProperty pc_compat_2_8[] = {
 };
 const size_t pc_compat_2_8_len = G_N_ELEMENTS(pc_compat_2_8);
 
-GlobalProperty pc_compat_2_7[] = {
-    { TYPE_X86_CPU, "l3-cache", "off" },
-    { TYPE_X86_CPU, "full-cpuid-auto-level", "off" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "family", "15" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "model", "6" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "stepping", "1" },
-    { "isa-pcspk", "migrate", "off" },
-};
-const size_t pc_compat_2_7_len = G_N_ELEMENTS(pc_compat_2_7);
-
 /*
  * @PC_FW_DATA:
  * Size of the chunk of memory at the top of RAM for the BIOS ACPI tables
-- 
2.47.1


