Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAk-0007v2-5b
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAf-0007pc-Ts; Thu, 31 Dec 2020 06:31:10 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAa-0007K6-SP; Thu, 31 Dec 2020 06:31:09 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v1so4808482pjr.2;
 Thu, 31 Dec 2020 03:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvjf9b3AqQz+QE6AFSTWom81gXgkfUnwDRLKV01hYd8=;
 b=uW4ZQUuqxDc+Q8aXrEqZ8xHcdewGO7hH4iTmLCiybwIt8eTSJf3zxnJQwOQV+eLTYm
 23Hi5NNMlxpWSS15InCIAgzXBSdW235x4Zcxgcc6XTRojt8RkSm6UGYPWJYnaakYoQe+
 Dcq+eMcuai/I2jhzVglCrTzuE6mrOZ7vl8OBNlo7siODDKsqdc4HMcblV634+choI3YB
 IgHRgSKbvr/wbWxS2V+6zzUjFRN/Un66pTPKnfxDCR5mK4kgEepg4hkrtGUi/b5WDKL7
 qlHTTRK7RApdPOpCANHEBJk42V6JvXQFYJLeEl3k0BM1ruCcO3isGFDp81YJAsvGYx9c
 JDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvjf9b3AqQz+QE6AFSTWom81gXgkfUnwDRLKV01hYd8=;
 b=Hz1f+H2rg/fTvqyg4wSumeyJmqcK7qqJ4h944LnJy07ZCuSlLkYxr2QDb33aMRygWI
 Mtc0l2DidVjtAbmByiGICgtqD/DHC+BUntiqgyaBCyT/QhQxTnlcA+g9IUrTh8XjtheF
 wzVmLbFEPEsMi2YspVLW3cWMWj+y5pQS7rCUqvXC22mCtPraYXme53Y4svf6eDf5NYGm
 DCf3PP/mQXEWHy4h/bq8vbsze/1/RQMCUBxfeIUYaJAAnG2wr3tLBlRsUqFyzTlEAugK
 N7Yx7Gh/hqiZV/rEZFotC/gv5qJslJOJhQ6kCCx2Q4klmAh+3w+X6ZWzq3WIyIajPRvl
 Ub8Q==
X-Gm-Message-State: AOAM5322A/WEiFLRPW6WQer3arxEfjlDe+CiyjiqL3KjiMbKEoAbf5Cu
 NKl5xQBRv8PbSt1c8IwTDjM=
X-Google-Smtp-Source: ABdhPJzNpy9ueoWkDCKDkeP7BBovIJR6R0pk5NzqELSXARIp+mxwYipy/vNHKfkmzGT86BQojlX2bQ==
X-Received: by 2002:a17:90a:46c2:: with SMTP id
 x2mr13156007pjg.15.1609414260059; 
 Thu, 31 Dec 2020 03:31:00 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 11/22] hw/sd: sd: Allow single/multiple block write for SPI
 mode
Date: Thu, 31 Dec 2020 19:29:59 +0800
Message-Id: <20201231113010.27108-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:13 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the single/multiple block write in SPI mode is blocked
by sd_normal_command(). Remove the limitation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1ada616e1e..67e5f7c05d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1229,9 +1229,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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


