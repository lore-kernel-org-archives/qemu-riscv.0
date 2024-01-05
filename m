Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AFEC47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:57:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTZ-000402-Qm; Fri, 05 Jan 2024 10:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSk-0001mq-UM
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:50:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSh-0001H2-DB
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:50:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33686649b72so1474356f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469812; x=1705074612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJhN/WyzxWMOOPIeTap61yRQUoY0YL+ZGCT3kZkMZNQ=;
 b=kbhIsb5G5wAWcU8WA6XlQi/6lKGxmbGxrqPEcemqnUAJHAWx5hQHKlqoOe50A3ShTl
 1VjKZw6HJZXRVq0Qkdp3/7TWZnZqz/0Zm6Hvitg5mfr38q44rrsFhW4TCZ2kdOVEZF4w
 RiGv8yqiwQJ0qh9gznbkrTMAXZuJ0/qlbqeG7B/SxZKotvHVMF19VFSsRvVTp+rYcejd
 k17URYeJuZmVmQklH/D1WUAfYQu2xiYwuf7NAfsNDt0yHchKrtVurmB1PKsfNg0CYRV9
 zxWKlhmZVkFLu4szNRvLhGnHKIQL8emVwUpOXYMi0QeF9SBpw2psC7u0feUG1OcLX6jm
 hKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469812; x=1705074612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJhN/WyzxWMOOPIeTap61yRQUoY0YL+ZGCT3kZkMZNQ=;
 b=ualNtuXeGfRS3L7pwWRen2JNvTheho7XtSyNPH5dUA02e2rjsHpkiB8zIIlyXkNYFQ
 3K1/7mMEbDs6OASWlWpxNdtguGSgtZP11HgI/9cPzP4n91bxuwlym1qNFyMWOonfXb0C
 t+1WiO33P4mLM/gL0jHA/okyAMLVIisL7Yl4dUm9w4a/Fd+kUZZbzE4OK9qESk97yu10
 +03F9kl/j5Kg2x4knL/+Z6OOI87S7DQqIgoV/ONTCOuF95hbnwybWm44r6bmO+RFN9MG
 6f46qyt0iNqlks3753QTpXXR5v4ucWxZ86s3l/CIse/4FKvgjBtew3U41EYAkkvfhSNn
 pmPA==
X-Gm-Message-State: AOJu0YwCOidQkAyDWuvATUBd4MsVZH2cHFscl6TyrWdRbr1k9avPZXb+
 JxrXhaZu7vrXZshkfRhEXX/xlhBYWdp+/g==
X-Google-Smtp-Source: AGHT+IFgZoIHxDMrAT6W2pvOHEZRM/nIAoxIFWwT/z/A34AmtOLLTFbNPuahflw3qXI8Zju35p8bsQ==
X-Received: by 2002:a5d:6d50:0:b0:336:808d:95e5 with SMTP id
 k16-20020a5d6d50000000b00336808d95e5mr1497119wri.67.1704469812164; 
 Fri, 05 Jan 2024 07:50:12 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 a22-20020a5d4576000000b0033671314440sm1629463wrc.3.2024.01.05.07.50.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:50:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Grant Ramsay <gramsay@enphaseenergy.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 70/71] hw/net/can/sja1000: fix bug for single acceptance filter
 and standard frame
Date: Fri,  5 Jan 2024 16:43:03 +0100
Message-ID: <20240105154307.21385-71-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Pavel Pisa <pisa@cmp.felk.cvut.cz>

A CAN sja1000 standard frame filter mask has been computed and applied
incorrectly for standard frames when single Acceptance Filter Mode
(MOD_AFM = 1) has been selected. The problem has not been found
by Linux kernel testing because it uses dual filter mode (MOD_AFM = 0)
and leaves falters fully open.

The problem has been noticed by Grant Ramsay when testing with Zephyr
RTOS which uses single filter mode.

Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Reported-by: Grant Ramsay <gramsay@enphaseenergy.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2028
Fixes: 733210e754 ("hw/net/can: SJA1000 chip register level emulation")
Message-ID: <20240103231426.5685-1-pisa@fel.cvut.cz>
---
 hw/net/can/can_sja1000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 1165d59824..6694d7bfd8 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -108,7 +108,7 @@ void can_sja_single_filter(struct qemu_can_filter *filter,
         }
 
         filter->can_mask = (uint32_t)amr[0] << 3;
-        filter->can_mask |= (uint32_t)amr[1] << 5;
+        filter->can_mask |= (uint32_t)amr[1] >> 5;
         filter->can_mask = ~filter->can_mask & QEMU_CAN_SFF_MASK;
         if (!(amr[1] & 0x10)) {
             filter->can_mask |= QEMU_CAN_RTR_FLAG;
-- 
2.41.0


