Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFebu-0002R9-T7
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 12:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFebt-0002O4-Il
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:09:57 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFebr-00067j-OV
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:09:57 -0500
Received: by mail-oo1-xc41.google.com with SMTP id
 t15-20020a4a96cf000000b0049f7e18db0dso4190239ooi.10
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 09:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AH6Fb9n2zOUywkwcVOAInIzMkndQ0tKmVWwBsc0N+DQ=;
 b=jASZwSSSCanbgkLaXYyV6/kmv2Q8EVkubjwNtzwQ803ZemIzomeWrp9+NBQtjbWCSg
 5lrYnOeJJaXrBWfBIkffbl4SMI7qHrt36SHLNy0whaVA1cVgKvJanVqawZpzawJykHSC
 q8BWR8H4aR4e/8wUPtWKkRP1V/e7WVZFBMSPRYTCnps0lQVh64ZWYXw8y8NmQPAxHzCw
 iNzWfvDJJVIGcGEQRYoDf/Kt9g5cyxLZSW781+kHYi0oPdUU6UGM2bePijWqMCHE2LCK
 F9Z0SAepbn0/IQGW6rfg2+I+hK7VqnylghAl5N6PL9UDMm4zPaufZ4/NOVFze5qeeZDS
 Ibug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AH6Fb9n2zOUywkwcVOAInIzMkndQ0tKmVWwBsc0N+DQ=;
 b=51IYLnoDJFYeLn55ikC1g5ZKN0tVlgFBS4TXzYJ7o1bUddutNB4hMrkIHnmtDcbht2
 /qwvXLldESitC6/RDKANuBsJl3Qw+XGcGF/gpxieMdFfy4E+jF60TCEVBapSmhzs5Uex
 zHTcIA4ozSEL4+jEe6fgxDy9hLHfVvnccsd8+W7v9l9bWxdlwXOYJyHpDMGoHOGhM401
 11jFarl+hYJkAwQEHQ7w4fMMKKFi4Gwb9bvRRR6SxP7YnUCEsnUu4T5bwZmlBno61qNJ
 kUOHUTYEVMuVlkL4W1B15/MuxbV8wkTuCOlawrOOM150yfYvA+TiNLQAbSpc3hRvAyUN
 Awaw==
X-Gm-Message-State: AFqh2krpPtDLAdmOmkQ9zywTlFbjRbCqlgSZnunWM1zc/BUb7Bf3UtDn
 X8orSMJeN0o2QEzgkeulxIxoOA==
X-Google-Smtp-Source: AMrXdXsBabeqnNzs822rstiYr8w8sdWPstEzdcXW+cbXwOApUJIoFfhN2YNc6PHqbIMUea+YYTL3Rw==
X-Received: by 2002:a4a:5516:0:b0:4a3:f27d:f324 with SMTP id
 e22-20020a4a5516000000b004a3f27df324mr1699709oob.4.1673456994467; 
 Wed, 11 Jan 2023 09:09:54 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:09:54 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/10] riscv: create_fdt() related cleanups
Date: Wed, 11 Jan 2023 14:09:38 -0300
Message-Id: <20230111170948.316276-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc41.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 17:09:57 -0000

Hi,

This is a follow-up of:

"[PATCH v5 00/11] riscv: OpenSBI boot test and cleanups"

Patches were based on top of riscv-to-apply.next [1] + the series above.

The recent FDT changes made in hw/riscv (all machines are now using the
FDT via MachineState::fdt) allowed for most of the cleanups made here.

Patches 9 and 10 were based on a suggestion made by Phil a few weeks ago.
I decided to go for it.

[1] https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Daniel Henrique Barboza (10):
  hw/riscv/spike.c: simplify create_fdt()
  hw/riscv/virt.c: simplify create_fdt()
  hw/riscv/sifive_u.c: simplify create_fdt()
  hw/riscv/virt.c: remove 'is_32_bit' param from
    create_fdt_socket_cpus()
  hw/riscv: use MachineState::fdt in riscv_socket_fdt_write_id()
  hw/riscv: use ms->fdt in riscv_socket_fdt_write_distance_matrix()
  hw/riscv: simplify riscv_load_fdt()
  hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
  hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
  hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

 hw/riscv/boot.c            |   4 +-
 hw/riscv/microchip_pfsoc.c |   4 +-
 hw/riscv/numa.c            |  14 +-
 hw/riscv/sifive_u.c        |  11 +-
 hw/riscv/spike.c           |  25 +-
 hw/riscv/virt.c            | 484 +++++++++++++++++++------------------
 include/hw/riscv/boot.h    |   2 +-
 include/hw/riscv/numa.h    |  10 +-
 8 files changed, 277 insertions(+), 277 deletions(-)

-- 
2.39.0


