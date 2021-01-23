Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMi-0003YI-Gr
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GM0-0003PA-NC; Sat, 23 Jan 2021 05:41:17 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLx-00039f-An; Sat, 23 Jan 2021 05:41:16 -0500
Received: by mail-pf1-x433.google.com with SMTP id 11so5489947pfu.4;
 Sat, 23 Jan 2021 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpmpBaqxwIW+T8AlgiMlZ3ja19EBYtyu/2rATDhidIU=;
 b=hw6+db9Cx1xhe2/NH3ajs3DIYY1ST3Iw4fAbNVxaxzp4I8fdedHKzf2WImgum3ZBjy
 6TV10i65i4CZSQv7Maig3dnZWPXeWKRPyfW0H5XjD3fTMu9mkXYBaOThpTZwd0ZonPAB
 A2ecXCqakVMenSB5IZR0sZhWiHPdbQQU4RALTtglotDibIyujkcnfmWoQSoOt0UTYy31
 NVOG6yuWNfmg8NfoMhPSeX3+euFcijPpB36iyxyelMnSARb6ehMRxdp1egOWBYlOlpN4
 TWbxdrp+zBexSDyiUVdURbNvxb8lpEXa7ZG7XkzK1qNDpbFI/sX3yHSBMXVKJ97kb7ID
 yXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpmpBaqxwIW+T8AlgiMlZ3ja19EBYtyu/2rATDhidIU=;
 b=Z74HKv7SxqCyJM0kbJiWC/g3AwCyhDMrifAz/Xwz0WsdYtB+ygAvdUp5eUicH/ZCE+
 W58RZY+1qiG5S52UoQ9lua5f3ET7xpYF6iQPKTA4CrwaP1zw8nIBGBYIcGhoqep2hLHh
 3IftTlcwuetXRS+88Ih4fZuLfa5FVb/lMRDQTYphM4MUmAHJAZhQpgF6Tn4UOH3qdmLc
 b1WWANsgPCsM3XtXrrPmzoTtHhIwaNk5MtSvXK9E1D8CdVUn++B3Yd/yqKyC6N+auBhr
 PdJQKchM0/rkOoIgHAAG9XWDVvB0qAi038yMVcj2nuTlDsoXFgUtc5aHsYxAmHij7EEy
 N2og==
X-Gm-Message-State: AOAM532ZpEr6V53/F51yBK8pBusf5UAFlYu/AAt161LDLq5te9PLebug
 kYKuuD/FgrApKVnC3ztvEjYISLtgeRWtrQ==
X-Google-Smtp-Source: ABdhPJwCg94C8xeDUN0SD6LlzdudIauiznYGVJmIKdwoT3tosIQqVn1VREO/JXkt/Er87Vck+eg/sw==
X-Received: by 2002:a62:7f8a:0:b029:1bc:8a1a:95b1 with SMTP id
 a132-20020a627f8a0000b02901bc8a1a95b1mr9411401pfd.73.1611398471408; 
 Sat, 23 Jan 2021 02:41:11 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 18/25] hw/sd: ssi-sd: Bump up version ids of
 VMStateDescription
Date: Sat, 23 Jan 2021 18:40:09 +0800
Message-Id: <20210123104016.17485-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:33 -0000

From: Bin Meng <bin.meng@windriver.com>

With all these fixes and improvements, there is no way for the
VMStateDescription to keep backward compatibility. We will have
to bump up version ids.

The s->mode check in the post_load() hook is also updated.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: bump up version ids of VMStateDescription

 hw/sd/ssi-sd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index ee4fbc3dfe..0c507f3ec5 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -4,6 +4,11 @@
  * Copyright (c) 2007-2009 CodeSourcery.
  * Written by Paul Brook
  *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ * Improved by Bin Meng <bin.meng@windriver.com>
+ *
+ * Validated with U-Boot v2021.01 and Linux v5.10 mmc_spi driver
+ *
  * This code is licensed under the GNU GPL v2.
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
@@ -319,7 +324,7 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 {
     ssi_sd_state *s = (ssi_sd_state *)opaque;
 
-    if (s->mode > SSI_SD_DATA_READ) {
+    if (s->mode > SSI_SD_SKIP_CRC16) {
         return -EINVAL;
     }
     if (s->mode == SSI_SD_CMDARG &&
@@ -337,8 +342,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_ssi_sd = {
     .name = "ssi_sd",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .post_load = ssi_sd_post_load,
     .fields = (VMStateField []) {
         VMSTATE_UINT32(mode, ssi_sd_state),
-- 
2.25.1


