Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkvuD-0002qk-Q7
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jun 2020 16:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuC-0002n1-0q
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2020 16:40:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23215
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu9-0000WM-93
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2020 16:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXxT+Y1BlIeR9aoBSeiIfSphfi5tyAp8cTijqQDYx7g=;
 b=hzK7XG5K0dsoj1oM9Jd5tc7Fx1jHZJPAqtWNohIhUo0ZHAaP/si2JMPBkuKM/6uPM6zXBc
 wVvhJecQLH9JzpsVNNHR695VhNNRKTSzvEUhgGrFBdIm7xPQTivJM4vM7lFMx5z1138Jy7
 M4ms4l/AmmqAHWBNcC2rbVQrPTxonoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-ok2Z6i8_OiOxpl3sOAHKQg-1; Mon, 15 Jun 2020 16:40:26 -0400
X-MC-Unique: ok2Z6i8_OiOxpl3sOAHKQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA95C100CCC2;
 Mon, 15 Jun 2020 20:40:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D6086ED96;
 Mon, 15 Jun 2020 20:40:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6904611358DF; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/84] riscv: Fix type of SiFive[EU]SocState, member parent_obj
Date: Mon, 15 Jun 2020 22:39:06 +0200
Message-Id: <20200615204008.3069956-23-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:40:20
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
X-List-Received-Date: Mon, 15 Jun 2020 20:40:32 -0000

Device "riscv.sifive.e.soc" is a direct subtype of TYPE_DEVICE, but
its instance struct SiFiveESoCState's member @parent_obj is
SysBusDevice instead of DeviceState.  Correct that.

Same for "riscv.sifive.u.soc"'s instance struct SiFiveUSoCState.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200609122339.937862-21-armbru@redhat.com>
---
 include/hw/riscv/sifive_e.h | 2 +-
 include/hw/riscv/sifive_u.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 414992119e..d386ea9223 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -29,7 +29,7 @@
 
 typedef struct SiFiveESoCState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    DeviceState parent_obj;
 
     /*< public >*/
     RISCVHartArrayState cpus;
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 16c297ec5f..5f62cf5f85 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -31,7 +31,7 @@
 
 typedef struct SiFiveUSoCState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    DeviceState parent_obj;
 
     /*< public >*/
     CPUClusterState e_cluster;
-- 
2.26.2


