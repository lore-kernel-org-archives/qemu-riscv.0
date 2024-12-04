Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F0E7716D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvxG-0007ak-KH; Wed, 04 Dec 2024 15:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxF-0007Zd-3s
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:37 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxC-00073o-Hg
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385eaecc213so114939f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343993; x=1733948793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMiVeD+NvW1fa7vIzwk9nB4EqLDwXQxpVEw4CRgejIU=;
 b=YBpmGZDfstLpjl/RN4Vx/k5ltxLmhf7FgupLyh4t7ipmqbUttxjZapBrKzGg+MMJpB
 bmsFzmT0j7kgmhyu951vi14v+vIVhAY5+c0PsBZ8agooqEbJYuaNRm15J8bQXFB40Dv7
 owX3vlwpkcc2arFmlSZNE8b20Ev6aNpH7KeiGC5EPqUsalc49/OKstb/lNoYDEYINAOn
 9nUIGphkw429GfOUwq+mJKLiqfHeiHLh0TGvKNQ2SOjip9zdSps5HWCO18ddVsI+h9yp
 I7YXU3aEenTVbCt81QTHqmslaY8b27oA/Mdufpz+OBRsgWpnQrRNqL/FCmMIhSMYeIpy
 UCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343993; x=1733948793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMiVeD+NvW1fa7vIzwk9nB4EqLDwXQxpVEw4CRgejIU=;
 b=RCDJhgnrQWp9YhmMRrWrViWyfDtXx9MUOxgsWohVQcWxHgOTsHvP7DwS/Lfr8uzgnv
 dWOAwdT/ZLYRUWNkn95DLhmv0yxuykIux86pbFmXGNnQBJUx1nxXAEi31/jsktbpp/2t
 YS4fUJiTTXrwNkHnKHUzie97zoshEYc0zWTIygx9bwNvoA+fusw5n2+kz4lwXLwqkwVm
 osb2U+bc5C3xlEMXecbFje4EqddbLbyWf+jXTq8gYg2xTKViVqgjdPVa5aMsh6TIU/fF
 2NMPlv9IrTeJc8BN3iacfln1QKugaJMhr/U5+LtctAuOaEmi+N0z4g0Lp/NKJaApuTLS
 inOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW76GgKQdvtN6gMKV31ExI8A+MaGbfKBIEzfWuaIwjTlKz9xcvvph4wNcRhCbiHX9s8tCnXm6PA0ViW@nongnu.org
X-Gm-Message-State: AOJu0YxB5Yx2F8TvbNSeQUdj0dsr9r9uE3Qfzige/ltj5tnGNVUxWPag
 ItyGjpkDlQBOIxq86gU8Jei5TqITQA0HpELuoOIXR6zZSM2U16UXYyAsHPBbYTg=
X-Gm-Gg: ASbGnctKjZolHp+fgGEUwV93dehSWXjRhxGozyF14VjZf/PWAqmPOKo5/CqyPT6e4Ha
 c4ZJIdsZrb7h+h1QW8ZeBR8n/rjX3vinCRFm44+f1wJd2D1wVekCMbX3PSGJ0QZtB6wyGzUyt5J
 scE+1OyG6rwSiOQZsWpiAQvFlco/0ab/6g2FYAhrj5gTvA67q9D17zMh05C3wL16jUWriR0mLrh
 FbHl+rORAhP1VS1ET0Jr6dF3jXpReH6317UHPLLu/NBm4Yu9kHmncv8rPACYFQElfSyuGnW9tdd
 HF9V9wY3jJXP7Q/lhUmA7NjP
X-Google-Smtp-Source: AGHT+IGWhwjv2J2oO67dFvzI2OUj4axL/zRmbmzFJFjahHejUxN3c+TpGi6RU4aHAiB2lykmP3GeYA==
X-Received: by 2002:a05:6000:2cc:b0:385:e8e7:d09a with SMTP id
 ffacd0b85a97d-3861bb5a42bmr666212f8f.2.1733343992917; 
 Wed, 04 Dec 2024 12:26:32 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f10a12dbsm10075187f8f.105.2024.12.04.12.26.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/20] target/rx: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:47 +0100
Message-ID: <20241204202602.58083-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

While on RX the endianness can be set at RESET, we
do not implement that; only little endianness is used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 65a74ce720f..391f3214168 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -27,6 +27,15 @@
 #include "fpu/softfloat.h"
 #include "tcg/debug-assert.h"
 
+static bool rx_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    /*
+     * Endianness is sampled via a pin at reset,
+     * but we don't implement that yet.
+     */
+    return false;
+}
+
 static void rx_cpu_set_pc(CPUState *cs, vaddr value)
 {
     RXCPU *cpu = RX_CPU(cs);
@@ -217,6 +226,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                        &rcc->parent_phases);
 
     cc->class_by_name = rx_cpu_class_by_name;
+    cc->datapath_is_big_endian = rx_cpu_datapath_is_big_endian;
     cc->has_work = rx_cpu_has_work;
     cc->mmu_index = riscv_cpu_mmu_index;
     cc->dump_state = rx_cpu_dump_state;
-- 
2.45.2


