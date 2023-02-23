Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV6ko-0003k1-Ob
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 03:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kn-0003iH-SB
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6km-0001LK-89
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNyUfcVHvjIdcGuv0SDWxC/qdUhNx/+4Mut0H2LduDQ=;
 b=gOX5Zz5AXTA2uyHGidF3/MiJKQ9+xvOXFZHVoHXOGcI99sHYL0BJAqzSDj/rv2XNF7mo/G
 4qsT1W2D0XE/Oz8J7mxCP+lLrZXwcTApprUSYej9qPkqspo+J3tTnloacInP9FK/1zo0UY
 BYVoyP/vdaoxF+6LkNoBfTXJcQ6rimI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-qCV7yt1kP0qz9Kpqr53kjQ-1; Thu, 23 Feb 2023 03:14:53 -0500
X-MC-Unique: qCV7yt1kP0qz9Kpqr53kjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 636CA857A88;
 Thu, 23 Feb 2023 08:14:52 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFDBC440DE;
 Thu, 23 Feb 2023 08:14:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 4/4] hw/riscv: Validate socket and NUMA node boundary
Date: Thu, 23 Feb 2023 16:14:01 +0800
Message-Id: <20230223081401.248835-5-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 08:15:02 -0000

There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
Both of them are required to follow socket-NUMA-node boundary. To
enable the validation to reject incorrect configuration.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/riscv/spike.c | 1 +
 hw/riscv/virt.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..fba0cbec29 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -342,6 +342,7 @@ static void spike_board_init(MachineState *machine)
 
 static void spike_machine_instance_init(Object *obj)
 {
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static void spike_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..ed79becb96 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1521,6 +1521,7 @@ static void virt_machine_init(MachineState *machine)
 
 static void virt_machine_instance_init(Object *obj)
 {
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
-- 
2.23.0


