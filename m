Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPPK-00045a-JN
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPA-0003iG-E8
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:30 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPP7-00035g-8A
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:26 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1879edfeff5so13349932fac.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740023; x=1684332023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nB7R8ngHJB13nLECFi0woNZhXZm+dTNI2xzF31bklNw=;
 b=oQGvzYiI+yAGR73dwMGk6t3vAcGguvaY0SRMFpvnFmI/GUsUqQ72AijmpzLv7GyPPx
 6RP8Hy1BCjPv6cpnr9+YwbCc9a1atufub56zu6wkjcOyK2HnoCfe8FoY+QQmQuiSu6DP
 cpnFZrO6fSxHz6UpmvkiaQCnSZg0UaQh9HG1aZFYoqY0VE1go6G+iHfPuqsKqCsPeUC/
 UergXKnCcB1e1BRAcKkdiI2noO5eDJXJBHF0LwqXgqAmpYu9YmI7w0bTLzgNIUcztmZ9
 H3X3UOjzsrFQxTXCguqrhwtUEVMoMB7zWiqE5slHIi6TrBnxnz9oi4qioqlmkB2XAsL4
 bpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740023; x=1684332023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nB7R8ngHJB13nLECFi0woNZhXZm+dTNI2xzF31bklNw=;
 b=EYolSDQl9h3OJtvVUhVYfaIKgc9lFqQEDGLP9KT8m8NH7CNhAW3gnakUhPGoTaptV2
 wH4FX6rBl9aQOxwLqGJDhHXTxS9LfjtBxeYLCf3LCVU4Jc67hIhERKPjqGQFB2mcn54d
 4X7Q2RLnyQLUn6YaYi300IVhKMwUCoTrWdTP/gYjWJCZnaY54GJZAUb1ksJIOzDob51f
 U4nuEHychnNnyArOUDJiDktxvxrVGw6sj6JNjRzmprDhkW6C5/h2RVvdmxFtZ0l682cI
 +gSSZ1G02xl7R1dRfxv04BWUrwnJR78R159UNKxEj3D0cAEJKVUWgKSiBYIUuYirTj5q
 6zig==
X-Gm-Message-State: AAQBX9epZ2Sc2rXJeJC7EqQwlbZkOmwVzCu2E7F6X/YgKK/u7ALhOqVR
 cCME1AmYO31ECIFzaVyvcmhONQ==
X-Google-Smtp-Source: AKy350YoKRZse0PsVOFWNx4GLaNEHa65nZ+6UCVjx4iweDvwmWWkVh5Hve4saGL4+0K4DSDGQWJkPg==
X-Received: by 2002:a05:6870:c1d5:b0:176:263e:9965 with SMTP id
 i21-20020a056870c1d500b00176263e9965mr9406623oad.44.1681740023141; 
 Mon, 17 Apr 2023 07:00:23 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:22 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 00/12] target/riscv: rework CPU extensions validation
Date: Mon, 17 Apr 2023 11:00:01 -0300
Message-Id: <20230417140013.58893-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 14:00:32 -0000

Hi,

In this v7 we have three extra patches: 

- patch 4 [1] and 5 [2], both from Weiwei Li, addresses an issue that
we're going to have with Zca and RVC if we push the priv spec
disabling code to the end of validation. More details can be seen on
[3]. Patch 5 commit message also has some context on it;

- patch 12 is something that was able to do with the recent changes from
Alistair's riscv-to-apply.next branch. We're using the bits from the
query-cpu-definitions work to filter out static CPUs from write_misa();

Patches missing acks: patch 12.

Patches based on top of current Alistair's riscv-to-apply.next.

Changes from v6:
- patches 4 and 5 from Weiwei Li were added
- patch 12 (new):
  - make write_misa a no-op when we're running a static CPU
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06934.html


[1] https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01010.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01950.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg00994.html

Daniel Henrique Barboza (10):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv: rework write_misa()
  target/riscv: forbid write_misa() for static CPUs

Weiwei Li (2):
  target/riscv: Mask the implicitly enabled extensions in isa_string
    based on priv version
  target/riscv: Update check for Zca/Zcf/Zcd

 target/riscv/cpu.c                      | 338 ++++++++++++++----------
 target/riscv/cpu.h                      |   5 +
 target/riscv/csr.c                      |  48 ++--
 target/riscv/insn_trans/trans_rvd.c.inc |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc |  14 +-
 target/riscv/insn_trans/trans_rvi.c.inc |   5 +-
 target/riscv/translate.c                |   5 +-
 7 files changed, 254 insertions(+), 173 deletions(-)

-- 
2.39.2


