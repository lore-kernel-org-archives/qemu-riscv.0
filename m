Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLm-0003HX-Pn
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLb-00034C-P1; Sat, 23 Jan 2021 05:40:52 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLR-0002yT-E0; Sat, 23 Jan 2021 05:40:46 -0500
Received: by mail-pl1-x634.google.com with SMTP id d4so4731698plh.5;
 Sat, 23 Jan 2021 02:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZCtk3pSUPvfXlClwRPrI//hxIZ74y5ldXEVKrWZP+A=;
 b=XWuqzsC1/KZMYbpW5K2E9qNI3BdDT6iQ3Dhs4Yh4EWv2aGPABd5drqZRIZG2pHehvB
 0LF5zCeM/9CdIn+XEF3aAONzf1UCyl0GMy1jiupVqfNnHGvxqj7U9rxlGzlVsZ6aGXCw
 EbB1KOfXLek/MdpLHuGr1fsqJS97yJYA1SoNZjMU0vYDR+2wVCI1PZQtD1UKwlQ1OnY1
 cRzRPQ5ZxA02aIUitZzkqNFN1SjCShXA6imllI2eJZhMjm+TzRXXA6sXJLUoHqMu6AE/
 KTLatw6r2fO5NiUbj/FfPpQk+Z0Nd3QpxnQYVXrQxBIrUo1ErbMI5ZhxM6DYOFsmQm3u
 m3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZCtk3pSUPvfXlClwRPrI//hxIZ74y5ldXEVKrWZP+A=;
 b=f/KEXbidWoZDAMnDq2ybFtpDLMxbQ6qkWUSRJsKCoCivYGxnMMvhD8EJSXHSi697bs
 pU4X9F9Bre7gJPrMjI+hLLrI0vbsfLDo/zEHq5O/0/6QG2MQ7122Wgl+9T+JhiEzu/Sy
 VKn3LbYW9wo+Di1JymvrNIv/ux+ZdhO/TumrRq0HeClV72KEtbsTBn7eygJL2v9m1MZZ
 7koPphSzMr5AtsRTI+mpx8hFv63zkILCrQb+s+R9fB0QOjqc5kB526A631omBBRyUkKD
 7FXam92B9QZNrAJdIK0q7UlPPr5gCRNmF2YOkoaUW5nkPpOKYY7AkDN4OvuIXJNCOLSY
 oclg==
X-Gm-Message-State: AOAM530hPyopc+CBjzmpVySHoBK77S7sAq9RpuveqHQ+G8BGNCAwOswO
 ZB9DQuUtqC0Z02zRt57efjE=
X-Google-Smtp-Source: ABdhPJxWnTh9D/WXpSrXJ/FGUn/EKdjbO67zPOkPrmz2gy51pYFla1iSPJTCp+TsxGNRCNxOJDZWhw==
X-Received: by 2002:a17:90a:2947:: with SMTP id x7mr20584pjf.157.1611398438176; 
 Sat, 23 Jan 2021 02:40:38 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH v2 05/25] hw/sd: sd: Drop sd_crc16()
Date: Sat, 23 Jan 2021 18:39:56 +0800
Message-Id: <20210123104016.17485-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:40:56 -0000

From: Bin Meng <bin.meng@windriver.com>

commit f6fb1f9b319f ("sdcard: Correct CRC16 offset in sd_function_switch()")
changed the 16-bit CRC to be stored at offset 64. In fact, this CRC
calculation is completely wrong. From the original codes, it wants
to calculate the CRC16 of the first 64 bytes of sd->data[], however
passing 64 as the `width` to sd_crc16() actually counts 256 bytes
starting from the `message` for the CRC16 calculation, which is not
what we want.

Besides that, it seems existing sd_crc16() algorithm does not match
the SD spec, which says CRC16 is the CCITT one but the calculation
does not produce expected result. It turns out the CRC16 was never
transferred outside the sd core, as in sd_read_byte() we see:

    if (sd->data_offset >= 64)
        sd->state = sd_transfer_state;

Given above reasons, let's drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

---

Changes in v2:
- Fix several typos in the commit message

 hw/sd/sd.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bfea5547d5..b3952514fe 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -271,23 +271,6 @@ static uint8_t sd_crc7(const void *message, size_t width)
     return shift_reg;
 }
 
-static uint16_t sd_crc16(const void *message, size_t width)
-{
-    int i, bit;
-    uint16_t shift_reg = 0x0000;
-    const uint16_t *msg = (const uint16_t *)message;
-    width <<= 1;
-
-    for (i = 0; i < width; i ++, msg ++)
-        for (bit = 15; bit >= 0; bit --) {
-            shift_reg <<= 1;
-            if ((shift_reg >> 15) ^ ((*msg >> bit) & 1))
-                shift_reg ^= 0x1011;
-        }
-
-    return shift_reg;
-}
-
 #define OCR_POWER_DELAY_NS      500000 /* 0.5ms */
 
 FIELD(OCR, VDD_VOLTAGE_WINDOW,          0, 24)
@@ -843,7 +826,6 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
         sd->data[16 - (i >> 1)] |= new_func << ((i % 2) * 4);
     }
     memset(&sd->data[17], 0, 47);
-    stw_be_p(sd->data + 64, sd_crc16(sd->data, 64));
 }
 
 static inline bool sd_wp_addr(SDState *sd, uint64_t addr)
-- 
2.25.1


