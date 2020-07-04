Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHk-00030E-3E
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHf-0002wp-Qe
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22334
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHc-0008Lb-7Z
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=C+0+lVevzuflUkvkxTkdlMTu2sHyyPnJ9UKndOF54gX/87wZJi+QTocNY2MpWcCPaYTL2y
 aBUGWpxBx0V5QNsv2x9dPlqwlwNkYyuVl2Y34xcEbhIf3F6pKEGwsmW+4hueOsom6tgJHw
 kBFE3NmU3Vetq+MPaqq3b1JHERNfchg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-1HKlaeK5PTWsiBiZ89neUw-1; Sat, 04 Jul 2020 11:40:50 -0400
X-MC-Unique: 1HKlaeK5PTWsiBiZ89neUw-1
Received: by mail-wr1-f71.google.com with SMTP id b8so21936025wro.19
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=OKllFQvCjid2PJIXKUQORJ02xrmPI/XC+yaanM0dmhs6EsjpICmwOS/ENzik3x85t/
 ytk0ZwnF1VSvxqybnP0eo2QgsAGDzxvvQio0wIkNP7oEWAt1xzyYYtNmXB29v3o0SOHt
 lzZMWmIJBB3Zxq0AJUP05HRD3dY6eSr9ZUxMOY0LZR3Uuo0TFNvzEGBWyJ1oZDm1TB99
 wx4dT5EAnp7eCEy8arpDBFkL1NxSiO+JqrKrD3QYUSM3hiMJBZQ7mtBR0jnjpFdQDQ8D
 clddNFM+MNJAhj4J3rAUALIB/q2F7Z1KcMhAnUoJrEtwXtBDsFbmDC+AbsdC99wwAmTv
 vhPQ==
X-Gm-Message-State: AOAM5327GH1glDlFpK4YGaYTNjM7Ue3HywzL3/bJzMcA0Qbhau2fjAUu
 O5wfX+WKBcN2AQcQXAAcdmDVPukPhw4n7TGSMbBXEBH/NeZC3K9epTbNop402iZ3hx+muoJkJST
 6bBIYc1NjSjv4+gE=
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr33895133wme.177.1593877248834; 
 Sat, 04 Jul 2020 08:40:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy89N5TpEiyPKwLtUEcDXIcvq4MVNBDKbqzh2H2kJGTopV9XvgksQGJaWu/AQIgivBZ+270XA==
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr33895118wme.177.1593877248705; 
 Sat, 04 Jul 2020 08:40:48 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v3sm17434678wrq.57.2020.07.04.08.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:48 -0700 (PDT)
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
Subject: [RFC PATCH v2 18/23] hw/openrisc/cputimer: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:39:03 +0200
Message-Id: <20200704153908.12118-19-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:56 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/openrisc/cputimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..60f2c9667f 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
 
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
+    qdev_warn_deprecated_function_used();
+
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
     cpu->env.ttmr = 0x00000000;
 
-- 
2.21.3


