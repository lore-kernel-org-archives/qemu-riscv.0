Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAp-00085d-E3
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAj-0007s9-5m; Thu, 31 Dec 2020 06:31:13 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAc-0007KH-48; Thu, 31 Dec 2020 06:31:12 -0500
Received: by mail-pl1-x630.google.com with SMTP id t6so9943761plq.1;
 Thu, 31 Dec 2020 03:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9NyACXhLTu4f5dkh4QFmGIUbis3QARakLx03R/Yz9iI=;
 b=lHgrammZLDBf6U/mIyvFKJeWYSyzfb23XFSUwbxY5JErL3EZ6u1YdbPYKYfqUHT/4S
 otN5OEMt5JtSt4afWu51oJVxS5FADnaO7gnrEJcG+xQZXo90giGL++wMjkFD1aaB3ts3
 bEX/8OdWkYBhQBPim2JQn90Y8srzGyAX1zGDb+zbzJG0nCKhnRqosVjZdq9g8EJJ675O
 Mo+8yAELwapvJQRZh+6SLTWN8EWbUMpTjhhJXDl3Pf1TTaqT50ZeC63Iedl1ODSBIYC8
 KFymoR2hEU4KHqY58O0wkrvHq/p20YklSZpEA4BwevfyWIvcn7wij8JsbKEMuX2eirqP
 G2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NyACXhLTu4f5dkh4QFmGIUbis3QARakLx03R/Yz9iI=;
 b=fm8aP1xx/a3kKbDS/hpN36jz0Lq+GxlCUDgKrDyM1LJ/LBecxKTqcOvUQ4YwoP9MrJ
 JlUMEgsBzqdsDC/NdMZU+ZCRtjZUPNU867rLHfuJzZW/ngdZmTHjpp2jpKFn7htzSeWm
 tdvWAq0k1i1joasrtYmRHCoMiraucCgj1oJrUGGh5+rnT85lDpij6SIxm2LEqLROk16q
 xq4ykhLQ1+siQwbFWEccE0TgHJBNsA2eOQ4I3rnY1pJwr9VgDdWBt+zmF59IM0YdJFy0
 mMd/h2BssZvXB4j0qzj1ta91TQWlP62r381IOrZaklzE94hqW+tIFhHCct1MMK7mv7C9
 NUtw==
X-Gm-Message-State: AOAM5310ouIpCknd6kO0Z6WQTLGlIg/CvcbQjOb4tXjZoo5wf3qCMEbD
 RKLVrMmDbnn4uQ1atcjw5V0=
X-Google-Smtp-Source: ABdhPJzlKfOCS2440a7bdtGeWd6CbzmXAn5qFMu5SBimKIwdgAkZEzp+d+61+8X09IoWkNZ7lo47GA==
X-Received: by 2002:a17:902:d202:b029:da:d86b:78be with SMTP id
 t2-20020a170902d202b02900dad86b78bemr38216753ply.0.1609414262879; 
 Thu, 31 Dec 2020 03:31:02 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:02 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 12/22] hw/sd: sd.h: Cosmetic change of using spaces
Date: Thu, 31 Dec 2020 19:30:00 +0800
Message-Id: <20201231113010.27108-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:14 -0000

From: Bin Meng <bin.meng@windriver.com>

QEMU conding convention prefers spaces over tabs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/sd/sd.h | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 59d108d453..05ef9b73e5 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -33,27 +33,27 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-#define OUT_OF_RANGE		(1 << 31)
-#define ADDRESS_ERROR		(1 << 30)
-#define BLOCK_LEN_ERROR		(1 << 29)
-#define ERASE_SEQ_ERROR		(1 << 28)
-#define ERASE_PARAM		(1 << 27)
-#define WP_VIOLATION		(1 << 26)
-#define CARD_IS_LOCKED		(1 << 25)
-#define LOCK_UNLOCK_FAILED	(1 << 24)
-#define COM_CRC_ERROR		(1 << 23)
-#define ILLEGAL_COMMAND		(1 << 22)
-#define CARD_ECC_FAILED		(1 << 21)
-#define CC_ERROR		(1 << 20)
-#define SD_ERROR		(1 << 19)
-#define CID_CSD_OVERWRITE	(1 << 16)
-#define WP_ERASE_SKIP		(1 << 15)
-#define CARD_ECC_DISABLED	(1 << 14)
-#define ERASE_RESET		(1 << 13)
-#define CURRENT_STATE		(7 << 9)
-#define READY_FOR_DATA		(1 << 8)
-#define APP_CMD			(1 << 5)
-#define AKE_SEQ_ERROR		(1 << 3)
+#define OUT_OF_RANGE            (1 << 31)
+#define ADDRESS_ERROR           (1 << 30)
+#define BLOCK_LEN_ERROR         (1 << 29)
+#define ERASE_SEQ_ERROR         (1 << 28)
+#define ERASE_PARAM             (1 << 27)
+#define WP_VIOLATION            (1 << 26)
+#define CARD_IS_LOCKED          (1 << 25)
+#define LOCK_UNLOCK_FAILED      (1 << 24)
+#define COM_CRC_ERROR           (1 << 23)
+#define ILLEGAL_COMMAND         (1 << 22)
+#define CARD_ECC_FAILED         (1 << 21)
+#define CC_ERROR                (1 << 20)
+#define SD_ERROR                (1 << 19)
+#define CID_CSD_OVERWRITE       (1 << 16)
+#define WP_ERASE_SKIP           (1 << 15)
+#define CARD_ECC_DISABLED       (1 << 14)
+#define ERASE_RESET             (1 << 13)
+#define CURRENT_STATE           (7 << 9)
+#define READY_FOR_DATA          (1 << 8)
+#define APP_CMD                 (1 << 5)
+#define AKE_SEQ_ERROR           (1 << 3)
 
 enum SDPhySpecificationVersion {
     SD_PHY_SPECv1_10_VERS     = 1,
-- 
2.25.1


