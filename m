Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prPNZ-0007Lc-2f
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 16:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNY-0007L1-3U
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:12 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNV-0002hr-He
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso38223814b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454907; x=1685046907; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JCy5CL+aVV3L+d+6YznmFmc95xl+9Z1cVCbvDUGg+7s=;
 b=DTbux1NqDQwufutBK3IpPeWjqnsSBvn4yxbfZXC2JiDN5iD0rIVkh3MSke5Kxd+2ZO
 yRXj7sqi4Iv4YzZ+EqeE/g9QDuN/1suoZD3tGavhl129WzyqGUocQ/e/8Mfx87QBJ74A
 lowxm/YL4KIyy54a7QlcGIrBbh/VeeHq4kHsSO+00W+9zOQ1vhpI5TC764yraDDSLRFL
 SV7Z15Q38Li8BmHneOvesCk3o+DmE7+1ZQueOH22kHNG4d4uI5/YvsQL4oC5JzrIeQtb
 vOJ1L7cd4IWnWc5NyX6mbAE3NjoYym1Ev2cKk0NQkoMby9EkYQYBB0Srp7UQePz41Ijf
 cQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454907; x=1685046907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JCy5CL+aVV3L+d+6YznmFmc95xl+9Z1cVCbvDUGg+7s=;
 b=FUMsdDoPFPYCBiC8E+3LrVTVgfywHA+0GsLKxMiT/wgJq8scwaVXf2pz6hbzPXWHsf
 SvezXWQHxcOtUbB/FANG4rqZQ0+sltNpHpg8LsgXGDPErRcIBddu7zJwzTBxiyRROVhK
 DQDvkUn3H7V7U78iWGIC2pu/w1mlPK2EIfIBDuZD3avpMxDvo382W3X+5rvOtGbUfNp1
 Op3Cv/RlxL06Oy3cQCPCkHqUxz6b9iuImnbzwKZM8aml2mAVw/101wDSvhxOfLcHP8AV
 6cQd29EUB4O7zih5ip5MtEJ4xxqJy5NKDa+2pBSO+hcY+qf59VKCA47y3nvDH68b9OV0
 4xNg==
X-Gm-Message-State: AAQBX9cAib0JffWT4/X7NAjonKDYDmDAXAzxm7brn24/kiXvXCvXYl32
 Z3mH25w2CmTkc5RzOb+vuSmbrA==
X-Google-Smtp-Source: AKy350ZHzQ8EJKPdjlfM/B4Z/AIm/oHMTa1WPRSJ6zF9vSOAouDzpzTrphFr+jO215kTj4RUjw3Pjg==
X-Received: by 2002:a17:90a:b005:b0:24b:60d0:d622 with SMTP id
 x5-20020a17090ab00500b0024b60d0d622mr16895462pjq.24.1682454906824; 
 Tue, 25 Apr 2023 13:35:06 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:06 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 0/9] riscv: implement Ssqosid extension and CBQRI
 controllers
Date: Tue, 25 Apr 2023 13:38:25 -0700
Message-Id: <20230425203834.1135306-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dfustini@baylibre.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 20:35:12 -0000

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
bandwidth controller which can be configured from the command line:

  $ qemu-system-riscv64 -M virt ... \
      -device riscv.cbqri.capacity,mmio_base=0x04828000[,...] \
      -device riscv.cbqri.bandwidth,mmio_base=0x04829000[,...]
    
The mmio_base option is mandatory, the others are optional.
                           
As many -device arguments as wanted can be provided as long as their
mmio regions don't conflict.

To see all possible options:

  $ qemu-system-riscv64 -device riscv.cbqri.capacity,help
  riscv.cbqri.capacity options:
    alloc_op_config_limit=<bool> -  (default: true)
    alloc_op_flush_rcid=<bool> -  (default: true)
    alloc_op_read_limit=<bool> -  (default: true)
    at_code=<bool>         -  (default: true)
    at_data=<bool>         -  (default: true)
    max_mcids=<uint16>     -  (default: 256)
    max_rcids=<uint16>     -  (default: 64)   
    mmio_base=<uint64>     -  (default: 0)
    mon_evt_id_none=<bool> -  (default: true)
    mon_evt_id_occupancy=<bool> -  (default: true)
    mon_op_config_event=<bool> -  (default: true)
    mon_op_read_counter=<bool> -  (default: true)
    ncblks=<uint16>        -  (default: 16)
    target=<str> 
   
  $ qemu-system-riscv64 -device riscv.cbqri.bandwidth,help
  riscv.cbqri.bandwidth options:
    alloc_op_config_limit=<bool> -  (default: true)
    alloc_op_read_limit=<bool> -  (default: true)
    at_code=<bool>         -  (default: true)
    at_data=<bool>         -  (default: true)
    max_mcids=<uint16>     -  (default: 256)
    max_rcids=<uint16>     -  (default: 64)
    mmio_base=<uint64>     -  (default: 0)
    mon_evt_id_none=<bool> -  (default: true)
    mon_evt_id_rdonly_count=<bool> -  (default: true)
    mon_evt_id_rdwr_count=<bool> -  (default: true)
    mon_evt_id_wronly_count=<bool> -  (default: true)
    mon_op_config_event=<bool> -  (default: true)
    mon_op_read_counter=<bool> -  (default: true)
    nbwblks=<uint16>       -  (default: 1024)
    target=<str>

Boolean options correspond to hardware capabilities that can be disabled
 
CBQRI proof-of-concept
----------------------
A hypothetical SoC with the following CBQRI controller configuration is
used for the CBQRI proof-of-concept:

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

The memory map used for the proof-of-concept:

  Base addr  Size
  0x4820000  4KB  Cluster 0 L2 cache controller
  0x4821000  4KB  Cluster 1 L2 cache controller
  0x4828000  4KB  Memory controller 0
  0x4829000  4KB  Memory controller 1
  0x482a000  4KB  Memory controller 2
  0x482b000  4KB  Shared LLC cache controller

This configuration is meant to provide a "concrete" example for software
(like Linux) to test against. It represents just one of many possible
ways for hardware to implement the CBQRI spec.

The CBQRI proof-of-concept configuration is created with the following:

  qemu-system-riscv64 \
        -M virt \
        -nographic \
        -smp 8 \
        -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=12,alloc_op_flush_rcid=false,mon_op_config_event=false,mon_op_read_counter=false,mon_evt_id_none=false,mon_evt_id_occupancy=false,mmio_base=0x04820000 \
        -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=12,alloc_op_flush_rcid=false,mon_op_config_event=false,mon_op_read_counter=false,mon_evt_id_none=false,mon_evt_id_occupancy=false,mmio_base=0x04821000 \
        -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=16,mmio_base=0x0482B000 \
        -device riscv.cbqri.bandwidth,max_mcids=256,max_rcids=64,nbwblks=1024,mrbwb=819,mmio_base=0x04828000 \
        -device riscv.cbqri.bandwidth,max_mcids=256,max_rcids=64,nbwblks=1024,mrbwb=819,mmio_base=0x04829000 \
        -device riscv.cbqri.bandwidth,max_mcids=256,max_rcids=64,nbwblks=1024,mrbwb=819,mmio_base=0x0482a000

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
series [4][5], is to satisfy the software proof of concept requirement 
or CBQRI to be frozen.

Future work
-----------
In the future, the device tree generation will be expanded to include
CBQRI-related properties. Currently, these are added to the dumped dtb
that Linux consumes for the CBQRI proof-of-concept [5].

Changes since v1
----------------
- Rebase on current master (8.0.50) instead of 8.0.0-rc4
- Configure CBQRI controllers based on device properties in command line
  arguments instead of a fixed example SoC configuration.
- Move TYPE_RISCV_CBQRI_BC and TYPE_RISCV_CBQRI_CC into header so that
  machines may use it (suggested by Alistair).
- Change 'select RISC_CBQRI' to 'imply RISCV_CBQRI' for RISCV_VIRT.
- Patches 8/9 could be dropped as they are not needed for the CBQRI
  proof-of-concept to work. They are only meant to serve as an example
  for those implementing new machines.

[1] https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
[2] https://gitlab.baylibre.com/baylibre/qemu/-/tree/riscv-cbqri-rfc-v2
[3] https://lists.riscv.org/g/tech-cbqri/message/38
[4] https://lore.kernel.org/linux-riscv/20230410043646.3138446-1-dfustini@baylibre.com/
[5] https://lore.kernel.org/linux-riscv/20230419111111.477118-1-dfustini@baylibre.com/

