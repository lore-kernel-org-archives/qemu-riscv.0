Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0be-0007kM-Ne
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bc-0007jM-HO; Tue, 19 Oct 2021 21:41:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0ba-0005Co-JE; Tue, 19 Oct 2021 21:41:24 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y1so14978550plk.10;
 Tue, 19 Oct 2021 18:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+M3MO6S5DIdwM7IJ3+Vts4SDdY+ngibSPAc3X5QHUbc=;
 b=X7yfevCliF6XldM4qKYhkkLMElY2tEBt7cBvXdROLSKLzkmmcXN6qmHCvDgSihV12t
 7Ie63EU4/rcuOZPMLARdINUDv9AGMsyrtEowIoRkulwb/Rmihwn/MzLJl1XVxOGgieTS
 up3tXx6pz3UgUdeIDXVjJnC2H517uHR7WneFrA+F9wphhJ7I5Y0LrPcfG3lXxcIlHXap
 SGMYNluwfV+H+qcMJBeIST8mmvk9Id4ZDs0Vfi3gxS1t24y5JYzFrfkXvPUyaKeA8/JZ
 DDrRJSS8mxr0nsBxlHtLO8Egxlo1kVfca8z6VG1bkOhQRslCTc2puIXt1K2ue1TbCx4F
 e+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+M3MO6S5DIdwM7IJ3+Vts4SDdY+ngibSPAc3X5QHUbc=;
 b=Y0N/uH5LzQnPypS0d1vpofThEGJnFZPYCjE9F0R56fkgLhf+WNiTkAwM0Pd4mfeduY
 gaZE9YrTqKEbFDDdYoaOBec4+MVRYF3YkaZPENkiHdiVo94xCfXP1sdgckyAla1Lf3vK
 e/sW46N04Z+xxKJqyvinp7XqQPZp2eOvfqVeO77mjirAY01NQDQT2QxeJaszswa2S6Fp
 bI13ENRqtIB9BtGd7399EF9rbXKp9AL5gvjxw7MT32NIZmCF3LEfK5WNzEsRC/vTS6BI
 dtX7D4CTadtXycrloDxn9BSur00fQnqRLEJVw0vpXE/kv0arKmP59UjeC0N8A9P0gQVl
 vUDw==
X-Gm-Message-State: AOAM5339QrL3UDj2smNN3Z7vOsOtuZ/RWLn7/KxQolXYcT8ahKvYLM1K
 QBSgugEqatwS0BZOSatAVWA=
X-Google-Smtp-Source: ABdhPJx1h2F2rGwp5xb672Pw2vVFt0au3oPPYXF/BgDlN8Dqjev7x2jSmiB3rZuBwYmZJ0ajQbLvfg==
X-Received: by 2002:a17:903:18d:b0:13e:f1ef:d80c with SMTP id
 z13-20020a170903018d00b0013ef1efd80cmr36388557plg.63.1634694080518; 
 Tue, 19 Oct 2021 18:41:20 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 0/6] hw/riscv: Use MachineState::ram and
 MachineClass::default_ram_id in all machines
Date: Wed, 20 Oct 2021 09:41:06 +0800
Message-Id: <20211020014112.7336-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 01:41:24 -0000

As of today, all RISC-V machines (except virt) are still using memory_region_init_ram()
to initilize the sysytem RAM, which can't possibly handle vhost-user, and can't
work as expected with '-numa node,memdev' options.

Change to use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to opt in to
memdev scheme.

Changes in v2:
- split RAM into low and high regions using aliases to machine->ram
- rename mc->default_ram_id to "microchip.icicle.kit.ram"
- opentitan: add RAM size check
- opentitan: assign mc->default_ram_size
- sifive_e: add RAM size check
- sifive_e: assign mc->default_ram_size

Bin Meng (6):
  hw/riscv: microchip_pfsoc: Use MachineState::ram and
    MachineClass::default_ram_id
  hw/riscv: opentitan: Use MachineState::ram and
    MachineClass::default_ram_id
  hw/riscv: shakti_c: Use MachineState::ram and
    MachineClass::default_ram_id
  hw/riscv: sifive_e: Use MachineState::ram and
    MachineClass::default_ram_id
  hw/riscv: sifive_u: Use MachineState::ram and
    MachineClass::default_ram_id
  hw/riscv: spike: Use MachineState::ram and
    MachineClass::default_ram_id

 hw/riscv/microchip_pfsoc.c | 36 ++++++++++++++++++++----------------
 hw/riscv/opentitan.c       | 16 ++++++++++++----
 hw/riscv/shakti_c.c        |  6 ++----
 hw/riscv/sifive_e.c        | 16 ++++++++++++----
 hw/riscv/sifive_u.c        |  6 ++----
 hw/riscv/spike.c           |  6 ++----
 6 files changed, 50 insertions(+), 36 deletions(-)

-- 
2.25.1


