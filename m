Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onvjd-0004Ck-Pu
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 01:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjb-00044S-6U
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 01:47:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjP-0003ep-5y
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 01:47:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id io19so361177plb.8
 for <qemu-riscv@nongnu.org>; Wed, 26 Oct 2022 22:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5GKiDqHKleGB+xWflIlAg134Iv//iu/IfRAvfEVvew=;
 b=WXjgEtKQQykO1j283HlDMKZ4oK1NxC8MLPKMrWj8LTNXwUpsxgT0wW6odwA2hVpvcQ
 3ldSc6DIVO3qPBAmR5DWX4AmLpV1TOAT7dnYShz9qLZ5rjAR/UaNgPrNVbFwH5NT9dL5
 s7rb3oJxCEQumD97H1q0iYnSdepcU3jvq8l2+2VfEUOG8nX8YltBfmZaOMH5xM4AXDfB
 Nw2Rqx+yxlJ8E8f1MCsZlhxnWZgJ10Nz3dYpOQfSg9uC+vs47fB2Ll9bje0TjeIS/h4p
 V8JLxX4Fg7ywV3gJeF6rDEiuUluduVdym48Mw9cTunsh+uaFHn2yzRMbCigBP9nzQ/Mb
 n43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J5GKiDqHKleGB+xWflIlAg134Iv//iu/IfRAvfEVvew=;
 b=Rl1Squ5JQxYKMgtu04xmv8d/kk68hR/aeuxhnlqyh2JN0q0pwzspHudveXBkQkAZHs
 2kN0LE/cBYH6qTXNv0sF+8MWDFqJB2Q56B+AosT/uZrFEsnt3m5iIn7DHvnpge4yuz3S
 bpSYtWfQn/EiyU14IhRZ9NNr9D/vLlZI1GIFIhA0by8Y87BT+dYMu0AsiHYquioUWbi4
 zW+fBW/0xeAPrQRDjvfmBuZkUVw9GBE5WwfW1EHwfaosryAfhIC0ionxz59nPsYt0sys
 x40sQn5S8t5rvgPvMGBIgeeXMvmL3N2uG6mpmPvXKwj4wVoRQ4zNMlaIoWljRM09uNQw
 afVA==
X-Gm-Message-State: ACrzQf306vD0WsErByFn2gCd8WEcjmig1OfTa/QSr2JH2LZs3i9bZdQV
 WgTjsnzWQgX2rasm7h0e3Ku5Uw==
X-Google-Smtp-Source: AMsMyM4Me7/X2t5701CtKJyYzsS2aNALDpQEf/9tXAlALzqRUGuMcdQxP8EQUitZmLasjHxtJdpJhQ==
X-Received: by 2002:a17:902:bf46:b0:179:eba5:90ba with SMTP id
 u6-20020a170902bf4600b00179eba590bamr48027509pls.16.1666849624011; 
 Wed, 26 Oct 2022 22:47:04 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:519a:c85:c94:7c26:ac49:6811])
 by smtp.googlemail.com with ESMTPSA id
 188-20020a6204c5000000b00562784609fbsm328217pfe.209.2022.10.26.22.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 22:47:03 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v1 0/3] target/riscv: Apply KVM policy to ISA extensions
Date: Thu, 27 Oct 2022 11:16:46 +0530
Message-Id: <20221027054649.69228-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 05:47:19 -0000

Currently the single and multi letter ISA extensions exposed to the guest
vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
and applies policies set in KVM to the extensions exposed to the guest.

Mayuresh Chitale (3):
  update-linux-headers: Version 6.1-rc2
  target/riscv: Extend isa_ext_data for single letter extensions
  target/riscv: kvm: Support selecting VCPU extensions

 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 target/riscv/cpu.c                            |  52 ++++---
 target/riscv/kvm.c                            |  88 +++++++++--
 target/riscv/kvm_riscv.h                      |   2 +-
 16 files changed, 408 insertions(+), 52 deletions(-)

-- 
2.34.1


