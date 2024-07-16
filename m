Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7233BC3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:44:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sTjP5-00053K-Od; Tue, 16 Jul 2024 10:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTjP4-0004tZ-91
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2024 10:43:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTjOw-00031H-RF
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2024 10:43:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-795d2aa4ba4so686831a12.3
 for <qemu-riscv@nongnu.org>; Tue, 16 Jul 2024 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721141011; x=1721745811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JaZ8kohlacrwgSAZfsaoX707cOD/zF89IUM4ZLVsfAE=;
 b=c0hbW2uKdz2Obaz0P42GZiYKxEoCcvCcK/jOj9uudhdWmRD67C8kDZSnvqWx4cQfI/
 zJvw+QBdfbQ9uq3bjRocls2L9ctFOyw9N2yGxE3v//y2H3xFvZjdE8yP1Ze+uCdS5+bB
 1kStgye195LPWOhE8hRdTk3xPp9WOmcrl6uTqeEgG6IKfQ2hXONFhCGgi721qBC4SeBF
 VwDStkKgVHQAAvYPRxNJocZWk4IgsXppg/iapW9o4q0ap5THiJJrO4VjzkgBicesW6+L
 QHTxIhC50Jh1JvelgVPPcuspZGXd45WaMJ/rCpYBC0ms+SMEvPuLsa6li+vRojNJcg9a
 eTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721141011; x=1721745811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JaZ8kohlacrwgSAZfsaoX707cOD/zF89IUM4ZLVsfAE=;
 b=hSg+eVu9zKgxu3rCP8N1Kmmk37BI88wMGR6mkOG4oug8t4dIFZzzyGVBiI9+G001F6
 SFW5lrJWOceoWgp+JLfuWV/xoiWxmN4qBtBgEPBKYGRYK11JawLqin2t7Ofs2LA7Drh9
 XDbo+fO05/EodLqiPXQ6/ddYbEz8WrjLb3KnVKqdlFHgvktABh6Ny3DQaCSkpfm/IsaS
 d9iVkGGr4fdGo5J2NaSvsiYwAI3mdm568X/Nofs4XFc4otopbi5BMLE/a9Q3T9/VXr8S
 +/oEopqx8dchT/qZ70TBqUhX73uhxwNBt8f90vA2+zlman2vdMi7iaDb7VamGjPixd46
 6ApQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxkA7klQ0jIo+voBzqAqBJY6xAu9VhaLUW0iHhUl5ZYPVMfU8RTJScP5rmC5tpK08gcS1AvakQfKbaU8aJevNTXJbO/Us=
X-Gm-Message-State: AOJu0YyBGsKxp/6nHQWfwHPzIZeos9kjoQv4jE7yDAuZnc9tTHBtqyT2
 xrC4dTXnxjf84+I5kZP6Kn/HEg8sqkGYd+BQavvM4vHQUDL9RInG4x0wAGChhJ0=
X-Google-Smtp-Source: AGHT+IE2/awNDIImD5i5Mm29yuImlImQIKSJOSyIDbasxycfDUnaqTK+0KQ/k0C2onrkcCZS3Dgqgg==
X-Received: by 2002:a17:90a:f3d2:b0:2bf:7eb7:373b with SMTP id
 98e67ed59e1d1-2cb37475043mr1725510a91.33.1721141011049; 
 Tue, 16 Jul 2024 07:43:31 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2caf480d61bsm6084782a91.18.2024.07.16.07.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 07:43:30 -0700 (PDT)
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
Subject: [PATCH v4 3/9] tests/acpi: Allow DSDT acpi table changes for aarch64
Date: Tue, 16 Jul 2024 20:13:00 +0530
Message-ID: <20240716144306.2432257-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716144306.2432257-1-sunilvl@ventanamicro.com>
References: <20240716144306.2432257-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


