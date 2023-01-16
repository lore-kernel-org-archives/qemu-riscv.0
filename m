Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHOco-0008VF-RI
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 07:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcj-0008Pu-Uh
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:02 -0500
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcg-0003FW-N7
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:01 -0500
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-1442977d77dso28707144fac.6
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 04:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5FDxluXRmeUXAj2YNso60vHmpeJDnwoXF1/zCr+eBh8=;
 b=WKncmo3mjzwxT2ezx72+RnLNk6fl2ZFM8AJzah/lYZKbzuSSK8YjIGPkhdjQQKPl0+
 /UiWzwIk1l0fwP1qLstV9rlV29KRkSlz6+KGnE1tAdtjH1dYyGPpyqm+27fuLH7qQBzk
 t6pAOchK0VPv8AiU44RHueXFhd6w3nT1Nn+Q7zJat0T+DljqITRDlA85Q7c1HoHeKEYE
 QOuRbn2pE/tWBnm+KwHWfHbUSopleWvQE+x0iyAkFVte7TJAW3Shy+SpwaEREB50w5Dc
 imJUwW6m6Lqj+q48bPe+VyTXIzoV+1tQyZbJiofem7JTDsDzxAOJO1/ZnOgunbYPQILK
 SBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5FDxluXRmeUXAj2YNso60vHmpeJDnwoXF1/zCr+eBh8=;
 b=htPJijCie1SEfigbN2pyj+Clcjvq2gTv6H8pdrK85ovVcbTIM89rZylk05D7LLoz70
 DAL/xnjnDtB0aTSZWOcnnIlm1s2LccM7kU7RePrTTyT71VbybPiBUmAlCM8ggxkoVwdL
 QlHSGSmWyu2BMhdKI090mo+W3dXM2e67iZ820xu6ueL1qYEvBjT1xuFQMghzQAsWPPvj
 iwMH/8SGl9zyjDhO1lXSShiTMqL9X3BgQUGfB3nvxikhub787SVnlmEXOVbV21qD0OYW
 72B3lC0kw6+Lwq2KdarOtcL9F3anVxiKPI/7buESXL2Kw7BJDnGZ2kcqHRU+eHEhx2va
 vSxw==
X-Gm-Message-State: AFqh2kqZ60mNwtzblDyzeQ7vryFZmtWIiN12P1At0ijO9evmNnAC7AhZ
 8eGDwFtmoNSh8XDdqxNUN70Kng==
X-Google-Smtp-Source: AMrXdXs9puokBoymhS0uljSDcb3NSPTAHSZ5tmvSkM+PZ7IsogiAs+XqcjYrIcfqDDpLYk+nEa67xg==
X-Received: by 2002:a05:6870:b624:b0:14b:c9ab:f185 with SMTP id
 cm36-20020a056870b62400b0014bc9abf185mr50762737oab.11.1673872194736; 
 Mon, 16 Jan 2023 04:29:54 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 g21-20020a0568080dd500b00360f68d509csm12814540oic.49.2023.01.16.04.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:29:54 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 0/3] hw/riscv: clear kernel_entry high bits with 32bit CPUs
Date: Mon, 16 Jan 2023 09:29:45 -0300
Message-Id: <20230116122948.757515-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x41.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 12:30:03 -0000

Hi,

This version has changes in patch 3 where we're now using extract64()
instead of a plain bit mask to return the 32 bit address in
translate_fn().

Changes from v7:
- patch 2:
  - added Alistair's r-b
- patch 3:
  - use extract64() to return the 32 bit address
v7 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02916.html

Daniel Henrique Barboza (3):
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static
  hw/riscv: clear kernel_entry higher bits in load_elf_ram_sym()

 hw/riscv/boot.c            | 108 ++++++++++++++++++++++++-------------
 hw/riscv/microchip_pfsoc.c |  12 +----
 hw/riscv/opentitan.c       |   3 +-
 hw/riscv/sifive_e.c        |   4 +-
 hw/riscv/sifive_u.c        |  12 +----
 hw/riscv/spike.c           |  13 +----
 hw/riscv/virt.c            |  12 +----
 include/hw/riscv/boot.h    |   3 +-
 target/riscv/cpu_bits.h    |   1 +
 9 files changed, 87 insertions(+), 81 deletions(-)

-- 
2.39.0


