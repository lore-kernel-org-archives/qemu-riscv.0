Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B9BD41D6F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 09:14:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tAmwn-0007fr-QW; Tue, 12 Nov 2024 04:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tAmwc-0007Xd-3H
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2024 04:12:19 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tAmwa-0007lx-Cx
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2024 04:12:17 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7240d93fffdso4468463b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Nov 2024 01:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731402735; x=1732007535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2idqT13QPvUk3XVWjtSkj7B7YJJ2J9H2nJZEXZzEVI=;
 b=g4LdPZGOCGgu8mS5v93+0T8icaV7VeSbvSjvz0eKaSBBftYBeN9OB7daT9nFRtreGg
 v6DadDtdPK0blaFj9GhwVpnhsAfremVpwqZvd7Vk8wKuS0KGzVU17hPPQmCKFcKR0DlN
 caEnkLoe4nqL25dKwUGGvcCbKTcDhnZ/39Me/ry4Gbmk2Wcmwg6Gg7aTWm+GpwNfjx9n
 4RcyolSVm0+//cvaUldqotuslXwy7smC2k2Drj6jfkX9as1M9fgLhNayiErvnPpCtJKl
 JZ9NfNd03IUMQhkRjijlM/SlAEv/yNLOGzXDxwLFU+sLmUHqumd3/pr26DCikBJIVnKU
 fMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731402735; x=1732007535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2idqT13QPvUk3XVWjtSkj7B7YJJ2J9H2nJZEXZzEVI=;
 b=s3oP+LD23qZjZ9z8ARxuaZaGYRLcmjVBZ/reIuwbYqvvJVGryVB1SzYXvR3DiuoJC3
 MhL8e0ktrA5D45JAymLoy3MNxt4zkmabr4kR1i50elvO4pZ62kUDQuPKKGOyhL8LRV1k
 vRYRGrKhuRcnPPqrJzEXl+GmC0rcfp/GxaGEBR+KwjggDwMIoLjBfsXftHyoImYc6Cv0
 1A8cKs1wjQyJhGwUBaLCL0+6zX6ytdzp1ms4lpaMtIaN2rYZHIQ9KI73RBbXx7SgcmM2
 DfPIUqZ/JLZ5xESlqKdWLvGuFefn3s5OeznfRDT9KMiVQNoGdS9qZUyzJgfHNZvy9hBu
 xSZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTfPgiLEmaVKevv5yHIeTA5j4Tmjw1AxxZ7ajcoLhw/AYpVSxZfIicKH9aa3RzeeSNHqwf9LHtI1ma@nongnu.org
X-Gm-Message-State: AOJu0YxdXcytjeF+j6XfR0qe8MosrCxwJFyH8Rr/TA70OlQY0w0kjX0z
 jX2RHcxug0yOuDBO0HuokWh1J2fLMf7cq/y2EalZ4QmAtcdANBVA8x93qoB3iSs=
X-Google-Smtp-Source: AGHT+IHoJ2sRzkUZ8/zP31ZvbTnw9jYyNXPIzwNYiN6cZn1zEfAavOFVqO245cT2/0YyWAm3xdDSLA==
X-Received: by 2002:a05:6a20:7f92:b0:1db:92be:1276 with SMTP id
 adf61e73a8af0-1dc228ebf86mr22709910637.6.1731402735058; 
 Tue, 12 Nov 2024 01:12:15 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e99a4f6c96sm13495347a91.2.2024.11.12.01.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:12:14 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 5/5] target/riscv: Expose svukte ISA extension
Date: Tue, 12 Nov 2024 17:14:23 +0800
Message-Id: <20241112091423.2529583-6-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112091423.2529583-1-fea.wang@sifive.com>
References: <20241112091423.2529583-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x433.google.com
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

Add "svukte" in the ISA string when svukte extension is enabled.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f219f0c3b5..6d3e9d563d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -199,6 +199,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
     ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
@@ -1595,6 +1596,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
+    MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


