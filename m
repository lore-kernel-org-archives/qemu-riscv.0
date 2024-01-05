Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8C6C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:52:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmSY-0000dm-2u; Fri, 05 Jan 2024 10:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRX-00064A-2L
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRT-0007JN-Rw
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d3c4bfe45so14949955e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469742; x=1705074542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MHct3O8aNA/2/UVwnbSfbe+2Bg3uf1okl2NSMgEytw=;
 b=RDI1RcxaxyKuatpifuVlVk6C8weM19gQADJK+wWa/W8BqYpddrTeT39IE8QJ04aJ1Q
 o+7WitPm8Qj++IzirnQ1Qa3zC8eMvjp827JfBQbuk7ABH4xnY07Ki71DL51XhtxoDQ3M
 wgtbbJ7vQVBEL//1D+a6Sy0cy2ewN5LUCs/8akLrgUvb5BCT5R1pxMJ384O6nP1DN6Ds
 wct+R5/zeElK2Tj693/ZdvdqkNwTtbN/PVKDu3phXgTDvEoBFl8EhiuiLEEgRD100H0G
 K56bgZ4UaRf8oFvCQ0BUKAwh+oQ8nyGitPySgZZlHE/3rOQnAcQIBSo/TXmEP5pHM7WH
 oqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469742; x=1705074542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/MHct3O8aNA/2/UVwnbSfbe+2Bg3uf1okl2NSMgEytw=;
 b=grEQJjoq7UY41ED61pz5hTY02HnVGtrFd8J6ROcBkew/G1KIwtZUOgCGV/kcH0lFs7
 ymkq2YDTioFFzJ0ZytIoG8MFYpOa5AkRbCzwASgxpRpW/a4lxi60e38XON7SKBsVpGDn
 mwLZIT6WcFV6qkiA24Mob6PmDMD/sj/h0EwywJvk7HygHhJ471nwmh2n5G5Pw8NsHBjR
 lyCiXMamsxsz9K027yBjdGUv+ZF9+YHF2MJXp/oV+V6AI0+qA5ItA09h5Ov9D1AaqiVt
 Sojvp2M5O59xVolz2SPaZRQC/JtlBipp5WXqtHbKKUTC+3GUQkeHVhCjwJtuKpXqqh3L
 ld9A==
X-Gm-Message-State: AOJu0YzxbshiIxgmVkOb994zw85FTBLuBd38zSEiCXTXActtlLY4MW4u
 CbkeD1hyavlCbIlIAwPKevfVcJ4YFj4A3DpHTli/iI0fWoA=
X-Google-Smtp-Source: AGHT+IG35Z/WWepcpJQlDLc8Yz929kiQtEAc/ue2/HLQPw811nDvSsd1ILxh7He87dMaKA/zAJp4YA==
X-Received: by 2002:a05:600c:4583:b0:40c:a5b:d28b with SMTP id
 r3-20020a05600c458300b0040c0a5bd28bmr634654wmo.86.1704469742377; 
 Fri, 05 Jan 2024 07:49:02 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4c86000000b00337464bf723sm1611623wrs.18.2024.01.05.07.49.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 57/71] backends: Use g_autofree in
 HostMemoryBackendClass::alloc() handlers
Date: Fri,  5 Jan 2024 16:42:50 +0100
Message-ID: <20240105154307.21385-58-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

In preparation of having HostMemoryBackendClass::alloc() handlers
return a boolean, have them use g_autofree.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-15-philmd@linaro.org>
---
 backends/hostmem-epc.c   | 3 +--
 backends/hostmem-file.c  | 3 +--
 backends/hostmem-memfd.c | 3 +--
 backends/hostmem-ram.c   | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 4e162d6789..3ceb079f9e 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -20,8 +20,8 @@
 static void
 sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
+    g_autofree char *name = NULL;
     uint32_t ram_flags;
-    char *name;
     int fd;
 
     if (!backend->size) {
@@ -41,7 +41,6 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size, ram_flags,
                                    fd, 0, errp);
-    g_free(name);
 }
 
 static void sgx_epc_backend_instance_init(Object *obj)
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 361d4a8103..fe8c481f8f 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -44,8 +44,8 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
                object_get_typename(OBJECT(backend)));
 #else
     HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
+    g_autofree gchar *name = NULL;
     uint32_t ram_flags;
-    gchar *name;
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
@@ -89,7 +89,6 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
                                      backend->size, fb->align, ram_flags,
                                      fb->mem_path, fb->offset, errp);
-    g_free(name);
 #endif
 }
 
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 3fc85c3db8..db28ab5a56 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -35,8 +35,8 @@ static void
 memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
+    g_autofree char *name = NULL;
     uint32_t ram_flags;
-    char *name;
     int fd;
 
     if (!backend->size) {
@@ -57,7 +57,6 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
                                    backend->size, ram_flags, fd, 0, errp);
-    g_free(name);
 }
 
 static bool
diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index b8e55cdbd0..0a670fc22a 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -19,8 +19,8 @@
 static void
 ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
+    g_autofree char *name = NULL;
     uint32_t ram_flags;
-    char *name;
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
@@ -32,7 +32,6 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
                                            backend->size, ram_flags, errp);
-    g_free(name);
 }
 
 static void
-- 
2.41.0


