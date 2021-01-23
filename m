Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GM0-0003NX-9d
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLj-00036U-5q; Sat, 23 Jan 2021 05:40:59 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLc-00031C-8U; Sat, 23 Jan 2021 05:40:58 -0500
Received: by mail-pf1-x42e.google.com with SMTP id u67so5486630pfb.3;
 Sat, 23 Jan 2021 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c771B4ttrpmQTuPEon8/y7iMjVoswF3wTEbNwRcJGBY=;
 b=hJfOIDDt1Tu3nSjJ8bm5HeP8aXpkQPsSgms01avoWkV9ycqKaeHul2amTRvhnNWJ88
 s2aDMGDPGmy8jEUJL1QW6BKyb+1NsIo/g/GFuVJOCnYRo9yGcYM3V2PQPMQ66iXtgUsR
 lelNi0ChDheL1naNr/o1cGAQzt+oBWtEQkIsPxNX9yaE61IxFqGDOFNvpey80SZPv7yV
 M/WLITDZ5Zr7xoEioIqB4sXdJ/kUVAlCy/OnwOtVUDXHmPqKZDhWjGmKZ0cNlrMMZaT4
 ABEqJfQ5MNqDWfreo1S3syz/msSODWkPFdR34dVdfNXQVJKI9lr/oDUNX93cHo+I3N12
 TcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c771B4ttrpmQTuPEon8/y7iMjVoswF3wTEbNwRcJGBY=;
 b=O0W/swq3IGSE/sezAGaXwAMslxBA1jSmpywxdfmElCeSzx5eveFUEAjZyQv1CHw4Yr
 MD2Rb+yUFUbIiSrDx2wUtfkPVlfYqWKwhpSVq43Y24NusA7oyldWNqfBkkBBd2C1dT2m
 Xpw1vsyE5IHOJvCg+pjzmYvG2zKAoBp1EzHRiCIu05/nnDP59Mj1u5iZVMFms6oEwY/o
 hk6P4f87BgXgeHPJhQyWg8XGDVJntBmPm0MhzcXlxpo8XFe0KFbZQ0HIzbQavMmiG3xo
 D41s/6sKI6dwfND3wPDS3yfxR3jjdZhB7OBUkGPMVCq5rMRKyWbCF5ddexx8aC/WOmJ6
 widQ==
X-Gm-Message-State: AOAM5335QgbG3v1Dzc9PzZe95EsFF3fWoUQ6b6hB2oyaesF8uDw57D5I
 R7Mqk4GzOShaBEDA11HW6JZVq49Ry3Ca3A==
X-Google-Smtp-Source: ABdhPJyBNrfo04uONZpjKOZHGcc7H+WOHzi6ioeQq40MoIB4FaLQRF8pHGEDJIiboXvqvqplUl7Fbg==
X-Received: by 2002:a63:f255:: with SMTP id d21mr9159787pgk.149.1611398448080; 
 Sat, 23 Jan 2021 02:40:48 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:47 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 09/25] hw/sd: ssi-sd: Fix the wrong command index for
 STOP_TRANSMISSION
Date: Sat, 23 Jan 2021 18:40:00 +0800
Message-Id: <20210123104016.17485-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:40:59 -0000

From: Bin Meng <bin.meng@windriver.com>

This fixes the wrong command index for STOP_TRANSMISSION, the
required command to interrupt the multiple block read command,
in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Make this fix a separate patch from the CMD18 support

 hw/sd/ssi-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 5763afeba0..9e2f13374a 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -83,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
     ssi_sd_state *s = SSI_SD(dev);
 
     /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
-    if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
+    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
         s->mode = SSI_SD_CMD;
         /* There must be at least one byte delay before the card responds.  */
         s->stopping = 1;
-- 
2.25.1


