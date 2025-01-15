Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D245C02183
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:44:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY8MY-00083B-Vz; Wed, 15 Jan 2025 13:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8MW-00082D-JY
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:32 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8MV-00035w-4d
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:32 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2a3bf796cccso65495fac.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 10:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736966608; x=1737571408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LFfXCjqMoPK4O+ptGX63fRnmxQjg5+dlAqXaV80UpeI=;
 b=LaX8M5vbshQDAJDK+m7XpzpVCo5oLZUnXaKUmeBfFdm33HiiJXqo4Ovx+OaksstBZ0
 gRuy9M3ijQ7kc2cS0Miucsk1AqD41KrcXfK5W3OFEzpjXC7sJ+0bItBjdHSc/RYXdULT
 ZaT6uvrl4aC7Of6T2Y5937d5gZeV1+je3IBi/o99Sii1iPICqj8Q8gfXpoxxV0jCso5M
 i5zw20mPoEmeW1kI2m/L1XuxcMe1xysLzamHlP/9vv1G70s7h0meMOR5WfT/zcLyXCfa
 bi60JfchXu1CwQBpRsF9rTKkjarzcuJxGzX2sdZja9moZ3ibGwNrNbFYZMGXPNjR5vfV
 7Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736966608; x=1737571408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LFfXCjqMoPK4O+ptGX63fRnmxQjg5+dlAqXaV80UpeI=;
 b=sz175V/ZbvRVJHihj+i9ZB2s+f4NnyzoEUZbAouUC4sfB+RsiLB5UcPqBROsEbmb68
 Q2j4YmgkXoVd8lXnn08AQA8kXmRTJgrzrgtWpKIcQ6mtplTCzYGWRlPGN9QnbiSuKg3i
 rljf3zTeYOWSGrSCtl0eFjfmZoVIy0x+/KAHEozYgL76fpfItP0V2UMI84NGT27T4VHp
 WsG9QZ3SL/NWAYuoNeUEoFqjEa0fE7o3Tnbi4lS9+5WQmqYnbuPaenxZ4iqH9te7bOa6
 sGkiehdWoluQTiTPDfmGJePNlqC2arZr55++6yQrv0LztkxcJeZsQNurSHcUnLkwUhLZ
 yD0g==
X-Gm-Message-State: AOJu0YxeYx4G1Ix0Q+wGJB4hSNmIRz8OmWZaaq9W5CKaxOtMPvjKT6vm
 /MGgC94s+7ZS7B2KAT/qtIPH1m/UdM590UAUh0E5Ml4a4lGDZqQoGh+tfkzba9M=
X-Gm-Gg: ASbGncsL3XITPcbm+2nQbSTiRiojnTbJkmR5gYQbxGnAHil1HCGX4ryoPs+0Je6bJuO
 jiVW152vME4m3On3MWdPqcqL56ACjpdWjTvsLwZCOe8Z7GQUWHXeAIaCKdu6jCOXUw+kNV+HabY
 yXZjY7Z5pbanSCCqPWZ3TKwCzciIdV2SQHUcmPgf4EUpNakaxuynZ9zClQ/cGwljsnMbVGNGNkJ
 v6uHX4Hhe1yRyEgeYvpNfW18rsbL6mH5oHJBycPnwlBHs1s3yFWXb5eCtE=
X-Google-Smtp-Source: AGHT+IF8eUqs7CzXGYJBLumlaBqpWohRss4fojhmPVOj4ess2swu3bekmGxHyI+MryHFKJRao0+qAQ==
X-Received: by 2002:a05:6870:30c:b0:29e:499d:1d33 with SMTP id
 586e51a60fabf-2aa066c7d11mr16739926fac.14.1736966608347; 
 Wed, 15 Jan 2025 10:43:28 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad80a5cb64sm6539196fac.47.2025.01.15.10.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:43:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 1/6] target/riscv: add ssu64xl
Date: Wed, 15 Jan 2025 15:43:11 -0300
Message-ID: <20250115184316.2344583-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
References: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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

ssu64xl is defined in RVA22 as:

"sstatus.UXL must be capable of holding the value 2 (i.e., UXLEN=64 must
be supported)."

This is always true in TCG and it's mandatory for RVA23, so claim
support for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c                |   1 +
 tests/data/acpi/riscv64/virt/RHCT | Bin 390 -> 398 bytes
 2 files changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2..b187ef2e4b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -213,6 +213,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssu64xl, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(supm, PRIV_VERSION_1_13_0, ext_supm),
     ISA_EXT_DATA_ENTRY(svade, PRIV_VERSION_1_11_0, ext_svade),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 695022d56c4ac16607d4c622955ad339fbbfe997..b14ec15e553200760a63aad65586913d31ea2edc 100644
GIT binary patch
delta 48
zcmZo;?qlW(@^B96V`N}pOqj@Jz^cQ@$e^;(o|BQSxYW#~B4@H2qXkC_BLhPoBLf2f
D`wIz-

delta 41
wcmeBUZe!*O@^B7mV`N}poG_8gfK`Q&kwIpoJtyPj07f&87)Az$G)4vn0JA^`U;qFB

-- 
2.47.1


