Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67779EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:20:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM4Z-0006Sg-Uz; Thu, 06 Jul 2023 06:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4W-0006Bc-Ue
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:50 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4V-0007DE-9l
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:48 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b723aedd3dso366599a34.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638726; x=1691230726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYO8DN3m1MPnavyeFk10m4IptueYXgPjsm/ZWKO8tks=;
 b=c/QRBiu4xGsFlIyAbJBYmT9fRnTxPHEW26JEa0I8avlwAnpoEEkyBdO2oOpBg4CDea
 6vjASrpUbJC8qmL5O5WcWqXnn++xYWZFBrhaqMhfTCFENMBqWJhRs4TFxQ4s/X6Zj2cr
 jAMJuSrs9YjD3mYXGDuQeewL6u+rAGWn8InVaD1LPTcwdbAFXZvDF3dFy/Kp4zVpCQUe
 e84R8Fy/XluIIV3GE/5E64FzIUimYNsOEuFoh4dmbRX1v4QZH8vPtSYH83HNnH/gh0zD
 +0ZeqrFGm4h5Y5GsMy4c+gWjJmUzMopRdB6bYEnNd97NB8/q2SdGdGYEwtk+uPKQ5Cbf
 lGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638726; x=1691230726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYO8DN3m1MPnavyeFk10m4IptueYXgPjsm/ZWKO8tks=;
 b=XBTcfWLrepMS2klhewQHtBXqbRdcSH4LmvYc18+GPeLqlwHhn8jVVWNZSexYmHa9Nd
 wQq+UfN9MLshTlyxz2hxqi2YCy87ruykjWczzvjwwVBR8yYr2iOV/Krx076ulnk7ztjc
 iBHOPpBDGMA4qEvEnISpsKdryxk2EOEtDgWahsY8KutQb05AegGEM+NaPqZmq+qc4Rs9
 JM/cVJhGJnEXVRw9rB+viVky7tmDCYlD5T/wTzdujR7FKdQ7m0Cdfr5H1TY1/56xQv1w
 rLWMhtmbLDNHeQm+gqA+upjpbT2rI8S0F4YdqznE8wDLfJgn7kkgAwFzB8BHJDwGVk0c
 1BbQ==
X-Gm-Message-State: ABy/qLZ66HH5r15Y3DbGikOob5UVBo5MnpEMqt6gCvQfDQvY7/Ktkwp4
 Cy5rwsyODKjau0iKXh/TxYbYXQ==
X-Google-Smtp-Source: APBJJlHWEXKO1BtGB5m5jRP8B7qyqAPOSEJ2ByEKGEBwWNcgv3f646N6mOWoURTk/1WXHZ19XGXbGQ==
X-Received: by 2002:a05:6830:191:b0:6b6:f292:43e6 with SMTP id
 q17-20020a056830019100b006b6f29243e6mr1321691ota.25.1688638726145; 
 Thu, 06 Jul 2023 03:18:46 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 17/20] target/riscv/cpu.c: create KVM mock properties
Date: Thu,  6 Jul 2023 07:17:35 -0300
Message-ID: <20230706101738.460804-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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
mock boolean property for every non-KVM extension in
riscv_cpu_extensions[]. Then, when running KVM, users are still free to
set extensions at will, but we'll error out if a non-KVM extension is
enabled. Setting such extension to 'false' will be ignored.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2acf77949f..b2883ca533 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1840,6 +1840,26 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+
+#ifndef CONFIG_USER_ONLY
+static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
+                                    const char *name,
+                                    void *opaque, Error **errp)
+{
+    const char *propname = opaque;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value) {
+        error_setg(errp, "extension %s is not available with KVM",
+                   propname);
+    }
+}
+#endif
+
 /*
  * Add CPU properties with user-facing flags.
  *
@@ -1868,6 +1888,22 @@ static void riscv_cpu_add_user_properties(Object *obj)
             if (object_property_find(obj, prop->name)) {
                 continue;
             }
+
+            /*
+             * Set the default to disabled for every extension
+             * unknown to KVM and error out if the user attempts
+             * to enable any of them.
+             *
+             * We're giving a pass for non-bool properties since they're
+             * not related to the availability of extensions and can be
+             * safely ignored as is.
+             */
+            if (prop->info == &qdev_prop_bool) {
+                object_property_add(obj, prop->name, "bool",
+                                    NULL, cpu_set_cfg_unavailable,
+                                    NULL, (void *)prop->name);
+                continue;
+            }
         }
 #endif
         qdev_property_add_static(dev, prop);
-- 
2.41.0


