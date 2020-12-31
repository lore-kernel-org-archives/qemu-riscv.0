Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAE-0007SJ-8k
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAC-0007OG-EK; Thu, 31 Dec 2020 06:30:40 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAA-0007B2-Nz; Thu, 31 Dec 2020 06:30:40 -0500
Received: by mail-pl1-x635.google.com with SMTP id s15so9920081plr.9;
 Thu, 31 Dec 2020 03:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjJeo+8Q1zYLunlgKoXBxtlmhbiH3R9yfD0wF408HsU=;
 b=amhdEoGibiP+f7hwdzks57gt1vrNt60w8qr666yBMCRx8SRExewhQSU5l917ytSY6h
 lPgzc0Ao9uz9HSo5m3KSlNroQ44cCs6zZGbZc9IksiMXSiSW9kYv0hsU98392DEplD2J
 gslldYQyhvhQdMgIDsqIyO4sTaCiliJf1ijIgLP+JXk2tCdsXjASjrB+3HiUb9YC42yf
 9RwcNufKPreZlDQwtTfiD2H30CtqHP+rIR2djwbPmX7AE+di45mVIAda/9Os22lwyl9y
 i6dqciPS5fmUUW5HspPIx4R+vdwGri2YEi1wtUugWWpXKXp1AzAbrFpYouS2Z/BoOnYO
 l6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjJeo+8Q1zYLunlgKoXBxtlmhbiH3R9yfD0wF408HsU=;
 b=m6ZIjjTn6h2VzZlfWNxGxZq8nX3M7RDI9bPsnlrNsBHw2pCvmnLzaByTDfRi1BheQt
 oq0YlxAQTDL0koip11cgLQvHCxQ/67NPCBix99QpTd8LMOplAa+3nXtH7G1lUuK0e7pm
 gMwCqsf1OpNhIt8R55/TxgK+1jbcW7AM7I8AVCSj5RQcvPZzD0sMGRU+jg8oclEPMaIC
 gl6pJJu2fMHFywjS6koTm3oaKM5FpwXbC4KHbaibuF7qLdF3On0sfEj7JbK0GOjzrS3o
 T21NMR/XHKyrNXShQdWorttMflI7P0xtQX/+g/At6xBm7+TinIeS5lhgeM4Y681FhNmK
 6UTQ==
X-Gm-Message-State: AOAM533qj0w/HvYrW7IsOSP+K3jobbC0hXMBayLTsp307I8fbCYVIZPK
 9pw/uaAdV1jCxr2YXWchcJg=
X-Google-Smtp-Source: ABdhPJyRNUKyX0IW9ruxB8FwO6rlBvX/B9D3tTFY2oeHe3xDTnrEinQxZS3T9uSDfyafD73MEZ3Bdw==
X-Received: by 2002:a17:902:ee82:b029:dc:78e:6905 with SMTP id
 a2-20020a170902ee82b02900dc078e6905mr56639801pld.48.1609414236821; 
 Thu, 31 Dec 2020 03:30:36 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:36 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 03/22] hw/sd: ssi-sd: Fix incorrect card response sequence
Date: Thu, 31 Dec 2020 19:29:51 +0800
Message-Id: <20201231113010.27108-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
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
X-List-Received-Date: Thu, 31 Dec 2020 11:30:41 -0000

From: Bin Meng <bin.meng@windriver.com>

Per the "Physical Layer Specification Version 8.00" chapter 7.5.1,
"Command/Response", there is a minimum 8 clock cycles (Ncr) before
the card response shows up on the data out line. However current
implementation jumps directly to the sending response state after
all 6 bytes command is received, which is a spec violation.

Add a new state PREP_RESP in the ssi-sd state machine to handle it.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/ssi-sd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 9a75e0095c..228ce4ddc7 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -36,6 +36,7 @@ do { fprintf(stderr, "ssi_sd: error: " fmt , ## __VA_ARGS__);} while (0)
 typedef enum {
     SSI_SD_CMD = 0,
     SSI_SD_CMDARG,
+    SSI_SD_PREP_RESP,
     SSI_SD_RESPONSE,
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
@@ -163,12 +164,15 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 s->response[1] = status;
                 DPRINTF("Card status 0x%02x\n", status);
             }
-            s->mode = SSI_SD_RESPONSE;
+            s->mode = SSI_SD_PREP_RESP;
             s->response_pos = 0;
         } else {
             s->cmdarg[s->arglen++] = val;
         }
         return 0xff;
+    case SSI_SD_PREP_RESP:
+        s->mode = SSI_SD_RESPONSE;
+        return 0xff;
     case SSI_SD_RESPONSE:
         if (s->stopping) {
             s->stopping = 0;
-- 
2.25.1


