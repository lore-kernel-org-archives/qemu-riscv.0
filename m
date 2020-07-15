Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvi1n-0007Z0-7K
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jul 2020 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1k-0007Q0-FH
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:04:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38034
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1i-0007Jf-GI
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Hg+tUVj5NWbsWGvRXcV+9lO/YZJmwxp44+OhFTOeUw=;
 b=Kd278K9ou7VKZx5C1dq+TWJVZqVQ6wyu/H9KegkXn/69AiTfXYO0SFSxGSfKTnuVXLN45v
 GgPflBAYsEYh07ojuqzUBsAhHJRGx5Zz5ueXtnKoEBpSQg/Uj7H5nxaCAJTKnXPmWatDRB
 bqHn0OFNRWaAQDApN+Pe6EIvuS4m/Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Sn6r-kSvPbiaIPJQ2QnwIQ-1; Wed, 15 Jul 2020 10:04:46 -0400
X-MC-Unique: Sn6r-kSvPbiaIPJQ2QnwIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD944102C7EE;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7C079CE4;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A66D511385E0; Wed, 15 Jul 2020 16:04:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, nieklinnenbank@gmail.com,
 sundeep.lkml@gmail.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 mark.cave-ayland@ilande.co.uk, palmer@dabbelt.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, thuth@redhat.com
Subject: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for "msf-soc"
Date: Wed, 15 Jul 2020 16:04:39 +0200
Message-Id: <20200715140440.3540942-2-armbru@redhat.com>
In-Reply-To: <20200715140440.3540942-1-armbru@redhat.com>
References: <20200715140440.3540942-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 05:07:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 15 Jul 2020 14:04:53 -0000

Watch this:

    $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
    {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
    {"execute": "qmp_capabilities"}
    {"return": {}}
    {"execute": "device-list-properties", "arguments": {"typename": "msf2-soc"}}
    Unsupported NIC model: ftgmac100
    armbru@dusky:~/work/images$ echo $?
    1

This is what breaks "make check SPEED=slow".

Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
qemu_check_nic_model().  That's wrong.

We fixed the exact same bug for device "allwinner-a10" in commit
8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
function".  Fix this instance the same way: move the offending code to
m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.

Fixes: 05b7374a58cd18aa3516e33513808896d0ac9b7b
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/msf2-soc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 16bb7c9916..33ea7df342 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -82,10 +82,6 @@ static void m2sxxx_soc_initfn(Object *obj)
     }
 
     object_initialize_child(obj, "emac", &s->emac, TYPE_MSS_EMAC);
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -187,6 +183,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
+    /* FIXME use qdev NIC properties instead of nd_table[] */
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
     dev = DEVICE(&s->emac);
     object_property_set_link(OBJECT(&s->emac), "ahb-bus",
                              OBJECT(get_system_memory()), &error_abort);
-- 
2.26.2


