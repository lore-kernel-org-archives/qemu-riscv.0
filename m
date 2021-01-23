Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMu-0003ec-7w
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLu-0003KU-QP; Sat, 23 Jan 2021 05:41:10 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLn-00035Q-9G; Sat, 23 Jan 2021 05:41:10 -0500
Received: by mail-pl1-x632.google.com with SMTP id g3so4739871plp.2;
 Sat, 23 Jan 2021 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6KHipQBQa0fN3miiY5k4Y+3eHUcfw7rpFhSKZm/tds=;
 b=Qtoc4qQ8YXN1BdojGY1NXIEnL7ljeJ5PgCw6anx0qCwKxHlElK7DoY54h1yRcNY305
 8o4BmYQ6n66d5SGB2zS7YfsumWqcwnSp8uqMvIZJQ1ywp4r0bJessGxXheUDGMpo4Oby
 U7GJW/eSpRHZ67754ChsyOMdcmIG5Fg75bLtzrE5nMTOYRwm7iKQ5tAIT6FJl+l4S/LV
 Z8x3qNCHVe/B2JrLvFZ8SkjIG0106C+NuQuPCiaZdOJOk916j6yfcPntK+P69fb1ZS5V
 6CRQGxYU95XwFpbItxAFoEfEv94+JfC2t7HoOIaNA6CHjzjjQQLQABkbWe9rapnHPius
 Fzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6KHipQBQa0fN3miiY5k4Y+3eHUcfw7rpFhSKZm/tds=;
 b=mXa75SnhbzRYIxPqYw1c/Kf+8euNZGJqAY0Xt9kskwNof3xwPFJX2PajrtC9lFSU8M
 CcGkPGHbfl0VEEHHmPkSwi+KOrRu56CDTrrShy1W9YJbitKvB+iQnNRkNfA7X3QQhF4+
 HhOtnGvG6xiesBUs/HFatFI0lMDiRtq+wqUk7Xk7jSPpK2ImNEoI3oYdPFgLBemPT8B1
 T+egSG3CMts90se7u6TkMenpCITp9m5/KLmhx+HSyuD/wE6F8+mV8R/CT5/v5vw4gfia
 9sVwKwUvzSLG7CJZj9Appiw1A1eJQapa8i735bqMdjAL5iQ/t/tcLf/LmHMd0Dk+7lb7
 SCEg==
X-Gm-Message-State: AOAM532JOBGesFZbsJD2vNxn5Px/AYJbANpxxMlZLXLLqfFCK0vsPFKM
 p4CqD673Gc4Z1jJq8b5rPTQ=
X-Google-Smtp-Source: ABdhPJzXvsdMGCS7+vhAAODPWuCtCJ+rOekr/vjuN4mTRyVQXE4xC5RYBpW8sClUDINB0h1MxqaJoQ==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr10837736pjs.18.1611398461404; 
 Sat, 23 Jan 2021 02:41:01 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:01 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 14/25] hw/sd: sd.h: Cosmetic change of using spaces
Date: Sat, 23 Jan 2021 18:40:05 +0800
Message-Id: <20210123104016.17485-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:12 -0000

From: Bin Meng <bin.meng@windriver.com>

QEMU coding convention prefers spaces over tabs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Correct the "coding" typo in the commit message

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


