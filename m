Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMn-0003cI-9T
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLm-0003HW-Ns; Sat, 23 Jan 2021 05:41:02 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLl-000346-2p; Sat, 23 Jan 2021 05:41:02 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h15so2235825pli.8;
 Sat, 23 Jan 2021 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8S+2pTjCNFYHJQpKubpfhi88hOIid6hv5Akr1gRnwjQ=;
 b=R999AIAk0j7suqvcy9wmiLFpq0GCTm6BcvAH6SWsdsJIpwBvUea20yCngEmT9HBxNe
 o0I67bpVWN4MECuqsuJG+L5+9mj1ldzIyl6Kfk/Mbymyu0jmF/oazgCodcd0jpFn927J
 Bc2zG+R1Xu+hCM7yO9HXWMpqSZfKkld93DFZBpbaCqLfcXdjzVs/tggZxT/B9/7Sp88l
 5agFhkYEVCj2xpJQ39w0wQ4E42VFO1feZi47x6dywSbsR6T5geMAYdCrWRHmGxUjWrBA
 W5p4nAS/guzkuEZjsjapyjMVlgB6C/CpfUEBkOAE/QGpI+8dx+QDb1s5yIn/vDA8rDoF
 55bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8S+2pTjCNFYHJQpKubpfhi88hOIid6hv5Akr1gRnwjQ=;
 b=WcxasobpiYS3dmwJ/hcFuba/hpnYDCsUmStVMzETek1sm9iqSyAIIc88MUSqirqg7u
 nDqT8fvbvRUcI9lKu9YkfFadyCTQVyMFq17Lr1aOGhESOJYszcf1jkythjPjJLLiA+eg
 jFVlzwODFHQz0KL8uGyRbk/O63zFhtVusUhhCIC0E0Q1XT/OT1+Az/Q+rA37hqzMWY2c
 I1wRzxQrGBJmvFga9n3Jwnub91MmhoPmErbFdsilBOCS4zGx8znI5vC4Dvp1CIogu8r4
 NUcxurX6g0OhDdEmBFpRdcfS+YwNt5WBnwhcKGWcLzzdiC2DecA7v4cAdUPMywItykIb
 5otQ==
X-Gm-Message-State: AOAM532ha77ZDgkpKovpZvlEkv/e6GU/MRoxzgHCXK2P9Pv9TPYejXwN
 5zg5vFRrSnaNYlVJkiflcj8=
X-Google-Smtp-Source: ABdhPJwQxDxjuMF8XXvqjMGZT1JXiN5j6Q0S/gTnOUYjzQzawTAqsuGSk9j6b2v6lwXxm4q/kxr3sg==
X-Received: by 2002:a17:90b:948:: with SMTP id
 dw8mr3408377pjb.72.1611398458950; 
 Sat, 23 Jan 2021 02:40:58 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 13/25] hw/sd: sd: Allow single/multiple block write for SPI
 mode
Date: Sat, 23 Jan 2021 18:40:04 +0800
Message-Id: <20210123104016.17485-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:03 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the single/multiple block write in SPI mode is blocked
by sd_normal_command(). Remove the limitation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/sd/sd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 09753359bb..946036d87c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1230,9 +1230,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
-            /* Writing in SPI mode not implemented.  */
-            if (sd->spi)
-                break;
 
             if (addr + sd->blk_len > sd->size) {
                 sd->card_status |= ADDRESS_ERROR;
-- 
2.25.1


