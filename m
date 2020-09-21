Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKU2W-0000sB-0C
	for mharc-qemu-riscv@gnu.org; Mon, 21 Sep 2020 18:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU2U-0000nR-51
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2020 18:12:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21373
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU2H-0001hq-Oi
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2020 18:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAYj6eanxpvOaG3xD5VarL0V3UnuN5CPZvESe5wO2/M=;
 b=R7IHVlnvYAIsEWSl2QOjLGFKXgYtoz82fIw8qTBBSRyU+UKP9lcljvTBKFsnb40VVEW1DQ
 xnQ2D1IGAXyVPoF2uW03mJcloNXc/8mF5itTH4Skyn/UAWlIaoSM6woZ/8iXa57RwPvmQI
 QVc69WuMyguPiSPu1acdrzODdBpufig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-N6HzcBesN9i2RJJj3vvZew-1; Mon, 21 Sep 2020 18:11:41 -0400
X-MC-Unique: N6HzcBesN9i2RJJj3vvZew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E61A5873084;
 Mon, 21 Sep 2020 22:11:39 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 985715D9CD;
 Mon, 21 Sep 2020 22:11:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Subject: [PATCH 23/24] sifive_e: Register "revb" as class property
Date: Mon, 21 Sep 2020 18:10:44 -0400
Message-Id: <20200921221045.699690-24-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 18:11:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 21 Sep 2020 22:12:02 -0000

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
 hw/riscv/sifive_e.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 40bbf530d49..9fe0c12df64 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -137,11 +137,6 @@ static void sifive_e_machine_instance_init(Object *obj)
     SiFiveEState *s = RISCV_E_MACHINE(obj);
 
     s->revb = false;
-    object_property_add_bool(obj, "revb", sifive_e_machine_get_revb,
-                             sifive_e_machine_set_revb);
-    object_property_set_description(obj, "revb",
-                                    "Set on to tell QEMU that it should model "
-                                    "the revB HiFive1 board");
 }
 
 static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
@@ -152,6 +147,12 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
     mc->init = sifive_e_machine_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = SIFIVE_E_CPU;
+
+    object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
+                                   sifive_e_machine_set_revb);
+    object_class_property_set_description(oc, "revb",
+                                          "Set on to tell QEMU that it should model "
+                                          "the revB HiFive1 board");
 }
 
 static const TypeInfo sifive_e_machine_typeinfo = {
-- 
2.26.2


