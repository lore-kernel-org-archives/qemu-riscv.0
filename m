Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310CCC41513
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 00:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOSTg-0001vO-QU; Tue, 25 Jul 2023 20:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSTg-0001uG-7C
 for qemu-riscv@nongnu.org; Tue, 25 Jul 2023 20:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSTd-0003BK-AJ
 for qemu-riscv@nongnu.org; Tue, 25 Jul 2023 20:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690331641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8S0eAWzN6EGtNTjC2qFLYW++XUaEL4oEsl8iKKMElY=;
 b=iz2QV8Sc9OvNQV4rdyXQVFdcEztG5Q7gNMoGT0/IXH+XVswnue8hpagSPFIrGgag/+DgzN
 xVa9X8VgyuViKL5hut4oCw2sbuED7au2B2s8ptSuLyhr4C79KOhTVkZDMP1No+tsuaLImo
 zciPuFMGQXBXp39Y/iW+EK9TPwYKfSc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-05eIoiskP4W0CGpOtJpIhA-1; Tue, 25 Jul 2023 20:33:57 -0400
X-MC-Unique: 05eIoiskP4W0CGpOtJpIhA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E09FF8030AC;
 Wed, 26 Jul 2023 00:33:55 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6621F4A9004;
 Wed, 26 Jul 2023 00:33:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 imammedo@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 5/8] hw/arm/virt: Unsupported host CPU model on TCG
Date: Wed, 26 Jul 2023 10:32:02 +1000
Message-ID: <20230726003205.1599788-6-gshan@redhat.com>
In-Reply-To: <20230726003205.1599788-1-gshan@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The 'host' CPU model isn't supported until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8'.

  qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
  The valid models are: cortex-a7, cortex-a15, cortex-a35,
  cortex-a55, cortex-a72, cortex-a76, a64fx, neoverse-n1,
  neoverse-v1, cortex-a53, cortex-a57, host, max

Hide 'host' CPU model until KVM or HVF is enabled.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index debd85614e..2562ca0c1e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -217,7 +217,9 @@ static const char * const valid_cpu_types[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
     NULL
 };
@@ -236,7 +238,9 @@ static const char * const valid_cpu_models[] = {
 #endif
     "cortex-a53",
     "cortex-a57",
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     "host",
+#endif
     "max",
     NULL
 };
-- 
2.41.0


