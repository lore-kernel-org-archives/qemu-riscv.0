Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E701C46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 12:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJBeQ-0007mf-3j; Fri, 29 Dec 2023 07:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rJBeL-0007lZ-91
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 07:07:38 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rJBeI-0004y6-Jf
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 07:07:36 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3C7573F73C
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1703851649;
 bh=tFjzcWXuE5DSXBUytMlng7Kt/kySHhmp0JIqujk7Ie8=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=IEpuYlSjBiNeTB5VC42hKn+e+o4BM2PHj7LBVSJGV5d5ZK9illWq2GrFBUcJXnR3U
 QUyoYoTTlmkOM3mt/pcU7ZqltVErvuzTNjMaUZsUYE75kWEn1kwtG18ivcA3gObdk2
 wazT+Jfe5OIeSnUMuUGYRhiC4pEcMvW6VaQU9bq/7L3vKt3M4J54NN/G/4405mg4fl
 ECSnaMPrkWxJKZEJaBMm6QHAzb5iXiOmxQAryQtsuDu2/MKcvFStj7C4ZBcFmgwWJF
 auEWxNNnDFiRmnEroVeQs3OEOEC8NaParziDtQzkM/FFq/+DDENsM76ETfJ+QEHvta
 afnAvDSrZRcbA==
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5551f8ec1c8so1856975a12.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 04:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703851648; x=1704456448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFjzcWXuE5DSXBUytMlng7Kt/kySHhmp0JIqujk7Ie8=;
 b=dLlRsKOoRU74gFx/CJvD2XdIUGcrC5fLhAcSvxXyEqlYGalP4TzJeYmsoiSg0mW0iV
 2qSRjqjsliiAN1aSQt9ulX2RZq2F4PEmCPc99ORx98K/K6tiovccQe7yfThvL5OI4Wi0
 YkYjkEGz9GoosHyBjjpz2mbW6XJs+XPMC/S91uqFitR6keJFriv1q/UHylROji8k+tqt
 gPZXaf3PJYdWE1q2+mh3mEbx3cpn0RkKB9/x8dS0kRqpGj5zTnulDl+0fDOF3Z62vAO4
 IrqkRgEep22SqiJbCyJopEXqopZys95tzFHCKZr6H6Zo/GoHregJgYIq19eXNB9gDn3y
 E5Lw==
X-Gm-Message-State: AOJu0YzY5pCzmTG9A+rtGCXkCDz/PWQteIj1jjIxnWdfwcxsKAJNjUuV
 KL9WQ98xhkdn2l2nIrKSlSgJM5kVKntyggqzTWsRKPFL+33xv3DC3Fs3WTlZTKba2h+NUGWjzzS
 0xgfKssIaIQS3AgZHBGfIcSuXB1CvKmFtIVZGfYA=
X-Received: by 2002:a50:d7d7:0:b0:553:739e:bfac with SMTP id
 m23-20020a50d7d7000000b00553739ebfacmr7732608edj.8.1703851648222; 
 Fri, 29 Dec 2023 04:07:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYwKsRQBh2evsx0Q9HgRecFYtkUacRQZ1dFs5S8toVVatnvK9PEr9WMTwV2D/Vu1PaF2YmUw==
X-Received: by 2002:a50:d7d7:0:b0:553:739e:bfac with SMTP id
 m23-20020a50d7d7000000b00553739ebfacmr7732592edj.8.1703851647910; 
 Fri, 29 Dec 2023 04:07:27 -0800 (PST)
Received: from x13s.fritz.box (ip-178-202-040-247.um47.pools.vodafone-ip.de.
 [178.202.40.247]) by smtp.gmail.com with ESMTPSA id
 j20-20020aa7c0d4000000b005527de2aecfsm10943344edp.42.2023.12.29.04.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 04:07:27 -0800 (PST)
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
Subject: [PATCH v2 0/4] target/riscv: SMBIOS support for RISC-V virt machine
Date: Fri, 29 Dec 2023 13:07:20 +0100
Message-ID: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
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

Generate SMBIOS tables for the RISC-V mach-virt.
Add CONFIG_SMBIOS=y to the RISC-V default config.

With the series the following firmware tables are provided:

    etc/smbios/smbios-anchor
    etc/smbios/smbios-tables

Add processor-family to the '-smbios type=4' command line options.

Heinrich Schuchardt (4):
  smbios: add processor-family option
  smbios: function to set default processor family
  target/riscv: SMBIOS support for RISC-V virt machine
  qemu-options: enable -smbios option on RISC-V

 hw/riscv/Kconfig             |  1 +
 hw/riscv/virt.c              | 42 ++++++++++++++++++++++++++++++++++++
 hw/smbios/smbios.c           | 20 ++++++++++++++--
 include/hw/firmware/smbios.h |  1 +
 qemu-options.hx              |  6 +++---
 5 files changed, 65 insertions(+), 5 deletions(-)

-- 
2.43.0


