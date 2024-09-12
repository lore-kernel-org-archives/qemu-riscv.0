Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E321BEE6454
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:01:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sodol-0001S3-1E; Thu, 12 Sep 2024 03:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sodoj-0001Ka-5o
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:00:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sodoh-0004Kh-HU
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:00:36 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-718d6ad6050so493627b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1726124433; x=1726729233; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aIlixRNtSXenIZ5H1YZipFaAIbAh7HofSUtCCsFCI0I=;
 b=Vj+D8QLq2QdsAWPRQUkBnS+0dOlfBQLNwp10lBz82tO9X04goc4IldF5nUFTsnhBWN
 vEZxPXyjAEGXGi471iB0e+KuM6F5RnRhmqozByDkG9U8NSaDzE7Fc6ekN6C6mq35mCtU
 76eq8m37ManV/SIYdGSxUz6QMPfRt0OGE6FWeS56V5xy32dgRp5DB5qZSkBImOL5oAnH
 xQuDAsNjmnU2g0TvEI8d4sSmjjR1ulB4wmJH5rS52KLhmuxZdR4EFAcuaHTjKnJtz21i
 uwriWXzUp7sEaQAmsF1zuQpVtPTP+5zZSTf8S667x2vrXNVq/aCNcrW4YfKHlvsi9E+3
 mtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726124433; x=1726729233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aIlixRNtSXenIZ5H1YZipFaAIbAh7HofSUtCCsFCI0I=;
 b=H66frQwdKfC8NSlOPvHcBweWeJwd2IufYVLdKeewnSP3cl03xPCg5QHRsJ8uMCCoCQ
 vemJhrlJEd0m3eTfw68dTvUKrB5IIJF7JMk6wNiFFOaDXsyV721/De5vU8miJWuU0e0N
 Rp9nqcHOx5dwpDCSDPG1yiz13n4RktYBob3VPXGBWMhQ+fJT1R2tujlayNgEyNWpifVz
 0Es+yozDLitsy33aIzhVVQ0+hRNZ1bh/ZttQnzEAI3KEhkPAoPKb/MdMlUnbnHp7mPvV
 iV1icUnYBGAbErll25qK0HG9ot2EozLtnmkH4qxMOiaY8K/e2tFzXnEPrfK4zkDoCzvq
 /ELw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4wNEzgEyQIn2MLDAO4bkxEF7vjItdJgjUeXQr5H/HjQ0g1AtvkfMeSE38N9vOnnlfgnctBQ+HeTAc@nongnu.org
X-Gm-Message-State: AOJu0YzYsk2S/KoZaVIFNERH7s+ryuB7vJN/ztIaOH3dcL2gWbvq3Swr
 PN2HtP5qiE/nnH0zGwj3h/S1RilQuiyBGpfb6La6eABhPb42+G/l/Sj9zTBchRs=
X-Google-Smtp-Source: AGHT+IGcoiqe7yjJ1VSKpWBid1ZYfT9PPGdZm6udjkydV/x+RG2SLIRZh6CFKutpgRA3uKXD3b5Y3Q==
X-Received: by 2002:aa7:8895:0:b0:717:90df:7cbb with SMTP id
 d2e1a72fcca58-719261e77admr3138217b3a.22.1726124433292; 
 Thu, 12 Sep 2024 00:00:33 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fe5309sm4001479b3a.84.2024.09.12.00.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:00:32 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 0/1] Keep transaction attribute in address_space_map()
Date: Thu, 12 Sep 2024 15:04:03 +0800
Message-Id: <20240912070404.2993976-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x436.google.com
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
the value of attribution from the function parameter.

Fea.Wang (1):
  softmmu/physmem.c: Keep transaction attribute in address_space_map()

 system/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1


