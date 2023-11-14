Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1881C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:05:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33Kh-0005nD-DJ; Tue, 14 Nov 2023 19:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kg-0005er-4z
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kd-00083a-7s
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkjJc9SmULphEh7KBEubO5fjf1sUZsLSsPFKusKCiHg=;
 b=cxL0Y5p6Izx8A2Xj06QXZbKuZiakXujP0UOZbrKhS6ztscnia2ED25zUxhAXtzZqwibalT
 JrEYcc34qXYACHOh063WaAxVyCUdfA9tpMsXvDIHynQlIoZVCS5LQ3C1bX9SyXDmuqsHJv
 QLdJxftFOTur/ySMp782JXcqz0pDHIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-b8vccmANMAesCOE6EAogfw-1; Tue, 14 Nov 2023 19:00:23 -0500
X-MC-Unique: b8vccmANMAesCOE6EAogfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD7D101A597;
 Wed, 15 Nov 2023 00:00:21 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663F1C15885;
 Wed, 15 Nov 2023 00:00:09 +0000 (UTC)
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
Subject: [PATCH v5 15/31] target/mips: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:12 +1000
Message-ID: <20231114235628.534334-16-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

[gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
MIPS '4Kc'
MIPS '4Km'
MIPS '4KEcR1'
MIPS 'XBurstR1'
MIPS '4KEmR1'
MIPS '4KEc'
MIPS '4KEm'
MIPS '24Kc'
MIPS '24KEc'
MIPS '24Kf'
MIPS '34Kf'
MIPS '74Kf'
MIPS 'XBurstR2'
MIPS 'M14K'
MIPS 'M14Kc'
MIPS 'P5600'
MIPS 'mips32r6-generic'
MIPS 'I7200'
MIPS 'R4000'
MIPS 'VR5432'
MIPS '5Kc'
MIPS '5Kf'
MIPS '20Kc'
MIPS 'MIPS64R2-generic'
MIPS '5KEc'
MIPS '5KEf'
MIPS 'I6400'
MIPS 'I6500'
MIPS 'Loongson-2E'
MIPS 'Loongson-2F'
MIPS 'Loongson-3A1000'
MIPS 'Loongson-3A4000'
MIPS 'mips64dspr2'
MIPS 'Octeon68XX'

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
Available CPUs:
  20Kc
  24Kc
  24KEc
  24Kf
  34Kf
  4Kc
  4KEc
  4KEcR1
  4KEm
  4KEmR1
  4Km
  5Kc
  5KEc
  5KEf
  5Kf
  74Kf
  I6400
  I6500
  I7200
  Loongson-2E
  Loongson-2F
  Loongson-3A1000
  Loongson-3A4000
  M14K
  M14Kc
  mips32r6-generic
  mips64dspr2
  MIPS64R2-generic
  Octeon68XX
  P5600
  R4000
  VR5432
  XBurstR1
  XBurstR2

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/mips/cpu-defs.c.inc | 9 ---------
 target/mips/cpu.h          | 4 ----
 2 files changed, 13 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index c0c389c59a..fbf787d8ce 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1018,15 +1018,6 @@ const mips_def_t mips_defs[] =
 };
 const int mips_defs_number = ARRAY_SIZE(mips_defs);
 
-void mips_cpu_list(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
-        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
-    }
-}
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 52f13f0363..1163a71f3c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1235,10 +1235,6 @@ struct MIPSCPUClass {
     bool no_data_aborts;
 };
 
-void mips_cpu_list(void);
-
-#define cpu_list mips_cpu_list
-
 void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *env);
 uint32_t cpu_rddsp(uint32_t mask_num, CPUMIPSState *env);
 
-- 
2.41.0


