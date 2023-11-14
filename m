Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3F9C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:04:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33JM-00026m-SE; Tue, 14 Nov 2023 18:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JI-0001uH-Ng
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JH-0007Df-4J
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHJG04+lgyfqTN74zgkyn2sc/y+9a361YMftbYRBCT4=;
 b=d4HqycfVRT/yvYuggwJAdnWFXFBYPYb06l7NGt8xBMY7UghQzzRQVXsIleznyISM8gghR3
 n41fLg7SPMbqHvvzUbh9VEFqdSSIS41TL9MWTo6nwbc1u+VLbBNWl1/A5We/JgXM8wrxxt
 0kx3oDtaRX6uSYXNtCdSKqjo20Lin5c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-30zIy3b1OdyUs-lUcbxZPQ-1; Tue,
 14 Nov 2023 18:59:04 -0500
X-MC-Unique: 30zIy3b1OdyUs-lUcbxZPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDFA63C000A8;
 Tue, 14 Nov 2023 23:59:02 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C0BC15885;
 Tue, 14 Nov 2023 23:58:50 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 09/31] target/avr: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:06 +1000
Message-ID: <20231114235628.534334-10-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
avr5-avr-cpu
avr51-avr-cpu
avr6-avr-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
Available CPUs:
  avr5
  avr51
  avr6

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/avr/cpu.c | 15 ---------------
 target/avr/cpu.h |  2 --
 2 files changed, 17 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index a36cc48aae..76fc4cdaf2 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -354,21 +354,6 @@ typedef struct AVRCPUInfo {
 } AVRCPUInfo;
 
 
-static void avr_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-
-    qemu_printf("%s\n", typename);
-}
-
-void avr_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_AVR_CPU, false);
-    g_slist_foreach(list, avr_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_AVR_CPU_TYPE(model, initfn) \
     { \
         .parent = TYPE_AVR_CPU, \
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 8a17862737..02750a7ccd 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -181,7 +181,6 @@ static inline void set_avr_feature(CPUAVRState *env, int feature)
     env->features |= (1U << feature);
 }
 
-#define cpu_list avr_cpu_list
 #define cpu_mmu_index avr_cpu_mmu_index
 
 static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
@@ -191,7 +190,6 @@ static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
 
 void avr_cpu_tcg_init(void);
 
-void avr_cpu_list(void);
 int cpu_avr_exec(CPUState *cpu);
 
 enum {
-- 
2.41.0


