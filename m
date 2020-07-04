Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkI6-0003oA-QV
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkI5-0003l8-Q1
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57744
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkI2-0008QB-UH
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGhDjSAMTvyc0GtSLCXSdOThvesECzDKYGUhUFBvKxM=;
 b=K0piscV5xQirRkf1GoFlPaLx9r5CJtcRIhCXVBoUlQJVOp0VsNai+2jscuNrxwouR+iMpg
 yX70bGM3cnuoXij52Q///XDic0SKzYpS5izPqsh/HtaQYE4lKET0UxbKk9TsA1e598bUff
 /btGFIHkyjLDSEXkqkldd8WcBzVCYKM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-R1bHPmUcM3a1iwoVQhvnbg-1; Sat, 04 Jul 2020 11:41:16 -0400
X-MC-Unique: R1bHPmUcM3a1iwoVQhvnbg-1
Received: by mail-wr1-f70.google.com with SMTP id d11so18516222wrw.12
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGhDjSAMTvyc0GtSLCXSdOThvesECzDKYGUhUFBvKxM=;
 b=ftUFODxWT0I6nv3WHxHCrrhzROSKrX4NSwarysBTJyctXd3XE1yEUMNqBn210t25xx
 MhcpLQe0V/DnuRDVkxuyG2GG46s/vRSZG0e1IyIt9jgmy54Rjdlb0lILAtpoOjDheubz
 XeUzMpcCgnYFGYtRaO1oyIOA1keRovHgpQ3TEctq6J6hrwfX+qtHjk+xz+zh9bIMz2tu
 QNvfX6lFyMXjHEhirGJUmuS+D/8Iv3p3AWlnhx/eH7RKZNyetfB369M0TCnSM8PVycgX
 nZW5Pg8akA9v0falFtIhox31dnfcRxz7MQcXN8dM/UXt5lkLfedHivhjdTvxPvnOFzfy
 1qrw==
X-Gm-Message-State: AOAM5305m9ueV9XHTMG6RHXinsYo4GJelCPkJu/AQcVJ7YHjhOiOl8Qc
 7cIJbO66vWK0igIvk1WR+6V2gEAMxNeFV3Sx02r5rMkW5L6hpfsOFB96jMADecDsSbrdi6wOlfv
 A9H0XOV6pJ6+lorY=
X-Received: by 2002:adf:db42:: with SMTP id f2mr40958774wrj.298.1593877275713; 
 Sat, 04 Jul 2020 08:41:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbE+aGDDMtvEhXpYLDyFkAKKq00ppivJij+CelWbeyfYysOcMWRUnfSqrisfL1wBnQD5WFVw==
X-Received: by 2002:adf:db42:: with SMTP id f2mr40958741wrj.298.1593877275481; 
 Sat, 04 Jul 2020 08:41:15 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j6sm17363975wma.25.2020.07.04.08.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:41:14 -0700 (PDT)
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
Subject: [RFC PATCH v2 23/23] hw/xtensa/xtfpga: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:39:08 +0200
Message-Id: <20200704153908.12118-24-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
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
X-List-Received-Date: Sat, 04 Jul 2020 15:41:22 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/xtensa/xtfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 10de15855a..ddb843e6e8 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -50,6 +50,7 @@
 #include "xtensa_memory.h"
 #include "hw/xtensa/mx_pic.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-deprecated.h"
 
 typedef struct XtfpgaFlashDesc {
     hwaddr base;
@@ -129,6 +130,8 @@ static XtfpgaFpgaState *xtfpga_fpga_init(MemoryRegion *address_space,
 {
     XtfpgaFpgaState *s = g_malloc(sizeof(XtfpgaFpgaState));
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &xtfpga_fpga_ops, s,
                           "xtfpga.fpga", 0x10000);
     memory_region_add_subregion(address_space, base, &s->iomem);
-- 
2.21.3


