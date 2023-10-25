Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EB5C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:47:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvnZM-00011y-MZ; Wed, 25 Oct 2023 19:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnZ8-0000xE-A7
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:34 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnZ6-0002JL-Fz
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cbf47fa563so2102825ad.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698277531; x=1698882331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDgDvO7i84WdHmQ1CVHYuaunKGbn8YvcKITz/IAnR9E=;
 b=Sw3/+hTjhDhB3pCL8QoiPYCIVxyAFPfQS8IBP3DsEEVXaOI11m0b8wisOH6u0fAjzm
 DYyquvTgA4oyk2kbfTwNiGM25e1ryHyBMLMnaYvgYQy8CPi/6YRDrDrruUR7hPKQIC/y
 GAjnA2N2KdMs3KPXG1SZm0RRrig8b5QHwY8glQvlG8KySVnaLWH4xPI7Ws689Skekqc8
 vM7Mmv2pOzAoaHwsnxZCQ31xz9Rswtjy3jNGaXnCNkC/nNcfkbh0MA8dcZ2RcycOKgvQ
 rxcBgGxObd3f4ZeQ+Q6HLNnjDu+gV7gMJKU9VbjrHnHm9RWyAcMmqiJOGp/DaU7My3ta
 gbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277531; x=1698882331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDgDvO7i84WdHmQ1CVHYuaunKGbn8YvcKITz/IAnR9E=;
 b=YB/9FpYz2b9JRzJib7VbM39lZST4aHnOYx0nqcaSKxMcZ7AMszwaooEEygxmhE+hxu
 AvCm5Y1bicd9+fuGRXAsD45BXUOMFM7VjKE2rCOtp4XXQ7e/fNCCsHzUThtFz33qL1u1
 pC//I1mFNOVHq/unIdtUEZK8pLN0DzdkgpZmEgytPVJbgiPh6k3bChRI7dD0FERKomnM
 1tUUdgftEvn55Nql6amuTysF2GCOX7rd3X7866QB49AfbWeBjLrjz5xDVHYXf1X878bh
 sukrzku6ShQ8y7MQW6xueVokHdH9t3M0+/igOAXnuU7RWNNWLwCBvz9SchpS1VhaQnWY
 FqCA==
X-Gm-Message-State: AOJu0YwkeT75qtAMbhAVAaxvx55FxPAsa9NqDscAl3NyMnHtb5AxQIUJ
 INFOwqqoKRwpAXbPOXcRAE/YSg==
X-Google-Smtp-Source: AGHT+IF9kp0F1/Sin6fhMrS9A9HMXaJeCDXpjBuaDYeDdMDZ3F6EQ0LOttAF/9dwAIKvvbzYh78MMw==
X-Received: by 2002:a17:902:f092:b0:1ca:86b:7ed9 with SMTP id
 p18-20020a170902f09200b001ca086b7ed9mr11311959pla.40.1698277531328; 
 Wed, 25 Oct 2023 16:45:31 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001c736746d33sm9738654plg.217.2023.10.25.16.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 16:45:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 07/10] target/riscv/tcg: handle profile MISA bits
Date: Wed, 25 Oct 2023 20:44:56 -0300
Message-ID: <20231025234459.581697-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025234459.581697-1-dbarboza@ventanamicro.com>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

The profile support is handling multi-letter extensions only. Let's add
support for MISA bits as well.

We'll go through every known MISA bit. If the profile doesn't declare the bit
as mandatory, ignore it. Otherwise, set or clear the bit in env->misa_ext and
env->misa_ext_mask depending on whether the profile was set to 'true' or
'false'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5d96ccb45c..4f4bc58627 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -829,6 +829,19 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if  (!(profile->misa_ext & bit)) {
+            continue;
+        }
+
+        g_hash_table_insert(misa_ext_user_opts,
+                            GUINT_TO_POINTER(bit),
+                            (gpointer)value);
+        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
+    }
+
     for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
         ext_offset = profile->ext_offsets[i];
 
-- 
2.41.0


