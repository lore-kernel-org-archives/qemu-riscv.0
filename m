Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE0DC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 17:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sTPEx-00057U-CU; Mon, 15 Jul 2024 13:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTPEt-00050t-DN
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 13:11:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTPEr-0007JH-OJ
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 13:11:51 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70af5fbf0d5so2797811b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2024 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721063508; x=1721668308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JaZ8kohlacrwgSAZfsaoX707cOD/zF89IUM4ZLVsfAE=;
 b=gCPV/0zaaD5RmIgDXda5YRcG3ZE9li9+4ozGLpDnm0eoJgY5GGp98xGUuhayAKl06i
 gAAo+MMCGwDussZ7qtaNn4D+FKnKAN2Aq7I1q1706a0N6XvmDa53zO7+J5uusx5QTFjo
 dShYzfn/cM6QVFki53zPulIDw7vCD4skTmouCYY5co81L//zHJormedk++RGa6YWRn1T
 r3W4ZPjeNloFPICxEdVBvd43ZI1iDLiXg8IZr2CA6BFBlgrWx7F8zBaw9kJFlBzA5Iqo
 6rhERnzIVZZ8u/3NegUFMTkfG3a2oCRlcg6SxnjYDAvWxG3UBkz7J2i/05qh9/4rvyqV
 KfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721063508; x=1721668308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JaZ8kohlacrwgSAZfsaoX707cOD/zF89IUM4ZLVsfAE=;
 b=tfVkWCdcGmp9X8nn/Ya3IvQXxShODpUAuLsmj8rCPJVpAeoUDDZzLy0reGo99DqKII
 cqCjfMaJEevAL3wzQNunKqVO8dYt2UgX+haORy7DqbzILXD+l0CqbfJjJqqrKpowSHlK
 diBwQm5WEWVzv/KKl9+cS7CVo+8O+N9RXMd0SMRLTYObo1474fGTVewx08faKc6qb2O9
 DZP/v/OSBbKDu+adDEh3a/78WjlxFnpz2V2XBlSxDpkUhm36ssrp17XMJiITnNg72f7v
 FfqwpgM3mbuKX3j4LEmLuCUKYRTQcoG31fIr7UbgYHlXSKysYcLSvdtk5MCp6MZT6WTd
 m7uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYOOv7v+pB+twxlTLrT6g2ydwy5g0rq1mpSSnMViwI7f7r8fjnMW1WsKNPhzuYxdtxRLhLjyPD7/8w4YGDRYE5Plw3v7k=
X-Gm-Message-State: AOJu0YzzNDOC1+IcgWTNwuOC7lyGWtbPxRY5HhHhLi9JXpK90v6D9XqO
 9roij8Tdh6TRQvwrO8r3IxoWGZbHz3lYDFyrRAvmpbprMZpw+99+M9+j7UqJlsdqnmrZovwffnc
 mAcc=
X-Google-Smtp-Source: AGHT+IHHZ5pIPosviKtPkyQEif/hMdfbEGRFuJs37YGdo10nEtGhSuQiBUcNsFL3MFTMipLEiC0hCA==
X-Received: by 2002:a05:6a00:928e:b0:706:5b39:2b18 with SMTP id
 d2e1a72fcca58-70b6c928f6fmr21008318b3a.11.1721063507636; 
 Mon, 15 Jul 2024 10:11:47 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca85ccsm4752618b3a.178.2024.07.15.10.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 10:11:46 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 3/9] tests/acpi: Allow DSDT acpi table changes for aarch64
Date: Mon, 15 Jul 2024 22:41:23 +0530
Message-ID: <20240715171129.1168896-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715171129.1168896-1-sunilvl@ventanamicro.com>
References: <20240715171129.1168896-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

so that CI tests don't fail when those ACPI tables are updated in the
next patch. This is as per the documentation in bios-tables-tests.c.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..9282ea0fb2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/x86/microvm/DSDT.pcie",
-- 
2.43.0


