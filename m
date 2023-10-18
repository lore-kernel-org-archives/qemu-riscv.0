Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8593CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 06:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qszyl-0005DZ-6J; Wed, 18 Oct 2023 02:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qszyj-0005Co-8y
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 02:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qszyh-000825-7Z
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 02:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697610262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MKpb0srex3X5XXzBrdtl7iM92vzcVG1T74Ao99NotUk=;
 b=BKRoja7SPbEo/fJxXyg2Fq7RP8XCYFZwGzV7Op4fdD/Q9jlell6tvrX4e5mYehjDv9CsMJ
 toC80099jHS83b+0xsEuUpFedGKCKYOTe9lMAAxc/X78Rz9n9RLdfFuAvuPyaqVqnWIytk
 g4JqD3oz+EaxcDRYCnJ0ZrJieikSGXo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-lixZjWySOR-pVs1jyVeW2w-1; Wed, 18 Oct 2023 02:24:08 -0400
X-MC-Unique: lixZjWySOR-pVs1jyVeW2w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C86E63C14902;
 Wed, 18 Oct 2023 06:24:07 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69FFA492BFA;
 Wed, 18 Oct 2023 06:24:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH] MAINTAINERS: Add unvalued folders in tests/tcg/ to the right
 sections
Date: Wed, 18 Oct 2023 08:24:01 +0200
Message-ID: <20231018062401.20746-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Some subfolders in tests/tcg/ are already listed in the MAINTAINERS
file, some others aren't listed yet. Add the missing ones now to the
MAINTAINERS file, too, to make sure that get_maintainers.pl reports
the correct maintainer.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b3599746c4..b80124f60f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -257,6 +257,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/hppa/
 F: disas/hppa.c
+F: tests/tcg/hppa/
 
 LoongArch TCG CPUs
 M: Song Gao <gaosong@loongson.cn>
@@ -270,6 +271,7 @@ M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: target/m68k/
 F: disas/m68k.c
+F: tests/tcg/m68k/
 
 MicroBlaze TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -327,6 +329,7 @@ F: hw/ppc/trace*
 F: configs/devices/ppc*
 F: docs/system/ppc/embedded.rst
 F: docs/system/target-ppc.rst
+F: tests/tcg/ppc*/*
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
@@ -345,6 +348,7 @@ F: hw/intc/riscv*
 F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
+F: tests/tcg/riscv64/
 
 RISC-V XThead* extensions
 M: Christoph Muellner <christoph.muellner@vrull.eu>
@@ -386,6 +390,7 @@ F: target/sh4/
 F: hw/sh4/
 F: disas/sh4.c
 F: include/hw/sh4/
+F: tests/tcg/sh4/
 
 SPARC TCG CPUs
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
@@ -396,6 +401,7 @@ F: hw/sparc/
 F: hw/sparc64/
 F: include/hw/sparc/sparc64.h
 F: disas/sparc.c
+F: tests/tcg/sparc64/
 
 X86 TCG CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.41.0


