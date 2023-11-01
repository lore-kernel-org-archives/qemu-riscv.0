Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE387C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:45:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyI2i-0002WW-4J; Wed, 01 Nov 2023 16:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2g-0002Va-CR
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:22 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2e-0000dk-NR
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:21 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d9ca471cf3aso190256276.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698871339; x=1699476139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QqMbaZ9ZTHkQg0Yfq1IBFSzq4QoXF5VtwzSAbraCcY=;
 b=TBKZWpSKZ/2tRV56wnsiIpk3O8WrrGZEG/psruqKUoIuQlIvtPF4UoKZ1LeMLZeu9t
 t5e5eneq790lIJ1Xp/tTFOMSr/BcTU6KOeBNFAJp22hBidkawnNzqoc3IAjam9d+yGY3
 RMctnYyN+Cl+q+iFlP/V4AIfENXV6IAppeNbdoPPPkF/+XdS/lFpk23ryDaFXHaLfvgz
 SA+FvaneScnDVKYBgivnwJtb7P3JIQf3EBfgFLtKdLxQnV796GprkBwPNArBJp8VxYzR
 8dskGPRS6At1P2L2TgCPdfoeC1sZdYJy8WaOdcdJP19NT9xIYZQuo4rhwD0hJ63N7+cn
 fmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698871339; x=1699476139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QqMbaZ9ZTHkQg0Yfq1IBFSzq4QoXF5VtwzSAbraCcY=;
 b=R++hU/51CFurCZXa2FJ0ZaHQJY+74gaWEPfZbZ8Vznqn7J1TEeno1wa2O/ywi19xj9
 5bZ/QY1aKIbFLwZPtneWD7uqtQVEbrHqZKNsgNS7PRvTS8U3q3ojyBV6Pzb4IvcjLSEq
 K6vlNaUJBEpcBVieTZInJpb8SFl9EgyeaeKkdL+nzX4CV6RbXYYUlbmeaPX7X0WQ82B+
 762LHty/FxanGwoGPjTi8f6lgx75Ql59eOaTPzUBGoVV22v7HiZwIsO19Lr5LcE3nJeL
 yxWydxbbhu4ioSbekwr+MakvY0rMidQHz0IfoBHiqrDZ5ap2dRtwOlJ9jsah6DKJk336
 uNTQ==
X-Gm-Message-State: AOJu0YxE/RhHllwI2KHaAAvNGIU5A9G/qk/7WmjBJREw8DLyeltGOnzT
 8vbB4MqUV53aPLPyyvE1nv62lg==
X-Google-Smtp-Source: AGHT+IH9fe2t8SSf/H4HLOw+H0lQ+HMp2715ocMS6i4YTuxuFF71lF6GlcQ4C4G8B+H+4kIcsm74mA==
X-Received: by 2002:a25:ae11:0:b0:da3:9565:635a with SMTP id
 a17-20020a25ae11000000b00da39565635amr5611851ybj.56.1698871339374; 
 Wed, 01 Nov 2023 13:42:19 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 z187-20020a2533c4000000b00d9cc49edae9sm329724ybz.63.2023.11.01.13.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 13:42:19 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 03/19] target/riscv/cpu.c: set satp_max_supported in
 cpu_riscv_set_satp()
Date: Wed,  1 Nov 2023 17:41:48 -0300
Message-ID: <20231101204204.345470-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101204204.345470-1-dbarboza@ventanamicro.com>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb32.google.com
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

The setter() for the boolean attributes that set satp_mode (sv32, sv39,
sv48, sv57, sv64) considers that the CPU will always do a
set_satp_mode_max_supported() during cpu_init().

This is not the case for the KVM 'host' CPU, and we'll add another CPU
that won't set satp_mode_max() during cpu_init(). Users should be able
to set a max_support in these circunstances.

Allow cpu_riscv_set_satp() to set satp_mode_max_supported if the CPU
didn't set one prior.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 822970345c..9f6837ecb7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1100,6 +1100,7 @@ static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
 static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
     RISCVSATPMap *satp_map = opaque;
     uint8_t satp = satp_mode_from_str(name);
     bool value;
@@ -1108,6 +1109,16 @@ static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    /*
+     * Allow users to set satp max supported if the CPU didn't
+     * set any during cpu_init(). First value set to 'true'
+     * in this case is assumed to be the max supported for
+     * the CPU.
+     */
+    if (value && cpu->cfg.satp_mode.supported == 0) {
+        set_satp_mode_max_supported(cpu, satp);
+    }
+
     satp_map->map = deposit32(satp_map->map, satp, 1, value);
     satp_map->init |= 1 << satp;
 }
-- 
2.41.0


