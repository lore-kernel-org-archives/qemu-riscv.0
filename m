Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHP-0002dv-Cp
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHI-0002Y0-Pn
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52179
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHB-0007wX-Ee
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=KhMuSdAkQJlZue+SDNBUitA5IOg2jP+W3oGcD0eDRDcoPzpgBH0wEjyF2BPCQ6emomV/ra
 5KHg+29Y43lY8+hC/iOfEhdLztrSdDRoDJg5KqMoY5CVp5N+R6HtL9LQiE++AeJSZ67ldk
 HStzzG4VzgFpASnPvxMRynGpwIhFErY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-K-oGo0_yPueDrQ2oBEObwQ-1; Sat, 04 Jul 2020 11:40:17 -0400
X-MC-Unique: K-oGo0_yPueDrQ2oBEObwQ-1
Received: by mail-wm1-f71.google.com with SMTP id t145so39828249wmt.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=RceSSSvbOlFEFiMrPetA2twJopBUKW7MX3+9jYTaloKHfHyzfxsA/5dTKPxrOVR24B
 qxDis+Oaraoq9kshUx5tPQp2vfXeLuJvIHz3GHrWODrZCK4tZAXczgb2MjVwZ7aSr0JG
 I381za2+S3rbg3OC8j9985HrHfxqe8tH5fon2df7Qw5/oRDc6JC4YbVOiJw+daTTVjpd
 PonmwR50AV32CEaMPgUgzpRnl35UQnG+PS0DGRYcuLNyowxz+xEFonf93RmoE1U6+PPb
 9SVklU2US0eKjczLQR/N563dayzZiCfKK63MZ2Ajm3VnzdxOoySyOZ588t48Zy0dRKig
 y0Zw==
X-Gm-Message-State: AOAM532Rai67uLscTVGxN6d5kqWR4JfhUF/2biytEHSPRvsV6nr/tFmH
 X/DPP2dcaNMHC0rHYi8RjVHvGcHZ1VCMuUm7Jx81Z3T6uN2HrDs7LxQzttVaz7X0FK2BZhHHmjA
 ep4rmdtOHyqq/wno=
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr44081248wrn.179.1593877216700; 
 Sat, 04 Jul 2020 08:40:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfLWq3tNY6jtdJixaHD7AoQJvqvwD5nnSHyNlkJG1VDMwXJ0YClqmsYsEN3jTKVungM+ZcUQ==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr44081217wrn.179.1593877216543; 
 Sat, 04 Jul 2020 08:40:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id a123sm8262680wmd.28.2020.07.04.08.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:16 -0700 (PDT)
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
Subject: [RFC PATCH v2 12/23] hw/dma/soc_dma: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:57 +0200
Message-Id: <20200704153908.12118-13-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:37 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/soc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 3a430057f5..22fd8c38b0 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
+#include "hw/qdev-deprecated.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
@@ -242,6 +243,8 @@ struct soc_dma_s *soc_dma_init(int n)
     int i;
     struct dma_s *s = g_malloc0(sizeof(*s) + n * sizeof(*s->ch));
 
+    qdev_warn_deprecated_function_used();
+
     s->chnum = n;
     s->soc.ch = s->ch;
     for (i = 0; i < n; i ++) {
-- 
2.21.3


