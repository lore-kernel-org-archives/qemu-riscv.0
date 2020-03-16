Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDupX-0000b5-7A
	for mharc-qemu-riscv@gnu.org; Mon, 16 Mar 2020 14:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDupU-0000Uw-Nm
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 14:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDupT-00053C-MK
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 14:51:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:30702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDupT-0004xm-Hq
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 14:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyRumdv7o8mjHGVNOOLf3anSbfYPjmYQMfiM+qbhAcE=;
 b=SkbS0p84WLIkN8JtdlAlBMRGakh8kTntcWfYUxxEexDppSeeW236HT7oGW7CyPx53hV3Uh
 5ZBjD8ApLMeFcdkaD32kSOnRamXtNcgqS/oYUBAdl2q0xNRFxL9P/+ev08Wl2Su1BbJ7wp
 k4Er9nhR27vwGrOqPUAzEnX2qRhjLCQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-JapZgHqqO7SYXVdpfiwQUw-1; Mon, 16 Mar 2020 14:51:07 -0400
X-MC-Unique: JapZgHqqO7SYXVdpfiwQUw-1
Received: by mail-wr1-f71.google.com with SMTP id u18so9388429wrn.11
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 11:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gL3h6ZksVMeXBRgyMt6g9kMfQEpNuOznE3swIyLz84E=;
 b=sLT3TOUljozVuKL80GpciFPTjY0And5p6ahzPp5rMhoRMBYqzP8y3zwdHeqpb1Y32v
 8RuJWdUaAn1cmh0GtgTSPa9kQdXd/P/OUEilRIE2sswckrXSOvhvtsKshpzGLkZNEsYH
 15JnXgfVpc9H3blfAfQCYVfbjKxHszeJQk1bCgz7qMvl7+1Kg+b6WVe6SW32SX0APc0H
 lmfnyQCK2ag5hVYJxivPRKtY1ep1IjYK4ODABLtPdEMbK06DBVInED9tqlEsS6Xbekco
 TfhvdqNFacnYdKXFu+ySj0221U9KbnF65ukd0z4H4kUgO4NJv2/lEYr1BQyn6bZiMVKV
 NICw==
X-Gm-Message-State: ANhLgQ08kKN2HdcxJCfafhPaxKYtsxPYD7hrl7ZzDebkny9OVsTfjMHO
 dcAWKLjroHO6EaL6pIsc9aNvEA/bbHz9A4OarE1v8Wsxt36bJAemu33GAAGXxNlQ7V/01Kv0Lcg
 UFJFoo1g/LXklJTM=
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr481677wmf.35.1584384665786; 
 Mon, 16 Mar 2020 11:51:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvNaIHGQ9I8m8ytYUjaU7litKg/SGzMQ6NhVLbSVjMAg5iQYGy3QqbxmPYWBwo64dYck+gg3g==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr481640wmf.35.1584384665537; 
 Mon, 16 Mar 2020 11:51:05 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id g7sm1105206wrq.21.2020.03.16.11.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:51:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 11/25] hw/riscv: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 16 Mar 2020 19:49:52 +0100
Message-Id: <20200316185006.576-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316185006.576-1-philmd@redhat.com>
References: <20200316185006.576-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Mon, 16 Mar 2020 18:51:13 -0000

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/riscv/sifive_e.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index a254cad489..a1974ef7be 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -208,9 +208,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
=20
     /* Flash memory */
-    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
-        memmap[SIFIVE_E_XIP].size, &error_fatal);
-    memory_region_set_readonly(&s->xip_mem, true);
+    memory_region_init_rom(&s->xip_mem, NULL, "riscv.sifive.e.xip",
+                           memmap[SIFIVE_E_XIP].size, &error_fatal);
     memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
         &s->xip_mem);
 }
--=20
2.21.1


