Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuE3-00078I-3p
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE1-00077v-2G
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:21 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuDz-0004K8-CA
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:20 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 r23-20020a05683001d700b00690eb18529fso1860656ota.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=psMLW3mk2KBadYtwbEx+BkQpAhfZEUXKHytX1+JxPMA=;
 b=Rd7zeZtV8Rpd/pJ2WMnshd7UT9GNqrz7lbIQMbDKkim5cMJQ0eIm2rXXNrC2cRTkyH
 AkGZAFhJzpeOAwC17Esb+ZPgnU/pVicRHhLI1r2+rhAZQtUI3842Q2S3kAHkt3dxc+il
 bkwba4+ZQu+nSZ7RvFjhyoPuMKnJrV/FD47XRxk8+LiPAChut9/kAEnIbiAUER0wvl4j
 MViJ156HhbDrU1jZfPmiE8b/SQSHJgyD6befXe38+49gcZD4lFU2FHN20BaMolrztmDc
 MO5vap8h/fWr/4q8C7p4HrEBmfMbRginWsH0WNWtS7SWk14ZTXw5Pq7tRYo16H3Z4VqU
 ClNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=psMLW3mk2KBadYtwbEx+BkQpAhfZEUXKHytX1+JxPMA=;
 b=588TRnToQ5IyrFOevglOpyxgw2ZKcp5jTYFPpcTXh1Zpg9zceczq94gP8n1mn/Shfy
 cDapo5SFJ9SXV2kV3HcNYXqDW7euF4TR5gbDnrcamvoBmPcw4qjfjEQ48nOWjf+Mxq4+
 v4UAEDh6Cigo17C76DEJeNAVMX96oJsE+URB7B9l7VLShhXgqx+XPyCIljUbTYzbmpvE
 W109tgytU0q+mf6UjN2rAr7l/6SyAU9SAMCWeEfa0J32nHnikOgS5heYrhLXVQeu2Otn
 oHbynBJ7gQyFZ9K+ftG7lBAZJwviA3lciaq3H3ju9c+lEnKjPMeRQXK6wMD7Uk2PT+nJ
 0Clw==
X-Gm-Message-State: AO0yUKU92ScNMBDWtFeOAo+JKR3dLIH2U4rw3whky75SfGjDG95Z3ijH
 08gDUvVR0kgaDKMAzKnWjZ9sow==
X-Google-Smtp-Source: AK7set8HB1RdkRgtdU8E9UQlY1HmOUUg/hdQDqz4UYjyq+NE5FADY1ecE2+FIrQ3EvsxQe3ZN+fc8A==
X-Received: by 2002:a9d:1cb:0:b0:68b:d08e:2200 with SMTP id
 e69-20020a9d01cb000000b0068bd08e2200mr4340974ote.34.1677091937942; 
 Wed, 22 Feb 2023 10:52:17 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 00/10] make write_misa a no-op and FEATURE_* cleanups
Date: Wed, 22 Feb 2023 15:51:55 -0300
Message-Id: <20230222185205.355361-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:21 -0000

Hi,

In this version we gave up removing all the write_misa() body and,
instead, we went back to something closer to what we were doing in v2.
write_misa() is now gated behind an experimental x-misa-w cfg option,
defaulted to false.

The idea is that x-misa-w allow us to keep experimenting and testing the
code. Marking it as experimental will (hopefully) make users wary of the
fact that this feature is unstable. The expectation is that the flag will
be removed once write_misa() is ready to always write MISA.

Changes from v6:
- patches without reviews/acks: patch 3
- patch 2: taken from version 3, acks and r-bs preserved
- patch 3:
  - rename 'misa-w' to 'x-misa-w' to be clearer about our intents with
    the cfg option
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05047.html

Daniel Henrique Barboza (10):
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: do not mask unsupported QEMU extensions in write_misa()
  target/riscv: allow MISA writes as experimental
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 ++++---
 target/riscv/cpu.c        | 25 ++++++++++---------------
 target/riscv/cpu.h        | 29 ++++++-----------------------
 target/riscv/cpu_helper.c |  6 +++---
 target/riscv/csr.c        | 15 ++++++---------
 target/riscv/machine.c    | 11 ++++-------
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++++----
 9 files changed, 39 insertions(+), 66 deletions(-)

-- 
2.39.2


