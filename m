Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854B3C46CA0
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:39:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwO-0003uG-SX; Mon, 27 Nov 2023 06:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwN-0003tS-BW
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:15 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwL-0005KV-No
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:15 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3b85c88710eso1122101b6e.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085090; x=1701689890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4laNBhxjdOpN77Tvpdchd1EPt51g2nh+UO7IavgEcW0=;
 b=RK/R6uieFmz4KkoT+t1uqVd3GlWFq1RVURPqlfOh9pBWD8/DKFkgXeyb8w+37kEhaV
 m4sFRztPxBGjHwRdKi+E/JCD/0aPdOi6pbNfdz4o8iD7MQat0rBgAoWU27p2XuikB9Sq
 DpJQhLJjwVifHxeU1n5jNjoFYDroPnH5V+YujR/0djlVRRrIIElw6zyWfxs/uZVoLxKP
 NXPVxXdYnrAUBWQUn+cNT4Mp5olifESS8F0CGDciynXRASQCKycpoo6R+bQlMigDfpyl
 2SS+lR8FsjUmTJUgjYZSMp+nRIcF3ikS/BQTLQ1IYzrI8M5wAfPAbvJlaCCIX0OFzzlc
 g1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085090; x=1701689890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4laNBhxjdOpN77Tvpdchd1EPt51g2nh+UO7IavgEcW0=;
 b=ezQknBMI2GTVOCZjz8QI0pmKFZwthJyRFe6+imTvmzlMDo85c7Z7NIPgLmxEKVXx+2
 5msSE/OZ273HYMBaZkfwmm6VK/kHZ9NmejDmx3Nm7EhyZ7hWbTDOvky/PuLrKOZCnFor
 OT77NcPkCaBPHa8V3w8O4ZlJAcdezK82IE2UsIceya4k+0SPMCRRF2m8K1GsO8yaYK7x
 TzcHHkOpyxjeNqUOaPJSO/jv7hPJrBrEFeI9F9HDwAUqYiwCoyFNdgMMN38vj2SsM+3x
 yGQvqwizHkSPZ36IK0vn3svVuW3AL+udwBhMhhbJzxQv6nXN43mMkbAW3qjwDeV8YPa8
 aAAA==
X-Gm-Message-State: AOJu0YzHphn7wKBMusXx1NrAVIeGTkNNEZeyyEhK2iSlkowh1unBWqSn
 lZ5iXPfQMxSVPfgiDJdVFVzf++YHvoMkZJBRtw8=
X-Google-Smtp-Source: AGHT+IEyJTK/0jwx7bM228cf01Q7fKLr1kfNQnjq6w/q78iiJG+lJWoJ2+SLpYADmuR/SssORL9APQ==
X-Received: by 2002:a05:6808:1304:b0:3b2:f431:e02d with SMTP id
 y4-20020a056808130400b003b2f431e02dmr14712138oiv.26.1701085090711; 
 Mon, 27 Nov 2023 03:38:10 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 4/8] target/riscv/cpu.c: add riscv_cpu_is_32bit()
Date: Mon, 27 Nov 2023 08:37:48 -0300
Message-ID: <20231127113752.1290265-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Next patch will need to retrieve if a given RISCVCPU is 32 or 64 bit.
The existing helper riscv_is_32bit() (hw/riscv/boot.c) will always check
the first CPU of a given hart array, not any given CPU.

Create a helper to retrieve the info for any given CPU, not the first
CPU of the hart array. The helper is using the same 32 bit check that
riscv_cpu_satp_mode_finalize() was doing.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 7 ++++++-
 target/riscv/cpu.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a395c77bda..2b79fe861b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -53,6 +53,11 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
 #define BYTE(x)   (x)
 #endif
 
+bool riscv_cpu_is_32bit(RISCVCPU *cpu)
+{
+    return riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+}
+
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
@@ -980,7 +985,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 #ifndef CONFIG_USER_ONLY
 static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
 {
-    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+    bool rv32 = riscv_cpu_is_32bit(cpu);
     uint8_t satp_mode_map_max, satp_mode_supported_max;
 
     /* The CPU wants the OS to decide which satp mode to use */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1f34eda1e4..485d2da3c2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -695,6 +695,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
 void riscv_cpu_update_mask(CPURISCVState *env);
+bool riscv_cpu_is_32bit(RISCVCPU *cpu);
 
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
-- 
2.41.0


