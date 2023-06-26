Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1079EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 22:09:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDuJQ-0005ZE-Hd; Mon, 26 Jun 2023 18:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIb-0002rf-SH
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:03:10 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIY-00061a-1S
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:03:05 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1b059dd7c0cso281773fac.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 15:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687816980; x=1690408980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dZf0bHV2ecRquP8KRWA8WZf3bgneo60hnPq8BK9ie4=;
 b=UuBrzH4GRkTL5vAyoPG4XFOfsi+zc/ZgO9iVGfYdNFloW3AGssJbitqOt+e6YHEK4S
 2mcdjxg2CyEJYR9ihN+j8vUNgFPVCZbAHh5Yg9JL583/rkfma/PbkHwlG46VjxU7F71Q
 SdJrLwS0YDCCfzkCW55uL/OWUwgDWTCC4nTRWz+PPr/DNJa09Cr+gkX/fYDxTxByXqUz
 +j9DmqGcMUckj1zcbUuHy9AWU7+doCHbbpY8jweM/1dGUkP8jq5dWGM74z1IA1Jsg0kJ
 UWYjMFIj536hzTaN3lBucsDirGJdNXHOpEFnz5q6EvDuDL2KZdx6P1qmdBZd0NenJfrh
 6V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687816980; x=1690408980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dZf0bHV2ecRquP8KRWA8WZf3bgneo60hnPq8BK9ie4=;
 b=ZzQ1GxcREJQfVuLtyoMFTa1zDgXeC5WM1e2zfq7dkdwzoz7VvRnG70i53KhhoMTiaR
 YX6NsKi3hP9t2gXKPTUdwogDS2Fqif44KiIMr21oecYhV/rgM2szmPSrruczL2cH+uZS
 O1CdYXUIciATSKg9P0CHA94zdwHfdbP1j9BtxvGmKP8awn9mtuoRWGFWOsvLuaRXnQ41
 vnf94CGO64PDrTqQf9bPpDDhzdBxJ2993XELNwyWLDvAaOL/398prE2yOxUqW9nFnz/R
 hshli57dytgw0WWIRRlFgiWH4UDq1BbOTcsJ5LKWqWppJUHcUYKM4DvH9kOaeudY+Im+
 rFEg==
X-Gm-Message-State: AC+VfDzbn+Tr2vZIXqi6MHEwepgati1IkplFqOppyOLkJnYgUOi7j+Te
 Nmo2N+S6Q9ZOgo/Qgo9dpFT8/w==
X-Google-Smtp-Source: ACHHUZ5Wp1+etJEirlbr5Oc7/F3jG1kHOPDjIWt0dpm160pDwYvgug2AhJwMn0NvvVLDCZf06BhlHg==
X-Received: by 2002:a05:6870:1986:b0:1a9:8c0f:7a5 with SMTP id
 v6-20020a056870198600b001a98c0f07a5mr20389829oam.3.1687816980579; 
 Mon, 26 Jun 2023 15:03:00 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056870a10c00b001b03fbfa0c5sm1831419oae.39.2023.06.26.15.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 15:03:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 16/19] target/riscv/cpu.c: create KVM mock properties
Date: Mon, 26 Jun 2023 19:02:06 -0300
Message-ID: <20230626220209.22142-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626220209.22142-1-dbarboza@ventanamicro.com>
References: <20230626220209.22142-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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

KVM-specific properties are being created inside target/riscv/kvm.c. But
at this moment we're gathering all the remaining properties from TCG and
adding them as is when running KVM. This creates a situation where
non-KVM properties are setting flags to 'true' due to its default
settings (e.g.  Zawrs). Users can also freely enable them via command
line.

This doesn't impact runtime per se because KVM doesn't care about these
flags, but code such as riscv_isa_string_ext() take those flags into
account. The result is that, for a KVM guest, setting non-KVM properties
will make them appear in the riscv,isa DT.

We want to keep the same API for both TCG and KVM and at the same time,
when running KVM, forbid non-KVM extensions to be enabled internally. We
accomplish both by changing riscv_cpu_add_user_properties() to add a
mock/no-op boolean property for every non-KVM extension in
riscv_cpu_extensions[]. Then, when running KVM, users are still free to
set extensions at will, we'll treat non-KVM extensions as a no-op, and
riscv_isa_string_ext() will not report bogus extensions in the DT.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b65db165cc..ad4b0e3490 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1720,6 +1720,22 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+
+static void cpu_set_cfg_noop(Object *obj, Visitor *v,
+                             const char *name,
+                             void *opaque, Error **errp)
+{
+    const char *propname = opaque;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    error_setg(errp, "extension %s is not available with KVM",
+               propname);
+}
+
 /*
  * Add CPU properties with user-facing flags.
  *
@@ -1738,9 +1754,27 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        /* Check if KVM didn't create the property already */
-        if (object_property_find(obj, prop->name)) {
-            continue;
+        if (riscv_running_kvm()) {
+            /* Check if KVM didn't create the property already */
+            if (object_property_find(obj, prop->name)) {
+                continue;
+            }
+
+            /*
+             * Set every multi-letter extension that KVM doesn't
+             * know as a no-op. This will allow users to set values
+             * to them while keeping their internal state to 'false'.
+             *
+             * We're giving a pass for non-bool properties since they're
+             * not related to the availability of extensions and can be
+             * safely ignored as is.
+             */
+            if (prop->info == &qdev_prop_bool) {
+                object_property_add(obj, prop->name, "bool",
+                                    NULL, cpu_set_cfg_noop,
+                                    NULL, (void *)prop->name);
+                continue;
+            }
         }
 
         qdev_property_add_static(dev, prop);
-- 
2.41.0


