Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHQ-0002h6-O2
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHO-0002bC-1N
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55691
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHG-0007yy-T4
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=avIMi6Pq8r0LZwQbB+qMcB37grQ5bYVvr+Wb/bOp8j6W8vywSNEYt9P2B0lzBCG2a6sSum
 Qh8IyYiBpA0PAdDaUJfDW2xzg9CUts4CYX4lRFgTIjxCmAr9Lege1KEYwhpcZiOxpibRmm
 WXqPZvdvNL4cx7s365jpnQvnIo/cvA0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106--2oC6TiMO4unL8GEvozMjw-1; Sat, 04 Jul 2020 11:40:28 -0400
X-MC-Unique: -2oC6TiMO4unL8GEvozMjw-1
Received: by mail-wm1-f71.google.com with SMTP id e15so39656221wme.8
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=T8UWPJMZ0QVzlz44NAwnOeI3MfBT6T3iSkxW2R0QDsDBN1QHm4mqiZAp2l2BTBLnoL
 xD7xrTEfsYxFYZsQl1SfJMzhdA1lnCjgSu7SJI/U8xkBrgfN3rJGSzzcNIkV/S9Y98zI
 bIWvWXSjOFoz1K5gteWfUy+bdS16VgbYFZK6LqxHtrkEzrgA90DWIfapgIcoDFMtlldt
 ncPdaC5i7b6+jWLNnVp6Umo2bOP1/c3M3cH2NG5HslW8ISJi57XUXl+cbSgq9wqgGDlD
 aXH885eI/hfpEeOBVhThMZo1bgW+mN+VVn10zkf/qfK0pGbu7sYEau6ltsQlcYS91zys
 lEgA==
X-Gm-Message-State: AOAM530dqEO2ym00TUmDs7Wa6mjCcCd64SvKEQPjIqV3jJeyaAVFr5NZ
 FJER1Z3h/d/oYAti2Y1KUvVqipA8gBItO1/gyOEInX9r7X2iYwZ1Q3IcOMCuIlSGTTv+Pf71QlE
 n6WtyjiLuo2zgX/0=
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr40903225wme.171.1593877227429; 
 Sat, 04 Jul 2020 08:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfj1AMaSc/tfso0a5RcVERV+07uEo2g4y1YxaMNSpNhNlT5T9RctIQ93Xb55zNHLo3jYCAHg==
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr40903210wme.171.1593877227296; 
 Sat, 04 Jul 2020 08:40:27 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j6sm17362141wma.25.2020.07.04.08.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:26 -0700 (PDT)
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
Subject: [RFC PATCH v2 14/23] hw/input/tsc2005: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:59 +0200
Message-Id: <20200704153908.12118-15-philmd@redhat.com>
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:38 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/tsc2005.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 55d61cc843..1f97b82379 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
 
@@ -489,6 +490,8 @@ void *tsc2005_init(qemu_irq pintdav)
 {
     TSC2005State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (TSC2005State *)
             g_malloc0(sizeof(TSC2005State));
     s->x = 400;
-- 
2.21.3


