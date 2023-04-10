Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plsGy-0000xr-9q
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 10:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsGw-0000xS-1s
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:30 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsGu-0000Ne-B7
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:29 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-634b28df952so460928b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136006; x=1683728006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sbelkXj5/xY8TaRMGMYt1lsv6AVM2L6f4uqa2EtkMaQ=;
 b=DxEEYPFhWkFMlT3Mfs5cfBgw6zy5aepnorrey4XBhXo5KX1xCJce2PSm2NQ9tPjtyl
 y8xzfyWVCXGus/xMq2F/g5GdjxyTtR9dSCS0AgRCUGB99miDfv3B8aG0QCX5CTu6ZHpx
 oqAq3+slqy1y3ypbU+ZgH14lKA8JP1RY5Mr2bcGkYxavqnW0NDMoS14+rGjoofD3mdyy
 rUl+ccD2vrfpBlKsCwkQUQpfoSHOJ+CKiwtn1R6xYr6F3jKo9AEAnshwWVKwjiEKnAbR
 4CIKCMUZc7LrhMiH4BMl7gAZ6gfAoTM8lDW01apjUZMG5tmwhiZMuwHIJHECeiWgz6ds
 emzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136006; x=1683728006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sbelkXj5/xY8TaRMGMYt1lsv6AVM2L6f4uqa2EtkMaQ=;
 b=cubXI/juynAd28PwIWQ35PCicKBCi4gLiOLqOozOmoXTYYw4GQ33MAv+gSqTKF6X2x
 pjzGHdn0ZxivyQPyl4Bd3StdzoqDvkT40thT2BjXbxe9bzLovu0r3sFsZdBdmQpQcXxf
 IM7lbSFesD6Zy9tOjwYmMEoYb8ZRU97U3FVQ8sgR9dH0DGMfBOaSYLi1KLqu+tKLbE9n
 VARNYjN7ehw/fV6XVWYChBF2oitRogOfhOoNW/tSbY6v4qZ05VbyqlErKqUGPb8qTuDi
 8D6cC6nyFzOoPFRY/zFXlftGHScSk5J2C9Vwwms8qTPghgqdW+5FK1lSHvDMF2cnLIoM
 QkXA==
X-Gm-Message-State: AAQBX9dWKKrf80LC6T7EaPU1zY0FZi5NRWl5hWV9dzphdB3NLLoej8Ps
 DOS3WOVuAu7NGpxJgKMY/1oQVQ==
X-Google-Smtp-Source: AKy350b7ROScqzIrDmoV+6/N3OCLRR1fduTcnnYKi6Hd++BkuExJCuMjYwwi3TkCjhv2z/O863YyIw==
X-Received: by 2002:a62:1b85:0:b0:626:17b8:8586 with SMTP id
 b127-20020a621b85000000b0062617b88586mr11258684pfb.30.1681136005834; 
 Mon, 10 Apr 2023 07:13:25 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:25 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 0/4] Smstateen FCSR implementation
Date: Mon, 10 Apr 2023 19:43:12 +0530
Message-Id: <20230410141316.3317474-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Mon, 10 Apr 2023 14:13:30 -0000

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below:
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence spliting the patch 4 of the original series into three patches and
re-submitting along with the original patch 5.

Mayuresh Chitale (4):
  target/riscv: smstateen check for fcsr
  target/riscv: Add fcsr field in tb->flags
  target/riscv: check smstateen fcsr flag
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |  3 ++-
 target/riscv/cpu.h                        |  4 ++++
 target/riscv/cpu_helper.c                 |  5 +++++
 target/riscv/csr.c                        | 25 ++++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 +++++++++++++++++++---
 target/riscv/insn_trans/trans_rvzfh.c.inc |  4 ++++
 target/riscv/translate.c                  |  2 ++
 7 files changed, 62 insertions(+), 5 deletions(-)

-- 
2.34.1


