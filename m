Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98D8C54F8C
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 23:59:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33JF-0001mV-Ln; Tue, 14 Nov 2023 18:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33J6-0001Tu-4a
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:59:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33J4-00078t-0T
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OA60zNYm3MxVJu1zn1Aljj0URKLh8YnKa9eMWyVPTBc=;
 b=dKEBIxK2yE44efHagm3yARA78dOz1+deTPgskEGb+qjAPsU/laOsRIpH0xDQcMcwoDdinT
 l7mIcSfN35QuXrqHoK+C0Yj/Ifwfe+Wjy4bM+W+JbLUChfTuDoGknuvTqMRJQ8Na1WKERA
 oy3j0eA6CHJ9Se0BWVF6IWnuWq6oBzA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-8-4GrtLFNIyl9bRUcLom5w-1; Tue, 14 Nov 2023 18:58:51 -0500
X-MC-Unique: 8-4GrtLFNIyl9bRUcLom5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0E98185A780;
 Tue, 14 Nov 2023 23:58:49 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC75C15885;
 Tue, 14 Nov 2023 23:58:33 +0000 (UTC)
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
Subject: [PATCH v5 08/31] target/arm: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:05 +1000
Message-ID: <20231114235628.534334-9-gshan@redhat.com>
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

No changes of the output from the following command before and
after it's applied.

[gshan@gshan q]$ ./build/qemu-system-aarch64 -cpu ?
Available CPUs:
  a64fx
  arm1026
  arm1136
  arm1136-r2
  arm1176
  arm11mpcore
  arm926
  arm946
  cortex-a15
  cortex-a35
  cortex-a53
  cortex-a55
  cortex-a57
  cortex-a7
  cortex-a710
  cortex-a72
  cortex-a76
  cortex-a8
  cortex-a9
  cortex-m0
  cortex-m3
  cortex-m33
  cortex-m4
  cortex-m55
  cortex-m7
  cortex-r5
  cortex-r52
  cortex-r5f
  max
  neoverse-n1
  neoverse-n2
  neoverse-v1
  pxa250
  pxa255
  pxa260
  pxa261
  pxa262
  pxa270-a0
  pxa270-a1
  pxa270
  pxa270-b0
  pxa270-b1
  pxa270-c0
  pxa270-c5
  sa1100
  sa1110
  ti925t

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/cpu.h    |  3 ---
 target/arm/helper.c | 46 ---------------------------------------------
 2 files changed, 49 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0282e0d28..8c3ca2e231 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2737,7 +2737,6 @@ static inline bool access_secure_reg(CPUARMState *env)
                        (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)), \
                        (_val))
 
-void arm_cpu_list(void);
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
@@ -2840,8 +2839,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
 
-#define cpu_list arm_cpu_list
-
 /* ARM has the following "translation regimes" (as the ARM ARM calls them):
  *
  * If EL3 is 64-bit:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff1970981e..c9a8baefc6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9421,52 +9421,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void arm_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CPUClass *cc = CPU_CLASS(oc);
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", name);
-    } else {
-        qemu_printf("  %s\n", name);
-    }
-    g_free(name);
-}
-
-void arm_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    list = g_slist_sort(list, arm_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, arm_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 /*
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
-- 
2.41.0


