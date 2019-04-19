Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hHMnO-0005q4-Ay
	for mharc-qemu-riscv@gnu.org; Fri, 19 Apr 2019 02:14:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnK-0005lj-LW
	for qemu-riscv@nongnu.org; Fri, 19 Apr 2019 02:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnJ-00054H-Nj
	for qemu-riscv@nongnu.org; Fri, 19 Apr 2019 02:14:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hHMnG-00051u-Cx; Fri, 19 Apr 2019 02:14:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62D56CA364;
	Fri, 19 Apr 2019 06:14:37 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC98600C1;
	Fri, 19 Apr 2019 06:14:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Date: Fri, 19 Apr 2019 03:14:24 -0300
Message-Id: <20190419061429.17695-3-ehabkost@redhat.com>
In-Reply-To: <20190419061429.17695-1-ehabkost@redhat.com>
References: <20190419061429.17695-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 19 Apr 2019 06:14:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-riscv] [PATCH 2/7] riscv: Don't split CPU model string
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2019 06:14:43 -0000

CPUClass::class_by_name is called after the CPU model name and
options were already split, there's no need to split the string
again.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d61bce6d55..5e97a83c80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -179,12 +179,9 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
     char *typename;
-    char **cpuname;
 
-    cpuname = g_strsplit(cpu_model, ",", 1);
-    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), cpuname[0]);
+    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
-    g_strfreev(cpuname);
     g_free(typename);
     if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
         object_class_is_abstract(oc)) {
-- 
2.18.0.rc1.1.g3f1ff2140


