Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45EC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:41:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxqr2-0002TB-MY; Tue, 31 Oct 2023 11:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqr1-0002PI-Q4
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:31 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqqx-0003jk-SA
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:31 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso81253001fa.0
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698766819; x=1699371619;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcXuK+xbqaqkrK6n/T3qmlROjWXVHk5ofR1FJH6tFRg=;
 b=iNx3Ktxqrjm9zEBaAdN3d870TA08+hu7hgOBtq8c2GuVfE0v5rg/EUw0KEuVZoGla1
 tSdgW8TGt6c0RVyf0BDoBeygzDAocSmomCxFtkP3Aeg+6L8DbKrvSRDS9ZnZ92daEJVc
 WcvJPdWf3D9YU9D3B9ZFwakB8BcSQmG511VRCodEGYOHmb7JCtXOuTcjnzN8aFkAcTkg
 DypsUWHun/hMEhEFoRl0tKwhpAglYddx3qmvFYPv0UwZDDTZYjsrFfD5Rp/QLttIMvUE
 pWjb2Q8WV17N/6iDXMSb0ikgEd1Ht5lwWrsbSLNFrd//L0AwdRkMqsPPXBx9u9anxs0L
 2eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698766819; x=1699371619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KcXuK+xbqaqkrK6n/T3qmlROjWXVHk5ofR1FJH6tFRg=;
 b=S8UvF4Cdwure+7D8iWlBDVqOsH2z1gxj3tX10Tq7yhLfuL+GguGI/VWNILa6DB96tp
 L7d8o9IQhr7pK399/p6TI4aUuvPMm2HA6d+cscAdS0OFr6EM4m9DjpIfPOnyUn+LjuuU
 eOo5kWY8xSgsKNy8uwLCFmCvug+86T87Rqc13+bFPyZX8fV6PiwgTrFepXzd6y2C0ONO
 uLB6VlsKJKxs9jaEoXdR5zDu+oadxgxUP9yFy56K44mD1wUBPt4C55pYcJqgOPKRxTCf
 vdTsiJ+eYDuG2Xz+yIqtf8QENjj8Avr4qtn6GebmM6BR4HEm8epKJF5/PWZ8nSBi8joH
 BSlA==
X-Gm-Message-State: AOJu0Yx9AnKAAVqwRLsMy2K57ZghfMDHZ6TBXrhAWcNKrqBOv3ubrjcK
 P0BMPHHR/SggmJOLEMktCuv4GA==
X-Google-Smtp-Source: AGHT+IFpkVdVL3nPs4chOd3trlZ8EBbQDQ6z1+3laBuHbYwPtNv8shl6jendNgy1YuRuT0kkVh5E7w==
X-Received: by 2002:a2e:be0c:0:b0:2c5:1bd9:f95c with SMTP id
 z12-20020a2ebe0c000000b002c51bd9f95cmr12373849ljq.53.1698766819463; 
 Tue, 31 Oct 2023 08:40:19 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c458c00b003fbe4cecc3bsm2094613wmo.16.2023.10.31.08.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 08:40:19 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes)
Subject: [PATCH v5 5/5] docs/about/deprecated: Document RISC-V "pmu-num"
 deprecation
Date: Tue, 31 Oct 2023 15:37:17 +0000
Message-ID: <20231031154000.18134-6-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031154000.18134-1-rbradford@rivosinc.com>
References: <20231031154000.18134-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=rbradford@rivosinc.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This has been replaced by a "pmu-mask" property that provides much more
flexibility.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 4e0eb2fe02..60c26bc410 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -413,6 +413,18 @@ Specifying the iSCSI password in plain text on the command line using the
 used instead, to refer to a ``--object secret...`` instance that provides
 a password via a file, or encrypted.
 
+CPU device properties
+'''''''''''''''''''''
+
+``pmu-num=n`` on RISC-V CPUs (since 8.2)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In order to support more flexible counter configurations this has been replaced
+by a ``pmu-mask`` property. If set of counters is continuous then the mask can
+be calculated with ``((2 ^ n) - 1) << 3``. The least significant three bits
+must be left clear.
+
+
 Backwards compatibility
 -----------------------
 
-- 
2.41.0


