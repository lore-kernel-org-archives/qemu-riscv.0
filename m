Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o2JTq-0003QK-E7
	for mharc-qemu-riscv@gnu.org; Fri, 17 Jun 2022 17:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1o2JTo-0003Q7-Mc
 for qemu-riscv@nongnu.org; Fri, 17 Jun 2022 17:26:12 -0400
Received: from sender-of-o50.zoho.in ([103.117.158.50]:2172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1o2JTm-0004Ye-Hu
 for qemu-riscv@nongnu.org; Fri, 17 Jun 2022 17:26:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1655501159; cv=none; d=zohomail.in; s=zohoarc; 
 b=IEjBrPIes3HmGSQagSWxktPTIsIx8vnGXwRn2cLnKCrrylN5zYHCkahR1xWWnibM4QeX66E9+TUo2ALke9oLhQ6nb0+Zbqh8OutT0GxtwBpW5tWZaRdgY3ONM+vp906ZSg1F7eidt8ydg5ODoqotDgYPsp/u3S/XucBc94uqWa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1655501159;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=eqVyuoHMEJ2/QUN89WYYMjbOJOv3gRFbSc08yfsuU90=; 
 b=DYMfRI0SqU/SEhB3DfNBwlCENHqONYF9DpJcZDzgr+6ghb2Gn7kXB4fCWqa9JMFL7dse3mVuURS+OI/8DNS3Xset9Bvditn5n/Q6AVMRQmkLt9ZCxD9jXMPwXB5q5PsAH7w/Gzv+QnrAyed2pKgMAh4/kiE6+PIMutaGho/0gig=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1655501159; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=eqVyuoHMEJ2/QUN89WYYMjbOJOv3gRFbSc08yfsuU90=;
 b=ITkcd6qQTAKeuEl3z2ID/kovtpvYLslsoBKPUzJW556OOD4QKmEBgQioOwq7DzGB
 oydIyUv23ghcf71YnVQ3hwg6FywxjtulS2oSgizly1ZblJqwfmEVNBnvnFU/z2nH3xy
 nRr0oPSctudoPHaoOvVd8l++LTDP3z2MKLQvsbSk=
Received: from localhost.localdomain (49.207.195.97 [49.207.195.97]) by
 mx.zoho.in with SMTPS id 1655501157940266.5996757223719;
 Sat, 18 Jun 2022 02:55:57 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Cc: Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20220617212542.59196-1-vijai@behindbytes.com>
Subject: [PATCH] include/hw/char: QOMify shakti_uart
Date: Sat, 18 Jun 2022 02:55:42 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.50;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o50.zoho.in
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2022 21:26:12 -0000

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 include/hw/char/shakti_uart.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index 526c408233..2c305562e7 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -27,6 +27,7 @@
=20
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
=20
 #define SHAKTI_UART_BAUD        0x00
 #define SHAKTI_UART_TX          0x04
@@ -48,10 +49,9 @@
 #define SHAKTI_UART_CONTROL_DEFAULT 0x0100
=20
 #define TYPE_SHAKTI_UART "shakti-uart"
-#define SHAKTI_UART(obj) \
-    OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(ShaktiUartState, SHAKTI_UART)
=20
-typedef struct {
+struct ShaktiUartState {
     /* <private> */
     SysBusDevice parent_obj;
=20
@@ -69,6 +69,6 @@ typedef struct {
     uint32_t uart_rx_threshold;
=20
     CharBackend chr;
-} ShaktiUartState;
+};
=20
 #endif /* HW_SHAKTI_UART_H */
--=20
2.25.1



