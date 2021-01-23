Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLk-0003BW-Pm
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLT-00032f-J2; Sat, 23 Jan 2021 05:40:45 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLM-0002wP-4C; Sat, 23 Jan 2021 05:40:43 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 30so5595825pgr.6;
 Sat, 23 Jan 2021 02:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6w90ZfsMt4jWRp3kwdSmprnCxB/Wq/3rVtoRL2E9es=;
 b=kDqUTyeND1B/c0uEFLg94OdJlqjE0M5qP6AbQ3LXjv8fIbftzVbwKgwnNFNSm5xM4p
 +jSmvhfzNsKMjXaftpLBriWIMoJhUru4f9tQn/F3PYzXlzPuTexmatMd8GtkaON2PQqs
 Z2u8DLXMybwjRUzq3nbv3ruOsCOiVBHGUQTiFQ4peJVkN9eqWIWaWBokw3Axtl8LoaGp
 QJe4LKL1vg0OS5PFcJFs0k+1S/WUeNooEImw0gNIA9CuBJ7fO2clA3Gz9YN6+JpptI4w
 HdGhN7qUiUrkUvvaxChFewBxDVeQfyZvvMcvNW/z5SgrpeVgbe2f9MTiHOlyrWNjYM1j
 roEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6w90ZfsMt4jWRp3kwdSmprnCxB/Wq/3rVtoRL2E9es=;
 b=Gn+D4ca6iDEaZP22teUcc9JXAZ67DriP8sYhjD4jefpuSq6fZasfUmzzGnTGjImwWM
 oFKuf19eZ/zKFuvuSPtc90tWTviBRETdxRB9MtgWifgrX7jpdNNqXvdnAf+AJ3YBxxwI
 oMP7JgeVJonLh2wi7ywVi0endDwYFO9wdQX1fQHkGGIZ5wgy5pY7I5Vhrz8RAoxlkr1o
 iFGCJX+jpG4wEfhg6sPtIXkWyx8BnvOD2sUbHwxTyNEj61SHD6uME68L8IKgreswipaq
 PkS0ys8IUG1jYpufvg1mbhmGsS2K+IFdFnbnGHRjm9TfmAhyAjSkP+C9Rh44S9i76efr
 RDhg==
X-Gm-Message-State: AOAM530CbQMFzQzUCEBgwBiex8nu+TGVg2CCn/F8KgDw90Cj4fJ+JcOa
 +RPM7I6c9WmCtP/xBfMsO2E=
X-Google-Smtp-Source: ABdhPJyJKZpokHs/r76KJqGkLKROGbrV9Kq9bRKENrsF2rDCH+U+Zcp09wRXU0k/vO4AMNDag7QHlg==
X-Received: by 2002:a63:50a:: with SMTP id 10mr2144683pgf.273.1611398432792;
 Sat, 23 Jan 2021 02:40:32 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH v2 03/25] hw/sd: ssi-sd: Fix incorrect card response sequence
Date: Sat, 23 Jan 2021 18:39:54 +0800
Message-Id: <20210123104016.17485-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:40:46 -0000

From: Bin Meng <bin.meng@windriver.com>

Per the "Physical Layer Specification Version 8.00" chapter 7.5.1,
"Command/Response", there is a minimum 8 clock cycles (Ncr) before
the card response shows up on the data out line. However current
implementation jumps directly to the sending response state after
all 6 bytes command is received, which is a spec violation.

Add a new state PREP_RESP in the ssi-sd state machine to handle it.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

---

Changes in v2:
- Add a debug printf in the state handling codes

 hw/sd/ssi-sd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 9a75e0095c..043e270066 100644
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
@@ -163,12 +164,16 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
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
+        DPRINTF("Prepare card response (Ncr)\n");
+        s->mode = SSI_SD_RESPONSE;
+        return 0xff;
     case SSI_SD_RESPONSE:
         if (s->stopping) {
             s->stopping = 0;
-- 
2.25.1


