Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmIq8-0000JH-Kf
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 14:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmIpv-0008K9-Bm
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 14:35:26 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmIps-0008Bn-G5
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 14:35:23 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 m20-20020a4ae3d4000000b00538c0ec9567so1359919oov.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681238117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3iBIBCvNAnmuv7pAuVCfHs087hGmvVlrkx8RqpPs/qc=;
 b=jarDJSTyKSfl2rwUBk28nccwPxiykU+vuOWDShHzsROX++hG114tsLEg8YnhLz1+gJ
 B67mP50CN8G45uQOxWmDNbszqMsBzoZDx7naei51KKLVJlXnT2fTg3mfsjV4ps6rN0KT
 P4U/KQT+X64KLcF/cy+QpzNHmehsLXS0ewT1afWpjbk0XvrzwGUiIylRYTdZY5jOD9AC
 Dc5/pi0kaYe1h8bU7so/VVDkVusV38TptTpnKesvzonrpltl+5UyrEK+HC/o3sYEtOrX
 +vORUfcOAMmw9e00jMsX3kqrH/nZLR4WxiZpAfEzX1vta52GovNWNjDKkGhnr2KHh1NT
 bsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3iBIBCvNAnmuv7pAuVCfHs087hGmvVlrkx8RqpPs/qc=;
 b=8Cn1+YWFDHykvRrbAR2Li2oHbXcL5AKAIgz02hV5qi/2aYi8siJ32bbiUtmUPj/zQm
 0R9founwNLQA71iToNP+Za4wLDjCPQmG5fLM9oOQiN1jLVC4VH6PEfoJfFN/xN97EEZs
 yopVh27eTpmUzPW+EHsXfsuJE1MJvjWo1jzHTiZleZ/xiIu3RTXl/TEMUIHdB6qIN0bc
 li/nMKVuc9wgm2FNIRN8ZechUQFa7G3yxhPRXLzMelFs+hx4C0e/ec2lrR+/Yf2ozViX
 hHAFhvWsqPJ6qbHmx3QR2JT2MgUTeYC0w6Xu8FfiKcHv6zmi91e21hMVSQZTwHGLPnrg
 lFTQ==
X-Gm-Message-State: AAQBX9cGrvUiFtCERI3xm3m15eS1vUg671fXZvkXFLpwVa+/TMuPW+iD
 xkrwOX+ODY+j8O+BMCtbAQ8RgQ==
X-Google-Smtp-Source: AKy350aMn4DfBOF8eI5jRkfi/YD1l97xNhYZ7biiC9MYiJnbY1Q3eFyYzgd/Z7UkVtYG5vYMWx+XkA==
X-Received: by 2002:a4a:5242:0:b0:525:59fd:fbe7 with SMTP id
 d63-20020a4a5242000000b0052559fdfbe7mr6561324oob.2.1681238117603; 
 Tue, 11 Apr 2023 11:35:17 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 4-20020a4a1404000000b005413e617935sm6149983ood.15.2023.04.11.11.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 11:35:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/3] target/riscv: implement query-cpu-definitions
Date: Tue, 11 Apr 2023 15:35:08 -0300
Message-Id: <20230411183511.189632-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 18:35:28 -0000

Hi,

In this v3 I removed patches 3 and 4 of v2.

Patch 3 now implements a new type that the generic CPUs (any, rv32,
rv64, x-rv128) were converted to. This type will be used by
query-cpu-definitions to determine if a given cpu is static or not based
on its type. This approach was suggested by Richard Henderson in the v2
review.

Patches are based on top of Alistair's riscv-to-apply.next.

Changes from v2:
- old patches 3 and 4: removed
- patch 3:
  - add TYPE_RISCV_DYNAMIC_CPU
  - use this type to set 'q_static' in riscv_cpu_add_definition()
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01310.html

Daniel Henrique Barboza (3):
  target/riscv: add CPU QOM header
  target/riscv: add query-cpy-definitions support
  target/riscv: add TYPE_RISCV_DYNAMIC_CPU

 qapi/machine-target.json      |  6 ++-
 target/riscv/cpu-qom.h        | 70 +++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c            | 20 ++++++++--
 target/riscv/cpu.h            | 46 +----------------------
 target/riscv/meson.build      |  3 +-
 target/riscv/riscv-qmp-cmds.c | 57 ++++++++++++++++++++++++++++
 6 files changed, 150 insertions(+), 52 deletions(-)
 create mode 100644 target/riscv/cpu-qom.h
 create mode 100644 target/riscv/riscv-qmp-cmds.c

-- 
2.39.2


