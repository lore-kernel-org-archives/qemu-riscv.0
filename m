Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC516CA101F
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 02:53:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvRz5-0004pb-Us; Sun, 07 Sep 2025 22:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uvRz4-0004pN-D6
 for qemu-riscv@nongnu.org; Sun, 07 Sep 2025 22:51:58 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uvRyn-0003kp-8R
 for qemu-riscv@nongnu.org; Sun, 07 Sep 2025 22:51:57 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77256200f1bso3535027b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 07 Sep 2025 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757299892; x=1757904692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQTGaMwRsY4E0LA8RI6FgJSJeVNA3/bkP8+cxXGBtWY=;
 b=SAzBvGvft4UGLOkCHfxWXPyIPHN8Ene+Xs16WhryX0pBKWHSvBRMmq0gRbOGP08yav
 Y3i7ks0SIgCjU22hUZzus6DOrM/mVpJN62Y168w1Y2gJZEMq2JG9EZjZN3TsvTdzug0v
 kNoyEWgRm1XQ7hDvywOK8aWrSfyMFvJgoaf+P3rQoXswAT7xS88V3a2p2hx8RU7Vuq4X
 TbnpIbPaZDAatPm7q6bBDp0384LejyJlEXVcSgR4m0DB3f3G2ol+A53XtoOTZgrlx88N
 vC4mibOvcsEl4KzIb5Q3hHviCo6r0picRuRWP1Dma4/VAZbsFEVnx1zG9WLPEtnpdV2N
 ZU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757299892; x=1757904692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQTGaMwRsY4E0LA8RI6FgJSJeVNA3/bkP8+cxXGBtWY=;
 b=IqDON6NhkwQVxqKkpRRChLQWwczlO+oMipvx6iNpC+kzq3l5D6F46XdJKqqlJNUnQt
 R8Mlr834QbTzcBN+IydBad4zZFjfk5ae6jOv478OojQuCdeC842IAP8aRp1IZYCk4/xn
 CniIZNkF6MRIh5oj0yzGn7AkMsu3o3tfv1pQDubAwzHaFk8aMfQ+WSxxJXlAT3vcLRLE
 VTe2qyTVpmXQ4eXo6x5u9JYzYSXYNzTK0e1ZmIigrh6mlhPw0te+55A8sEa1aew6afcm
 ywFsLHxm9sFmzZ6vEiITHcWIXb71KwfkhsF+Coz2wf/X17CNopoLAPdNNENBqbxCd7Mm
 zfOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMYP5eA5bq1dtG/CN3/w1kBR6GCEmmbxeakoiD4zSDG5BQ1uGuCh5rOpEpeU1ZfxdnB80epn71u6M7@nongnu.org
X-Gm-Message-State: AOJu0YwkUSj3UKqt2hhUlu+G6JnROp6CC5DyCPmxQupNAtqNzMDcdmFp
 vQIuCyDVBBHgEO3R97MvRGV3LE8hmabI7/f4S7Kh/hCuIXd2EQGJ5SDu9CdtdRV6mMI=
X-Gm-Gg: ASbGnctMTPfiPHWJRl8JkrI7txE84EN5wvE0Ljcg1G0fEJVxe1CoS2u6OgY7QOL9nD5
 drFuD113NxSZ0zLkMFgLcm1WbNxJ28n0BbKm9ngC1kZI3S5KGs5gsz5rloYvSZ+F9REajwM5TGP
 Vw3OR71NNm+b42H0KG2OfaJCJ/NUSVskoH7WPBwZcfIQMLeuyMCcqE7cWyKhdHV73gffqYvDenx
 /MR9/IbhCgxS8jPFcVUOoxGIsrqmETOlxsgpqItkAmX/iXS2OXpb7G0fDPSJTbHGPk2Mrbei55f
 AGh0jVy0hkPPHGyT7TqypsUGN4ueexx4622vra6Wyk+bYxNOOnkVvQxChycLq3kpy3tuoLJQHM2
 yaBCTIVlH2AkLn8Cq2gKvpV0nn6gogU75C3eMkOJkvmHmvBoFPzikChDWJBMOu4ePgo5psIg0kf
 V8WeEaazl3nx7E
X-Google-Smtp-Source: AGHT+IGCsJDONcPps5oWEWTc66jhlG2RbmthH2x/WX9FeFsDsh4/NCzwgDtNvBbug/sEziero9iIWw==
X-Received: by 2002:a05:6a21:998d:b0:24a:78a3:5b1 with SMTP id
 adf61e73a8af0-2534441fad3mr7981953637.35.1757299892472; 
 Sun, 07 Sep 2025 19:51:32 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm26823834b3a.75.2025.09.07.19.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 19:51:32 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v4 3/3] target/riscv: Expose Zvqdotq extension as a cpu
 property
Date: Mon,  8 Sep 2025 10:51:17 +0800
Message-ID: <20250908025117.1728895-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908025117.1728895-1-max.chou@sifive.com>
References: <20250908025117.1728895-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42d.google.com
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

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d0909f7beb..68fdd2887c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1373,6 +1373,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
+    MULTI_EXT_CFG_BOOL("x-zvqdotq", ext_zvqdotq, false),
 
     { },
 };
-- 
2.39.3


