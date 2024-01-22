Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC41EC46CD2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 22:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS2aC-0004pf-6f; Mon, 22 Jan 2024 17:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2Zz-0004mu-RG
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:43 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2Zy-0005uW-CO
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:43 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5cdfed46372so3436875a12.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705961741; x=1706566541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzHL8aJDpNvMBJ2WBWw1qBXQpPaYiy2l39AZTY8wyvQ=;
 b=iuKOMvdXhVRrMPHY1vS1xuCSkKWfzDw98+EhppFz+AKMyNcnodpVhefWAMXzKhn+RZ
 LlZu3CtLvrNe31qdC11aBlM4EEdF5GPZKg5WfVFgUFQ1j2RChEIv0RE4Qx01RTLTZFr4
 BaqyNGM9iMZEZsKs1IMN9r+PjlcRbDyiTmtPeGVspr6TmSL5+sXp89EinOsxeAlX+xnm
 w6tO7buYiFneFgaR4CmVkxkzW7OXk1gkMez7Zs5gqcx8Llmcmrhf70bny0aQFmBIekca
 R986YN2BjMfaLBcKoFGEuQsAqXS+ilk+A8LrYdhGB6BkC6S924lTonqXLoHt/1iH7BM2
 YBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705961741; x=1706566541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzHL8aJDpNvMBJ2WBWw1qBXQpPaYiy2l39AZTY8wyvQ=;
 b=gj1McIs71EkO52AKAuxcvBmgUBR36nihHcK49lyY982vUr8+FAlGSJaOAhIkOjrs3z
 vjR7OGvAkcqew2L5VVOTJ82C+ZRtNPokqt1hNmx4Bx2IyMGscCylKPHDom5QfdEJyGv5
 V2Apnu8tFVYHdmfDLrkkvgdLx2m17HtD4Tj22BoeSDXbKFzOcg9bUhN/uAN4Ry+lgNIf
 C6MHr3U9KbxX2TV3aA75NfYPo/K0HKT4iE9iPQqarv9JZssWOGz8LqoawO3alMZjZv2s
 hzW+7G+YHaHcmlfFOpZ3VgesX/bj4XX91HtzWVmMWtp9+FcMudbGVHz8eeRByJ1VOp/L
 n5Tg==
X-Gm-Message-State: AOJu0YxO6+yz5vzTmpSDLj4wC3jvNtmFD9YSK+xZAOo2Uqo89p21H2E/
 BytSeFjJLVLx8q7sAJCs9u6bbS5ynBmiP3pdi6mbmro/rFQY95IPB9sy+lL5zqk=
X-Google-Smtp-Source: AGHT+IGzsf37BmxGv7KeuB1LO0dV+L3lL+X9Y8JQx+fmpMyYbXTJosc/Eamursw+m9Hv82BYymEMdg==
X-Received: by 2002:a17:902:650e:b0:1d5:efcb:3cd1 with SMTP id
 b14-20020a170902650e00b001d5efcb3cd1mr4636841plk.81.1705961741183; 
 Mon, 22 Jan 2024 14:15:41 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d7338977e6sm4029104plb.223.2024.01.22.14.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:15:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/7] hw/riscv/numa.c: use g_autofree in
 socket_fdt_write_distance_matrix()
Date: Mon, 22 Jan 2024 19:15:24 -0300
Message-ID: <20240122221529.86562-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122221529.86562-1-dbarboza@ventanamicro.com>
References: <20240122221529.86562-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52a.google.com
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

Use g_autofree in 'dist_matrix' to avoid the manual g_free().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index d319aefb45..cf686f4ff1 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -167,7 +167,8 @@ void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
 void riscv_socket_fdt_write_distance_matrix(const MachineState *ms)
 {
     int i, j, idx;
-    uint32_t *dist_matrix, dist_matrix_size;
+    g_autofree uint32_t *dist_matrix = NULL;
+    uint32_t dist_matrix_size;
 
     if (numa_enabled(ms) && ms->numa_state->have_numa_distance) {
         dist_matrix_size = riscv_socket_count(ms) * riscv_socket_count(ms);
@@ -189,7 +190,6 @@ void riscv_socket_fdt_write_distance_matrix(const MachineState *ms)
                                 "numa-distance-map-v1");
         qemu_fdt_setprop(ms->fdt, "/distance-map", "distance-matrix",
                          dist_matrix, dist_matrix_size);
-        g_free(dist_matrix);
     }
 }
 
-- 
2.43.0


