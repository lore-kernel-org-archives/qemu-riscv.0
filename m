Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81B5C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTP-0002tj-9J; Fri, 05 Jan 2024 10:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRj-0007Fj-Ee
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:21 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRg-0007rb-0f
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e384404e7so8501275e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469753; x=1705074553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjTvneZAUBkosxG1nWDJT6FQx8ULASKYfEukRB1XIpY=;
 b=bSQdDuDMsgO/iZ7Fv9m7PW1eB1csUPd557FC0hOWYAaQUFFp4CgsNcrld3qtjxo33U
 5xl0ooX9IAXb9CkG+vfzsd1r7askWZsZ0TEIfq+cVAZyWJXK3zSAjPCSMihaEgdKdCbq
 CrzC0L0+LF8+UM6muz9jwO05cZwZBuvfNCMUp4wi4H8sWFL25wfyu25T8gDso1w7m716
 /Y4FNurtrXC0vdtBfRHO5+8u+NXAfGDrnIzAOVCBvyMf/NSExPf+ZLflb1DkMtvY3Cn7
 SckIjMm2AWqtqtrOcnUfsS3DAl5kYIDKkToDANQWK5+TNOm526/PRjTZgsgOppk2zYRn
 k+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469753; x=1705074553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjTvneZAUBkosxG1nWDJT6FQx8ULASKYfEukRB1XIpY=;
 b=Zn14jR5V8ltUUS4hrANIusDAarKnjyv8dkcNtzpy19oA3kvn1GEK3nA81Y/ZKC8vDU
 PHL2oehVAp3oWhTjiooPQDQNwqnL2jCb3AOG0/eOUNFvR6R3dCNaEtVkQ+vJMUTL5GZU
 AJtm6H7OEtlRXKXVpuF2pgvM2yZlmH7E4+3/35Zchq0FuDq9kzUq8s0E65VUcEwNAqFT
 PpqfwnPB3UMx4EtXMPQkA95D+3elCYj171+8Vyxv7kMuTXidq4pC16HaNnjTbHJUsV5u
 vrFd4ZB6aITw2K+QAgkL6vf/rR81VMSJ3s+hgowIhTa8Q8NLP09N/H1V84+jCDpGFXe+
 s4fA==
X-Gm-Message-State: AOJu0YyubZo0lKCrWSC0tZDY05gJzMBtH3HqhcQNZfTHbl5suVg/igJx
 w7msBeisOLKl/dNyniaGanogpgPO1J4AWg==
X-Google-Smtp-Source: AGHT+IGG3nrZw0R33ZdCdnMyPFIMVtpJdwa2QHtsYkDw8jf9KUPt1o7tF7B/jmDhhVLe/I1ue141zg==
X-Received: by 2002:a05:600c:3b1d:b0:40d:91fd:74e with SMTP id
 m29-20020a05600c3b1d00b0040d91fd074emr1369672wms.15.1704469753430; 
 Fri, 05 Jan 2024 07:49:13 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040d6d755c90sm1937955wmq.42.2024.01.05.07.49.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 59/71] backends: Have HostMemoryBackendClass::alloc() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:52 +0100
Message-ID: <20240105154307.21385-60-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
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

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have HostMemoryBackendClass::alloc
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-17-philmd@linaro.org>
---
 include/sysemu/hostmem.h | 10 +++++++++-
 backends/hostmem-epc.c   | 11 +++++------
 backends/hostmem-file.c  | 19 ++++++++++---------
 backends/hostmem-memfd.c | 10 +++++-----
 backends/hostmem-ram.c   |  9 +++++----
 backends/hostmem.c       |  5 ++---
 6 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 39326f1d4f..0e411aaa29 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -47,7 +47,15 @@ OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
 struct HostMemoryBackendClass {
     ObjectClass parent_class;
 
-    void (*alloc)(HostMemoryBackend *backend, Error **errp);
+    /**
+     * alloc: Allocate memory from backend.
+     *
+     * @backend: the #HostMemoryBackend.
+     * @errp: pointer to Error*, to store an error if it happens.
+     *
+     * Return: true on success, else false setting @errp with error.
+     */
+    bool (*alloc)(HostMemoryBackend *backend, Error **errp);
 };
 
 /**
diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 3ceb079f9e..735e2e1cf8 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -17,7 +17,7 @@
 #include "sysemu/hostmem.h"
 #include "hw/i386/hostmem-epc.h"
 
-static void
+static bool
 sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     g_autofree char *name = NULL;
@@ -26,21 +26,20 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
-        return;
+        return false;
     }
 
     fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
     if (fd < 0) {
         error_setg_errno(errp, errno,
                          "failed to open /dev/sgx_vepc to alloc SGX EPC");
-        return;
+        return false;
     }
 
     name = object_get_canonical_path(OBJECT(backend));
     ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED;
-    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
-                                   name, backend->size, ram_flags,
-                                   fd, 0, errp);
+    return memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
+                                          backend->size, ram_flags, fd, 0, errp);
 }
 
 static void sgx_epc_backend_instance_init(Object *obj)
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index fe8c481f8f..ac3e433cbd 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -36,12 +36,13 @@ struct HostMemoryBackendFile {
     OnOffAuto rom;
 };
 
-static void
+static bool
 file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
 #ifndef CONFIG_POSIX
     error_setg(errp, "backend '%s' not supported on this host",
                object_get_typename(OBJECT(backend)));
+    return false;
 #else
     HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
     g_autofree gchar *name = NULL;
@@ -49,11 +50,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
-        return;
+        return false;
     }
     if (!fb->mem_path) {
         error_setg(errp, "mem-path property not set");
-        return;
+        return false;
     }
 
     switch (fb->rom) {
@@ -65,18 +66,18 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
         if (!fb->readonly) {
             error_setg(errp, "property 'rom' = 'on' is not supported with"
                        " 'readonly' = 'off'");
-            return;
+            return false;
         }
         break;
     case ON_OFF_AUTO_OFF:
         if (fb->readonly && backend->share) {
             error_setg(errp, "property 'rom' = 'off' is incompatible with"
                        " 'readonly' = 'on' and 'share' = 'on'");
-            return;
+            return false;
         }
         break;
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     name = host_memory_backend_get_name(backend);
@@ -86,9 +87,9 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
     ram_flags |= RAM_NAMED_FILE;
-    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
-                                     backend->size, fb->align, ram_flags,
-                                     fb->mem_path, fb->offset, errp);
+    return memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
+                                            backend->size, fb->align, ram_flags,
+                                            fb->mem_path, fb->offset, errp);
 #endif
 }
 
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index db28ab5a56..3923ea9364 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -31,7 +31,7 @@ struct HostMemoryBackendMemfd {
     bool seal;
 };
 
-static void
+static bool
 memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
@@ -41,7 +41,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
-        return;
+        return false;
     }
 
     fd = qemu_memfd_create(TYPE_MEMORY_BACKEND_MEMFD, backend->size,
@@ -49,14 +49,14 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
                            F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL : 0,
                            errp);
     if (fd == -1) {
-        return;
+        return false;
     }
 
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
-    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
-                                   backend->size, ram_flags, fd, 0, errp);
+    return memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
+                                          backend->size, ram_flags, fd, 0, errp);
 }
 
 static bool
diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index 0a670fc22a..d121249f0f 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -16,7 +16,7 @@
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
 
-static void
+static bool
 ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     g_autofree char *name = NULL;
@@ -24,14 +24,15 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
-        return;
+        return false;
     }
 
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
-    memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
-                                           backend->size, ram_flags, errp);
+    return memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend),
+                                                  name, backend->size,
+                                                  ram_flags, errp);
 }
 
 static void
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 1723c19165..3f8eb936d7 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -331,9 +331,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
     if (!bc->alloc) {
         return;
     }
-    bc->alloc(backend, &local_err);
-    if (local_err) {
-        goto out;
+    if (!bc->alloc(backend, errp)) {
+        return;
     }
 
     ptr = memory_region_get_ram_ptr(&backend->mr);
-- 
2.41.0


