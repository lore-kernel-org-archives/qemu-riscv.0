Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV6kf-0003d8-UN
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 03:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6ke-0003cR-7y
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kc-0001H5-Qf
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wLL9544MFJuZn5ro6CESRAgbVJwuWFdQYsfjmY4xL8=;
 b=H5fTxbelp8s875eyelaJb0PraEFHgLiMngVswBrPZZU0FxoHn1BSX1AvvgndH5W4gm1LTO
 v/gXSsTUOHmIJ+F5Vle0kn+T1IOpwlnVXJ6IuqLroQS/VklEq5DLVsNthb/cqiq74kSskq
 3CAS7j98yS5zDhnTUOChYQTfUw3nJ2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-1eFz_WD9PGO_6RMfiLhVEQ-1; Thu, 23 Feb 2023 03:14:44 -0500
X-MC-Unique: 1eFz_WD9PGO_6RMfiLhVEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D02A85A5A3;
 Thu, 23 Feb 2023 08:14:44 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15B218EC1;
 Thu, 23 Feb 2023 08:14:36 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 3/4] hw/arm: Validate socket and NUMA node boundary
Date: Thu, 23 Feb 2023 16:14:00 +0800
Message-Id: <20230223081401.248835-4-gshan@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 08:14:52 -0000

There are two ARM machines where NUMA is aware: 'virt' and 'sbsa-ref'.
Both of them are required to follow socket-NUMA-node boundary. To
enable the validation to reject incorrect configuration.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/sbsa-ref.c | 2 ++
 hw/arm/virt.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..1a87437017 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -844,6 +844,8 @@ static void sbsa_ref_instance_init(Object *obj)
     SBSAMachineState *sms = SBSA_MACHINE(obj);
 
     sbsa_flash_create(sms);
+
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static void sbsa_ref_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..9d9f26626c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3210,6 +3210,8 @@ static void virt_instance_init(Object *obj)
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static const TypeInfo virt_machine_info = {
-- 
2.23.0


