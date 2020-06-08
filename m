Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKG8-0008Ee-3D
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFz-0008AM-HJ
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29855
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFy-0008Ht-Ay
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
 b=NRSLs2IUvu+sMbOvrfgRaHiTDhLkqxNmbMSggfvOc4/le0zXtA8cTYmwEJOyjw9yvzFa3+
 E5QguSuNOVIDv+i7if2R+Iu0qtxh0lY8exsgSLA7ne4pskYd7+PkvjPI2IUcCq8ID7aew2
 mgaDEj0bfopy2fa0IIYmW/vHviXhAzQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-2qQ9_31DOei7yKb2siA4XQ-1; Mon, 08 Jun 2020 12:04:11 -0400
X-MC-Unique: 2qQ9_31DOei7yKb2siA4XQ-1
Received: by mail-wm1-f71.google.com with SMTP id j128so8743wmj.6
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
 b=jLwJeJAJYOlSMZlzVyL6VW1mKijc90fjCjVH1YkIAdZfnTLQJkVZT3TSrIaSFgZm1a
 Psc0rVR384eSJct0nnhMVJaHbd0yg5tsEg9K7XxKPGZCFcnBwl37CgOB5cw52Rlktetj
 Pl+KSReI71S2TacVMHKbJS0UAeBAUcVlk3PIq7mFdiaRgEA8l93+uEoGLnFEVq43sfVu
 j4XQlJoIHQoCAG7Yvg/xceryeXEVnihNaGF2Z+8wADWzUJ6sNCNC6dPA1Ac09brk3S1y
 gs/B4ZDrVxMMfsZHDxPQC2sWoIJ9Fh97cykAo+VIVsJiJK76CEs+HHv2dPNUJpTWeIkF
 vUzA==
X-Gm-Message-State: AOAM533FDf9StB1xkJAjTm6cEWGXlLr9Bcm1Gl44n+AJzK1XPhTr3kj0
 aQWfin8mTvDKUZdVexByx80R0Of/ESpd6dEmpx9QuClIotvHfXBhGT6XRHUn+et0Fymve53VZkM
 8NIj0fVIgKZvoNlU=
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr28997wmf.141.1591632250053;
 Mon, 08 Jun 2020 09:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwleTjEs6m/0F9WTXFTKcyesoS9BhM/fhVRhaP0ZaaZMgPHfTC+huUmGRS6bDSqa1xeeej4Q==
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr28952wmf.141.1591632249790;
 Mon, 08 Jun 2020 09:04:09 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j16sm243025wre.21.2020.06.08.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:04:09 -0700 (PDT)
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
Subject: [RFC PATCH 35/35] hw/xtensa/xtfpga: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:44 +0200
Message-Id: <20200608160044.15531-36-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:04:17 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/xtensa/xtfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 60ccc74f5f..a3c82dc81a 100644
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


