Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poBds-00009c-1z
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 19:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdq-00008j-8G
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:42 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdm-0004GU-Ot
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:41 -0400
Received: by mail-pl1-x62a.google.com with SMTP id lh8so10824491plb.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Apr 2023 16:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687116; x=1684279116; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wO+rCJ7u3vdZTAwTfavGPwf2QxLk0VLkqeBo7jdqhpk=;
 b=pN8LU1tqvskBlwX3jB/oTEcdAtGY8F6yX0e3cbaEz/k3LcGunMxXc1d2iZzQ35OVNq
 ojNiT9uQPXui0+ozKOw4G42QMi5BVJsqVL2lh3jZADRaJtZR28uY5NTkp9aJnzHJRKxI
 ozVzaCnwmiov6w13lKexqojzcS4wCFaog3bjzzHgYWMrZpz8w4nB7QHl4Za6npocKGSZ
 MYs5oeBhyctVWE2k1d4uvKNKwSTQ0ijEvJInkCQC9nsuEALehTqEZWqc+BgOPV/p8dM/
 nnT9sCQsWdeJYsJUM9IQIR+k0wuT5ANlp0qzcnPcM1Icm7ZJVZ55iIaIHX+GsUfiK+0b
 Ni1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687116; x=1684279116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wO+rCJ7u3vdZTAwTfavGPwf2QxLk0VLkqeBo7jdqhpk=;
 b=Czyxb+hA1kkdCufXl1hxhARlU8dyQYQ85tDxA5FC7g2mSoAC6eoXKBHFbE4cnYpGLH
 ah6N3vmhCFmm4tm+q59oGVdrNZj9ki3DGQtMdQfwEFrWlzJSbg2vdVQ+x6mh/YQEP0Yp
 HUKKHEAOP7HNfKzB4xHBnApNq9D9yIFumPzU2AJB6ov2aplDG+41J8HcuT3tF7Oedyiv
 EuiBenEThK1gWH7XdmbccMrEz9XK0tVsm1GpYblFw1azDqlL7pROjp7BuI/9Nh5vq3pr
 ZcVmgpjE1ZHFN16ZNRjH5gBmeq/OntGauiBO6UABWWjDno9PZsc6WYD8H0K+hBzYSD8d
 jtQw==
X-Gm-Message-State: AAQBX9elfK0CD3XCLOgsl4h2MzLNV/jy1p/ITKbQzTRkGTQid+XnJZvr
 rn8Z3qPJzmYmaXzOVj11CAFyPA==
X-Google-Smtp-Source: AKy350bRG7AODP/qO6vVa6C1r4YXkWrnziQIGY58VMKlJicHdRyyUi/390pcnUE7FEtMfnvf5YLCnQ==
X-Received: by 2002:a17:903:1d1:b0:1a6:c12d:9027 with SMTP id
 e17-20020a17090301d100b001a6c12d9027mr5180708plh.56.1681687115797; 
 Sun, 16 Apr 2023 16:18:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:35 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 0/8] riscv: implement Ssqosid extension and CBQRI
 controllers
Date: Sun, 16 Apr 2023 16:20:42 -0700
Message-Id: <20230416232050.4094820-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dfustini@baylibre.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 16 Apr 2023 23:18:42 -0000

This RFC series implements the Ssqosid extension and the sqoscfg CSR as
defined in the RISC-V Capacity and Bandwidth Controller QoS Register
Interface (CBQRI) specification [1]. Quality of Service (QoS) in this
context is concerned with shared resources on an SoC such as cache
capacity and memory bandwidth.

These patches are available as a public git branch [2].

sqoscfg CSR
-----------
The sqoscfg CSR provides a mechanism by which a software workload (e.g.
a process or a set of processes) can be associated with a resource
control ID (RCID) and a monitoring counter ID (MCID) that accompanies
each request made by the hart to shared resources like cache.

CBQRI defines operations to configure resource usage limits, in the form
of capacity or bandwidth, for an RCID. CBQRI also defines operations to
configure counters to track the resource utilization per MCID.

CBQRI controllers
-----------------
This series also implements an CBQRI capacity controller and an CBQRI
bandwidth controller as well as an example SoC that instantiates the
controllers with a specific configuration:

  - L2 cache controllers
    - Resource type: Capacity
    - Number of capacity blocks (NCBLKS): 12
    	- In the context of a set-associative cache, the number of
	  capacity blocks can be thought of as the number of ways
    - Number of access types: 2 (code and data)
    - Usage monitoring not supported
    - Capacity allocation operations: CONFIG_LIMIT, READ_LIMIT

  - Last-level cache (LLC) controller
    - Resource type: Capacity
    - Number of capacity blocks (NCBLKS): 16
    - Number of access types: 2 (code and data)
    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
    - Event IDs supported: None, Occupancy
    - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID

  - Memory controllers
    - Resource type: Bandwidth
    - Number of bandwidth blocks (NBWBLKS): 1024
       - Bandwidth blocks do not have a unit but instead represent a
         portion of the total bandwidth resource. For NWBLKS of 1024,
	 each block represents about 0.1% of the bandwidth resource.
    - Maximum reserved bandwidth blocks (MRBWB): 819 [80% of NBWBLKS]
    - Number of access types: 1 (no code/data differentiation)
    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
    - Event IDs supported: None, Total read/write byte count, Total
                           read byte count, Total write byte count
    - Bandwidth allocation operations: CONFIG_LIMIT, READ_LIMIT

The memory map for this example SoC:

  Base addr  Size
  0x4820000  4KB  Cluster 0 L2 cache controller
  0x4821000  4KB  Cluster 1 L2 cache controller
  0x4828000  4KB  Memory controller 0
  0x4829000  4KB  Memory controller 1
  0x482A000  4KB  Memory controller 2
  0x482B000  4KB  Shared LLC cache controller

This configuration is meant to provide a "concrete" example for software
(like Linux) to test against. It represents just one of many possible
ways for hardware to implement the CBQRI spec.

In addition, please note that this RFC series only implements the
register interface that CBQRI specifies. It does not attempt to emulate
the performance impact of configuring limits on shared resources like
cache and memory bandwidth. Similarly, the code does not attempt to
emulate cache and memory bandwidth utilization, like what would be
observed on a real hardware system implementing CBQRI.

Status of CBQRI
---------------
The CBQRI spec is still in a draft state and is undergoing review [3].
It is possible there will be changes to the Ssqosid extension and the
CBQRI spec. For example, the sqoscfg CSR address is not yet finalized.

The goal of this Qemu patch series, along with complimentary Linux patch
series, is to satisfy the software proof of concept requirement for
CBQRI to be frozen.

Note: CBQRI was previously known as CMQRI and the github repo with the
spec has not yet been renamed [4].

Future work
-----------
Currently the configuration of the CBQRI controller parameters is done
directly in cbqri_example_soc.c but this requires a user to edit the
code for a different configuration. In the future, the configuration of
CBQRI controller parameters will be done as command line arguments.

In addition, the device tree generation will be expanded to include
CBQRI-related properties. Currently, these are added to the dumped dtb
that Linux consumes for the purposes of testing this RFC.

For those interested in the software using this Qemu implementation,
I will follow-up with a link to the Linux patches once posted.

[1] https://github.com/riscv-non-isa/riscv-cmqri/blob/main/riscv-cbqri.pdf
[2] https://gitlab.baylibre.com/baylibre/qemu/-/tree/riscv-cbqri-rfc
[3] https://lists.riscv.org/g/tech-cmqri/message/38
[4] https://lists.riscv.org/g/tech-cmqri/message/41

Kornel Dulęba (1):
  riscv: implement Ssqosid extension and sqoscfg CSR

Nicolas Pitre (7):
  hw/riscv: define capabilities of CBQRI controllers
  hw/riscv: implement CBQRI capacity controller
  hw/riscv: implement CBQRI memory controller
  hw/riscv: instantiate CBQRI controllers for an example SoC
  hw/riscv: Kconfig: add CBQRI options
  hw/riscv: meson: add CBQRI options to the build
  hw/riscv: virt: initialize the CBQRI example SoC

 disas/riscv.c                |   1 +
 hw/riscv/Kconfig             |   8 +
 hw/riscv/cbqri_bandwidth.c   | 511 +++++++++++++++++++++++++++++++++
 hw/riscv/cbqri_capacity.c    | 532 +++++++++++++++++++++++++++++++++++
 hw/riscv/cbqri_example_soc.c | 124 ++++++++
 hw/riscv/meson.build         |   4 +
 hw/riscv/virt.c              |   3 +
 include/hw/riscv/cbqri.h     |  81 ++++++
 target/riscv/cpu.c           |   2 +
 target/riscv/cpu.h           |   3 +
 target/riscv/cpu_bits.h      |   5 +
 target/riscv/csr.c           |  34 +++
 12 files changed, 1308 insertions(+)
 create mode 100644 hw/riscv/cbqri_bandwidth.c
 create mode 100644 hw/riscv/cbqri_capacity.c
 create mode 100644 hw/riscv/cbqri_example_soc.c
 create mode 100644 include/hw/riscv/cbqri.h

-- 
2.34.1


