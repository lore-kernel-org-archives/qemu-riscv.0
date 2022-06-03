Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nx9nI-0001Dc-Ht
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jun 2022 12:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n8-00017Q-18
 for qemu-riscv@nongnu.org; Fri, 03 Jun 2022 12:04:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n4-0008HU-WE
 for qemu-riscv@nongnu.org; Fri, 03 Jun 2022 12:04:49 -0400
Received: by mail-pf1-x432.google.com with SMTP id 15so7500952pfy.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jun 2022 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2aUBvrQlpNzn2WARyXj5t5iAYRyEUGcgIZzag4vLOjU=;
 b=T0gqJkF2+gAxUuBI3me+vb5sB2cUxpDg1oha7xwODHKqjfMDtvTVgPIfQYFWsGRYaB
 GuoFFjD8tsZGutz6s+3MydzANP7Aacyj8Tzgt0KRorRiS382kBwNtNdmTScXd0t8EBEx
 JptgSyD5k5jYuFSDIYMgMrU7F9SUVYXQHpLbe9t1nBPKT29xsYNE+R/UEmwv4rddGOXt
 T2aRN+0I+2bRc8rFusdaXlxps3g/i0ZiHFa4yvEce5WBnm9SD72MLp37llEJnu7dj0Jz
 wJzdgkU3WuvH86HCtL+BYWhzlYZSO2QBTzEYZ+k7JnKf6sgyhJafdprtPA0dLAG++Hz0
 rI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2aUBvrQlpNzn2WARyXj5t5iAYRyEUGcgIZzag4vLOjU=;
 b=F8Py2QJS/KKSnngjYS/xL5asx+LPfgZsdFf5cGKmit7QvbA2AA/C3JlZDfVR8CK4rq
 j6qk6t3sErzVoHT4ihHkRQ4Pp7yP+YHVDN0igKoE+vqBZrrnY1G0ktaCYLu31sqYHJer
 AuzWG2a5aFCfAETozDgxFx7FLtfn0tLcOl02gD51kR8HnTTE0eq/DuokujQxD/Ysq4TA
 w6mO+j6zfkuJIdWeSfxGziD0RsJNRl5X4lU96dnLIeOy+/KC84IZGVLef+07lrZAYjfR
 0w40OIp69oNAByqM79NGkDnXYZEJI76Kl2gGrmdqly/3Mv2PcCoJr72RRWm1XoAZ/qYR
 25lQ==
X-Gm-Message-State: AOAM532UDVAzrE/akQVLnasxAaNZZ2X5148fdRAs/mdpkgWAjVGJJTPs
 kdLRu5zZ7megaMOrtxGP23MFmg==
X-Google-Smtp-Source: ABdhPJyaheyB4WmDJIBJxEyDgiHq7Wdp9Cl/40isOzttmuiYYV8ftjNK7/yxt5BZd3IBEO6nScD9ng==
X-Received: by 2002:a62:3646:0:b0:51b:91c7:fd4a with SMTP id
 d67-20020a623646000000b0051b91c7fd4amr19598686pfa.78.1654272276894; 
 Fri, 03 Jun 2022 09:04:36 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.0.22])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016196bd15f4sm5638035pla.15.2022.06.03.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 09:04:36 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v5 0/4] RISC-V Smstateen support
Date: Fri,  3 Jun 2022 21:34:21 +0530
Message-Id: <20220603160425.3667456-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 03 Jun 2022 16:04:50 -0000

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

These patches can also be found on riscv_smstateen_v5 branch at:
https://github.com/mdchitale/qemu.git

This series depends on the following series from Anup:
https://lists.nongnu.org/archive/html/qemu-devel/2022-05/msg05231.html

Changes in v5:
- Fix the order in which smstateen extension is added to the isa_edata_arr as
described in rule #3 the comment.

Changes in v4:
- Fix build issue with riscv32/riscv64-linux-user targets

Changes in v3:
- Fix coding style issues
- Fix *stateen0h index calculation

Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Anup Patel (1):
  target/riscv: Force disable extensions if priv spec version does not
    match

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 555 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  21 ++
 5 files changed, 615 insertions(+), 3 deletions(-)

-- 
2.25.1


