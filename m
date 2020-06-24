Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jo0uw-0001H2-Hg
	for mharc-qemu-riscv@gnu.org; Wed, 24 Jun 2020 04:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uu-0001Bg-JM
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2020 04:38:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28587
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uj-00027y-7q
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2020 04:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iDl2ElwkXpRbcCCv6gyWEk3cW3jpGvA4tnLbRXMjV8=;
 b=RCX3Sq6lF8Dty9xbmlwZ2NJqKGzU+vfU8B9q3jeD3yE3DgXUmxSpPcI+9mRogHfVMQg3rT
 eJ3ICMfPAJxvtpPQWbyEAdwJwocE3HsRsiXFrm6Huu+HCuFATFtauvl2EarmyTFgWHN1vb
 wQESrIt92n79CeAZp2bI0maZuzJysF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-6QQ8lXt-MaOJOnryILq1Ug-1; Wed, 24 Jun 2020 04:37:44 -0400
X-MC-Unique: 6QQ8lXt-MaOJOnryILq1Ug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C4E1B18BC1;
 Wed, 24 Jun 2020 08:37:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D64AD61983;
 Wed, 24 Jun 2020 08:37:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8630113847F; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 17/25] riscv/sifive_u: Fix sifive_u_soc_realize() error API
 violations
Date: Wed, 24 Jun 2020 10:37:29 +0200
Message-Id: <20200624083737.3086768-18-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
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
X-List-Received-Date: Wed, 24 Jun 2020 08:38:00 -0000

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

sifive_u_soc_realize() is wrong that way: it passes &err to
sysbus_realize() four times before checking it.  Harmless, because the
first three can't actually fail (I think).

Fix by checking for failure right away.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-riscv@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7d051e7c92..a1d2edfe13 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -677,11 +677,15 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, false);
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->prci), &err);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
+        return;
+    }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
     qdev_prop_set_uint32(DEVICE(&s->gpio), "ngpio", 16);
-    sysbus_realize(SYS_BUS_DEVICE(&s->gpio), &err);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, memmap[SIFIVE_U_GPIO].base);
 
     /* Pass all GPIOs to the SOC layer so they are available to the board */
@@ -695,7 +699,9 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     }
 
     qdev_prop_set_uint32(DEVICE(&s->otp), "serial", s->serial);
-    sysbus_realize(SYS_BUS_DEVICE(&s->otp), &err);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->otp), errp)) {
+        return;
+    }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
 
     if (nd->used) {
-- 
2.26.2


