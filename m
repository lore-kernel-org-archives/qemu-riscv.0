Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mC78I-0007cd-JW
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 17:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78G-0007Y6-QM
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78F-0003qS-7g
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8xKfaOtV5YirFJnawF8BSMsjQ2Cw5AAkSNjpNee/go=;
 b=HAPk2yBwH7trgw4LEWUZrJrPVokMW5HF68C3VdkpYPZ/tV1yQ+/yxzBu4y4Y9DVFlBZ1g1
 Zclg5vvdsAAqxXDAvDrQCkv2xg5jeeCy1buJe6DFZN8xe3ID0J0ZEJydagVLze8I5zDe0G
 j11crkVHRb29SYtkY6hFiOVqa0i9QsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-KmFyneedNCSGqwvltEhAJA-1; Fri, 06 Aug 2021 17:11:51 -0400
X-MC-Unique: KmFyneedNCSGqwvltEhAJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADA4760C5;
 Fri,  6 Aug 2021 21:11:49 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F70A5C1A3;
 Fri,  6 Aug 2021 21:11:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Vijai Kumar K <vijai@behindbytes.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH for-6.2 04/12] [automated] Add struct names to typedefs used
 by QOM types
Date: Fri,  6 Aug 2021 17:11:19 -0400
Message-Id: <20210806211127.646908-5-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 06 Aug 2021 21:11:57 -0000

Anonymous structs on QOM typedefs make the code harder to convert
to OBJECT_DEFINE* macros, as the macros expect the struct name to
exist.

Use a codeconverter rule to automatically add names to the
structs used in QOM typedefs.

Generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=AddNamesToTypedefs $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Vijai Kumar K <vijai@behindbytes.com>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
---
 include/hw/adc/npcm7xx_adc.h            | 2 +-
 include/hw/char/shakti_uart.h           | 2 +-
 include/hw/tricore/tricore_testdevice.h | 2 +-
 chardev/char-parallel.c                 | 4 ++--
 hw/m68k/mcf5206.c                       | 2 +-
 hw/misc/sbsa_ec.c                       | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index 7d8442107ae..8e5a1897b4b 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -42,7 +42,7 @@
  * @iref: The internal reference voltage, initialized at launch time.
  * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.
  */
-typedef struct {
+typedef struct NPCM7xxADCState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index 526c408233f..25f7cbcaa55 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -51,7 +51,7 @@
 #define SHAKTI_UART(obj) \
     OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
 
-typedef struct {
+typedef struct ShaktiUartState {
     /* <private> */
     SysBusDevice parent_obj;
 
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 2c56c51bcb8..e93c883872d 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -26,7 +26,7 @@
 #define TRICORE_TESTDEVICE(obj) \
     OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
 
-typedef struct {
+typedef struct TriCoreTestDeviceState {
     /* <private> */
     SysBusDevice parent_obj;
 
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 05e7efbd6ca..acf9fb8afa0 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -49,7 +49,7 @@
 
 #if defined(__linux__)
 
-typedef struct {
+typedef struct ParallelChardev {
     Chardev parent;
     int fd;
     int mode;
@@ -177,7 +177,7 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
 
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
 
-typedef struct {
+typedef struct ParallelChardev {
     Chardev parent;
     int fd;
 } ParallelChardev;
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 6d93d761a5e..72a815dbbd0 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -160,7 +160,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 
 /* System Integration Module.  */
 
-typedef struct {
+typedef struct m5206_mbar_state {
     SysBusDevice parent_obj;
 
     M68kCPU *cpu;
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 83020fe9ac9..9e3c40a23dc 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -16,7 +16,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/runstate.h"
 
-typedef struct {
+typedef struct SECUREECState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 } SECUREECState;
-- 
2.31.1


