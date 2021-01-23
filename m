Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GM0-0003OO-FU
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLk-0003BC-M2; Sat, 23 Jan 2021 05:41:00 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLc-000311-7l; Sat, 23 Jan 2021 05:41:00 -0500
Received: by mail-pj1-x102a.google.com with SMTP id e6so5475487pjj.1;
 Sat, 23 Jan 2021 02:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtlieItfiW2uS3tWTv06gLh4blc9qN5sDQVQkFIfd3M=;
 b=or1c0Os3L8661o6959/JxYbcMuYeSo5dbi+B6VPP2Txs+F9HRPHvSXGRZBojk2RE1j
 0HKb3uM9w/2giJaYVBO6IjsOEGe5AWOTexgYrn78nvxay97o6Mxw0t/YRLjc8ZEw+YUo
 7i18RscXiSqbwYzQG3VgnotbPx9m+EyHCevLIAEpDCfGBS/qxp6+8nOC9XWJeClg/BRi
 voOD/lZFFGI7g46g3rgcew88EarY7IKIYdCoci6HHqxm6fVfl6VQQFCmGwECptJWYPFA
 QFYo/btECz7G3LQw8aXrGvz5oGczEYlgjCrF5oc/9aQ4kWZT6pgP5jmcgAXmvboOqb0G
 ltvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtlieItfiW2uS3tWTv06gLh4blc9qN5sDQVQkFIfd3M=;
 b=qrUEzNg/33dCLposmLY1eoLaSkUB+aXpxKjnMlMNk2T3tDcZRjojqWuRyyi3yQ2qJi
 QRL5gYEhHQnbfOjD8MFLKjdSbrg+blHHBnIrDkUQKM1hMoYpTy32jC48TJC89UxSrWEV
 m6rnVWMavKGHbgXzniR+4+tEx9ALyZkHdAKOaOYa+5+sJGY+t0AtGn6GyCuM17SDvdH5
 yB8h4cZO+GhKDTCEouv3U5NIqsycg5b5+KiLwBo3L1x6Q45yMD/HlhuD5mdHJtwIFcAk
 RjK4JBIrNsIE1T2xgW5N9pc4DgOoejWO4M/V/KrbEJE+1FtfRkFDh8sXklVmUrJDxZZ2
 iguQ==
X-Gm-Message-State: AOAM531QfZtCDhTyZ/15/49RexbNqZSQgzYqARRCq8LpsV7nIg3fXXie
 3yPQoto/twj/4F5k5r1Ypro=
X-Google-Smtp-Source: ABdhPJwk7iW0Yqwn1w6vBgUXg7LByq9z+7jNFQU/jvbMk1qgUi+J+WMm1Z9sGBYUb7ifw8Q/97BoFA==
X-Received: by 2002:a17:90b:e8f:: with SMTP id
 fv15mr10848970pjb.178.1611398445618; 
 Sat, 23 Jan 2021 02:40:45 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 08/25] hw/sd: ssi-sd: Add a state representing Nac
Date: Sat, 23 Jan 2021 18:39:59 +0800
Message-Id: <20210123104016.17485-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:01 -0000

From: Bin Meng <bin.meng@windriver.com>

Per the "Physical Layer Specification Version 8.00" chapter 7.5.2,
"Data Read", there is a minimum 8 clock cycles (Nac) after the card
response and before data block shows up on the data out line. This
applies to both single and multiple block read operations.

Current implementation of single block read already satisfies the
timing requirement as in the RESPONSE state after all responses are
transferred the state remains unchanged. In the next 8 clock cycles
it jumps to DATA_START state if data is ready.

However we need an explicit state when expanding our support to
multiple block read in the future. Let's add a new state PREP_DATA
explicitly in the ssi-sd state machine to represent Nac.

Note we don't change the single block read state machine to let it
jump from RESPONSE state to DATA_START state as that effectively
generates a 16 clock cycles Nac, which might not be safe. As the
spec says the maximum Nac shall be calculated from several fields
encoded in the CSD register, we don't want to bother updating CSD
to ensure our Nac is within range to complicate things.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: add a state representing Nac

 hw/sd/ssi-sd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 8bccedfab2..5763afeba0 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -39,6 +39,7 @@ typedef enum {
     SSI_SD_CMDARG,
     SSI_SD_PREP_RESP,
     SSI_SD_RESPONSE,
+    SSI_SD_PREP_DATA,
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
     SSI_SD_DATA_CRC16,
@@ -194,6 +195,10 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             s->mode = SSI_SD_CMD;
         }
         return 0xff;
+    case SSI_SD_PREP_DATA:
+        DPRINTF("Prepare data block (Nac)\n");
+        s->mode = SSI_SD_DATA_START;
+        return 0xff;
     case SSI_SD_DATA_START:
         DPRINTF("Start read block\n");
         s->mode = SSI_SD_DATA_READ;
-- 
2.25.1


