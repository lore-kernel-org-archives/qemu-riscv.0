Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4132C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:16:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHJ8g-0002lT-2U; Wed, 12 Jun 2024 04:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8e-0002kY-S8
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:15:24 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8d-0006Qq-4b
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:15:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1f692d6e990so61548635ad.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jun 2024 01:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180122; x=1718784922; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cAY0jW33Nj782SxENctmS4bNW7VRXFYMi+Au2pU8GGg=;
 b=AkFChHSRi9FuDXAqDe2qDD5ieYTd44LLsZ5Sml08XQezQoyaBUBucwFB5kYOVyCinF
 bHk7o90d9ajMeiWFAdegIg4F3OVxHCCZZQT1vE/YEUk+tTOzjPmtvT4GqmyoROlWU6+W
 L76ORVFZPlULW46bopTc8Pbh5wKATpSbMHHUBLT6cl+p4CzsaQEWcD+JF9tGcsHw8P4o
 6psMSWgAt6tvs4PRsiLhlFKz30tWPnfyia2B6VTIHei9ZVAYtv8Dsseop2BiJ5gT0DGQ
 llCdAKZtVQ6XlCw562lBX6A2mUgobCptAkuE5cLAVA7WAzwOmh/amDqkn1BeN3gS9UPm
 ypIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180122; x=1718784922;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAY0jW33Nj782SxENctmS4bNW7VRXFYMi+Au2pU8GGg=;
 b=QTW/3qB95BuRifvmUlFntbkDf9BSQJLPnfhvuqdVU4WKoZLbet8y0QskEHZn6Q1v7D
 9QMb0b+6/PKJa5CVJRL5mMRx7VP9VXQvuC4jQMzQUBgfZ1KqiaABbeiUHStQ4UYRhSVq
 8dOxYhgBl/p/1B4WazWD4CcDEvUZvfht1XcL7KAA6txzsazvGZ382huded76jy+1meHh
 mAbiWbRRt+V54zfzZL0SlrmuqNvTFReRLogDWMBQIGHytscZATkuPHmnkXq/AcBSjibI
 NjXTZ1v/GuYSFOLvishMs+YNxQOZbMhaIOtRmPHnNPXOMhDZACmL6kU9NyIpqu/YlPhv
 kowQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt8qt/KfpvZe2gkhTB/0vctwpZd6q2KeUKAMPfjYX5yIulB7gQjxaTzUvCyQ46A3ejSw6Pd35PqS3x3FtW1YA9Z/HvjMI=
X-Gm-Message-State: AOJu0YwvkNIEUHJRmfxFfNNlM/hbCdWTsH0KtzhhijC8q67HUC8jabJ3
 pePmP6JTseHT4dz3MdW0asg8V6W5FgjAp4TDv8V3ArUlJeCGvA0slSe68/TU+aB78Rt67coGzcp
 uOVWaMmZv
X-Google-Smtp-Source: AGHT+IHUiZ6yRJPovFi3wuSKb1lIaXMYW52Ig2N+KD3BR2hpJOErLSMsS3A/wsHOygy4d4Z3kX5hNg==
X-Received: by 2002:a17:903:234b:b0:1f7:13b1:753f with SMTP id
 d9443c01a7336-1f83b5e1de8mr13440535ad.22.1718180121827; 
 Wed, 12 Jun 2024 01:15:21 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:15:21 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 08/16] target/riscv: Allow global WG config to set WG CPU
 callbacks
Date: Wed, 12 Jun 2024 16:14:08 +0800
Message-Id: <20240612081416.29704-9-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Some WG CPU functions depend on global WG config (like num-of-world), so
we let the global WG config device to set callbacks of a RISC-V HART.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2d3bfedbba..50a0fba127 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -431,6 +431,10 @@ struct CPUArchState {
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
 #endif /* CONFIG_KVM */
+
+    /* machine specific WorldGuard callback */
+    void (*wg_reset)(CPURISCVState *env);
+    void (*wid_to_mem_attrs)(MemTxAttrs *attrs, uint32_t wid);
 };
 
 /*
-- 
2.17.1


