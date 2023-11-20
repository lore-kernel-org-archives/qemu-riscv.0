Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773FAC072A2
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 00:30:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r4sAS-0006Gi-ML; Sun, 19 Nov 2023 19:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4sAL-00060n-Mx
 for qemu-riscv@nongnu.org; Sun, 19 Nov 2023 19:29:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4sAK-0001Jt-60
 for qemu-riscv@nongnu.org; Sun, 19 Nov 2023 19:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700440157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2Opa+n3VWOIBf82pAqFV3jjJGG/p3OT/M7D+mi8Yb8=;
 b=E9fZZ0AH9wbRLfbNGora2WuoKTugaOe8yJKcWtq3lYOauSHEh/SUWQ1gWW4Im7lZjx31kh
 aGRvLiF87Vh+gxU/Ut3RK67GZcpaqHdOY4GelbdZ5HzIaWwUulRWKl9pMyosas4/J5V3Cw
 e8+l9opja7Yjh+lrQDHl+tQ4sxltpCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-sQAXnZ_pNNCp-ERVkfESTg-1; Sun, 19 Nov 2023 19:29:12 -0500
X-MC-Unique: sQAXnZ_pNNCp-ERVkfESTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BC4E8058EB;
 Mon, 20 Nov 2023 00:29:11 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F56B40C6EB9;
 Mon, 20 Nov 2023 00:29:03 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v6 8/8] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Mon, 20 Nov 2023 10:27:24 +1000
Message-ID: <20231120002724.986326-9-gshan@redhat.com>
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
References: <20231120002724.986326-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v6: Move valid_cpu_types[] to shakti_c_machine_class_init()   (Phil)
---
 hw/riscv/shakti_c.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 12ea74b032..3888034c2b 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -28,7 +28,6 @@
 #include "exec/address-spaces.h"
 #include "hw/riscv/boot.h"
 
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -47,12 +46,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory = get_system_memory();
 
-    /* Allow only Shakti C CPU for this platform */
-    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
-        error_report("This board can only be used with Shakti C CPU");
-        exit(1);
-    }
-
     /* Initialize SoC */
     object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
                             TYPE_RISCV_SHAKTI_SOC);
@@ -82,9 +75,15 @@ static void shakti_c_machine_instance_init(Object *obj)
 static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(klass);
+    static const char * const valid_cpu_types[] = {
+        RISCV_CPU_TYPE_NAME("shakti-c"),
+        NULL
+    };
+
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
-- 
2.41.0


