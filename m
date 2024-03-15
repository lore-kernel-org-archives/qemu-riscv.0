Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562C5C54E67
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:16:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rl7Kq-0007qn-E3; Fri, 15 Mar 2024 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7K1-0006NJ-Fp
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:07 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Jy-0007qv-L1
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:03 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e6a9fafacdso1787097b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2024 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508199; x=1711112999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JsmeTBVN2sRCxleZ76cGscd4q7biWqmkJjrGr36tu0=;
 b=J1hHEUgHdT/fkd/6o2o5/YBNg1J3S7NXyu6+3JGWWTwCsC7vRCY4g267jKxtcu+Zqe
 sgSIE/B2l20D+uMdwbgLkHP7iZ87BVTvhAPYifF/9MXBrseo/oqYwJKLOksWuHB+PrZb
 bujsDxSyniLtL6aPy873F+pnjmDJTI/5+Mm0FJ4E+3hnevFDk6th9xKZK6nhb2WmQsHR
 HzkW658MH5nDC9iP3tAV3ellrRuf2Zb8bhPqY6uZ2SSwCBIphnSvEjSofdCbkbE3Q8Vj
 P0ROV8t+YK0uviDgTYolCXIEmh+1u68cYqUJewnvycgx6pi+wSYwTVcDEyg24pWrKvua
 tRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508199; x=1711112999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JsmeTBVN2sRCxleZ76cGscd4q7biWqmkJjrGr36tu0=;
 b=rHpGkyhTsqWvrH9uIiw+wApRX/3YbAJp5qgwzrqJ7u6qGl0Vv92SFDdq5t3hG9JSQ4
 O77fw30tiw22NlowLXj58Eou8CpTDbaJLOKXtkzjaobDOfZSNqpQxOHu5qwdmpmnTTgM
 iWTKPJShJFbzFOeYZMMPXbdtEgaQAl052qZAihY39KCPAsJ5PVOkx82hE19qpIAkx6mn
 WMoODbZiuBTDyLZ8eQI9NtNpAVKqvgYInELXAy/YiU9uPnsKNENWNKXjTHl9ARrUvM78
 EeBytj3RnfeZeqX/GRAox68R9CR4+gOShquUEQpRW2o3KcBm5nmDhvX6MpTwEKpFhfNS
 pgIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd1jdinhYuFp4r3PHJVtUTiJImjnJmw2b1Pp7yK3CbZjfCw8Fj9/7RjM0zgqlcwAplYD1UYqmxah8DAvKurPqPk4jZBPk=
X-Gm-Message-State: AOJu0YxlzO30wuDsjQ1KJyZyz6ESMFOypzEy7MwAl4hDWaF5JDEFIb+v
 f8ETJ77hcDy9nGhJ6jRH9CBApPQ/ooNT6w+AtWhnHJMmotGtRziS0UD5HOxL5/Q=
X-Google-Smtp-Source: AGHT+IGk16iw1tTDOrbRN0W0Q0R0/WrAWlPbsKTL77h7TeZzM7tVW8IWW3lVJMWpt3VB7fI3ZNjFdQ==
X-Received: by 2002:a17:90b:3a48:b0:29d:dd0f:f853 with SMTP id
 oh8-20020a17090b3a4800b0029ddd0ff853mr3121079pjb.26.1710508199293; 
 Fri, 15 Mar 2024 06:09:59 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:09:58 -0700 (PDT)
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
Subject: [PATCH 08/12] meson.build: Add RISC-V to the edk2-target list
Date: Fri, 15 Mar 2024 18:39:20 +0530
Message-Id: <20240315130924.2378849-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x433.google.com
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

so that ACPI table test can be supported.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b8ded80cbe..bf50688593 100644
--- a/meson.build
+++ b/meson.build
@@ -93,7 +93,7 @@ else
   iasl = find_program(get_option('iasl'), required: true)
 endif
 
-edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
+edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu', 'riscv64-softmmu' ]
 unpack_edk2_blobs = false
 foreach target : edk2_targets
   if target in target_dirs
-- 
2.40.1


