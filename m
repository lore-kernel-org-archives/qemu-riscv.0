Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plqep-0007AV-LA
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 08:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqem-00077f-GZ
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 08:30:00 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqeg-0000sC-PW
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 08:29:56 -0400
Received: by mail-oi1-x22d.google.com with SMTP id m2so2595425oiw.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681129792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a0XUJfd3Es4csagaT/7KtTZjz9+/UWZuMAZA+eSifU0=;
 b=WuFk3wGd74BH/ZxWhaZDQiurhupbNi41W0B6pAUD2ZxCup63C/1kCJ3bABqewOXgA3
 H8GyUAEs7xrevHfXTurJT24xPk7OLKO9nrhYxwfWKla2TKOmfXaluxyZf7F/wBugnSxq
 T4xPXCZAewj7XTFIjJnRekGuNKpppEzijLJFKLrPXXXZbU2GmndEFsCJU/G/wmMU+8M5
 YzCETbGNyC6g0rOc6dckPbQ9fbrzoSRjfl7vIrbpzkL87VJWbfRQvx7H9+Uj8ABft+fb
 3Gb6wreI9EcbxtIfKkgi/8me5ZnXLwjTmJKRYIiaNrd1PTevvzsL/p5q3eLE+SUeaks/
 H8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681129792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0XUJfd3Es4csagaT/7KtTZjz9+/UWZuMAZA+eSifU0=;
 b=kfSUF13bDGUunyrwXO0aKLCd39P9yfWDWNGLaIqAIRlv1zk0VPykZZ1XBuHygbDOAe
 A2g32OJ5vCHaLlrNyhPFcWcZLDmvxgUReD4lzp51JJSJtbZZsraXEFesiSoV/Ofw0IOW
 3Z/sp2tsagWglIi2OYbN2IHVc+bixlZnUWLtywsf8RdwQfRlNXryM7jAJ8sUMhDcRRWk
 +prQO0+qoZtdRgk1BrbUiRpEhpgiboxWk4480UzDSZ/dLDAdT5txnvbvdIqKtnxC+FGC
 Bsn07S/pgEPfLb5T2NyXZUYmvX1igl9c+RsU15j/w0f3Mot9j/wFGk5oXVZBLF1ulp8R
 sYMw==
X-Gm-Message-State: AAQBX9fOv+idWREsldkStdGD4Q0JVe1Rl6UB4l+sFAoyPbbAGgZ/ZgpR
 ObB/14yLCJZ6/2NjZOsWKn+8dw==
X-Google-Smtp-Source: AKy350bt7IyrPOxQPLojcmpllRwZpABzV8dpPRWbRQ4dsLYbOYlliwRjTQA/22S6XvucYf7INxLPGQ==
X-Received: by 2002:a54:4487:0:b0:384:32ff:eb75 with SMTP id
 v7-20020a544487000000b0038432ffeb75mr4648944oiv.18.1681129792625; 
 Mon, 10 Apr 2023 05:29:52 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 o13-20020a056808124d00b00387160bcd46sm4297016oiv.46.2023.04.10.05.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 05:29:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/4] target/riscv: implement query-cpu-definitions
Date: Mon, 10 Apr 2023 09:29:41 -0300
Message-Id: <20230410122945.77439-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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
X-List-Received-Date: Mon, 10 Apr 2023 12:30:00 -0000

Hi,

This series implements  one of the most common QMP CPU commands,
query-cpu-definitions.

libvirt and others uses this command to inspect the CPUs available in
the QEMU binary, with the option to further inspect their properties
using device-list-properties.

The design decision made here is to consider all generic (i.e. not
named) CPUs as not static, which the API semantics considers to be the
same as migration-unsafe. The reason why I took this decision is because
generic CPUs can have their extensions changed via command line. Today
this is the case for all CPUs, but we're going to change that in the
near future after this series.


Patches were based on top of Alistair's riscv-to-apply.next.


Daniel Henrique Barboza (4):
  target/riscv: add CPU QOM header
  target/riscv: add query-cpy-definitions support
  target/riscv: add 'static' attribute of query-cpu-definitions
  target/riscv: make generic cpus not static

 qapi/machine-target.json      |  6 ++-
 target/riscv/cpu-qom.h        | 73 +++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c            | 54 ++++++++++++++++++++++++--
 target/riscv/cpu.h            | 46 +---------------------
 target/riscv/meson.build      |  3 +-
 target/riscv/riscv-qmp-cmds.c | 55 ++++++++++++++++++++++++++
 6 files changed, 185 insertions(+), 52 deletions(-)
 create mode 100644 target/riscv/cpu-qom.h
 create mode 100644 target/riscv/riscv-qmp-cmds.c

-- 
2.39.2


