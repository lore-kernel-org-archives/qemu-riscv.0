Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D7C47E49
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 22:17:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS2aH-0004r2-5x; Mon, 22 Jan 2024 17:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2a7-0004oi-3r
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:51 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2a4-0005vZ-Tj
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:50 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d7431e702dso10070325ad.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705961747; x=1706566547; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WX7OqCyKznH6Xg+YgqFqeDU+3oQq1TVExI/mQG8+wFY=;
 b=dh0pyy1SBx1XhX3Rlh4NRfnJuwwnPYS9qZZF2NW28RSsWaAayE3tSLHlEp4i2QPSFn
 e9C08FTRJwGk1Mcva3LmSmmEcbbE1HO2QpPV4iaAJ1WuDIValvyu2y2YbDP8bDi6Dlkl
 drxKp8nDxCHEJSXRb9g4RkXmfZWmbm/4jpbbYd3rpgbqWmslqo6essqvpAjtT2l54UPR
 9mkHUuxv+Vut9c2qA0DT4p5PIn2mM8v/d7NivD2m9h/snjEmC43pjuG7KA4/4UDsn3pC
 UixHf94Fa9L9bYs71qRW7cC+drdI/wOB4EtQb7wNj3WRv+v/7dgrm9YYgbQ/o1M3Cd7/
 pNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705961747; x=1706566547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WX7OqCyKznH6Xg+YgqFqeDU+3oQq1TVExI/mQG8+wFY=;
 b=KNvVcRcJkMTZRH7PwzyipxN1680+gzp4OUXwrVVyFzwID9Cy6hnIYxOaxGuPsP2Nz8
 MbsPTKP2CctLRHEmQZHqRChEu/M/eM4NR623NopUOSDWQvLXHoTY4GdDAwLGdb/Z/Q4C
 d99vfD+e3TzsI1jStNSglpeERaNNM2v8axdbpzs/ORGOBtc4Enwf3P6P97beWKkycP+i
 1nOppRnus0oS3zCfHt7/Y7nl6yPZ+OHI6MfRgLklh9rbOUgXoNDq2xSdx82ts7efqBR2
 hwwbz91ccYHKVO6YmdXX0WCHP8cSKjxU2JD/K38q7gwgI9wpPVoWsRvjBL8Q3Y7DsJcz
 zW9w==
X-Gm-Message-State: AOJu0YxEOAD5RiumrHzf+moFojgWrYj0JA1GBXksaK7q2nU4KNXxrAMb
 6uvGGVBMifkrpUCoaIB8T6b3vurDKQKCl+SrB5zEPwUD6KWjCFqGjXTmOV2udrpsFsHe77Vv129
 W
X-Google-Smtp-Source: AGHT+IEUeRkhNeTWUoJFpnmdmj8HsTlZKD7bvdHdJHpp/3Cnr9klbj89tzwsW2Rk0d76hZHPblV3uQ==
X-Received: by 2002:a17:903:2348:b0:1d7:600c:cc3b with SMTP id
 c8-20020a170903234800b001d7600ccc3bmr1352388plh.22.1705961746992; 
 Mon, 22 Jan 2024 14:15:46 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d7338977e6sm4029104plb.223.2024.01.22.14.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:15:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/7] hw/riscv/virt.c: use g_autofree in create_fdt_sockets()
Date: Mon, 22 Jan 2024 19:15:26 -0300
Message-ID: <20240122221529.86562-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122221529.86562-1-dbarboza@ventanamicro.com>
References: <20240122221529.86562-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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

Move 'clust_name' inside the loop, and g_autofree, to avoid having to
g_free() manually in each loop iteration.

'intc_phandles' is also g_autofreed to avoid another manual g_free().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 373b1dd96b..d0f402e0d5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -721,11 +721,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                uint32_t *irq_virtio_phandle,
                                uint32_t *msi_pcie_phandle)
 {
-    char *clust_name;
     int socket, phandle_pos;
     MachineState *ms = MACHINE(s);
     uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
-    uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
+    uint32_t xplic_phandles[MAX_NODES];
+    g_autofree uint32_t *intc_phandles = NULL;
     int socket_count = riscv_socket_count(ms);
 
     qemu_fdt_add_subnode(ms->fdt, "/cpus");
@@ -739,6 +739,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
     phandle_pos = ms->smp.cpus;
     for (socket = (socket_count - 1); socket >= 0; socket--) {
+        g_autofree char *clust_name = NULL;
         phandle_pos -= s->soc[socket].num_harts;
 
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
@@ -749,8 +750,6 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
         create_fdt_socket_memory(s, memmap, socket);
 
-        g_free(clust_name);
-
         if (tcg_enabled()) {
             if (s->have_aclint) {
                 create_fdt_socket_aclint(s, memmap, socket,
@@ -793,8 +792,6 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         }
     }
 
-    g_free(intc_phandles);
-
     if (kvm_enabled() && virt_use_kvm_aia(s)) {
         *irq_mmio_phandle = xplic_phandles[0];
         *irq_virtio_phandle = xplic_phandles[0];
-- 
2.43.0


