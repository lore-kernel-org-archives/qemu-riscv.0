Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FE7D3B985
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:23:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFteB-0003gb-K0; Tue, 26 Nov 2024 06:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFte9-0003fc-NQ
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFte6-0002Vd-BM
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so21581905e9.2
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620135; x=1733224935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KF5+Q+1rOwwX8eIZyyP/Swk9x61oFbeTaj2aNqOzoek=;
 b=uqspTHG7nWNYGC04V7d9iVNSCuRszDF0T0PhCE1EP+v8tqK70adGQPBqRqrsUSt2ue
 58nMqaRi8CsezZLP2+N82HflK4ah5bGK/hVF0Q3eOy1BO+bq8rLjK2HELm9mQXBqCQtZ
 +Eyls/Md6HqHay4nxB1hV37t+N9PwFXD8T0x1eMyNphvFNIXm+jwbxs6lM3DpkVs8lrr
 /gHvRJm+XqD9dWmgNaZg8414n/G3KFyzMkuuJKdfVeAmmqoSCwpZckJz8KgFmpyapblT
 UEteKKL9q10R1bZxLVmc0wKGRrQoEyvrYD2Bn+ztqkshyJWQevxmSmHefaftZuPKhDQz
 0oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620135; x=1733224935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KF5+Q+1rOwwX8eIZyyP/Swk9x61oFbeTaj2aNqOzoek=;
 b=uZXfK60EliJRhg4AXrvqk8eeKCSOehqv+84a11WGce0v5U77bi6MhMyAcDkJmR8+0i
 ylnj+mPK+11Q0IQpqHGqP6kjDNef3fLQ/3bQlXEOxobsuIS8Wg84D8gOkuHY89Monaw6
 GG3Cgw1/iZCrDlWw9J/RkMktqE2lw+JNov7GuQOAderJczcRFi0NAU4BlHeGLiSHrgNw
 7Wmv8pfqwonhyKioId3KNcaTLmj5aSbH405MvOIQQYTGBz/1CeSbkSnnvQgYI7MA9IAG
 EH0qPwsYSY4zX5paQbBWIfZGmOGGXMlxSsnGv0lW3ZPIUuzGKapLCFqZtWHR+C+MgZ1r
 uDPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPdpCBfVO0THOu+4J+yy0PQx8xB5fp9s/nZycgsFfAKFrW6D60Bc4jfmj8E3vbwcJWawoIAFp8juek@nongnu.org
X-Gm-Message-State: AOJu0Yx4HFsH3JMYLneK5FwzPEKaZgIPm7htIhvpyz0o0d7MTTsoaI8U
 Pt5rgtCPOclo2365W6i6Qt6CrvvWKDcOc+nbPioi8jD8ABU2EWNDeZO2tOuXXzA=
X-Gm-Gg: ASbGncvihU6DTdQ32JwRUBsjWGslwqiXYgChNPW+6LlQ5EhMBSlCG06EHMb9D1sT5zn
 uundOeFTN3lh0H0cFwur9wy8Bh1mvURs4HiUnwCK4ekoSQVxfYCZoO899uMyo2yvxxcI+ItWdfY
 B8OnnkMYbUQkVYEdTJ+yWTEWtbr3FJxcyPAeNyPQLiksg2JC9qE7bYQze/G3sZrzF/NV2r7EvU3
 hK4g0ni3j4ajCu4d5Ctq60Ki5ZZUEYQXBx7iSC8l4fUqKF3Q3qgNg1TzWbG662/cf5SmndI
X-Google-Smtp-Source: AGHT+IGB1S3nePENSA533CkYLMuP58/EiNkFaULMaHf4Q6BH3rt6mUvqb14gZTBwOv+wLOm8/JJ+aA==
X-Received: by 2002:a5d:5f53:0:b0:382:46ea:1113 with SMTP id
 ffacd0b85a97d-38260b3cc31mr15783506f8f.4.1732620135272; 
 Tue, 26 Nov 2024 03:22:15 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc34bdsm13398468f8f.78.2024.11.26.03.22.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 00/13] hw/boards: Remove legacy
 MachineClass::pci_allow_0_address flag
Date: Tue, 26 Nov 2024 12:21:59 +0100
Message-ID: <20241126112212.64524-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Since v1:
- Looked at previous analysis from Peter [1]
- Invert logic so "allow address 0 accesses" is default

---

This series aims to remove a legacy field from
MachineClass. Why? Because it doesn't scale on
heterogeneous machine where different host bridges
are created.

Rather than a global exposed to all machines,
use a pci-bus specific flag on each machine
requiring it, propagated by the host bridge
device.

No logical change intended, only machines previously
using pci_allow_0_address do not set refuse-bar-at-addr-0.

Presumably various machines neither need to set this
'refuse-bar-at-addr-0' flag, but updating that is
deferred to each machine maintainer since I don't have
the knowledge and sufficient test suite IMHO.

[1] https://lore.kernel.org/qemu-devel/20241125140535.4526-1-philmd@linaro.org/
[2] https://lore.kernel.org/qemu-devel/1444683308-30543-1-git-send-email-agordeev@redhat.com/T/#u

Philippe Mathieu-Daudé (13):
  hw/pci: Do not declare PCIBus::flags mask as enum
  hw/pci-bridge: Initialize bridge with parent bus flags
  hw/pci: Factor machine_refuses_bar_at_addr_0() helper out
  hw/pci: Introduce PCIBusFlag::PCI_BUS_BAR_AT_ADDR0_REFUSED
  hw/pci: Propagate bar_at_addr_0_refused to
    pci_root_bus_internal_init()
  hw/pci: Propagate bar_at_addr_0_refused to pci_root_bus_init()
  hw/pci: Propagate bar_at_addr_0_refused to pci_root_bus_new()
  hw/pci: Propagate bar_at_addr_0_refused to pci_register_root_bus()
  hw/ppc/spapr: Create host bridge setting bar_at_addr_0_refused=false
  hw/pci-host/gpex: Expose 'refuse-bar-at-addr-0' property
  hw/arm/virt: Create GPEX host bridge without refuse-bar-at-addr-0
  hw/riscv/virt: Create GPEX host bridge without refuse-bar-at-addr-0
  hw/pci/pci: Remove legacy MachineClass::pci_allow_0_address flag

 include/hw/boards.h                 |  1 -
 include/hw/pci-host/gpex.h          |  1 +
 include/hw/pci/pci.h                |  8 +++++---
 include/hw/pci/pci_bus.h            | 10 ++++++++--
 hw/alpha/typhoon.c                  |  2 +-
 hw/arm/sbsa-ref.c                   |  1 -
 hw/arm/virt.c                       |  1 -
 hw/i386/microvm.c                   |  2 ++
 hw/loongarch/virt.c                 |  2 ++
 hw/mips/loongson3_virt.c            |  2 ++
 hw/openrisc/virt.c                  |  2 ++
 hw/pci-bridge/pci_expander_bridge.c | 17 +++++++++++-----
 hw/pci-host/articia.c               |  3 ++-
 hw/pci-host/astro.c                 |  3 ++-
 hw/pci-host/bonito.c                |  2 +-
 hw/pci-host/designware.c            |  2 +-
 hw/pci-host/dino.c                  |  2 +-
 hw/pci-host/gpex.c                  |  5 ++++-
 hw/pci-host/grackle.c               |  2 +-
 hw/pci-host/gt64120.c               |  2 +-
 hw/pci-host/i440fx.c                |  2 +-
 hw/pci-host/mv64361.c               |  2 +-
 hw/pci-host/pnv_phb3.c              |  2 +-
 hw/pci-host/pnv_phb4.c              |  2 +-
 hw/pci-host/ppc440_pcix.c           |  2 +-
 hw/pci-host/ppc4xx_pci.c            |  2 +-
 hw/pci-host/ppce500.c               |  3 ++-
 hw/pci-host/q35.c                   |  2 +-
 hw/pci-host/raven.c                 |  2 +-
 hw/pci-host/remote.c                |  2 +-
 hw/pci-host/sabre.c                 |  2 +-
 hw/pci-host/sh_pci.c                |  2 +-
 hw/pci-host/uninorth.c              |  8 ++++----
 hw/pci-host/versatile.c             |  2 +-
 hw/pci-host/xilinx-pcie.c           |  2 +-
 hw/pci/pci.c                        | 31 ++++++++++++++++++-----------
 hw/pci/pci_bridge.c                 |  1 +
 hw/ppc/ppc440_uc.c                  |  2 +-
 hw/ppc/spapr.c                      |  1 -
 hw/ppc/spapr_pci.c                  |  2 +-
 hw/riscv/virt.c                     |  1 -
 hw/s390x/s390-pci-bus.c             |  2 +-
 hw/xen/xen-pvh-common.c             |  2 ++
 hw/xtensa/virt.c                    |  2 ++
 44 files changed, 94 insertions(+), 57 deletions(-)

-- 
2.45.2


