Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA4EC54E67
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:14:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rl7LT-00024S-J0; Fri, 15 Mar 2024 09:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7Ku-0008J0-AN
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:11:00 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7Kr-0008Rm-4u
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:59 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-568aa3096e9so1432978a12.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2024 06:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710508255; x=1711113055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKSoPbdfR84sDrdE++VJn8/NPQXAflULbgNG03R7vOs=;
 b=GJdmN5QdeNlSHjlc1eKHQ7df0nIAbPKjenT+oX55U5TcaLNyjnHeQP/mf2mcoNgefV
 3/0N5Gq9dp5+q73f8R90qT5BtgchnGqcvGsrYsntQBibTnpNB5kiGKZtSRwa/CF/ZhKF
 gnZqEJ/ER1wySAZ3pXE5H8htSt3QVSzQYKFkWazihql/bvkK8lU7VwuXPgBN2Gd/BhRE
 +K/31cInbp7bBSTKIRL+i3ArrwMr93NkjnyDHtrd88JtCFGRr2wgggocnB2pbSQYL5aK
 dVmEQD7R10hMyhcYj+HeoXKB/cyQLM2PD3sv5s5o2bgsf1Rhx93zmJJ3/5oLbJbH9HJB
 IcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508255; x=1711113055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKSoPbdfR84sDrdE++VJn8/NPQXAflULbgNG03R7vOs=;
 b=GqP0z41KnehHLsqxJqGUctwVwFstKbZ1V82ES7S+FWgpD1vZ8AWb0rL1Y3gV4Y8qpr
 MT72scOyqTdWX+J37wXsfHVtBMemWWsueZIAqp8xHORNvk1SCqe2xZHNdR8kbsMJPOyI
 Tv4sdfLV8J+bmrb2NI/rjPdVSIR/0KhhHJTiAz9jIia+e71d0FZ+A5bW06BaFm5T26Wd
 PfQ1JfLpR92D3Gth++ePzXMlVNUAMlJ9pOa/6Ta4A+77vezT4+ycLo2oiyF1uXLd+zwA
 v9EDN1gjqa2SSgASsZnHXi24TgMlZuESsSOKXHaqpEhFDntzxDZNPRSN7whh73KpSvUw
 TjdA==
X-Gm-Message-State: AOJu0YxGIgfBYkmn8E1egVMqPk80NiwsKp5gG9OOV9yKUvm1TQkN+te8
 2NVh80IIt1UOF3rCyy4bxyLg7ZSeuLwLXUBAc1triwgVWkPZlvvT87LzHn8m31/C1CRTmajVVBc
 3
X-Google-Smtp-Source: AGHT+IHYyeLEfVVgN9kci+ZeRoPz5G6i50JiPnnqzD2jONHSLkszD0RljwqLECh5RRITNdvEpl0ANg==
X-Received: by 2002:a17:906:5a95:b0:a46:74fe:9177 with SMTP id
 l21-20020a1709065a9500b00a4674fe9177mr3636958ejq.21.1710508255621; 
 Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.145.26])
 by smtp.gmail.com with ESMTPSA id
 sa15-20020a1709076d0f00b00a45bbeeea9asm1681047ejc.167.2024.03.15.06.10.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 15/21] target/arm: Use QMP
 generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:03 +0100
Message-ID: <20240315130910.15750-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 3cc8cc738b..c5091e64ec 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -28,6 +28,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/commands-target-compat.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
 
@@ -220,29 +221,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     return expansion_info;
 }
 
-static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = cpu_model_from_type(typename);
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
-- 
2.41.0


