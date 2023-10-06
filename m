Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BCE81DF9
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:22:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokm4-0005sV-9D; Fri, 06 Oct 2023 09:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm2-0005sF-EO
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qoklz-00036f-BO
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c88b467ef8so10892405ad.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598501; x=1697203301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7cx30TPsSMlthaQY6ArUoO3g4FeF87/3sFYVmmtB7us=;
 b=SRQGSWXon9HpAoGvRbz99AeILEgFjt+Zto/vUTwz1LYx8wetwf1os8cMb5/uaX33T/
 hM6ENt1n0s3s8A5nNJM92fcvBTF7TH+hLimLcujl69bFCJMIK3ZiMw0v0ILYGR1ovsvY
 /bYqpHNQz0RGq//dmDKmZvGdimG+ZqBwA31GWUR0RCd4BJagvwMIje6EtWoAVxKV34jq
 gtAzSa95a5Gnxvzm9iPJqVb4S2XuQa0damCbbtPXA4/kk5OZFCITqwhqr/0xPJET3vsg
 Czi4QXDXUfI1bf/L4dn23qJumOcnfZ9WoGR95hqW8lJL8GLI8LS7MFXRxFhzx+9l8aPj
 UUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598501; x=1697203301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7cx30TPsSMlthaQY6ArUoO3g4FeF87/3sFYVmmtB7us=;
 b=Vzx7yDsJhsxAECVwGJ5PjW3umM4OIvxPPYkmTY+kbNYi8Y63ajRtNzlywjWFE2rxzv
 jEKvcdY8k1YKLcbChVhpLI+/lR05mo4wpURkH31Sk2mqfzt+Yhh2VRGzvTdchFftv2OE
 j8cm1fj7sCOBV3tqVn+O1lTNnueIWE8wgpIJPjMJC6jjFVacYNNV+P4wyNVK5FPoziKF
 VNYV85CR79NNC1VwB8Quucg483nEALLf0uv/3aZJouKJS+bq83VBxmIRHA2phbYDNEfg
 MuBSloSsqlNtPTDx8g8gnErypV6M6ZRsoEniS0YysOuxjQjitbxJJk6jVtCusp1G6HO1
 nn3Q==
X-Gm-Message-State: AOJu0YwnW12rudzPEJpvvdPbbqXYOZu9NEd/e2yDGajYowu+7Leq9Gl2
 028r1TBFOoejvD4FeQqY9W4Dlg==
X-Google-Smtp-Source: AGHT+IHSuOYZ6GEP2WJnet++98DRbdtYD/8FLA6G4weOmQokKYKcpWMobjD3kf7vZSWuz9eVbatkkA==
X-Received: by 2002:a17:903:22cd:b0:1bf:3c10:1d70 with SMTP id
 y13-20020a17090322cd00b001bf3c101d70mr9368048plg.6.1696598501127; 
 Fri, 06 Oct 2023 06:21:41 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 00/10] riscv: RVA22U64 profile support
Date: Fri,  6 Oct 2023 10:21:24 -0300
Message-ID: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
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

Hi,

Several design changes were made in this version after the reviews and
feedback in the v1 [1]. The high-level summary is:

- we'll no longer allow users to set profile flags for vendor CPUs. If
  we're to adhere to the current policy of not allowing users to enable
  extensions for vendor CPUs, the profile support would become a
  glorified way of checking if the vendor CPU happens to support a
  specific profile. If a future vendor CPU supports a profile the CPU
  can declare it manually in its cpu_init() function, the flag will
  still be set, but users can't change it;

- disabling a profile will now disable all the mandatory extensions from
  the CPU;

- the profile logic was moved to realize() time in a step we're calling
  'commit profile'. This allows us to enable/disable profile extensions
  after considering user input in other individual extensions. The
  result is that we don't care about the order in which the profile flag
  was set in comparison with other extensions in the command line, i.e.
  the following lines are equal:

  -cpu rv64,zicbom=false,rva22u64=true,Zifencei=false

  -cpu rv64,rva22u64=true,zicbom=false,Zifencei=false

  and they mean 'enable the rva22u64 profile while keeping zicbom and
  Zifencei disabled'.


Other minor changes were needed as result of these design changes. E.g.
we're now having to track MISA extensions set by users (patch 7),
something that we were doing only for multi-letter extensions.

Changes from v1:
- patch 6 from v1 ("target/riscv/kvm: add 'rva22u64' flag as unavailable"):
    - moved up to patch 4
- patch 5 from v1("target/riscv/tcg-cpu.c: enable profile support for vendor CPUs"):
    - dropped
- patch 6 (new):
  - add riscv_cpu_commit_profile()
- patch 7 (new):
  - add user choice hash for MISA extensions
- patch 9 (new):
  - handle MISA bits user choice when commiting profiles
- patch 8 and 10 (new):
  - helpers to avoid code repetition
- v1 link: https://lore.kernel.org/qemu-riscv/20230926194951.183767-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (10):
  target/riscv/cpu.c: add zicntr extension flag
  target/riscv/cpu.c: add zihpm extension flag
  target/riscv: add rva22u64 profile definition
  target/riscv/kvm: add 'rva22u64' flag as unavailable
  target/riscv/tcg: add user flag for profile support
  target/riscv/tcg: commit profiles during realize()
  target/riscv/tcg: add MISA user options hash
  target/riscv/tcg: add riscv_cpu_write_misa_bit()
  target/riscv/tcg: handle MISA bits on profile commit
  target/riscv/tcg: add hash table insert helpers

 target/riscv/cpu.c         |  29 +++++++
 target/riscv/cpu.h         |  12 +++
 target/riscv/cpu_cfg.h     |   2 +
 target/riscv/kvm/kvm-cpu.c |   7 +-
 target/riscv/tcg/tcg-cpu.c | 165 +++++++++++++++++++++++++++++++++----
 5 files changed, 197 insertions(+), 18 deletions(-)

-- 
2.41.0


