Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAK-0007ib-RC
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAI-0007cb-FK; Thu, 31 Dec 2020 06:30:46 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAG-0007Fg-KZ; Thu, 31 Dec 2020 06:30:46 -0500
Received: by mail-pj1-x1034.google.com with SMTP id b5so5226002pjk.2;
 Thu, 31 Dec 2020 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suKVNRF1y5wycIXS5AYAnG5OVgkshSpEZUreLLDk4co=;
 b=agA72WRhmFTsXdrs/O6TbbEWX87KUtKKNQxDS5NgNzkvd2zja6T07AI8tEVkt6UN3V
 CyNpUsPkDMkVwxENlWfFldZvU+lnO/my2J/vCy1gEoSHgpVMzsqVxFfNd5O5F4keN2N+
 wRNqMvuo4l6eQmwlQccP4xCPfPbCO5EET43QTBw7KMNyMe5L2BuZb4VN+jkZptIWfoD1
 4sYf5xDRm2ppIDOmH51BhKenJQLXbvQ0c75geM1Fk+9bTtkkyvbvZfsecu/WObQijY6y
 7FhRRmvYfUE/yyVqAoDJWS+6wRtbgwG3lODgiGboBrXF7tGFcCTxf8wDbNKUQjxnW2e2
 5hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suKVNRF1y5wycIXS5AYAnG5OVgkshSpEZUreLLDk4co=;
 b=O2QaFstPzmAVkSXXvu2HcLaabZQX5VTKdBSlW07L/9D11bQoZFZObzrPXHRWSzJN7j
 jtPO9Fh2ieZlZiaCxiGLcvBUqcuW2RVA+Ff9Hyc4xXInA+6NE0lLbQSXmuW/OSyjHjUV
 bbM+RGuOp33zUxdK/nrpbBwjBE+w8oUxmT+d8rPFdeq5BDZ5B2bzbJ7XyVc1nijCnYq/
 0JjnvYbkDqbnjmF/LxojJvTKS7sqn5u0QFqGVRCH9XBOEEiXF7es+XngaFqvRxNjBVGS
 6YwTlUUJd/EQbxMpgQf6JLxt63ciJsBeBYKRBkXRMi3NsjjOHeec3JsDr4g+d/Q7ugRs
 j6WQ==
X-Gm-Message-State: AOAM531Ky+mSyFRoKAT8vwmTID4MrHD1LpiVKxpatyCsb6cj2McBK2CW
 Ub5WUeMceEHzP11c39o8RW8=
X-Google-Smtp-Source: ABdhPJyCuwCGVW7rTZujIDkwcvhs6gT/2UaBbKtNBH8H9irnaBHLvadNZKUNCo7tR3T2LsJQEdP4LQ==
X-Received: by 2002:a17:902:9896:b029:dc:3306:8aa7 with SMTP id
 s22-20020a1709029896b02900dc33068aa7mr53028260plp.6.1609414242724; 
 Thu, 31 Dec 2020 03:30:42 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:42 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 05/22] hw/sd: sd: Drop sd_crc16()
Date: Thu, 31 Dec 2020 19:29:53 +0800
Message-Id: <20201231113010.27108-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:30:47 -0000

From: Bin Meng <bin.meng@windriver.com>

commit f6fb1f9b319f ("sdcard: Correct CRC16 offset in sd_function_switch()")
changed the 16-bit CRC to be stored at offset 64. In fact, this CRC
calculation is completely wrong. From the original codes, it wants
to calculate the CRC16 of the first 64 bytes of sd->data[], however
passing 64 as the `width` to sd_crc16() actually counts 256 bytes
starting from the `message` for the CRC16 calculation, which is not
what we want.

Besides that, it seems exisitng sd_crc16() algorithm does not match
the SD spec, which says CRC16 is the CCITT one but the calculation
does not produce expected result. It turns out the CRC16 was never
transfered outside the sd core, as in sd_read_byte() we see:

    if (sd->data_offset >= 64)
        sd->state = sd_transfer_state;

Given above reaons, let's drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2036734da1..52c7217fe1 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -270,23 +270,6 @@ static uint8_t sd_crc7(const void *message, size_t width)
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
@@ -842,7 +825,6 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
         sd->data[16 - (i >> 1)] |= new_func << ((i % 2) * 4);
     }
     memset(&sd->data[17], 0, 47);
-    stw_be_p(sd->data + 64, sd_crc16(sd->data, 64));
 }
 
 static inline bool sd_wp_addr(SDState *sd, uint64_t addr)
-- 
2.25.1


