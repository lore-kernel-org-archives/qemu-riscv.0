Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA172C4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 13:56:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwjGQ-0003Ma-Ln; Tue, 16 Apr 2024 09:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGJ-000307-HO
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:54:16 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGH-0001s3-RI
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:54:15 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e2c1650d8so4418190a12.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713275652; x=1713880452; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnRVHCDouTA+5HlMl31thguywp3whz3Nvn7kAUajqzI=;
 b=NkqQ9jYU5x+proCeNpNSj+Iw2v6xVxmdRZE2io4XmOHGo9Pd9R8Rpiln98sql+8FwQ
 ZypMYyquyscF/aTKvpxc0MF1DoNJBji6wnEE+lM2yvg6VdAtNSveM+iKviDAu7724YGi
 5QCAKimMWQyeWVIljaHTzxmh51xLkDJmC+wOmHLwfIpM3PtvBkJiXbvtcf/k0J4EPfkm
 pzv5b17vTsAzd8UBgHIuALUPC5d3TiORz+LN6AC0DDrcHr9kGnZ6zor7Gpf84Wp5tZ4K
 4BFrsXeErVUnetyDtivoIrh6FukngierXR7hkET+wM0Tkwzho6BdCkMw/6vUZkcA7mWo
 rWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713275652; x=1713880452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnRVHCDouTA+5HlMl31thguywp3whz3Nvn7kAUajqzI=;
 b=UYxRpg/7RxRoXb6EpvoBIjFQv/WYK+76yLUO986RDTi6k/PFgsKXNsH37TF2QnwMSK
 ymN+nH1OAYzU9jaSWBEkPzG1ZAntaAKihmfSouLGkHUpTveBk41qkcvYxnsRtubpFsFS
 wQkn9+aBqzh4tuKxF8/m6Vr0k0sqOENKk6eqjQ3u5D4JXoIENO0JdYTvt2npf9Rppxni
 5uq+/lO2MiUz/KjLxh3igCN1r4QgZMTtE2O4mk3qYl1gRrWCxhviqsjYIuGMyZ4v/2b8
 lWC8sEh7aRPeiMMtLlHtOr8piOY51P+y+aFKjt2fsFFwVsR7AjD1PlBrCWGG+dKLEDET
 BRew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/bn3l1mQwHrkRZLWvokiZYCLQjK6fFn4QXTmSkItd67qSfhVi/YD1tPYdynon9sDOtTtMpCscid/ukWIknH+p8TM6ogw=
X-Gm-Message-State: AOJu0YxZLcxk1IW99uyRZJheR09Ilrp3qtTKlfoqoELSWxp3hO4QZIS5
 mwJRg7Aqr5Kee5aLotu6uDtXpFsYhJR+2AC4lPRQR7Eqt3guSRvbgsqKBJAx7S9EHKnsNgmdJUJ
 V
X-Google-Smtp-Source: AGHT+IFhG4L3gtH69a1y/FdVwHzVlnymk2JnoSWQL//ktYw6Ci8bSUiIFfJZsqtAUnQlxka7xmRipw==
X-Received: by 2002:a50:9ec8:0:b0:568:32cc:f808 with SMTP id
 a66-20020a509ec8000000b0056832ccf808mr8400333edf.15.1713275652383; 
 Tue, 16 Apr 2024 06:54:12 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 fi11-20020a056402550b00b00570498c622asm375182edb.66.2024.04.16.06.54.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 06:54:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/22] hw/smbios: Remove 'smbios_uuid_encoded',
 simplify smbios_encode_uuid()
Date: Tue, 16 Apr 2024 15:52:41 +0200
Message-ID: <20240416135252.8384-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416135252.8384-1-philmd@linaro.org>
References: <20240416135252.8384-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

'smbios_encode_uuid' is always true, remove it,
simplifying smbios_encode_uuid().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/smbios/smbios.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 8261eb716f..3b7703489d 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -30,7 +30,6 @@
 #include "hw/pci/pci_device.h"
 #include "smbios_build.h"
 
-static const bool smbios_uuid_encoded = true;
 /*
  * SMBIOS tables provided by user with '-smbios file=<foo>' option
  */
@@ -600,11 +599,9 @@ static void smbios_build_type_0_table(void)
 static void smbios_encode_uuid(struct smbios_uuid *uuid, QemuUUID *in)
 {
     memcpy(uuid, in, 16);
-    if (smbios_uuid_encoded) {
-        uuid->time_low = bswap32(uuid->time_low);
-        uuid->time_mid = bswap16(uuid->time_mid);
-        uuid->time_hi_and_version = bswap16(uuid->time_hi_and_version);
-    }
+    uuid->time_low = bswap32(uuid->time_low);
+    uuid->time_mid = bswap16(uuid->time_mid);
+    uuid->time_hi_and_version = bswap16(uuid->time_hi_and_version);
 }
 
 static void smbios_build_type_1_table(void)
-- 
2.41.0


