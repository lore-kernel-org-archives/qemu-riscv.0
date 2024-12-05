Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF3E7716D
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 13:33:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJByY-00036y-PB; Thu, 05 Dec 2024 08:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwR-0001Fp-FW
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:54 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwP-0005sq-4N
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:50 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-725a84ff55dso402593b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 05:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733405443; x=1734010243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZJJwingVLBRRtBAVAtXqvksCDZNIyQoyVa3BKr9tV8=;
 b=gF9gJ0uoXAD68kSqLqcdd3fA/R5ZYgMmvHT41XbNBuYOkUwKjNR1fqLQ4DW7W+gIq+
 CxOLMl8eGKsrUp2o7TZ3S5XpanbaGVIQLNED461/QHSX3C3nAxl6pnV1tLKglyACLGAi
 GvC/vk3c5b0kadzaHCsvUaHmfgFeoqhXuLZ0c7jvEcSDq0ZoZm2DWsNsllnVuWlFqJw0
 j6lBzO7/SNiSag9mlbRagbtareAlHjvqS19YJ50Gg6f+XV4hWu3LF0pFzVphZ7FQVMsU
 RoFvf1S2N/xjbFROzFn0GZ9aIUjahWxEnCoH6m6ob7W1YZbJcih7It2PoSrib+CIbxT+
 Llww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733405443; x=1734010243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZJJwingVLBRRtBAVAtXqvksCDZNIyQoyVa3BKr9tV8=;
 b=hv5XKHbujBuqPi8vezdykoeW9vCGej24Q/LqXQataOwnkuHLwY2DjxxxHkDbuZjJVB
 2sldxqgTBzh2nGqQ75jqayp6upRtL/IeausINv7GXVx9uGkcUN0lEJTdqSmM3g7UpFiJ
 pUukzjNyKVx7Zqy/vZr78XvCDlyOiVZVS1f+Q9h41o1IbIgvNq/QOdNk8SWAjqseLAHa
 0xXRkYylW0SFVwzWm2UXBAVGxL0ArUkSxZGAUK564ZVF/Zkn045W4xEjl1JZXAsY3IgP
 7viX9RAbivcbcsDephnop3UP5Mn+eX0yQepffqt62ZlvDsVUjYH2QrrSLhWoeiBbkrZp
 w/ng==
X-Gm-Message-State: AOJu0YzmyprmwZQBUq92MrMX5hWWHaM7M5oKiTt0/6dKRzUyBAKf3apD
 4KTsPL6CGp7UGe4+bTDR72gkpOC2isPoGoNbFMVnPdXxZVpqkb0WnncZIUWCoZ0=
X-Gm-Gg: ASbGncsKzYxOM7zL5/C3goj3sdTJrlvz76I9ld1FxxKUkpR/mmdi+0tXngFlfySHS0Z
 GeYm+ASb3hqSnfYRfBEpJheuuPkPW4cr+xxo/xlLc71yn/r+jWo9v4dOHNN4ljCBCzIdjSO8Y1v
 15AH5+rW0o8GduDJdm0SzQp8msJm5f7cob5JFyxQ6sBKOkD+I/p/5DFApFSBvVAH15wg70uSOXe
 kZMobgpCsr2GkzLWN2JGPxUOcm+Rw0AWjMENVOWnGSd610d9XpmyfWhlqXotEuw+Qfcn6vFcxsH
X-Google-Smtp-Source: AGHT+IE1hurQQGyDUv/CyJDzX3LS6FAxpW5+AnqS7Tc5AaFJlW8zhuCl623Scn99SMPI59kO7wsH3w==
X-Received: by 2002:a05:6a00:230b:b0:720:6c6c:52a9 with SMTP id
 d2e1a72fcca58-7257fcc65fbmr16299450b3a.18.1733405443468; 
 Thu, 05 Dec 2024 05:30:43 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a8f512sm1250315b3a.126.2024.12.05.05.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:30:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 11/11] docs/specs/riscv-iommu.rst: add HPM support
 info
Date: Thu,  5 Dec 2024 10:30:03 -0300
Message-ID: <20241205133003.184581-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241205133003.184581-1-dbarboza@ventanamicro.com>
References: <20241205133003.184581-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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
2.47.1


