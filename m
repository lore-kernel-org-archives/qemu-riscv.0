Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6clx-0007kZ-Bi
	for mharc-qemu-riscv@gnu.org; Fri, 14 Aug 2020 12:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6clu-0007f2-W4; Fri, 14 Aug 2020 12:41:39 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6clt-0002fq-ES; Fri, 14 Aug 2020 12:41:38 -0400
Received: by mail-pj1-x1043.google.com with SMTP id kr4so4665500pjb.2;
 Fri, 14 Aug 2020 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TqvXXs04ABgLxrxaiAku8/lC9UuRi+ByjZ0L4KKRwC0=;
 b=VrNTz2XilhuQ4nnjTUcNdSyg+wvvqZj/eddpkSNEzhfCgpj2cYSUKNz+n/7g2dEg0g
 AZJzwcpUhXLK3RcyrA2TAPwgFci9kesWJ1gldUNgUVGOQUjh+bCreQvJ89F9CZYuAKOF
 d7CJG7WVm+onmsMWhWiQNiFdXEWHo14Djip8y0HVtFrtomYlwO+YtXEpFrNBLhB0I8Cl
 GUmwU5wuaFJkzc4Z/w7ZBD3UjRwXu4qp99Km7fRWGbenfiOvH93Wdofuri6BC1BAIy8L
 /WxS2cFUUYQtwvTyE6KJavHVeveF8dOF9vVHjAArhrpydlZfX+G1VUBgAbOkxyuhs067
 XM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TqvXXs04ABgLxrxaiAku8/lC9UuRi+ByjZ0L4KKRwC0=;
 b=D/S/9FoMVBxR174EIN7ik6UmRRQ8oh5VYyobvuSjUCnKTavL2/Qbboxd/ZoZXitQ0z
 vnTOFUhvo0r37wHqaNlq1sNY5y7RrwwKXLAl4h7dR1hjD+RMDwKcvcCyCCAN1SOTEm9h
 vIiSimvD6Z1fAM9YKQNHgUqvHwxHN9DKvhHE+I5Z7VJZ24yiUzeCBWsyb9xKRGk0cpSl
 wBFzS/NMoMbBr0kJd6V2FCpOYHTq19r7GNXdjW3WhKSyoujCBMrPNy8kpzGSwkc/aGnh
 8CLGfjvFEtVQ9xRFmUE9I7Iae8qJyP7ZpJ0UuounlcSbST77xJOY9ofhupkLFn5OUWVS
 xGlQ==
X-Gm-Message-State: AOAM533U6iI34d6gSeyruE/XKo0h89wc/AMG22N1l7msB6QuS7i/jEm6
 YaK8JMUtHznput4giG7jD+A=
X-Google-Smtp-Source: ABdhPJzwqDQXKtlBBhYrwiYknUSf0aZet4vXu+BQHSNaaOGXB3KDnGWpay/TRqmqQx8ZDY937aCGcA==
X-Received: by 2002:a17:90a:3645:: with SMTP id
 s63mr2968853pjb.30.1597423295651; 
 Fri, 14 Aug 2020 09:41:35 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id 16sm9836332pfi.161.2020.08.14.09.41.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:41:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH 08/18] hw/sd: sd: Correctly set the high capacity bit
Date: Sat, 15 Aug 2020 00:40:46 +0800
Message-Id: <1597423256-14847-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 14 Aug 2020 16:41:39 -0000

From: Bin Meng <bin.meng@windriver.com>

Per the SD spec, Standard Capacity SD Memory Card (SDSC) supports
capacity up to and including 2 GiB.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 51f5900..5e7fc3f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -313,7 +313,7 @@ static void sd_ocr_powerup(void *opaque)
     /* card power-up OK */
     sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
 
-    if (sd->size > 1 * GiB) {
+    if (sd->size > 2 * GiB) {
         sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
     }
 }
-- 
2.7.4


