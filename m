Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35C6CAC597
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4md-00084K-Su; Mon, 15 Sep 2025 04:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4mQ-000823-GU
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4m4-0002R2-NQ
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2677a4d4ce3so3820475ad.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925675; x=1758530475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMKFCKh18wOrivpgQnUQaTtC9oFw8JI5jtQ4R31+8ng=;
 b=JY/CdJc+pN6UdwhmMUDw9tZi5kt52OB09vLElrPEYB6shwxxDG+nkP+711JX2z3EFP
 VDeLnwfbzFr7Ejd/Ivk8fbp6NI/ry1wnnsud2jZJLcQFuXuvxD5VjRM7STOJ7KXp1EEs
 ir2ydFx0CcTNDKRy0QaNxeqXg9ZuYNkEwehAc1r9emXFhMQYFQJYvOjqT7ZqWjXBQ2LB
 6jhnXQZ7iCiafO58ILoMQ7OoSe3gOTnYVXuz4/dBRt6meBS+DHHQf7PNl80ewgAPGcSb
 j/OIV12y3Fn6oJIbJDRaIdlHoWKGJDyRufB9aBn38hy8BOffatSztYc79NIOi6/cnC3Q
 +4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925675; x=1758530475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMKFCKh18wOrivpgQnUQaTtC9oFw8JI5jtQ4R31+8ng=;
 b=SFUQ6nQC8CMYovYosRLwy9U+xak8Y/zygSNKavuZCCqj5mrBFMItHWm0BwsrVoysAe
 gppGPW3pDWwe8PsKmX4fdNTmdmOmVWOFy3nYwmEKbK8O4o8XpjwWcTcSL0qIs7JwW+WR
 kNxGVBYgd3+RrnAswPbv7G2g/CJ/WF7Nqgb+RwZcY31FTIOOHpT5k0UqVqD62CcKWS0s
 R52JPfEAvj4j6PGTmUzODzeF9BFjxRK93YSGwOm82+P+dZ3uvUhRGdPgZ3R+LmqcmPWl
 4LGbgg2N09nTG8AzVIgPRCRpN69HsMPFr/+io8rFT9+lolDRl9r5bKjPD1q6EUPauDXb
 FGBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy+Ozg8c28ZjT1jYoMZ/Wl5eln0UgNOk7jEdm07pMLhoPjBM5fz9+IdjSUphGndBUFsZP+TVjiQ2q9@nongnu.org
X-Gm-Message-State: AOJu0YwlS4PwAmBjV8VbiAXmc0/c3KrfVDWMaVnt0CeUS1GzlZMoIcgf
 +QSoOWREES9iNuTx0+4PHIj57h9rop4f37PlUXIwznJqyuVswvl5+WnP3hLiO95g5zg=
X-Gm-Gg: ASbGnctKnYMWU3CXyfIspVVDY2nC7cRTA/0bnBAEGX4prltDtBeT1fowT+35fULnY71
 fxwOyC4IGGs7l4ihMQ2FCxUlfh6NGFT7/Pv06vgM/B3P4XTj95q3owSrW2Xw7o2dO49GmDUrzOZ
 baLr0gKcb0ft2kCm51kyJG5gBFaqlDrwa5ZJo5XYtpFOPsngGP6LJOtbR5KkkWQ+GNcwgML1E83
 JW8x/QMdz9ZmT+c5jga+oDkm17GXQ2hSvW3gkVgOyddhu/bKcvbzou62wmSkBK9BlFyLrjT1XB/
 erlV0bNbgHn64bwRTf5I7F48x+AdK9S08nP0qkUQC18yX/Ly/hsME1ipURzxkyr4qZTcPG2z0rg
 SZD0bduIpYGKGiNbzo/UYiCS7Nqb58KZyheiHdxlYP7l4aJD28YxKQhWa5GCTrwOX+pzfb5cY09
 knnQ==
X-Google-Smtp-Source: AGHT+IEoepi1ijJrzn+8noOffyj4W7n1Hcsub6V6/Hnby3U8QpPNR32zul1r+zn8pWGkwQDw8M8WPA==
X-Received: by 2002:a17:903:3884:b0:24c:d0b3:3b20 with SMTP id
 d9443c01a7336-25d2675c1fdmr124834985ad.37.1757925675127; 
 Mon, 15 Sep 2025 01:41:15 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:41:14 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 8/8] target/riscv: Expose Zvfbfa extension as an
 experimental cpu property
Date: Mon, 15 Sep 2025 16:40:36 +0800
Message-ID: <20250915084037.1816893-9-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915084037.1816893-1-max.chou@sifive.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b5c9f9ac586..2674f000e80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1373,6 +1373,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
+    MULTI_EXT_CFG_BOOL("x-zvfbfa", ext_zvfbfa, false),
 
     { },
 };
-- 
2.43.0


