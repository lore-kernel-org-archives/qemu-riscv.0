Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDE-00068M-CZ
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCx-00060A-Fs
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33071
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCt-0007Rj-H7
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
 b=cDcUjz9SDc+O5KcNdlJ5/YMdGHem6EyimH6hybVCRfm2zvEofSNu0aFCKvBmVc1rm2LTe8
 Kq0ycRhwepuGgqsia+xxBnfXb0kBNkm1MdE+dq6i4LUy94m62J5G6+337pw5IJnVEmSGjp
 eet1C3ncp3M7YGCDLsSCcA4dbPVpWaE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-D1RL3NUOPlu23KYAFwGA8w-1; Mon, 08 Jun 2020 12:00:55 -0400
X-MC-Unique: D1RL3NUOPlu23KYAFwGA8w-1
Received: by mail-wr1-f69.google.com with SMTP id o1so7297309wrm.17
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
 b=JDDKAZZQPZfaewQbHF0GT+WMiUeyBc95f5SVGwq4VEQsYE28/59FEaBlqIKTUMGr9q
 D8mm4n33WhF9B++B2EeCk2XFtLTKAWsXU03Ary7NHt9B3VNFsdwRrOq+9kUWktkkrEu0
 Yn91iixMfzy6ML8nf1Qgj9y3OoHrgVr6UqvznEzw977Ivc9tNuuuTJBHau68nUHPTmMd
 q9e+c0OoH1zIGis9F2631CyQpOXih65xwnsE+znrQ67WSkzAmULElAjxTnlVIen84lV5
 hc62Uc/Hfc2E1jipk7k6bJC9Yzfsyk4t0xBejT9MO3WF/evWAaNs1vOISIc9lb/YxP5G
 v0ww==
X-Gm-Message-State: AOAM533Ggy9FVkV7fblK+v9tRwv1GRVDzBEzPof7MBDNV0/zrY1lby6S
 1haV0yP5LBz5/Y0oz3Id+AJYaO4g1QMp42/FNIltXCJYS7UcOOnyJaeB/buCicrDj50Kfz7sbdr
 VBE5nQ+/m9GTDqRk=
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr48584wme.152.1591632053831; 
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziyL5raG4PwAXzO4TG14Cp0iz1q12d2PaRjnoEeXVkhA3kNQMidurFs0yP2smspC0uLUhA1g==
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr48526wme.152.1591632053569; 
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id w10sm187197wrp.16.2020.06.08.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
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
Subject: [RFC PATCH 01/35] qom/object: Update documentation
Date: Mon,  8 Jun 2020 18:00:10 +0200
Message-Id: <20200608160044.15531-2-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:11 -0000

The documentation was introduced in 2f28d2ff9dc, then
0d09e41a51 and a27bd6c77 moved the headers around.
Update the comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index fd453dc8d6..eb560bf32f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -45,7 +45,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Creating a minimal type</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * #define TYPE_MY_DEVICE "my-device"
  *
@@ -146,7 +146,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Overriding a virtual function</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * void my_device_class_init(ObjectClass *klass, void *class_data)
  * {
@@ -170,7 +170,7 @@ typedef struct InterfaceInfo InterfaceInfo;
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


