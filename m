Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKU2X-0000wS-I3
	for mharc-qemu-riscv@gnu.org; Mon, 21 Sep 2020 18:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU2S-0000iA-46
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2020 18:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU2H-0001i2-P2
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2020 18:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfUh7sBCp5W7Sr+En1wJlTcrEKS1ztpPr27s/gxaLDk=;
 b=WIrv8oUfbtS12S3dt+b3s+6PO329zAnLPZWlsTL/Rq2K1n5Q3qRESMcu25hh5dGNhgzInX
 p91vmY8+dinPldNKsaRV6SZ6DZIvZHHj1yHOZ3axKtADkwKUVYXiW2uOglH595elZ+eTo7
 UX3NHFk7BnKkAbvs+dPPh8Ql6ye6W5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-8kHgsiHCN525RklM_0xR7A-1; Mon, 21 Sep 2020 18:11:42 -0400
X-MC-Unique: 8kHgsiHCN525RklM_0xR7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6684909CA7;
 Mon, 21 Sep 2020 22:11:40 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD307366D;
 Mon, 21 Sep 2020 22:11:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Subject: [PATCH 24/24] sifive_u: Register "start-in-flash" as class property
Date: Mon, 21 Sep 2020 18:10:45 -0400
Message-Id: <20200921221045.699690-25-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:43:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 21 Sep 2020 22:12:00 -0000

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/riscv/sifive_u.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 4f12a93188d..0f0fab9a47b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -568,14 +568,6 @@ static void sifive_u_machine_instance_init(Object *obj)
     SiFiveUState *s = RISCV_U_MACHINE(obj);
 
     s->start_in_flash = false;
-    object_property_add_bool(obj, "start-in-flash",
-                             sifive_u_machine_get_start_in_flash,
-                             sifive_u_machine_set_start_in_flash);
-    object_property_set_description(obj, "start-in-flash",
-                                    "Set on to tell QEMU's ROM to jump to "
-                                    "flash. Otherwise QEMU will jump to DRAM "
-                                    "or L2LIM depending on the msel value");
-
     s->msel = 0;
     object_property_add(obj, "msel", "uint32",
                         sifive_u_machine_get_uint32_prop,
@@ -599,6 +591,14 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpus = mc->min_cpus;
+
+    object_class_property_add_bool(oc, "start-in-flash",
+                                   sifive_u_machine_get_start_in_flash,
+                                   sifive_u_machine_set_start_in_flash);
+    object_class_property_set_description(oc, "start-in-flash",
+                                          "Set on to tell QEMU's ROM to jump to "
+                                          "flash. Otherwise QEMU will jump to DRAM "
+                                          "or L2LIM depending on the msel value");
 }
 
 static const TypeInfo sifive_u_machine_typeinfo = {
-- 
2.26.2


