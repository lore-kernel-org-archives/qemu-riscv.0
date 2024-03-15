Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498CC54E58
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rl7L9-0000iS-5Y; Fri, 15 Mar 2024 09:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7KR-00072S-31
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:31 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7KJ-00082l-GO
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:30 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso3458536e87.1
 for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2024 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710508221; x=1711113021; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juKrFHTenueZGgaczYCixm7yTPX2XVgDuiXA1GdKgho=;
 b=D7JEwiWqRZf2E+/JqDXANmIZlpLhqhTFqwifI5DSLOpCkBaBKHB926LnUU2mg75Pho
 9CDVbyFH22DU2+n3gEdwUGeXdf/19AtWSek2JSKMoz8t4bAFyHmXjBZrICtCY+ZO4miV
 Q/mqTKKEdIafPF7CMen6j/j/8pPPoQn8yJWSXEUMWiQbV/cQOsspwEabY6dley9bKhJ2
 4O+kfmglfaqXvgd7hFpXWv2IQJNa5qfxcgXSuCiYSpRnkxZ08UChSJGSmVxZigF3+/Q7
 RdwVDW08xgO73x39sdkLPyJ848KatCPBuw7B3h+Pfu+1JRMWXMVXu2+M8jrehIabC9gz
 cTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508221; x=1711113021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juKrFHTenueZGgaczYCixm7yTPX2XVgDuiXA1GdKgho=;
 b=nFlhQGDL8pkyYITmAPAnNpxsskDJCvqlDZH+yAZX7DQW312hkby+QUFtAuTjN0KYom
 c2poJWTt1dx+9X1YD9kLBNt/U4dGkmIIxUlVPKGHF+sTlySXdougYk6o9QjCC4EBpCca
 1G6lQQeW6Ww3KTAoStX+VcC+q95wii/I9D/ADPVWLmt9FhXIr3KJ7+10X6xiAC7MF8y9
 SBch+8e1dny+W4ygSMmLqq6ZJEEECgYMfW+D0Z2kWR2zyQlCM0NTbTZJdjCR69Yxsuqm
 DDKR62wvZNaWRNCzftfodQOYqErkVtdNnt7wCOhI8zaA5IgUIZLsm29OHvaco+ynG0xG
 HJDQ==
X-Gm-Message-State: AOJu0YxdpD6curMQnvWQ4buIYZmFekAc7Px6Jd+r65wDMV+DUOzS2fPA
 jdnAgXvqz6cmhStkcXv+5QFj1jT+iLWhimgLVphLXJC/3o+JOLNdneMsPdmS4OM=
X-Google-Smtp-Source: AGHT+IG/fkrm3CO2MahErI9fFc2gtBPFkzwyIu619VO5D+ezRzl3dqx8ZqO1u+VaQLLAaFAD47y0KA==
X-Received: by 2002:a19:f807:0:b0:513:2bea:d0e0 with SMTP id
 a7-20020a19f807000000b005132bead0e0mr2965749lff.62.1710508221669; 
 Fri, 15 Mar 2024 06:10:21 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.145.26])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170906bc4b00b00a4671d37717sm1605908ejv.52.2024.03.15.06.10.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Mar 2024 06:10:21 -0700 (PDT)
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
 Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH-for-9.1 10/21] qapi: Make CpuModel* definitions target agnostic
Date: Fri, 15 Mar 2024 14:08:58 +0100
Message-ID: <20240315130910.15750-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
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

CpuModelInfo, CpuModelExpansionType and CpuModelCompareResult
are not restricted to any particular target. Define them in
machine.json to generate them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/machine-target.json | 78 ---------------------------------------
 qapi/machine.json        | 79 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 78 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 5f17b25d50..0412400df3 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -6,84 +6,6 @@
 
 { 'include': 'machine.json' }
 
-##
-# @CpuModelInfo:
-#
-# Virtual CPU model.
-#
-# A CPU model consists of the name of a CPU definition, to which delta
-# changes are applied (e.g. features added/removed). Most magic values
-# that an architecture might require should be hidden behind the name.
-# However, if required, architectures can expose relevant properties.
-#
-# @name: the name of the CPU definition the model is based on
-#
-# @props: a dictionary of QOM properties to be applied
-#
-# Since: 2.8
-##
-{ 'struct': 'CpuModelInfo',
-  'data': { 'name': 'str',
-            '*props': 'any' } }
-
-##
-# @CpuModelExpansionType:
-#
-# An enumeration of CPU model expansion types.
-#
-# @static: Expand to a static CPU model, a combination of a static
-#     base model name and property delta changes.  As the static base
-#     model will never change, the expanded CPU model will be the
-#     same, independent of QEMU version, machine type, machine
-#     options, and accelerator options.  Therefore, the resulting
-#     model can be used by tooling without having to specify a
-#     compatibility machine - e.g. when displaying the "host" model.
-#     The @static CPU models are migration-safe.
-#
-# @full: Expand all properties.  The produced model is not guaranteed
-#     to be migration-safe, but allows tooling to get an insight and
-#     work with model details.
-#
-# Note: When a non-migration-safe CPU model is expanded in static
-#     mode, some features enabled by the CPU model may be omitted,
-#     because they can't be implemented by a static CPU model
-#     definition (e.g. cache info passthrough and PMU passthrough in
-#     x86). If you need an accurate representation of the features
-#     enabled by a non-migration-safe CPU model, use @full.  If you
-#     need a static representation that will keep ABI compatibility
-#     even when changing QEMU version or machine-type, use @static
-#     (but keep in mind that some features may be omitted).
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelExpansionType',
-  'data': [ 'static', 'full' ] }
-
-##
-# @CpuModelCompareResult:
-#
-# An enumeration of CPU model comparison results.  The result is
-# usually calculated using e.g. CPU features or CPU generations.
-#
-# @incompatible: If model A is incompatible to model B, model A is not
-#     guaranteed to run where model B runs and the other way around.
-#
-# @identical: If model A is identical to model B, model A is
-#     guaranteed to run where model B runs and the other way around.
-#
-# @superset: If model A is a superset of model B, model B is
-#     guaranteed to run where model A runs.  There are no guarantees
-#     about the other way.
-#
-# @subset: If model A is a subset of model B, model A is guaranteed to
-#     run where model B runs.  There are no guarantees about the other
-#     way.
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelCompareResult',
-  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
-
 ##
 # @CpuModelBaselineInfo:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 4bc38e86fd..65702c2c78 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -10,6 +10,85 @@
 
 { 'include': 'common.json' }
 
+##
+# @CpuModelInfo:
+#
+# Virtual CPU model.
+#
+# A CPU model consists of the name of a CPU definition, to which delta
+# changes are applied (e.g. features added/removed). Most magic values
+# that an architecture might require should be hidden behind the name.
+# However, if required, architectures can expose relevant properties.
+#
+# @name: the name of the CPU definition the model is based on
+#
+# @props: a dictionary of QOM properties to be applied
+#
+# Since: 2.8
+##
+{ 'struct': 'CpuModelInfo',
+  'data': { 'name': 'str',
+            '*props': 'any' }
+}
+
+##
+# @CpuModelExpansionType:
+#
+# An enumeration of CPU model expansion types.
+#
+# @static: Expand to a static CPU model, a combination of a static
+#     base model name and property delta changes.  As the static base
+#     model will never change, the expanded CPU model will be the
+#     same, independent of QEMU version, machine type, machine
+#     options, and accelerator options.  Therefore, the resulting
+#     model can be used by tooling without having to specify a
+#     compatibility machine - e.g. when displaying the "host" model.
+#     The @static CPU models are migration-safe.
+#
+# @full: Expand all properties.  The produced model is not guaranteed
+#     to be migration-safe, but allows tooling to get an insight and
+#     work with model details.
+#
+# Note: When a non-migration-safe CPU model is expanded in static
+#     mode, some features enabled by the CPU model may be omitted,
+#     because they can't be implemented by a static CPU model
+#     definition (e.g. cache info passthrough and PMU passthrough in
+#     x86). If you need an accurate representation of the features
+#     enabled by a non-migration-safe CPU model, use @full.  If you
+#     need a static representation that will keep ABI compatibility
+#     even when changing QEMU version or machine-type, use @static
+#     (but keep in mind that some features may be omitted).
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelExpansionType',
+  'data': [ 'static', 'full' ] }
+
+##
+# @CpuModelCompareResult:
+#
+# An enumeration of CPU model comparison results.  The result is
+# usually calculated using e.g. CPU features or CPU generations.
+#
+# @incompatible: If model A is incompatible to model B, model A is not
+#     guaranteed to run where model B runs and the other way around.
+#
+# @identical: If model A is identical to model B, model A is
+#     guaranteed to run where model B runs and the other way around.
+#
+# @superset: If model A is a superset of model B, model B is
+#     guaranteed to run where model A runs.  There are no guarantees
+#     about the other way.
+#
+# @subset: If model A is a subset of model B, model A is guaranteed to
+#     run where model B runs.  There are no guarantees about the other
+#     way.
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelCompareResult',
+  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
+
 ##
 # @SysEmuTarget:
 #
-- 
2.41.0


