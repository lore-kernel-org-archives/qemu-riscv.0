Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01485E8FDC3
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 09:58:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qoL7r-0002JU-Lx; Thu, 05 Oct 2023 05:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qoL7q-0002JE-7m
 for qemu-riscv@nongnu.org; Thu, 05 Oct 2023 05:58:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qoL7o-0004Zm-K6
 for qemu-riscv@nongnu.org; Thu, 05 Oct 2023 05:58:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-690ba63891dso639230b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Oct 2023 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1696499910; x=1697104710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UvlJbfC9iU1xlm0Y4EWFEt+DFsas2Cq22UlJ01mNphM=;
 b=PGCMhVLPL+zFYDnk8h1ho3lgdrxd2ShS3oHASdtR8DSEcjXKdikbL0AFCvp7ALl2VZ
 /qcpZExLs5yJgijNluiDndEP4ri9hZiZMd+2IjJYmqgLtV79X/rHKBm0ktSwbdZPDaj5
 hPG2YGc6x++hT1LeQHJrKe21ABYyNx0AMnHlCp+s3vaUCGFZNB5uJlW8ZWOPIl8xdJyc
 7hcv+5qFzfneqOIoUGcSWZN64OUDxGYlXsyhy3RNetsyD71QYV+QZMGJTOUPwK69Dvsg
 1TcLq1NlA051HlzRJim+szi//QxEPu7pdDoNks0L8ioL62pI7sNLBYaXphKFGmbC+zmm
 ApWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696499910; x=1697104710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvlJbfC9iU1xlm0Y4EWFEt+DFsas2Cq22UlJ01mNphM=;
 b=tUy2R1ICWl+sN5qJqRb+5FU2ahjEjZNUawWfQbYDnzvSzFFur3Sl4J9B5Q35rzwINb
 2hly9ViUJ98igbodEXDyufd+GqRGAFfCCKeJuMIpvVItJXsVPlGTA6h4UdVZryhv8ejx
 pb3HqZrH4RYcban6CMWhZfMzOwY5mIpdHQ9rKeXy3U6x27sdoxiAI0+jWA3XYHOyKW/d
 CxSQIv5OyhRzZE+qy8pkamx3zxpW90IpiTv0MPzVNXBfb+eeUQqZS+IEtMRize507G/B
 f1OVwTmX4gGngUY8EcMmaT1adOxPSvTonjj24RAJ4IAfblKtfFnSh89FghJhSo8eN/wh
 qfgw==
X-Gm-Message-State: AOJu0Yz03FaB0Sy3QnVpw9PRG3g+t8w2CfDnPNXQwQThdqcg9mP4iQhv
 rc68fiS8t8f8Y+Oyym5/kOHuhg==
X-Google-Smtp-Source: AGHT+IGnOGSfPGHa5NCOwtTBp8AssIFqSo3omGr9QdrMJaug35jbcf2IxGIXr4eeL8NwkE/KikYVPA==
X-Received: by 2002:a05:6a00:1a92:b0:690:bdda:7c35 with SMTP id
 e18-20020a056a001a9200b00690bdda7c35mr5098131pfv.1.1696499910537; 
 Thu, 05 Oct 2023 02:58:30 -0700 (PDT)
Received: from localhost.localdomain ([146.70.201.138])
 by smtp.gmail.com with ESMTPSA id
 c14-20020aa781ce000000b006936294bc32sm976018pfn.128.2023.10.05.02.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 02:58:30 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Fix vfwmaccbf16.vf
Date: Thu,  5 Oct 2023 17:57:32 +0800
Message-Id: <20231005095734.567575-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42a.google.com
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

The operator (fwmacc16) of vfwmaccbf16.vf helper function should be
replaced by fwmaccbf16.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3fb05cc3d6e..c45d94c165c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3361,7 +3361,7 @@ static uint32_t fwmaccbf16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 
 RVVCALL(OPFVV3, vfwmaccbf16_vv, WOP_UUU_H, H4, H2, H2, fwmaccbf16)
 GEN_VEXT_VV_ENV(vfwmaccbf16_vv, 4)
-RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmacc16)
+RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmaccbf16)
 GEN_VEXT_VF(vfwmaccbf16_vf, 4)
 
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
-- 
2.34.1


