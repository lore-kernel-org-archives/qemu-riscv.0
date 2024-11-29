Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63974D729E9
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 15:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tH39Y-0005wu-Kz; Fri, 29 Nov 2024 10:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tH39W-0005wB-Fn
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 10:43:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tH39U-0001Vs-Na
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 10:43:30 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0062e9c80so2463797a12.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 07:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732895007; x=1733499807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sg+SWcDqWlUzlCEJmd/1EXEzYbTMn5ymk45kdZhKOZs=;
 b=zm2IcYYF+gODkyftlhJjT1yCtkT2Zt1YT9r2b9OgGuUyH4rpesCYK1dwA7HtR+QS40
 f3jIvLqrgRgWyC42B9Zr3PYHd7i+fgKpSh4xt9g6Z9Ows57pk4xVBvpVHnXB1/t85gEO
 rzK4uZ67mneuAplrfJ50Hf2sCsvA6WgslHa/XCf629MZyWOtjkPKsN/bZBVejjZAiIc5
 tgTBJLLcO3fYd7jZtfJGGEl168IwvXu/D4YFV3OSBEBgpFgWVKnQ/z0sHvwX+wr1xOki
 tWbIhCJh2FqnnmQGUSU8LBl1zu4GRFN429higBJLsY9XYi8rSjw3IHKOCBVp8eCREOjJ
 M27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732895007; x=1733499807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sg+SWcDqWlUzlCEJmd/1EXEzYbTMn5ymk45kdZhKOZs=;
 b=gNqEUsXX4LKEYJ6vbBp4BM8wvLndQNOg3QUblAYO4diDKgiVC3YODnUSgIFNmUzcNs
 kChRzR7lbAU21wBwPLz4Xa8Po4MG9HKynfaCvZ3L2dOQ1vM2cVup6F6Jf0oZIgnvA0K4
 3DK4RrHwbhzLACGP6NNcLNVs5bu9LDJnLaFQkWzHII3xbgoNdfqd2wyRztFNrJC6voi5
 3TEm6WZi2T/4ylR2cBTkxNsjBfwpqNXPxPJKGF9Qkzny6Wx2e+TPhlseBQ3V34swW4OJ
 0muafXh0WpwIFLNXSa79ppyr8yvNioy5Sh8yagL994Sh8zFrd6F/S981VXJ1qs+66b9O
 +iBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhHWGx/b6TcutdrUcgc9qUTKGd6xr37//7coVAt56r9c4zX9DxBY8La3ewErWfPA6TzH4u0WMQZusC@nongnu.org
X-Gm-Message-State: AOJu0YxLx1mt384V9oHk4/piOGuBPpEX/++ylXDrRMrPQfWfRWL94Abd
 vzMBao55u90vgfFY7CfNNer9DqMbDek9qtYi5Q7UjhhrLK/+ZI6/tf2yBCu445Fz4CcnbFuVKBZ
 d
X-Gm-Gg: ASbGnctPQnanJr33fjACgRAphs0QMMVp/X15eS0zlj0FXmZ8hpK4dRA8x3DJGJOOksL
 uMkXwZB45J9rcRO0Es65yyhRk5Uj15fs4SM3yqb3DK6z6kqm1LFtwTplYYhOvP3snO16zYu5Q1o
 hvT5CREeX455kFURQEx8lAmM0/hQ8MKEgC4j0+iOOgk1ckQubp2c0RAkWmaM6QM1VBDT9hJTP9Q
 T22xxNF2IiH3TXiFCzufUrXYAcfmtMkM9ZhDWf4G3Ly52f+nIIiMPAmZP29
X-Google-Smtp-Source: AGHT+IFCcfbpWYeCSTiKzgUh4MRu1kJjdiHokROxnaBrAcL1UIJVmVwpBOS2b8qI67xVwNqngl/fbA==
X-Received: by 2002:a05:6402:27d0:b0:5cf:d078:c9dc with SMTP id
 4fb4d7f45d1cf-5d080c4868cmr10475696a12.22.1732895007279; 
 Fri, 29 Nov 2024 07:43:27 -0800 (PST)
Received: from m1x-phil.lan ([176.176.147.124])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8dcefsm2003596a12.55.2024.11.29.07.43.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:43:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 3/3] hw/char/riscv_htif: Clarify MemoryRegionOps
 expect 32-bit accesses
Date: Fri, 29 Nov 2024 16:43:04 +0100
Message-ID: <20241129154304.34946-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241129154304.34946-1-philmd@linaro.org>
References: <20241129154304.34946-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Looking at htif_mm_ops[] read/write handlers, we notice they
expect 32-bit values to accumulate into to the 'fromhost' and
'tohost' 64-bit variables. Explicit by setting the .impl
min/max fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Notes

1/ these variables belong to HTIFState but are declared statically!

  static uint64_t fromhost_addr, tohost_addr, begin_sig_addr, end_sig_addr;

2/ I believe a 64-bit implementation would simplify the logic.

3/ This is a non-QOM device model!

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/riscv_htif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 3f84d8d6738..db69b5e3ca7 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -325,6 +325,10 @@ static const MemoryRegionOps htif_mm_ops = {
     .read = htif_mm_read,
     .write = htif_mm_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
 };
 
 HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
-- 
2.45.2


