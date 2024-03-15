Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA535C54E67
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rl7Kv-0008Nj-Bm; Fri, 15 Mar 2024 09:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7K8-0006Y5-HH
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7K2-0007v3-4d
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-29d1380e418so1189928a91.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2024 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508204; x=1711113004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gri6e0kUQ2zYZ/hFnr3bQcljAuIiwyEyI/MJW064ldw=;
 b=WQ+oUlBMUTFP7uA5GKlAU9HLBHG2/mQJwYMcgh0qm9w7v3mWl9AKfDH6Seh/wbdDfn
 c8yFtRY86tvfn017oqaH2e9REatLrhKI48XWDO5YmwrMXwRDx5L8HHI7agoogUf0hQEH
 xBip0nAa8pgoLLf8eshcA2LwyHywr5XO9QbO6l43pRoZ2W0JU5G3i6XRvqQGHuuDxAlG
 lmKsOg6tbtcCmUAxxaysb22L3wrFO2NIkDRyAJotRJT0TN8l7T9Tcw6sbXL5tWOANaLF
 RKhQkJGSCS1qDKiDfXOgaxVEEkI1wkRMmXRQljoOkRVuGrmKlI1/nQaq6vN43La2s0WO
 p/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508204; x=1711113004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gri6e0kUQ2zYZ/hFnr3bQcljAuIiwyEyI/MJW064ldw=;
 b=vvXAvCaj00giHKso2SKNy4t2YTmXGH6bwpKnZyXIfWo0nAOZDW8HNjgh0wkm2ZgERc
 4Ms1/PcUx0e/80Mzud2nCfBJZZgSXL7j8Nk/I7UKjd5bD1tT0i/7kjUocazHDi8Bcgm5
 hhblYUJsuikWrxS2qqp+bXoqVpw1mc6RFJAEdH/zbuheJXCWjfSEQsjYOoBxU8u0BkHl
 a46pgMVPEXjzlAbP310QZwNrEP/pJ0TI2fcaF15FlboCXsm1Q4HHdsXD3pNZBiTpie9i
 wPCgNMkSpM5YAvShAYCN0zw7oFxQGzL6VwEND+oRFPcO7PsGx27Wdgxtsg3sktPVZF2n
 YdSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwPFuI7xlZB2TjjTwDLJOI3pjmHMI9uDvW3sGwc0hRo//FSWQmOw9YPasty3JASqLrQY9kKvbh3XCKqkAAxMLD/MI/wDM=
X-Gm-Message-State: AOJu0Yw3YVGYuih51Wuiqptt+xr6zLt1WZGg+TIhbghGx9a9sIOYeLqU
 O6U0XHqGBfagfEVZcw5E4/Yya7VLlfEY2jv/ZlXIdwxI4lrrw9Ovqd6UoBM9KDo=
X-Google-Smtp-Source: AGHT+IHBXMQGkvp2BYHGXuu3UtKKT1FEzBUr0oVoOkzF2cunzVAJYffewH/cjG2yjN9xhsn4IBGPmQ==
X-Received: by 2002:a17:90b:1bcc:b0:29b:a1de:32d3 with SMTP id
 oa12-20020a17090b1bcc00b0029ba1de32d3mr12532208pjb.17.1710508204543; 
 Fri, 15 Mar 2024 06:10:04 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:10:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 09/12] pc-bios/meson.build: Add support for RISC-V in
 unpack_edk2_blobs
Date: Fri, 15 Mar 2024 18:39:21 +0530
Message-Id: <20240315130924.2378849-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1036.google.com
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

Update list of images supported in unpack_edk2_blobs to enable RISC-V
ACPI table testing.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 pc-bios/meson.build     | 2 ++
 tests/qtest/meson.build | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 0760612bea..8602b45b9b 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -4,6 +4,8 @@ if unpack_edk2_blobs
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
     'edk2-arm-vars.fd',
+    'edk2-riscv-code.fd',
+    'edk2-riscv-vars.fd',
     'edk2-i386-code.fd',
     'edk2-i386-secure-code.fd',
     'edk2-i386-vars.fd',
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 36c5c13a7b..dd19711d9f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -252,6 +252,9 @@ qtests_s390x = \
 qtests_riscv32 = \
   (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
 
+qtests_riscv64 = \
+  (unpack_edk2_blobs ? ['bios-tables-test'] : [])
+
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
-- 
2.40.1


