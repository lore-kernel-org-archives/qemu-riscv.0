Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CA2C54E58
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:18:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rl7Kq-0007qz-Dl; Fri, 15 Mar 2024 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7KI-0006nG-Ni
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:24 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7KD-0007zC-Vf
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:22 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a44665605f3so224497766b.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2024 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710508215; x=1711113015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=501a0naqlbNKu8avIdgSMPglnIX/rNjXROgIt46X+30=;
 b=YQ7VCtbRMI1CGPT6Te7UzRL5zSlTy9LEfn6mbecoPaacg6NZ4M83CnqZK/nucC0q0r
 hET/PWwtxFRqBMA45uXoliL0Xle2iO3s0DRfp+SFk+KoqmmgMaM79In/YlRFTkyOXBWk
 aFXUJapWPWznMepGNDgUlW7zOAdUoDY3L7eV7X1cTL7aMWTOIemQWwya+JpBhSnwux45
 OVRLe7w7sBSgzwfeX3RxddVqtzCsW5WRUjKFcalRVeWRBTqhxx0gCyS6DSG4pqF+brjB
 MmiOPmoboXDFZKsQ+YMGhQA9PoYypqSdk90X3twMf8oc4whcpa/EuSaJ49NyxJJ+mwCB
 swbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508215; x=1711113015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=501a0naqlbNKu8avIdgSMPglnIX/rNjXROgIt46X+30=;
 b=uX091JbKqAE6AwiHRGQGL0DO2KHcgNokNfnRkHGjZIppfg9O0/wjbjJ0qm5j1KvHTR
 peSGJrKX6PiqBfdFGBXDmRyDmyvMz9mE7LiVhS3eRCQou74yVdJeANoJ8FcTfSq1bhQC
 c7rYUvczl7glK8HGvB4Ox+YzuwfGtFvGCfY3dliJ4yjopkyel6zfehMGUUzWDoIGQ8cZ
 ZdbjZN8kYEXN/zQc1MF9Ny8HsJsNX3V3Bpdr1raKZ2Oqo1NxWjbRJyhArfnF2j7SCasn
 r9VdijoJV7RWVoWh4vUOsHBX6ejkZ7qLyeDrJVuz3nd5GfnAxDCQ8FRWqCGvjv3Deoqs
 Mrfg==
X-Gm-Message-State: AOJu0Yx9x7aa0u0UawwoDUzWLMs2APsoGRrHCapPc9wNpZvBEqSINWqq
 /CD68Y7Qsin9rtwt5Y8ltnodCDS57uINSOV73fhZSJbkUt/1KySvqQtTkVHz5ec=
X-Google-Smtp-Source: AGHT+IFXUOZ0DXU9TFe7eErBIR0hjw1JRtYP9W4z0ySb0FEWd+FLxscB84jJYmFd0YaJKmhT8vL6Mw==
X-Received: by 2002:a17:906:2655:b0:a46:2a47:6f4c with SMTP id
 i21-20020a170906265500b00a462a476f4cmr1311867ejc.60.1710508215147; 
 Fri, 15 Mar 2024 06:10:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.145.26])
 by smtp.gmail.com with ESMTPSA id
 gq25-20020a170906e25900b00a453123b111sm1698649ejb.120.2024.03.15.06.10.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Mar 2024 06:10:14 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH-for-9.1 09/21] qapi: Merge machine-common.json with
 qapi/machine.json
Date: Fri, 15 Mar 2024 14:08:57 +0100
Message-ID: <20240315130910.15750-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

machine-common.json declares a single type, which isn't
restricted to a particular target. Move this type in
machine.json.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS              |  1 -
 qapi/machine-common.json | 21 ---------------------
 qapi/machine-target.json |  2 +-
 qapi/machine.json        | 13 ++++++++++++-
 qapi/qapi-schema.json    |  1 -
 target/s390x/cpu.h       |  2 +-
 qapi/meson.build         |  1 -
 7 files changed, 14 insertions(+), 27 deletions(-)
 delete mode 100644 qapi/machine-common.json

diff --git a/MAINTAINERS b/MAINTAINERS
index a3130f64fd..ed98814398 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1889,7 +1889,6 @@ F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
 F: qapi/machine.json
-F: qapi/machine-common.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
diff --git a/qapi/machine-common.json b/qapi/machine-common.json
deleted file mode 100644
index fa6bd71d12..0000000000
--- a/qapi/machine-common.json
+++ /dev/null
@@ -1,21 +0,0 @@
-# -*- Mode: Python -*-
-# vim: filetype=python
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or later.
-# See the COPYING file in the top-level directory.
-
-##
-# = Machines S390 data types
-##
-
-##
-# @CpuS390Entitlement:
-#
-# An enumeration of CPU entitlements that can be assumed by a virtual
-# S390 CPU
-#
-# Since: 8.2
-##
-{ 'enum': 'CpuS390Entitlement',
-  'prefix': 'S390_CPU_ENTITLEMENT',
-  'data': [ 'auto', 'low', 'medium', 'high' ] }
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 519adf3220..5f17b25d50 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -4,7 +4,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
-{ 'include': 'machine-common.json' }
+{ 'include': 'machine.json' }
 
 ##
 # @CpuModelInfo:
diff --git a/qapi/machine.json b/qapi/machine.json
index bb5a178909..4bc38e86fd 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -9,7 +9,6 @@
 ##
 
 { 'include': 'common.json' }
-{ 'include': 'machine-common.json' }
 
 ##
 # @SysEmuTarget:
@@ -50,6 +49,18 @@
   'prefix': 'S390_CPU_STATE',
   'data': [ 'uninitialized', 'stopped', 'check-stop', 'operating', 'load' ] }
 
+##
+# @CpuS390Entitlement:
+#
+# An enumeration of CPU entitlements that can be assumed by a virtual
+# S390 CPU
+#
+# Since: 8.2
+##
+{ 'enum': 'CpuS390Entitlement',
+  'prefix': 'S390_CPU_ENTITLEMENT',
+  'data': [ 'auto', 'low', 'medium', 'high' ] }
+
 ##
 # @CpuInfoS390:
 #
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 8304d45625..2c82a49bae 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -67,7 +67,6 @@
 { 'include': 'introspect.json' }
 { 'include': 'qom.json' }
 { 'include': 'qdev.json' }
-{ 'include': 'machine-common.json' }
 { 'include': 'machine.json' }
 { 'include': 'machine-target.json' }
 { 'include': 'replay.json' }
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 43a46a5a06..b46339bd7c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -29,7 +29,7 @@
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
-#include "qapi/qapi-types-machine-common.h"
+#include "qapi/qapi-types-machine.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
diff --git a/qapi/meson.build b/qapi/meson.build
index 375d564277..90047dae1c 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -37,7 +37,6 @@ qapi_all_modules = [
   'error',
   'introspect',
   'job',
-  'machine-common',
   'machine',
   'machine-target',
   'migration',
-- 
2.41.0


