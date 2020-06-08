Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFX-0007jT-NN
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFW-0007iH-OW
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50125
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFV-0008DG-Qx
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kyMhVQ9HQhJiyo6QGAHK03lmBlbuIzucxY+SHtzpks=;
 b=Mx14a3r1+3sciBy/CW+SYkx3qWaGzdlBnmbxJt41uTfhxY/Dsaj0sxUc/zTE4fO2DIgmLR
 ZDiEUCf+71agYa12N2yhShG/Eol+BpdQ910nG9FyYI7KqY+htokpOP46tD9SHARsq9rFHR
 7TRA+XC1jp3xykucCQvgsn0fIsn+lKA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-5zc3Q_XXMmW0kB7EyNyfVg-1; Mon, 08 Jun 2020 12:03:43 -0400
X-MC-Unique: 5zc3Q_XXMmW0kB7EyNyfVg-1
Received: by mail-wr1-f72.google.com with SMTP id e7so7387805wrp.14
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kyMhVQ9HQhJiyo6QGAHK03lmBlbuIzucxY+SHtzpks=;
 b=rVCI5q+rBOMWoKTb5+Alx9LMZ+RuVND8ukb7ULe9cRVA/3N7BX1dMWHidNrhDhsIVg
 P4Svw2H9IS5wh0fOu1le7yx1lNKbzyjonLsYCXFxrxRT7cdllwsUooaAMX0XYYdtQQK8
 VIE3qrwzVwH/4td1izo7lOaGDqao22R0xzCTktiTz5wkV6vN9exSmnQwDQ1FDMhSTZdb
 UeMKxmeJAty3RjWCCT/J0cdOeRmhBabETdIe/C5Mjy2pyU6OLR+EGtdbZef0JbEdt7f5
 8/1vZVk0ig97uTd0mmzlAi77aSM0TnJ+QHlvztpe01Noo+IYpz6KusqJgXuZk8k+d/lq
 HhjA==
X-Gm-Message-State: AOAM530+T4ov5f0MGfCkxk93hciir22+veSjqxo0V4TcSYD8iKoVvzvJ
 9h7KMXvKmm2Sdk6MbMPVVI/eqNKJAzCgvdtxRc0OCmw8ByuSzqVywgcoXKEQzVvkJrXw8hICGvm
 z9C++JhlHKeByWBg=
X-Received: by 2002:a5d:6087:: with SMTP id w7mr26621412wrt.158.1591632221505; 
 Mon, 08 Jun 2020 09:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEzYn7IfaprZ27/xV2VCZHXx76WBbSnolmOS6yBDnvZe3b82K5DvPVvnhVs7yLdMTrFxNPeQ==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr26621373wrt.158.1591632221329; 
 Mon, 08 Jun 2020 09:03:41 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o82sm8088wmo.40.2020.06.08.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 30/35] hw/ppc/virtex_ml507: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:39 +0200
Message-Id: <20200608160044.15531-31-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:47 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/virtex_ml507.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 0dacfcd236..17b8036c38 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -40,7 +40,7 @@
 #include "qemu/log.h"
 #include "qemu/option.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
@@ -95,6 +95,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
     CPUPPCState *env;
     qemu_irq *irqs;
 
+    qdev_warn_deprecated_function_used();
+
     cpu = POWERPC_CPU(cpu_create(cpu_type));
     env = &cpu->env;
 
-- 
2.21.3


