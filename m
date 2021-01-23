Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLW-00033h-9T
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLO-0002z1-2x; Sat, 23 Jan 2021 05:40:38 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLH-0002vX-QM; Sat, 23 Jan 2021 05:40:37 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q7so5599856pgm.5;
 Sat, 23 Jan 2021 02:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYTOVsDICNYs9a4Nc8bQDRVEnCpcAczZDVceLgRkdvo=;
 b=kcVubV9vjsxs3ZxGmi6MkWnOdGAQ1RVTzDbCWxXuar0/EM/BamDS4Z4nLxPluxgFRV
 Sn7BfbS3S75B6VUyOzxnwYmfX6JpF607XR4kqVgea95f8hVAt/g6rElinTiOneiY9VCJ
 rD1k+/IHgcoGnXxfv15VhMGUmNXUQjnk8Ioeu0uXGJLh8Xc5dE2y+9LW9yOsjXafC5en
 4NF7+bVna9Oqp5lO2rbqfdOluAiN12p7CKoUlH0hDvqOvLHgnMor0ZB898xaJ8F8XiJZ
 tKB2XsldH0RVw+cRYHQOhqP3JHJrFRpgPxanovJQDNZsg0AqG/HHYYzzN/ZfZCU/p5Nu
 Pwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYTOVsDICNYs9a4Nc8bQDRVEnCpcAczZDVceLgRkdvo=;
 b=PNYwiDvf7QNihHgY63xeRNpFYRESzZ0k3kqamZHHAwA+4s0B4nEO8kTZVey1xuErU5
 9Iej76Hn+mbNGo8MZ39XrytDRYFN6oldKRo05bb6cQqdLrGhGzxoG23vVVR7RtZ62O6Z
 LJeBfz/74mGOr+cUDYoeSYFfV9e8FmIvNBtet7V2fVL49Uy8p6TStaFNweiYYjmoG72T
 MoZmCKd9NUHqNP+ojY+8MnLXrQWFPMTXzeZZEJT1MVHsAWYH0+qNEVvUxktaOsVa6MB9
 asWnRxKi19bXvBLCUYNGvsZ3BR5a6DHSX6bJkj8S5hJ5Bq9gzgUgOmNFeGG8lBInVX6o
 TAMA==
X-Gm-Message-State: AOAM531Asvjh/5tb7Yn3C3Oaj3mOoG9sRjSLgI7N5GZe7UJr3uI+5W2U
 Kdyn0Z409iVw7wyApk7fRyo=
X-Google-Smtp-Source: ABdhPJw8J2LCeCIrP3654oAube3BZMLZwuW/+nIlv2eDbJa7ctfivBd+8aKt+JdvIM3qBDDFLC9Xxg==
X-Received: by 2002:a63:6344:: with SMTP id x65mr9102420pgb.172.1611398429996; 
 Sat, 23 Jan 2021 02:40:29 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 02/25] hw/block: m25p80: Add various ISSI flash information
Date: Sat, 23 Jan 2021 18:39:53 +0800
Message-Id: <20210123104016.17485-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:40:40 -0000

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


