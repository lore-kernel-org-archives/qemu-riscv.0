Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEu-0007CI-V5
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEk-00079n-NC
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56206
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEi-0007wX-F7
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
 b=RbmYIE+F+ytFvpDhqV9blQEwpn/6DiIdKII8KKQL9CY193euKLY5FUr2asU/FB9c4q9lGG
 crs7fTZZ0WK7r66UINoRSgsMth6+KoPP7vOEaHwDoIyn2ea+IMTpvfKzjKStKruhlV0OrG
 L16Q3LaVcakBgZV3pbXFER3lGjHlhPk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-kSh1fKamMNiCcHuAK84jrA-1; Mon, 08 Jun 2020 12:02:49 -0400
X-MC-Unique: kSh1fKamMNiCcHuAK84jrA-1
Received: by mail-wr1-f71.google.com with SMTP id z10so7391897wrs.2
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
 b=KSTXa90JFHp6a/FnFfR1TMIz7j/JC0hXlVsGfNWcIJAa7Ye8uXXIRsXYcMVU3BGU6G
 Ljj4mzeWQZo0G2NPBzX3wLI3X/lU+OLvsh/ORkR4OqsotOdmj1+clzxt0tQE228C5JZf
 tcgwPtz7A/YO0RRqQq+X4zUvm7v0Crad+j0QspODYeWw6iTRlOGZCBqFrdFwO/vaGEZB
 ZL7HyULiE1QBSSxolpT1BrGD1wkK2dBcsN+HHKX9kN1ZOqe5fONtND2LXJZoExYaQ7ra
 lJjJwqykf81Y4PIFvKsYN0dkweuRy874jl4pSvAaVpsPQqJHVFv/NM8CAn5+/MSIFbap
 z0Hg==
X-Gm-Message-State: AOAM533XKDBjU6AxMeoT0ak1173QMyZPzfPBunzTEPWS4WLbDxrTUiR1
 U6nRE+UYrT3ViZRBfl+KX0hbe0EK6/knX1wiJorri+f48VsPBYDzVkUx+DpA27BgP9FvQLeBYSu
 uDzDl0SVxXJwe79g=
X-Received: by 2002:adf:cf06:: with SMTP id o6mr23925402wrj.163.1591632168115; 
 Mon, 08 Jun 2020 09:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl0bue+F9URFV2MLoWaC0ni3jZ25V2PPkWtrtnwtHvWPF3nP5GuuAiBdquATZ2VeeHOXjWiw==
X-Received: by 2002:adf:cf06:: with SMTP id o6mr23925378wrj.163.1591632167963; 
 Mon, 08 Jun 2020 09:02:47 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z16sm155794wrm.70.2020.06.08.09.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:47 -0700 (PDT)
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
Subject: [RFC PATCH 21/35] hw/lm32/lm32_hwsetup: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:30 +0200
Message-Id: <20200608160044.15531-22-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:59 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/lm32/lm32_hwsetup.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index de94de177a..f4a4d8fe4b 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -27,6 +27,7 @@
 
 #include "qemu/cutils.h"
 #include "hw/loader.h"
+#include "hw/qdev-deprecated.h"
 
 typedef struct {
     void *data;
@@ -57,6 +58,8 @@ static inline HWSetup *hwsetup_init(void)
 {
     HWSetup *hw;
 
+    qdev_warn_deprecated_function_used();
+
     hw = g_malloc(sizeof(HWSetup));
     hw->data = g_malloc0(TARGET_PAGE_SIZE);
     hw->ptr = hw->data;
-- 
2.21.3


