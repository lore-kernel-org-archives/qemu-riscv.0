Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F276CC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:58:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTI-0001zL-0N; Fri, 05 Jan 2024 10:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRy-0007nz-Cs
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRv-0000Gn-5a
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e36e29685so10250075e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469770; x=1705074570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Woygxb5I84iWcYNaobFk5BQd3UxVH0KFWr0IJtclL9o=;
 b=Ckxd5aEW30HBEabc+kyoDNBFSBgsK9nVKTqm+JR4jlJZiGUiEzLETvaGonHR/xPErY
 v4JYS+DhetyLJ5Lp9XuaeV69NgP/UrjbUjesSPq5e+d1CirGxcH0QFC+NONjtlZp4lU1
 ATEOfPaph8R3nl+29iPXEIWBcJWYnPmQtmHxLaDjnssMb172xzIT/aJauGT9+u9FSJro
 +ajmymCY8Lb4hMG80nG5M/qYaeIPGgT/KlqqVqfEHHmYFRmP+/40vFOEao9aA8SPG0xQ
 addq9KrNO2PuhJfkA7SOpU3qV6pBzvQqRgVMXsiVUYtnJb99S/qtEncycLulbYrkCocW
 6wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469770; x=1705074570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Woygxb5I84iWcYNaobFk5BQd3UxVH0KFWr0IJtclL9o=;
 b=k+AamKBe70wIamvJkySRsGsjjNIMKXd4B26W1NTGQsavVchLsMX45GllyvETT2vTnH
 UAM9rPuWwpLys6JHSlsHVJz/Z7OTKUcIw0eIwaAQgT8o+PWuBW1KpcmbDAcl/mXkmgds
 7irj6Sk5WmLdV9ApcJA8FET8MtJoK6ODsokaJlakmjOGGJPRDwOKsjxIOPaERK99O/h0
 pyUoNpdvuncXF5Bchc3hTxY5XYAo8OTfJGDJ1ML1gackBT/KzeEBVNSelrxF85BjCQKC
 nsEnA130e2guEAeQU0cgo85cgeeyL16T/U06JOLKQc4aPGuzZackf/aYV6mm8WXiss9n
 5z+w==
X-Gm-Message-State: AOJu0YyaUpQ/87Pp35t0/Zea9KZi03IbzJ+b2SERdJXne4QLY2VFgGgv
 J+XKJ+La5q5Fs4Nr09Q96DPXtLmkuwdQGMO8xWXPYd9oOj0=
X-Google-Smtp-Source: AGHT+IFj7g+Jiz/gUa6sy6goPKZ431YyH55zl8uNAkLJs6GWTCq2clGafVgdd1ErZrmHAKEqnxbUWg==
X-Received: by 2002:a05:600c:4fc1:b0:40d:fc98:b88f with SMTP id
 o1-20020a05600c4fc100b0040dfc98b88fmr1258706wmq.49.1704469769865; 
 Fri, 05 Jan 2024 07:49:29 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfd001000000b0033672971fabsm1603944wrh.115.2024.01.05.07.49.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 62/71] misc: Simplify qemu_prealloc_mem() calls
Date: Fri,  5 Jan 2024 16:42:55 +0100
Message-ID: <20240105154307.21385-63-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Since qemu_prealloc_mem() returns whether or not an error
occured, we don't need to check the @errp pointer. Remove
local_err uses when we can return directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-20-philmd@linaro.org>
---
 backends/hostmem.c     | 22 +++++++---------------
 hw/virtio/virtio-mem.c |  6 ++----
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 1b0043a0d9..30f69b2cb5 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -219,7 +219,6 @@ static bool host_memory_backend_get_prealloc(Object *obj, Error **errp)
 static void host_memory_backend_set_prealloc(Object *obj, bool value,
                                              Error **errp)
 {
-    Error *local_err = NULL;
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
 
     if (!backend->reserve && value) {
@@ -237,10 +236,8 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
         void *ptr = memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz = memory_region_size(&backend->mr);
 
-        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
-                          backend->prealloc_context, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
+                               backend->prealloc_context, errp)) {
             return;
         }
         backend->prealloc = true;
@@ -398,16 +395,11 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
      * This is necessary to guarantee memory is allocated with
      * specified NUMA policy in place.
      */
-    if (backend->prealloc) {
-        Error *local_err = NULL;
-
-        qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
-                          backend->prealloc_threads,
-                          backend->prealloc_context, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
+    if (backend->prealloc && !qemu_prealloc_mem(memory_region_get_fd(&backend->mr),
+                                                ptr, sz,
+                                                backend->prealloc_threads,
+                                                backend->prealloc_context, errp)) {
+        return;
     }
 }
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index dc4709790f..99ab989852 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -605,8 +605,7 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
         int fd = memory_region_get_fd(&vmem->memdev->mr);
         Error *local_err = NULL;
 
-        qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err);
-        if (local_err) {
+        if (!qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err)) {
             static bool warned;
 
             /*
@@ -1249,8 +1248,7 @@ static int virtio_mem_prealloc_range_cb(VirtIOMEM *vmem, void *arg,
     int fd = memory_region_get_fd(&vmem->memdev->mr);
     Error *local_err = NULL;
 
-    qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err);
-    if (local_err) {
+    if (!qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err)) {
         error_report_err(local_err);
         return -ENOMEM;
     }
-- 
2.41.0


