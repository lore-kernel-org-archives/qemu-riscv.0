Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53891C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:08:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33Kp-00065r-SD; Tue, 14 Nov 2023 19:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Ko-00064f-4F
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Km-00086E-3R
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4eTiLCEOv9w25aK8fnhBq4hC/5pssEztOwbkb9SzsE=;
 b=EASMLCah1EpuVX2p5MMUL305jT8eDMLTJ0TF5Wv4fVQTN1vh6Vo3EQUEYyCsQIromF3sIp
 fntuymGunaxr8EqL+ZmQJ83gPIzonEmPaEMsshslZ6gzIPk4qNx8IOL+ZEas3V7vYnfdg4
 P+hKdMmV1jjB4JxL+Qup3jeysNr0ScY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-xnut3d3kP0ykENvqyO8VKw-1; Tue, 14 Nov 2023 19:00:37 -0500
X-MC-Unique: xnut3d3kP0ykENvqyO8VKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD8184AEE0;
 Wed, 15 Nov 2023 00:00:34 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73AE1C15885;
 Wed, 15 Nov 2023 00:00:22 +0000 (UTC)
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
Subject: [PATCH v5 16/31] target/openrisc: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:13 +1000
Message-ID: <20231114235628.534334-17-gshan@redhat.com>
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

Before it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  or1200
  any

After it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  any
  or1200

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/openrisc/cpu.c | 42 ------------------------------------------
 target/openrisc/cpu.h |  3 ---
 2 files changed, 45 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f7d53c592a..381ebe00d3 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -253,48 +253,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &openrisc_tcg_ops;
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint openrisc_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void openrisc_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename,
-                     strlen(typename) - strlen("-" TYPE_OPENRISC_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cpu_openrisc_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_OPENRISC_CPU, false);
-    list = g_slist_sort(list, openrisc_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, openrisc_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_OPENRISC_CPU_TYPE(cpu_model, initfn) \
     {                                               \
         .parent = TYPE_OPENRISC_CPU,                \
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index dedeb89f8e..b454014ddd 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -299,15 +299,12 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
-#define cpu_list cpu_openrisc_list
-
 #ifndef CONFIG_USER_ONLY
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
-- 
2.41.0


