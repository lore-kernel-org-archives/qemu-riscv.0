Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2hl-0005E9-G8
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ha-0005BD-Hf
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hX-0005lY-7j
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kj6LlpYEBQqdR9FwoSkyHmihGdt25q73/5GxAYqyAUU=;
 b=Jz2Tid1io9jxsgBLIt0zsIWPT8BBcpT38Gn8IgqwkIr3yPBHx97DuAOqak3VgwAEkJThh6
 B3EIADQRwdwoitu+H359d0u8FZ1kJoEcP2HsrWmSM7YR8+wELZFgmTVXR/SZXaW4RQOFxy
 SVReCqRs7Ms4rWQXGcgGi+qUaJYIO9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-RISZKiG8O1CaodTctAuQpg-1; Tue, 31 Aug 2021 08:17:13 -0400
X-MC-Unique: RISZKiG8O1CaodTctAuQpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AD3F92500;
 Tue, 31 Aug 2021 12:17:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC23E226E9;
 Tue, 31 Aug 2021 12:16:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82B5B1800992; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 09/29] tcg/module: add tcg-module.[ch] infrastructure
Date: Tue, 31 Aug 2021 14:15:25 +0200
Message-Id: <20210831121545.2874233-10-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Aug 2021 12:17:21 -0000

Add TCGModuleOps struct, empty for now, followup patches will fill it.
This struct has pointers for tcg functions which are called by core
qemu.

The struct is initialized (at compile time) with pointers to stub
functions.  When the tcg module loads it will update the function
pointers to point to the real functions instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module.h | 8 ++++++++
 accel/tcg/tcg-module.c   | 5 +++++
 accel/tcg/meson.build    | 4 ++++
 3 files changed, 17 insertions(+)
 create mode 100644 include/tcg/tcg-module.h
 create mode 100644 accel/tcg/tcg-module.c

diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
new file mode 100644
index 000000000000..7e87aecb2357
--- /dev/null
+++ b/include/tcg/tcg-module.h
@@ -0,0 +1,8 @@
+#ifndef TCG_MODULE_H
+#define TCG_MODULE_H
+
+struct TCGModuleOps {
+};
+extern struct TCGModuleOps tcg;
+
+#endif /* TCG_MODULE_H */
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
new file mode 100644
index 000000000000..e864fb20c141
--- /dev/null
+++ b/accel/tcg/tcg-module.c
@@ -0,0 +1,5 @@
+#include "qemu/osdep.h"
+#include "tcg/tcg-module.h"
+
+struct TCGModuleOps tcg = {
+};
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index ec74e17a8285..93cbbf9f3926 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,3 +1,7 @@
+specific_ss.add(files(
+  'tcg-module.c',
+))
+
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cpu-exec-common.c',
 ))
-- 
2.31.1


