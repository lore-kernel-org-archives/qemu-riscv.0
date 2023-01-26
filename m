Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL2g6-0003dK-K3
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 08:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2g2-0003c2-4Z
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 08:52:31 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2fz-000437-9v
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 08:52:28 -0500
Received: by mail-ot1-x343.google.com with SMTP id
 g2-20020a9d6b02000000b006864bf5e658so833559otp.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Jan 2023 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d1knL1PmLCMTfdnT7lvIVkkfe7oOtwmHZaVkSwNWmqw=;
 b=QitkWlK1WurRhOImB4F+o4hbcghU1t9PZuTGbiFZV/sOD5OSZKTtSnjR2Zc0QGX7dx
 GDc3EsjvifediunAkPanKvDNg//XLRkU8prHpyGy7sGu2GxaP+wo1kZzRlYBDtekpUuC
 48XTiJD+VgNY5g2dKFJUWE9lJg05cTRicd8xBF+Oq+nOoAepxUgKMVZStifalXvM50TA
 6R13aFbCv06T1hmoN8K1Wt3feV9jsKeblplIWMIzIwD1aBFQcjGYEtuOem4wGR4jCaC6
 0nceJHt3EF+j+/gutG+KPQhkigQML6gjo/t43JI7NN1nCvEK2B8C1jGAse5TgVuG/hXZ
 2S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d1knL1PmLCMTfdnT7lvIVkkfe7oOtwmHZaVkSwNWmqw=;
 b=qHl0b0/TFjgfs7l0pymk0/fcPNnHK66kCfZ1z6F4fZZ/joSCrqQCD1mO5ey3os90cL
 Ke54I+NHvru814/SGbih0olArq3yuHY4uyGebdYt3eZU7vNkGOxB1Z116HG65vtakGv1
 oAVHCvXMPlj6RcElnXIEhPIoub5HqGdeyge/xl09EOjEMJvpBHpA2ASJRmetNKHAIFyL
 OgZ6mFHHcssyTSG9bkr526vnsbqPk3W1V6xSfO9HhQg1mXbojC4jtNs2f1tYzKdFa6UQ
 lGvqFzL6arKDaEtUTuh8LMdR+97GRfGKjbwQJVRqPPCd3VVlDIkxySAtkouKH7v1orR2
 GYVw==
X-Gm-Message-State: AFqh2kpvdrvzBTtfTw4q1ovMPJizGfaFl70mlYCPQEcI6d1/ZS56Kmvb
 imvG192YsWAUNhmed+PSYGo4ag==
X-Google-Smtp-Source: AMrXdXuhkf7F4ATl6Y3nqZlQ3OXKc60D0jpBgIRVz5DMWIzI9FXv58cOL6rtU+gcBcLD4ORL8dfXdw==
X-Received: by 2002:a9d:12a4:0:b0:686:628b:a9d9 with SMTP id
 g33-20020a9d12a4000000b00686628ba9d9mr14103789otg.14.1674741145416; 
 Thu, 26 Jan 2023 05:52:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 w19-20020a9d77d3000000b00661b46cc26bsm496323otl.9.2023.01.26.05.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 05:52:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 0/3] riscv_load_fdt() semantics change
Date: Thu, 26 Jan 2023 10:52:16 -0300
Message-Id: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x343.google.com
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
X-List-Received-Date: Thu, 26 Jan 2023 13:52:31 -0000

Hi,

After discussions in the previous version, where we ended up discovering
the details of why the current riscv_load_fdt() works with the Microchip
Icicle Kit board almost by accident, I decided to change how
riscv_compute_fdt_addr() (the FDT address calculation from
riscv_load_fdt()) operates. 

Instead of relying on premises that the Icicle Kit board can't hold
right from start, since dram_base + mem_size will never be contained in
a contiguous RAM area, change the FDT address calculation to also
receive the bondaries of the DRAM block that the board guarantees that
it's not sparse. With this extra information we're able to make a more
consistent FDT address calculation that will cover all existing cases we
have today.


Changes from v3:
- patch 3:
  - function to handle Icicle Kit FDT separately: discarded
  - change riscv_compute_fdt_addr() to clearly handle cases like the
    Icicle Kit board where not all RAM is contiguous
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04464.html

Daniel Henrique Barboza (3):
  hw/riscv/boot.c: calculate fdt size after fdt_pack()
  hw/riscv: split fdt address calculation from fdt load
  hw/riscv: change riscv_compute_fdt_addr() semantics

 hw/riscv/boot.c            | 56 +++++++++++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c |  7 +++--
 hw/riscv/sifive_u.c        |  8 ++++--
 hw/riscv/spike.c           |  7 +++--
 hw/riscv/virt.c            |  8 ++++--
 include/hw/riscv/boot.h    |  4 ++-
 6 files changed, 68 insertions(+), 22 deletions(-)

-- 
2.39.1


