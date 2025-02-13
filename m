Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32A8C0219D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:25:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiYEs-000250-J8; Thu, 13 Feb 2025 07:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEm-00022H-8E
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:36 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEh-0002Tx-1f
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:33 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaec111762bso162888166b.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449348; x=1740054148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0QIUZ9G9ceuu7BOeFAVNnHGygrUdl1K5aeRH+HplWk=;
 b=Wj28MKwQjCLsaCYr0OPKaCevm2TVyfbZqzveO0WvPlt8+TxlJAUji1141zrGwpoahS
 l/zIIQeVXN68kXcYgx9EkxmwmNOCPBHUKCKH4iJMwiToY69GcfGU/mYTt4qI86W26YYX
 PRswk59ilZopiS1T+VzVpNfOXS/vWuDxussSEen4wF6pDd9p9KOnU0r2LxXViRgwcqxT
 V5bRCmlnS2+WexzqVoamHSFtsCL/28iQOuuzTNigwR3OUkLRvF90GlL8i+hMwzBOhZzu
 +cBAKy8VJVuVe3qIU828cpz9rEhzGdRw/OWzwAEmYzSe1zjz4/m1S4/095YeunaE1FQF
 UWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449348; x=1740054148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0QIUZ9G9ceuu7BOeFAVNnHGygrUdl1K5aeRH+HplWk=;
 b=s/MqPeVhcC64O5pqOSjMaXLAxuLMWJgJIdJA1VOGuJgkc4uHbk+DX4I10p3zFK7e3P
 bVkj1P6iQ3GwpAvlSCRy6Pif/1pfuz9pQLuE7LJ+xtlkrfOy2DGrvvfD4o6XBSbdCo60
 EDhBW8KOrejbWH3zakm16/3A8kqM9x6qyxSq2a3PEWnYWpOC6V0MjM3g0ZE6HJKcMZFw
 xH8MUgM+riUS2u7E/iCZ0Up/mZIFIKfsgKJh8czREcung1QJTqP+ow4ggazokB3Bily2
 MKT7ik3t2ETwzqEEcJYgr0NAnW3gX6Vc7BlWcsdfVsclNIpWpDe8eivElslGh5Bc//YR
 +RVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzRjWJ1kn9reQWA1d+a1K7RMtu7eVV0rPaBVz1B0rbI6S5w/9DKf8NSMoNz6+vjGvi+jbZYZoE4VhK@nongnu.org
X-Gm-Message-State: AOJu0YwJSRYJU3+AXjpxeAT753ewHa/V6EoX811p2IxJGMZ6vUgmxx/y
 94g/QU8GKx50WHbYfk3Qti96t5TmY43/d112tkBvinjlFj3Rr5ttlCy+nPnhNts=
X-Gm-Gg: ASbGnctXthEkfBSy6gG3fPQ+/f/z+0EBSJ+Sy5WwfQzD37IXsrEHcaOE8no5eq98D91
 MS59PsXK0ZYN39Mb/saLnfux859WvpmLOelfE3UA6jeyzARERhcwVZClxr1wv4EXDpRp5OYGZqb
 VOkl7OpvwF9k0f+cXBGDIKkp81VlQWMNYYNv4aI0GK0pn2O9QjXgXCSYwQMOy4HoqNEO1dFWlou
 E+KKvXsGfJr50xUp31nZwMDQtygh/CRnBMHDRcy7Y0Flic5aox5f+dCy2V+d3T2fq4jfEi434PL
 DqCAt8/Ab612rog0FIFTYt+NFz7YwI8rtqqI1SHv4IjL1MSK7AACWrzCxmZc
X-Google-Smtp-Source: AGHT+IFcEI4Fc9o0XGrsqIZqGPhP/I7pfT2aGbeUUlm6vNF4JlElm+h+q368itYh4zUDnRMPZVR7Cw==
X-Received: by 2002:a17:907:3da2:b0:a9e:b2da:b4a3 with SMTP id
 a640c23a62f3a-ab7f347dc2bmr670610566b.42.1739449347940; 
 Thu, 13 Feb 2025 04:22:27 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5325ac21sm122673766b.73.2025.02.13.04.22.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 1/6] hw/qdev-properties-system: Introduce EndianMode QAPI
 enum
Date: Thu, 13 Feb 2025 13:22:12 +0100
Message-ID: <20250213122217.62654-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
Endianness can be BIG, LITTLE or unspecified (default).

Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/common.json                    | 14 ++++++++++++++
 include/hw/qdev-properties-system.h |  7 +++++++
 hw/core/qdev-properties-system.c    | 11 +++++++++++
 3 files changed, 32 insertions(+)

diff --git a/qapi/common.json b/qapi/common.json
index 6ffc7a37890..0e3a0bbbfb0 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -212,3 +212,17 @@
 ##
 { 'struct': 'HumanReadableText',
   'data': { 'human-readable-text': 'str' } }
+
+##
+# @EndianMode:
+#
+# @unspecified: Endianness not specified
+#
+# @little: Little endianness
+#
+# @big: Big endianness
+#
+# Since: 10.0
+##
+{ 'enum': 'EndianMode',
+  'data': [ 'unspecified', 'little', 'big' ] }
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 7ec37f6316c..ead4dfc2f02 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -30,6 +30,7 @@ extern const PropertyInfo qdev_prop_pcie_link_speed;
 extern const PropertyInfo qdev_prop_pcie_link_width;
 extern const PropertyInfo qdev_prop_cpus390entitlement;
 extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
+extern const PropertyInfo qdev_prop_endian_mode;
 
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
@@ -97,4 +98,10 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
     DEFINE_PROP(_name, _state, _field, qdev_prop_iothread_vq_mapping_list, \
                 IOThreadVirtQueueMappingList *)
 
+#define DEFINE_PROP_ENDIAN(_name, _state, _field, _default) \
+    DEFINE_PROP_UNSIGNED(_name, _state, _field, _default, \
+                         qdev_prop_endian_mode, EndianMode)
+#define DEFINE_PROP_ENDIAN_NODEFAULT(_name, _state, _field) \
+    DEFINE_PROP_ENDIAN(_name, _state, _field, ENDIAN_MODE_UNSPECIFIED)
+
 #endif
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a96675beb0d..89f954f569e 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -1283,3 +1283,14 @@ const PropertyInfo qdev_prop_iothread_vq_mapping_list = {
     .set = set_iothread_vq_mapping_list,
     .release = release_iothread_vq_mapping_list,
 };
+
+/* --- Endian modes */
+
+const PropertyInfo qdev_prop_endian_mode = {
+    .name = "EndianMode",
+    .description = "Endian mode, big/little/unspecified",
+    .enum_table = &EndianMode_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
-- 
2.47.1


