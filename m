Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A743BC47DDC
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 22:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS2aA-0004pN-7M; Mon, 22 Jan 2024 17:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2a3-0004ny-6b
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:48 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2a1-0005v6-Av
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:46 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5cec32dedf3so1842322a12.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 14:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705961744; x=1706566544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXJkelt17p21iChlHdyIQJpyyWudaM9AOBguHLeeMgQ=;
 b=lp7lBg0KgWu7fwwE4/vN/jAoWT+vfwdO+9Yiz+Jw6gjMNJIX80cBbp2d+ABEz6ZIMO
 g3SNvinrbjhXGgr1CNMlVL9oYUQ5G/qQK/Z4LjWEeDSt7Rf35JWAWgwDq/IfF6QvbNQa
 YkhkBWY5+dgWbeflRmMFouVIOzMJ0eb5EuAf7HFt0U82QLIFpgXfWd/U5klbuZdyQSBK
 ei49dqui62X1MQJwyPb2D1fRZi3qlRkz3IhGqTCP6AxcPOvcuimUN+2kuf2U+2dX3a74
 FsXkG6Tkh5D/ZeEcPqNc9OWEIzKoHi2ZlDPZN0NBEAItBiT4NHZzJqIaQRejnu72y9Py
 ulFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705961744; x=1706566544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXJkelt17p21iChlHdyIQJpyyWudaM9AOBguHLeeMgQ=;
 b=XuJnEX3MGKB5ZhurYuZnWL/KMlLLB94+s0fu/96U+jgGShnf3wJkryh731XMWae6cr
 v9re8Iq8CcFmxqO2VQAo2tIJOyY+eXlBmRk40QqTmZMuyKJjNEQNWpohk8TDsfSdjOn8
 dydTSUjlxaAiPmaLJhUzzC5a93a6VLS0GswCF9W1l9kg/SgmdjWzzyvPZuXlTxu1tL8N
 VOK2vx1p/JS4+pSXmOfvyU42Zk+tFFqQEjr19EHkoc+JrYQ3a9S8tETjIcnUbIQYP57M
 Ibty3YyHnp0rPqI93/TVgfGuG8PJHkb0UaoELIyuBkLUucAGvfcJ68fub9Fx7+jEzQWh
 TOzA==
X-Gm-Message-State: AOJu0YzBIXMY4n251xyxyHLi/x7JIAstJ844LzSQgd48dK5rENTPBhzC
 /f2K2he+CMxWly0xIftWoKpMMCqLOj+VOmFgYKWQ5xTS7N/65dZehqqq9Ab21Y8=
X-Google-Smtp-Source: AGHT+IHbmrRzoDHuMPAm+9RhG728+lpTXnTIbB5f/SqVjXPWWMy/EmeBdxl0eXAAmPSKdisro603Ag==
X-Received: by 2002:a17:902:ea92:b0:1d6:ee5c:42c2 with SMTP id
 x18-20020a170902ea9200b001d6ee5c42c2mr2027491plb.115.1705961744093; 
 Mon, 22 Jan 2024 14:15:44 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d7338977e6sm4029104plb.223.2024.01.22.14.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:15:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/7] hw/riscv/virt.c: use g_autofree in
 create_fdt_socket_cpus()
Date: Mon, 22 Jan 2024 19:15:25 -0300
Message-ID: <20240122221529.86562-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122221529.86562-1-dbarboza@ventanamicro.com>
References: <20240122221529.86562-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52b.google.com
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

Move all char pointers to the loop. Use g_autofree in all of them to
avoid the g_free() calls.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f9fd1341fc..373b1dd96b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -215,12 +215,16 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *ms = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
     uint8_t satp_mode_max;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
+        g_autofree char *name = NULL;
+        g_autofree char *cpu_name = NULL;
+        g_autofree char *core_name = NULL;
+        g_autofree char *intc_name = NULL;
+        g_autofree char *sv_name = NULL;
 
         cpu_phandle = (*phandle)++;
 
@@ -233,12 +237,10 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
             sv_name = g_strdup_printf("riscv,%s",
                                       satp_mode_str(satp_mode_max, is_32_bit));
             qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
-            g_free(sv_name);
         }
 
         name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
-        g_free(name);
 
         if (cpu_ptr->cfg.ext_zicbom) {
             qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
@@ -277,10 +279,6 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
         qemu_fdt_add_subnode(ms->fdt, core_name);
         qemu_fdt_setprop_cell(ms->fdt, core_name, "cpu", cpu_phandle);
-
-        g_free(core_name);
-        g_free(intc_name);
-        g_free(cpu_name);
     }
 }
 
-- 
2.43.0


