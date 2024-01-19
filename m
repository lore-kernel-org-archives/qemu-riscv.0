Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E48DC47DD7
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnBo-0007PZ-W4; Fri, 19 Jan 2024 06:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBn-0007O1-J6
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBm-000377-1B
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so10789335e9.0
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664252; x=1706269052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IaNDObNAqYNxlZ9PNSQWTtp9Qeox0bgAC84EDezcoU=;
 b=zk7EHrNrHwfkJ05cCktdOV2Es7vmqZ6eSiF9Bv5eyosrcE+eZRp86WzGl5kt1cp7QM
 IxJCCw4q4vnfe4nrMZo+SDRYMtaUO57aA5Kq0wYhk2mu1lzml/weaXP2u1EMvUaoxAtK
 P2a9CtyIQq9R8YyaBhe+VbhlMgbKcRlT721PKoVyCdoWJQ1/Hnp0pQo4aVzwVk/NGZ6q
 k7xXktBh8e6fN1Eict/W9HYJcWPo+HJwrCdqRiY4Yj69UUrJ6aL73dXUY67LNz2dN20w
 rRt0XEE1pihrlicjJGU4f8GGv/VKOBDlq7SE8IM3aI++nJXvoCEHa/USFNPFYOZWSOZG
 COdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664252; x=1706269052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IaNDObNAqYNxlZ9PNSQWTtp9Qeox0bgAC84EDezcoU=;
 b=BBwj/ESN9DHPL+XPVfPbsjELQBk06mXcFWvBjlVY0fwy82zsxZgD080TaaK6lJOFxR
 /6DnG1ktOAvF4dwmaVEXI3LTL0wD9/yvqtqro+jWbEm3ml3RpNLWRdwivOKJ+bwNcPH/
 d3/zwrVmdFwziJ12nLkYHnwyjafWYanbRBuSthnJqaFl8cvww0Wzx1ty9CccMXZ02AKW
 Xdmr+V1FyXv9rl5vx2zKCogaY84bEQ1qAWegE5JZWGngJcg3NNfd55O3RjpEtM8Km3ok
 npxm9jK5iH66VbvNi/YkC6+Y8K2EdSG9ZJn5BBn3h9QyEZeQw9TNUZaJtkaD022YIKtb
 9Htw==
X-Gm-Message-State: AOJu0YzeM/qzmm22M60LONrlZ38mOYhQunV7yQjsbvgNaQ7Ud/coiI62
 bhH6pMQ2gM/V88ZBL63rnavlQHIM+RYeDRAttj0iP/Yb4snjUCOU2u9dV1rwL6A=
X-Google-Smtp-Source: AGHT+IGME/CrHYUSCjWLKv9N7hUwo8xb1T01fsrIIY9PgyaLVNdwLW0/psrKAa/3cpDKhot/jlQmvg==
X-Received: by 2002:a05:600c:1388:b0:40e:43ba:cf3f with SMTP id
 u8-20020a05600c138800b0040e43bacf3fmr505422wmf.1.1705664252716; 
 Fri, 19 Jan 2024 03:37:32 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 j6-20020adfb306000000b00339208ecb30sm1294065wrd.68.2024.01.19.03.37.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 32/36] hw/scsi/esp-pci: set DMA_STAT_BCMBLT when BLAST command
 issued
Date: Fri, 19 Jan 2024 12:35:01 +0100
Message-ID: <20240119113507.31951-33-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Even though the BLAST command isn't fully implemented in QEMU, the DMA_STAT_BCMBLT
bit should be set after the command has been issued to indicate that the command
has completed.

This fixes an issue with the DC390 DOS driver which issues the BLAST command as
part of its normal error recovery routine at startup, and otherwise sits in a
tight loop waiting for DMA_STAT_BCMBLT to be set before continuing.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20240112131529.515642-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/esp-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 875a49199d..42d9d2e483 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -124,6 +124,7 @@ static void esp_pci_handle_blast(PCIESPState *pci, uint32_t val)
 {
     trace_esp_pci_dma_blast(val);
     qemu_log_mask(LOG_UNIMP, "am53c974: cmd BLAST not implemented\n");
+    pci->dma_regs[DMA_STAT] |= DMA_STAT_BCMBLT;
 }
 
 static void esp_pci_handle_abort(PCIESPState *pci, uint32_t val)
-- 
2.41.0


