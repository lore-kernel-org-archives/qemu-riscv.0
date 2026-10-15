Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4804CC6B38
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIdk-0000eb-Pg; Thu, 15 Oct 2026 06:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdb-0000Zu-Im
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:41 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdY-0003Eu-5E
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:38 -0400
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so41413945e9.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059875; x=1792664675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wyuy2rktXggsAmL76/K7kLk/zQD6P6G+cIxBCgNKHGg=;
 b=TqLQKxZ2HQKe6z8Y2cAfpMXkj0wxXio5xOW+H8z6I2dxCTpyhe83OX3h7OK8mltUR5
 pCwB++gT01PS1YBD48HzbKJgwqa1qCHIQ2b7lzsC7IGXPcYfmVp5S2x6FAbUF3P+EMl+
 S4WBbduxK4aMYNpr7wfcnfvX5FZv/UcnDk39H4yzDBMt5gT2ENzqXZhXapMkIhvpjJL7
 seB9TrwrDeubxSFdWjzhimxlXfIDA3xpDek25d7q3vYaSyupuldWMNhBV0hD4YU8LdXy
 Er/hoBvv3GZnXn/Tg8TEYoKEwba8j+XjWdygsLRaLWIIGPXeA4WtcQrVTywQvuNWpEXD
 sADQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwe2OSs63GAk6WsO3izQycvIPOckFRJxwbRkr5tjYhufBwreBbZC0+Hxa2cH5uCK9Eh8q8g0SqWbdgo@nongnu.org
X-Gm-Message-State: AFq9FYJ96P2B5Fur52D14Boaqt1yP5I2QGWgr9YViorqs8CTQ94U0hPI
 UZnPPkcBMSjoTRzmS5vWBWwB6hVGIF3u2UCMNzkXuIt7dNfY3DlSeEp7
X-Gm-Gg: AYBFou2SEiKbjyEcKVXJFTukxK4BJC0UQhT/bxppJpNQL2Xyx3u/AGhwK+2T+dVg8V/
 z2BeTJRAWYvxEfIwGP5adRSqL24ciZG6NRXB03LpoIFnZyUgqkcbaghYiOQXPuxhNSIzpnJdeAo
 mVlQZbip838X2AiD8mdIXZXEDk2hswMJTHgbTs3OuVRrxfUIjMJFzFWvg45PM7HoNYN2rTNEyHa
 jSTAaLI9Gjj5gve0zo940lf4iZHAM97xIlygW/mxqACJ48edQAXJq+mU1LDt/CQ7GTbknCPSKa7
 SMv+70TQ1AFUjl8dN5Juicv5Nvm9C6nE3y7CKUAk5/powCfgHwLi2gwoYExco8X/GeGaUVOTqpj
 TmT9rTMo9MwYlO5H57PbSE9wGa2+RTo8Y56s++HC3Tw/xzNR7Pz1Uk19ZN8lsug3iazNnxRWYPK
 K1I2QPLDPJ3XG94KFcvl9XTyVYimi5jIQAskzQRnJJS+Z7cUQCaRAPe0jS36hxbRmejhVqeSNhA
 Igd8x7Jtw7Swi+1+eI+2NCUKjsK2BLaChcebGaFyE+Qeg==
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id
 5b1f17b1804b1-4a18e446880mr341688695e9.3.1792059874580; 
 Thu, 15 Oct 2026 03:24:34 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd66ab3dsm56129535e9.2.2026.10.15.03.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:24:33 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:51 +0200
Subject: [PATCH v3 04/50] hw/i2c: pca954x: drop unused header inclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-4-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056474; l=892;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=GLj3AqYRa9mINpG5YoTmBh1sQwRVDiaGrNDDg2Hh/b0=;
 b=ZY5YmJ/6jWLNSEgZHRfp0lhNgeO69qtpIB0iK7KytOQABfNNQ94S50cQDVhgqbbeFgyP+4sbN
 cmxVIJjz6hZAAmOe26SjjoBtMCL+btJbha9Yvlrh/tcT6vz8yJo0eF1
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f44.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The qapi/error.h, hw/core/sysbus.h and qemu/module.h headers are
included but not used by i2c_mux_pca954x.c. Remove them.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index c603446028..c8e75da8b2 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -15,15 +15,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
-#include "hw/core/sysbus.h"
 #include "qemu/log.h"
-#include "qemu/module.h"
 #include "qemu/queue.h"
 #include "qom/object.h"
 #include "trace.h"

-- 
2.53.0-Meta


