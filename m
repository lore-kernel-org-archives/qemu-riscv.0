Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08517EE6454
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:01:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sodoo-0001fk-Hg; Thu, 12 Sep 2024 03:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sodon-0001cc-O1
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:00:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sodom-0004LC-36
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:00:41 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-718e11e4186so545192b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1726124438; x=1726729238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkmTzubpfXWhOndmnlWoFaXYzXRHYYUSg1UDMNDwHU0=;
 b=nt7tWcBwTylEo6reXiyf32iBvDd9+JLhXG7ndTxfYGr6cPc7q3Ybfhaeld/FUuHZ3j
 OVZbJxZPTZ4lJWbvHMpB8Xi/U2uhsVCHpSi0Ni9PlNIhJiWgagUSNegvIHk4XAmpRiE9
 5CINU7QYQdCT7H7jBDbOh7oFwbCbrh56XzH5MWbfwHlDUyKmWhA4x5AjGdfNxdH0Vah9
 0RP4PtSorkDE4K5dJwa1f5FMbxGpJJa6uKxTPQF4IEvO0QTT3FpZgKrgCShmvm9rDxex
 348nZxJ+pSBlHhKoZ+gh9a0nRkvWTTFlOKsW39c1sVK7TKOigAfdmX87yZhk4d1JL/Qs
 gGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726124438; x=1726729238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkmTzubpfXWhOndmnlWoFaXYzXRHYYUSg1UDMNDwHU0=;
 b=lrZXxZW4qyQ2Vc+edWWz77LMW4awX2wm7WVAoF+6FVgk8iwQmNflr1U8Rpbryq2FaL
 9X+DGmoQiJ0xt9h/cyMPQblzhL7MoucZhvLQG7wQk839KzkROraolPGRDpFKKA9Xkf0v
 lA0m8Fo8flbc+D66zFY3OcwLs/IfqGyjLroK8oV9K53uSTwPEJ6S2NdDzm0+ch0DxmX4
 /oFSufpmZjHM0NuKxL7cHVegVWuZFilrkYJktS2SV91RSf0jJ10xSaHAnlBbEgDA1Hu4
 GmO9/mnkmIQLUG/HbiHdeMp3LRzQF1nhKNIVKuwRmQQ2qbnECyOl5vcvdF75RhM08KLa
 N+9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeWKSKFsFqYomflRgJJ7OICjksP9CMZL5sFwSFppyW0bBwktFEKc3wV3b+JR30zd6L/EKKQzAmqJO9@nongnu.org
X-Gm-Message-State: AOJu0Yyzrcb+MlpiPm50uAGhCohssGPU2siX2vDMH0KfWt3WUpl0rZYa
 71bELWboMTh1d/rtxX3dnEqwZE/V+8F0cw+AuNDZUTUF98PIYMlBCPr0zfpDKZE=
X-Google-Smtp-Source: AGHT+IE7YwfdSbwkgECmNrglp+39irURHKgvc0yTYl89/G5bju5A8IfA7CFEkuvDDpndZQZ4caOL9w==
X-Received: by 2002:a05:6a00:1790:b0:706:a931:20da with SMTP id
 d2e1a72fcca58-719260654f6mr3520676b3a.3.1726124438332; 
 Thu, 12 Sep 2024 00:00:38 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fe5309sm4001479b3a.84.2024.09.12.00.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:00:37 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 1/1] softmmu/physmem.c: Keep transaction attribute in
 address_space_map()
Date: Thu, 12 Sep 2024 15:04:04 +0800
Message-Id: <20240912070404.2993976-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912070404.2993976-1-fea.wang@sifive.com>
References: <20240912070404.2993976-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x42d.google.com
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

The follow-up transactions may use the data in the attribution, so keep
the value of attribution from the function parameter just as
flatview_translate() above.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 system/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/physmem.c b/system/physmem.c
index d71a2b1bbd..dc1db3a384 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3274,7 +3274,7 @@ void *address_space_map(AddressSpace *as,
         bounce->len = l;
 
         if (!is_write) {
-            flatview_read(fv, addr, MEMTXATTRS_UNSPECIFIED,
+            flatview_read(fv, addr, attrs,
                           bounce->buffer, l);
         }
 
-- 
2.34.1


