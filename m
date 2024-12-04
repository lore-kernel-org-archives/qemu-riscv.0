Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7B5E77170
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvx6-0007VM-Il; Wed, 04 Dec 2024 15:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvx4-0007UP-Tz
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:26 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvx2-00071e-Bm
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so174394f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343982; x=1733948782; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhKSMfIut/lDTwvjTF8AW4idKBvUZ60ritdW+EWnr7g=;
 b=gvOyf5t2epwIy3CQvNhQBPbIs2QT0OCLdG5TB6sIRX7CqUAisqIkGeUIHouTdo2IeW
 fbqmQ2uZLqUYObH9kMMTFYCYiLeN9PpYcVVmKYhN6BsYqdGffFg9F+/hEHr9MMI7ifc0
 Kbnc7zP3ETRX7/ichdZKr9u+F4YB4CK4HzobDUVWXefcrQUzO6c0KUbx237oVj7xG9eY
 98ZUD3QgJptFreeCWoW1BS9cuNF4yIFchPsRoOEVLdEqP75pOSsF+CTkS24O5y+LmDcK
 VBa2J9UILy5gfJ5Ln2X34F9rT8VBzZgZWhrlT4Qj51063gJO1tK+iRc4326enjpKgfav
 F2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343982; x=1733948782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhKSMfIut/lDTwvjTF8AW4idKBvUZ60ritdW+EWnr7g=;
 b=mUDxfZM2jpryHph2c2/UWt08leo9l7V0Os7mz4WVgHeo6X6uO5cQw+rFiUAl0L8xL0
 KoMXuroB1yjc0PIWKhNFOFPZPFp0bC5ODy5l5SFWpqon8l6bhX0PIdBO1al+4yMvYCbc
 thJhBzp5l9G8bPVE4wmNfyrCjexUFw0K2rOwKnUegP1dk5z5QwPOsms7tH+XgZXBaSj8
 MoihYsJ0osyfW4dkoM8K8rnCa6QXRvTRjt30xjLNN1EcxPaNOAdmFdWtA73JGgx3Cr1R
 a9DUn/KrqfSeAR9i7zdbdWNPyLSXlNXbhUoGBXvLEkTAipDXp7xBQ12FkSIBIZCAwo72
 zCKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi6fI6SkY1wsWjS65lBonSEPyh+EUR8bqm5z2gdMhA0hnfBSvBdjgz3Aa40GaCfA8N0Pa39PpcmBZw@nongnu.org
X-Gm-Message-State: AOJu0Yztp3VaXA2FN39/1Jub98EeKb0qRdZY7T+8DU3nJLNJHnDq38D1
 mV3OP4H8nDD5BzZuh4eW6DBTTvJyIP5JmM2cHBGF092iheqH4TV0giKNcgrtcpI=
X-Gm-Gg: ASbGncvofDMdaa3CJ5gg50HgGkwqngNuuolniGarLaN+LZbFbyLol8E4VJKHJEn9Kfh
 VFtVrRuLl4SgxL2hrY37o0j1yAaFVpUQUiM2dx8HGzRY91EXdnM8mXuAKYSs/MgOsLPfkbiRTPL
 57LzVDVlHpP5Q4MF8KGOrx/tQhr0rW+TeDClO46u0UTOuQicj4/tAZGASWrAAkbJ2FmdUjAOlJJ
 EfHwGeRl/usbxH22IpPmk7mw51C+iJpU4ckVQjRD3+bCrsXfqRUf1Tvect8hoEmrHlQZTnbCpjF
 zFABBqyNTbxgwfUhTi0R0C6R
X-Google-Smtp-Source: AGHT+IFJ+SOgmlgPnyukKmZpFbfdSn4zZ5sGZ1LRydSUp9JlgocOPOE3nd3fyAnpHvKcXu5besp78g==
X-Received: by 2002:a05:6000:4411:b0:385:ded5:86f0 with SMTP id
 ffacd0b85a97d-385fd3e797bmr3942400f8f.19.1733343982632; 
 Wed, 04 Dec 2024 12:26:22 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d7611af2sm17657530f8f.22.2024.12.04.12.26.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/20] target/arm: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:45 +0100
Message-ID: <20241204202602.58083-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

arm_cpu_virtio_is_big_endian() already returns whether
the data path is in big endian. Re-use that.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6938161b954..3061b2ac18c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1132,7 +1132,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
 #endif
 }
 
-static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
+static bool arm_cpu_datapath_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -2664,7 +2664,7 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
-    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
+    .virtio_is_big_endian = arm_cpu_datapath_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -2709,6 +2709,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
+    cc->datapath_is_big_endian = arm_cpu_datapath_is_big_endian;
     cc->has_work = arm_cpu_has_work;
     cc->mmu_index = arm_cpu_mmu_index;
     cc->dump_state = arm_cpu_dump_state;
-- 
2.45.2


