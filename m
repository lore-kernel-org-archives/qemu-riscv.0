Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC07EC46CD3
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 12:09:02 +0000 (UTC)
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJBeW-0007w6-ED; Fri, 29 Dec 2023 07:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rJBeT-0007nz-0C
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 07:07:45 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rJBeP-000530-HU
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 07:07:43 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 30ADD3F5A9
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1703851656;
 bh=SEH1cXhIuqvfvUI/EzQ5KABDAy9IZVCjqX/d3LE2DB0=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=H4rBioKAqVx0wu5Th8NRBbgepgT8SbFZTDOg8jmHDNorconsqx3Z+B93QolKuERbG
 KGHPo1sMFJ4n+aqBCT6UQ0VlANXBwwC93Ihpdukq4XknBh7pmy2BxaeULji/2MjeLU
 EJ6OkNWP8Iwy68z43Wo6Oeg+MBRDIVz06cMKJX8pRm/0wSufgofevkQcJqjAkZxbYr
 nZxDyf4i2KUGGgawtqJIALE+oFuHL73q4G513FNAmz3Q7uffWcyD2pzxp9FIus3bHI
 OxF43k9qQUFWPwmXW0iKSFFGjCcApshDA7l/iAbu/jOR9VzkHGiWSkm3qgUxqRQ3DN
 IJPUOP6CZ02bQ==
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5552b98855bso1433403a12.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 04:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703851652; x=1704456452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEH1cXhIuqvfvUI/EzQ5KABDAy9IZVCjqX/d3LE2DB0=;
 b=AgQ6GNQE53GsXytOwuK5fYpyI6n913wVuKdhjHa0jqBE4CDIiUZ1bHIOC8QuuHcjlX
 PD4sF4KGyPPoS3mAz0tNIQXkJCMI9HkcX0ADu1pSobk9+8tVkyXJB0A7vK+/M5M+ynfL
 UsjlWnKdybjPHcgtATR2iqFTxC3lXF2Gwwg1fcdls5W7sC5L8nIgfLRsYS5NKHLpv07x
 ts4TA6zuhfnpWXtCagcza+/7+SzcXWCo0KpF2uIQdax5pozWUY1m+pCYN1oRwVzU6sVP
 C3VXPxOdm5Wuz8YAIn/4BnvDla0d4l/cjaf6tA/6CXF5Mss9AvVHn5enx//3NkA2bBSt
 PPpQ==
X-Gm-Message-State: AOJu0YzEA6ZP2ZCBvBbcmyWYddnaAO2mvydSHHkgQr109bSlOS9xiKO4
 CLHWs0L06xNZofbvHFPG797qH6pu4s8p0jb6/CVvELB+ocZ4CXdbbR8gLVcEhNv6CjiQMS2+1YW
 ghCNLytDYDxVzqlkxr+6AKnGbG5LF7T+kppX21lc=
X-Received: by 2002:a50:999c:0:b0:553:721b:81c7 with SMTP id
 m28-20020a50999c000000b00553721b81c7mr7308054edb.45.1703851651975; 
 Fri, 29 Dec 2023 04:07:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7psCERK1hHsBpfgqNTDEU7miceNbfo+sGfOEnKqiV+mJ0nvSPaGOGrEnVC4zJGpEpvBP+gA==
X-Received: by 2002:a50:999c:0:b0:553:721b:81c7 with SMTP id
 m28-20020a50999c000000b00553721b81c7mr7308047edb.45.1703851651734; 
 Fri, 29 Dec 2023 04:07:31 -0800 (PST)
Received: from x13s.fritz.box (ip-178-202-040-247.um47.pools.vodafone-ip.de.
 [178.202.40.247]) by smtp.gmail.com with ESMTPSA id
 j20-20020aa7c0d4000000b005527de2aecfsm10943344edp.42.2023.12.29.04.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 04:07:31 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v2 4/4] qemu-options: enable -smbios option on RISC-V
Date: Fri, 29 Dec 2023 13:07:24 +0100
Message-ID: <20231229120724.41383-5-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.553,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

With SMBIOS support added for RISC-V we also should enable the command line
option.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	new patch
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7bdb414345..5ed82df11f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2705,7 +2705,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 17 fields\n"
     "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
     "                specify SMBIOS type 41 fields\n",
-    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
+    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH | QEMU_ARCH_RISCV)
 SRST
 ``-smbios file=binary``
     Load SMBIOS entry from binary file.
-- 
2.43.0


