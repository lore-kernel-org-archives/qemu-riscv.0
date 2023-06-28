Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA23EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 21:33:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEcm6-0004Si-5R; Wed, 28 Jun 2023 17:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEcly-0004Dt-1v
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:32:23 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEclw-00007T-1v
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:32:21 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b059dd7c0cso12060fac.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687987939; x=1690579939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YCVJ1UigptFIkjyPY8sDv0telv70VOtYorhAbbPEGo=;
 b=Hau3bi8WVht8EZB7OoCNa4S4dOg7Syga2AZ8APkC/4GepVCDM9BWaJdVpYOoUAfacy
 66G1c35vrdMKTxOCQm2WEXchToWYiJNkWxg8gHsyXfDMzKMuFblawN5SLieghINVuHq/
 fpYpDZjEQnphHORhGxGw6DXtgXXXekt7RIH7onncqfdPuvRJOL1KMXRq6AD/TyXhGX1z
 lW84k4bVWvYGm/cuAJu2uFVlLG6xbQ6nkjyx5MAVzaPq4IuEF38/UYGM1hZidzejyOVu
 4U6pLvC2Zs3igRjtmWLHqTExwF9ySzWwEnnh/71h16VWPQEjqra5/W5+cVQv63V2u5dn
 ENDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987939; x=1690579939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0YCVJ1UigptFIkjyPY8sDv0telv70VOtYorhAbbPEGo=;
 b=fEBcrU7q4fbeHVJz2kKLs4yzkDl6OkiXzDOkExg0JJvKg5SHQmNSnvKEoVdgn7QNZX
 AH9m95QbpA2jUZ5bbC6pN+MmTvYUTuhB51b56fVjDjhNi0RY/Orf3NxhgKI4Wb7YvLoQ
 pFFWKv1xCSkoo1dSkg8C3JC96NCw6JoCo/Fsa/zZhE3ni9dkbbtNdYQ9Xo41m4dFreTj
 C+zV06XtM4b7ZRs57fKC1iBo1iTQVQp/YEpRA3tcPU89PKqofw/VgCDAABI80SS45NVn
 bSFF8KzbFPjQtBOBAhAIogKwGp4F7iq8nvRHg3qmp3zIzIr9K1u464FmZHMuz3f561S+
 CAKA==
X-Gm-Message-State: AC+VfDy06/36QnJG/rXURScyvx6BbH5HSJgX3Lx/b0cedOtndLBlqOE9
 3P44UwjpMi29rgS4uwaKUJj+DA==
X-Google-Smtp-Source: ACHHUZ7yWDl5IsrS04HBd8G8GmebqhmeScgTV6fBxGD/pW4OQHib3HLc14LRoTqfb+MaQypqIAx00A==
X-Received: by 2002:a05:6871:810:b0:1b0:7b57:c70f with SMTP id
 q16-20020a056871081000b001b07b57c70fmr3917489oap.58.1687987938844; 
 Wed, 28 Jun 2023 14:32:18 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a4a4511000000b0056084a91c74sm832892ooa.24.2023.06.28.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:32:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 17/20] target/riscv/cpu.c: create KVM mock properties
Date: Wed, 28 Jun 2023 18:30:30 -0300
Message-ID: <20230628213033.170315-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628213033.170315-1-dbarboza@ventanamicro.com>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
---
 target/riscv/cpu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 79c8ffe6b7..6d7a0bc4ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1731,6 +1731,26 @@ static Property riscv_cpu_extensions[] = {
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
@@ -1759,6 +1779,22 @@ static void riscv_cpu_add_user_properties(Object *obj)
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


