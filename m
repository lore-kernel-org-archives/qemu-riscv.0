Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGC-0000jS-Lp
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGA-0000eo-44
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37042
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkG8-0007Sk-Fy
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4VxXE4SCiQENXjR0p5gMwHzmkYsDqhVYN6kqXLwme2s=;
 b=YYnKr/qu2kH9iXo0p24Xm76SS4Xw1s0Ouu6P7PnrvKZFPw41Cur7WihjlBU/rSyr01JS/A
 1CtBzf09y8GLA9nOBSURl5pGeqUXPQaRy/MeV3CS+N+6Wv1W6+uGeRR9PYsKJGDgtViiP8
 NmMJhXmCKzecJJnZ+xEpPCCLV4fRJQg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-sa7z3GXrNhm3VNjms17zcA-1; Sat, 04 Jul 2020 11:39:18 -0400
X-MC-Unique: sa7z3GXrNhm3VNjms17zcA-1
Received: by mail-wr1-f70.google.com with SMTP id f5so35780656wrv.22
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VxXE4SCiQENXjR0p5gMwHzmkYsDqhVYN6kqXLwme2s=;
 b=ZskS4uYjcupG4y7SvNCa2Mz9qnx3E7HTBCWxd+3QZcHYTnI3QHtVxTZ2c9uEPRhWYO
 D/RYKlYj3hZ6FUEhLpZl7zyKxxUjZvI+L6pNsURcrbacw2CNccRZpz3JrZCX/nmHOy1h
 yeKy0fZHpBAjuV1GKE+xfL221kBjrmh3/sAbIlq97SSgCTVnDg6VP76Ya568YQqBI3jh
 T8FZ29RJNiregjah/yWEi+gG0dnyOAOSK5ufpi2vZEbnvn59cLaPndOJKoFSHLJIPsZG
 Qzt9Aa8kfJIN6v7QIUXz1cegGI0H4GTeCRb1QGgrR54fAvP1BF8iaZavPCTh+b3tytyw
 kaOA==
X-Gm-Message-State: AOAM530cVmcG38zvgInAU31yv6DbnGJV8teYjK6ZmtIfvJ9zpq4MfoYx
 aJza+Ld0irfOLwAk3bLSbi2en+TlX0GaY0i1VYe5rYMl34PNrXxjzXXL1lPJUip1G0k0cyHQsHk
 OI7eAr0tVtfHMyxk=
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr41861938wmg.93.1593877157271; 
 Sat, 04 Jul 2020 08:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBJo4FUom82vRU8/5mP45VfvlfhObz1DhaGdrkvZdmWsyz2BGimXVJAaF2JPT0rdOWUhT2Jg==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr41861890wmg.93.1593877156946; 
 Sat, 04 Jul 2020 08:39:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id m10sm17446986wru.4.2020.07.04.08.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:16 -0700 (PDT)
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
Subject: [PATCH v2 01/23] qom/object: Update documentation
Date: Sat,  4 Jul 2020 17:38:46 +0200
Message-Id: <20200704153908.12118-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
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
X-List-Received-Date: Sat, 04 Jul 2020 15:39:22 -0000

The documentation was introduced in 2f28d2ff9dc, then
0d09e41a51 and a27bd6c77 moved the headers around.
Update the comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 94a61ccc3f..03dcd3623e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -43,7 +43,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Creating a minimal type</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * #define TYPE_MY_DEVICE "my-device"
  *
@@ -144,7 +144,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Overriding a virtual function</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * void my_device_class_init(ObjectClass *klass, void *class_data)
  * {
@@ -168,7 +168,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Defining an abstract class</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * typedef struct MyDeviceClass
  * {
-- 
2.21.3


