Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4HP2-0000XQ-O8
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HP0-0000Sb-K6; Tue, 26 Jan 2021 01:00:34 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HOy-0001QQ-TD; Tue, 26 Jan 2021 01:00:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id r4so9204803pls.11;
 Mon, 25 Jan 2021 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYTOVsDICNYs9a4Nc8bQDRVEnCpcAczZDVceLgRkdvo=;
 b=ZAFhstByT+cDNv3dv7zNJLbdBsYZ6uZNKRxhIKo6yRhQR/5A0k1K8SoKWdPv6A+f9r
 USxFnKlbpantI+f550mSyhTL0v/xgrvna7fJztFZ1n41u7uC3YMgopUYkTP9zrUCH/DK
 WBI4rRUM1vBSf+sgWmsQr6K3wLHlDWfyMhygxypmkrK/6+g12XApZaLujQsdl1W/Jk2E
 QmR1mW971QKfWbQY71hNz6iF5YvSbG1PmYzN4s95h8YLINg8ieBcGpzASMQDYrtNnpEw
 yIPztZhaWO1DTBzwCpOZZLmHp5ougcAK/L60eAO/lrD9D6UYIOlwvfGRf3cIGaZax1Ip
 S+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYTOVsDICNYs9a4Nc8bQDRVEnCpcAczZDVceLgRkdvo=;
 b=CLznBxzSHhedoO5aZItJxfltO0XbwuKrX44OaRUzD0QcJfhoSw0NMkWijU56X7hQe5
 VFNe7SkeTWopPz+09+5Ehkxae6AZHixc9B3FqgzNZJ+p7A4KSPYB692yJkI2n1vVkjCS
 iZSecKld959Uwad+iYLmhTF1t6l4uy4elDwY+VF0lCouSbL7LlGAnM2q8s3kUTJx4mJ8
 fPk022BD28VQmdPBYCMhixHiiakIsNWRm00u8ZJEDJm+q3HOw7CdjIK3kMSO3FKwODYB
 a+T4iq2RDQt2IsqjFRYq4EhgySUTRqboUuXJ4xx2OKyBotlk0gd46u5GIUZH3xlxvfnt
 zwqw==
X-Gm-Message-State: AOAM530t+s8pf1i3BG02Qw/24uWZ3rrqku49t5rzcTh35ThX90jYKbTZ
 OTmG+cCk6FimPDCZaEntgAg=
X-Google-Smtp-Source: ABdhPJyPwHi8MzHYKkxKVjI4Uok5csF97QVwmD8zUKlhA5u+FTolI1crx6wAOCysf8rwoQNS+WMN1w==
X-Received: by 2002:a17:90b:1004:: with SMTP id
 gm4mr4284092pjb.97.1611640831068; 
 Mon, 25 Jan 2021 22:00:31 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm12471076pfk.0.2021.01.25.22.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 22:00:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 2/9] hw/block: m25p80: Add various ISSI flash information
Date: Tue, 26 Jan 2021 14:00:00 +0800
Message-Id: <20210126060007.12904-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126060007.12904-1-bmeng.cn@gmail.com>
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jan 2021 06:00:35 -0000

From: Bin Meng <bin.meng@windriver.com>

This updates the flash information table to include various ISSI
flashes that are supported by upstream U-Boot and Linux kernel.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/block/m25p80.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 217c130f56..4bf8aa8158 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -210,6 +210,19 @@ static const FlashPartInfo known_devices[] = {
     { INFO("640s33b",     0x898913,      0,  64 << 10, 128, 0) },
     { INFO("n25q064",     0x20ba17,      0,  64 << 10, 128, 0) },
 
+    /* ISSI */
+    { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
+    { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25lp256",   0x9d6019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
+
     /* Macronix */
     { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
     { INFO("mx25l4005a",  0xc22013,      0,  64 << 10,   8, ER_4K) },
-- 
2.25.1


