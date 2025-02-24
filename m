Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D48DC021A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 19:14:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmdpW-0005ok-9v; Mon, 24 Feb 2025 14:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmdpF-0005iV-NG
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 14:09:11 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmdpD-0004tt-Sv
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 14:09:09 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-220c2a87378so80752265ad.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 11:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740424146; x=1741028946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbbIeWCW4JzTBbeBSfjq8vnpfY5VkBCOXFXILh+yEvQ=;
 b=ho7mdll8Cz2VDQE9g3VtscbTVzvbfMjTfNDIM5Lj1hdGG3KKpfOKn5akbwbFHsEojF
 chluzwHq0L8dcf4HXwAYbtH4FVUpvMWXQnWNGDpm3NdcYCijurmRgmQhXImKGz8O85OM
 zRwMF9FvzFG0cU7GDTQg7b1WzuGj+YCtkeQxZDMJ1uvYLn9qRBMhjfE+B+Ogi2MJa/Hz
 8+cuY92Q7aRqWx9cP4Lp4Qn9MzG4rdxbWTxkG8Xy8ZrkSlarJFLFf8P6ANfxthvoGr9e
 nKayrFoR/Lry/h1y2F+llwOjcIFXXx86jorBiA+pWzpPzrVMkdqk2GMOzn88O6FQ18jp
 cdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740424146; x=1741028946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NbbIeWCW4JzTBbeBSfjq8vnpfY5VkBCOXFXILh+yEvQ=;
 b=CnMJ5o7LFgM4CfyHDyth07O1JYPYZS7/qWYO0vIJnUbTzEwizcWWvY+7cYnCG1MQUN
 lcVawcTrSZFbneu+aeDkXWlJC6C5lUBEst32ZeWGUzFG50b55O5dn6rq4JZQU199CQSO
 Pu9D1wh3u4hjcjrd3C9D8MycIS36e7wtwe7MJvfAvQWRNl26pohQKWzhhWjCzi48+6Se
 RSfF7VHMhVFdzoplyWg6DMURdV8AIj/Ug1Sx6rfvVAAIKViQ5n/J2r3HXlHEzliSn8qq
 fSq2/X5mYP9fR67NRR9EeErhfIgN4AAfWNZrNh11WqQDnzdjfkvwvc3PsmELLHp/mN4I
 Ey9g==
X-Gm-Message-State: AOJu0YwpFFAcnQWPs57K53K8I/mRXDuaSujfyxkQJixLwPFLrMGCeJ4y
 ODMb0Jb+xc39Os++ZffZ9+ijIDRplPBw749vW4Wchd7GUDrF4deAY3TfNMGPgfk=
X-Gm-Gg: ASbGncs79AJN1WnMnxAj/CA2nASIvG1QUhivWNFBmsdMfn7ImaVokCcvcrFDK2RzrIS
 GLtZjIWZYmjHqNI3YGUTg+yr2V6J3F2FgKC928wroCSp/4akyTM6T9qrD/9e64AIbX6BBq+3xsE
 GZBSWE9B42focUnXdTi+ucgYaYpavXJYoLPZsFmpBeOPYUkZWgPTQrmcF5b6pcqyR7PVbJVqf1C
 HDLPqipgyCHdEVjiQbX+RzfEFA4mkhVns+1u3K2hsLeBR+Crde7SjVe0P+RKctXjbyYWxu79B1k
 JdwFvOGtICcXlYJjWwf2acbYQvn+cA==
X-Google-Smtp-Source: AGHT+IFTHuNTOowQJrG1m4QWiu3Af76qEeHKl/5mOFzfI7bieZkvXKSTvgSXvQdCpAy8hWN0Pv8GIQ==
X-Received: by 2002:a17:902:ea10:b0:21f:9c7:2d2e with SMTP id
 d9443c01a7336-221a1191916mr256593245ad.40.1740424146294; 
 Mon, 24 Feb 2025 11:09:06 -0800 (PST)
Received: from grind.. ([2804:7f0:bcc0:6edb:f473:a9df:d551:443b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545df28sm183583155ad.153.2025.02.24.11.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 11:09:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 11/11] docs/specs/riscv-iommu.rst: add HPM support info
Date: Mon, 24 Feb 2025 16:08:26 -0300
Message-ID: <20250224190826.1858473-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224190826.1858473-1-dbarboza@ventanamicro.com>
References: <20250224190826.1858473-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/specs/riscv-iommu.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/specs/riscv-iommu.rst b/docs/specs/riscv-iommu.rst
index b1538c9ead..000c7e1f57 100644
--- a/docs/specs/riscv-iommu.rst
+++ b/docs/specs/riscv-iommu.rst
@@ -82,6 +82,8 @@ Several options are available to control the capabilities of the device, namely:
 - "off" (Out-of-reset translation mode: 'on' for DMA disabled, 'off' for 'BARE' (passthrough))
 - "s-stage": enable s-stage support
 - "g-stage": enable g-stage support
+- "hpm-counters": number of hardware performance counters available. Maximum value is 31.
+  Default value is 31. Use 0 (zero) to disable HPM support
 
 riscv-iommu-sys device
 ----------------------
-- 
2.48.1


