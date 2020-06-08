Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFq-00086n-OH
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFp-000853-Of
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33498
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFp-0008H5-1R
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
 b=Av8TYAI51f0lVCJkG1lxpEAUiWXFYwuS466ftH0je9/DcrqjHm6sJCPvjnfmh40fn2owc9
 oTDxJ5LmohazEDRbQtdbr9JZOLEsUdji3VCTR0I0amvOkh7zy5JBFGr3qRH8+RfEr6emC5
 Gl2iEnq/0emd+BPnxZ+ni/mwG2GtKws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-HX2D77QOMg2eRhzKimrFQw-1; Mon, 08 Jun 2020 12:04:03 -0400
X-MC-Unique: HX2D77QOMg2eRhzKimrFQw-1
Received: by mail-wm1-f70.google.com with SMTP id 11so7266wmj.6
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
 b=aRMewbIUKQPH8cjElveYo6FWIqRQsx4ZSnX1AEnCaL+T8xaRN/s51vWY35IOmVpjKY
 A+gW1SaH30QdBpTlU2eCMXDzsJcS6LYDPso54Bin6AjWvcWkohowFdlem8JLFq/FPkg1
 vbUIcaI+agEc3xWlvSEkO3eSzvbPELdxg3B0qLhxXHXJKnYPVd+p+J7sDqQgmKgv5Avw
 oMlJtpmi92yiarLk7gJG11nNZsJxNMHiLgCRzUWsXXlJ8DbsvM1FNakGLUWAMRwrClHZ
 a3cZhgU/QhnjKvWC9CxEvTt7/GMntT93Hj7hDdDTfk0U6Cp7kA75sk3Pp9iDJuTdb7Lv
 JduA==
X-Gm-Message-State: AOAM5338BZDaub+zTzu3vnU7yTjfxLqBqJ7r3hr/t95LGLhGiUhcaOzm
 LM8fhRC1Oq1cgufGv2uidcWaB8DqwIE/itgknusjYou9tfw8UgW39n4i4ADdIOuirs/T7qv40z9
 Lpz3FRvTHKe9jdro=
X-Received: by 2002:a1c:2082:: with SMTP id g124mr55784wmg.21.1591632239008;
 Mon, 08 Jun 2020 09:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Ea3200SCtYHheH/UK2Mas0Wr6/SnNtzGrclQZuKXFOcXxL+qpSERI07OhtEH9rZ1aPQhvQ==
X-Received: by 2002:a1c:2082:: with SMTP id g124mr55753wmg.21.1591632238819;
 Mon, 08 Jun 2020 09:03:58 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h188sm48452wmh.2.2020.06.08.09.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:58 -0700 (PDT)
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
Subject: [RFC PATCH 33/35] hw/timer/slavio_timer: Emit warning when old code
 is used
Date: Mon,  8 Jun 2020 18:00:42 +0200
Message-Id: <20200608160044.15531-34-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:04:06 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/slavio_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 4c5d65e391..16f21669bf 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -31,6 +31,7 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/module.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Registers of hardware timer in sun4m.
@@ -392,6 +393,8 @@ static void slavio_timer_init(Object *obj)
     unsigned int i;
     TimerContext *tc;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i <= MAX_CPUS; i++) {
         uint64_t size;
         char timer_name[20];
-- 
2.21.3


