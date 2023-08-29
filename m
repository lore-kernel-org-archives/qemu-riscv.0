Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FCAC6FA8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 12:22:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaxjO-00087i-6r; Tue, 29 Aug 2023 08:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaxjM-00087S-Ir
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 08:22:00 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaxjF-0001L5-Gu
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 08:21:59 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bcb5df95c5so3241067a34.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693311711; x=1693916511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5+hKm/hGHe1RwTMPtHep9ct1mBSIWHV32WOu9vzrmvM=;
 b=RDmmgD8u3kHAN7JjVLfajGjeVtgWgNi6ZmUzSFD91wxr0phxgfdsylk/3LNzbnrv33
 gYJmaDlwA3JwMmDufSOx7ELvng6LSLxCRMW7BdNoINCNkT9uG8ApKnx3UjpXVKh4M87H
 kN+GSO/tuDA+vEcfcXvfbPi8SKr0Hwd9GUTcWQV5eZwE1dy0lAFTBzWP3m+YZzONuirD
 IJDFJa1rg0eYKNx35aX+ctoe3ca8tGjkzxE7hPB2Mz+d71jV0yPNAaDd1y65cUPyod/V
 6grSwZVsey2RYWWKAJkLg0wfzFoTEXzwCt2RYZ9PeehEGBdN3eFs3QcZBPJKbTRR+7yL
 Agiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693311711; x=1693916511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5+hKm/hGHe1RwTMPtHep9ct1mBSIWHV32WOu9vzrmvM=;
 b=h6bCvgDHAOfJPxpwxGh5GsEVWjh3MF1abpLPwkMgJob1JCw+5nlqujkBj6GUxXRGiG
 0Pv6h7kM8NOwA6gUlGZCPM3iH/Vx2CNSVhIdmlmcxW01E5fh5z32p4/sZ9njtLgUWwQe
 SMGqvneVyYzu973VUiQ5G4XdYdTf7gP2oPLO1ND8E3O5+05h159gy8E6JKjsLrMTSWf9
 s8NJwlo90ppRKQM3jSCy2Rj7fjEpHmkjqIkXLtF/K80kFjuTmhnZd1RRHb0rUsdkabVC
 vO2mu8YJeON9Yi7dGYe8cz6U2/AG1N332rm2Zjra9MGHFs7mtXz7TJsWxlHD96rSdOD/
 ACgw==
X-Gm-Message-State: AOJu0YyKF4RrmrilI9EbsNIbQr5Lb9zesHtJgw9CLU6sVglO4y/V/w9i
 c9o3j+/ueX1RpI8SVYnqRujG4w==
X-Google-Smtp-Source: AGHT+IFqtiiKklT2oPkTRTg5Djviv/b7uOX6h+MiMmukfQvgv7TQlYaQnKoW7JxXNQNK5n5aKZHA/A==
X-Received: by 2002:a05:6870:64a0:b0:1b7:38d1:6f98 with SMTP id
 cz32-20020a05687064a000b001b738d16f98mr15946477oab.38.1693311711636; 
 Tue, 29 Aug 2023 05:21:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a4a97c7000000b00573320e1241sm5079327ooi.14.2023.08.29.05.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:21:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 0/2] riscv: fix --enable-debug in riscv-to-apply.next
Date: Tue, 29 Aug 2023 09:21:42 -0300
Message-ID: <20230829122144.464489-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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

Hi,

There is a couple of build problems that sneaked in riscv-to-apply.next
in the KVM AIA patches. Here's a potential solution for them.

Alistair, feel free to squash the fixes in the original commits since
they're not yet on master.

Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Daniel Henrique Barboza (2):
  hw/intc/riscv_aplic.c fix non-KVM --enable-debug build
  hw/riscv/virt.c: fix non-KVM --enable-debug build

 hw/intc/riscv_aplic.c    |  2 ++
 target/riscv/kvm_riscv.h | 10 ++++++++++
 2 files changed, 12 insertions(+)

-- 
2.41.0


