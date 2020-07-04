Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkH4-0002Fs-IR
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkH3-0002Co-4B
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28345
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkH0-0007mA-Bo
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=Ge4dGhOWB3qdHk64C5v/M/SFOAj1vNvDqqeyJxp9G4dwik0RJhQRSb+fBDcnv7Q9/ZdSCN
 z6ISOWPxA3j0UwdF643PTI6Oy82HkFQfAayFCog9ufgNH/PGRniblvNFhMc7zQEmvk5R7y
 gGN7Fq7wCEhAXJ7H77oDTsVs8oG1fUE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-EpAO34B1P2CBfQEtaXlXdQ-1; Sat, 04 Jul 2020 11:40:12 -0400
X-MC-Unique: EpAO34B1P2CBfQEtaXlXdQ-1
Received: by mail-wr1-f71.google.com with SMTP id 89so12525853wrr.15
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=uaAyK7Nq8lfh1P1gi+j3tJXLQCwFuyMrl/0DBgUQJoD4GNi5VilycvrcfZbYxdefvX
 nhanvc/dSC3VpgbciUeNVMJ4j+9H1b5HEPpwc/k7E+fxNIjKTOfNWr8he+kjvQP1q39m
 6hHu188y9Xzwmt4I9hf7Ewa2R/CbKiFYOXpEa3sK+I3l06tCTzw30lt2ReQNG4OYbmuk
 NP/9rtBocI7TjVi1qSrTd2zmZhVb8341SRsqNRVOllFSxRUooSlOEYMRr6mPoV+mgxug
 XBqvwNLyK4eN7sIsm8aeOOUh8Nc2f/Wr0cJYXqhKvrriSLmvY9X4jbVivSmqEwnTOk5Q
 p5iA==
X-Gm-Message-State: AOAM530zyKWtnssDakTjuDgfgHF8K/adqYx+GaCI2tJQab8ZYlZKtlCj
 +szrzMOVpWKkChfFQP4YKjRJqHP2KbeV6wUdfsZwFu8sbXKq7Ve0qSKaIfq5iX8mtWsAxihL0HD
 BX/tREHBpWPXj90o=
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr40832231wmk.30.1593877211223; 
 Sat, 04 Jul 2020 08:40:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJPpdiXfwZHoJeVsztQrPxphUc0XkfpFMak7zIQP9ikycliG6Rrvj8/oUtw1GISYnquWwZtg==
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr40832203wmk.30.1593877211076; 
 Sat, 04 Jul 2020 08:40:11 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id q188sm16902969wma.46.2020.07.04.08.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Stafford Horne <shorne@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Thomas Huth <huth@tuxfamily.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v2 11/23] hw/dma/etraxfs_dma: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:38:56 +0200
Message-Id: <20200704153908.12118-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:17 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/etraxfs_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..d2f7e7ca9d 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,7 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/cris/etraxfs_dma.h"
 
 #define D(x)
@@ -765,6 +765,8 @@ void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
 	struct fs_dma_ctrl *ctrl = NULL;
 
+    qdev_warn_deprecated_function_used();
+
 	ctrl = g_malloc0(sizeof *ctrl);
 
         ctrl->bh = qemu_bh_new(DMA_run, ctrl);
-- 
2.21.3


