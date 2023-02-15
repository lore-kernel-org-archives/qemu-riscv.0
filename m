Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyI-0007c2-O9
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyG-0007ae-IG
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:36 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyE-0007vG-K9
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:36 -0500
Received: by mail-oi1-x236.google.com with SMTP id bd6so16640654oib.6
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9OPZU49O81ubGxfHmiTW1rLsPMfddY7U/bKWmj7uiPk=;
 b=lek92tHcuS9C6LeHSGTaVhlllmtnBAv+C411vKq2lolV3cRKCGDtlzrMZhe4dKGY8C
 BlIM/EhnELZuho13toM1cbOeMQLYT7gusYQpllLbC7N0bM3F2KI3IUXpcT51NewOOcq1
 7fl4Kr/QmeaW1xfrDfnBMmCyXFrzOPLA45QE2035KW2W2difmgpTjgSzvajGlUTkk51M
 tmnOW03gYi+zgeyyJrXat9yPnJui+ixONc2urACOtl/1Jn+L/0FUR3awH1bYyXsFlW6k
 Jq3DuX269Qo9YdCYcrG1l/o52rKpoMNuq/5wAdXqHWnrovFoq3MXDOXNwZuDgvWPn4tr
 i/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OPZU49O81ubGxfHmiTW1rLsPMfddY7U/bKWmj7uiPk=;
 b=OiE0B3Pdy+Ug+8MDCYWL8+37EFZ/wl8JVkmjPbphzj+eTlJdxeSxElFX68sAAmvXK0
 7j0d84hLtKqEGPHe8nDfw5wG8700oilXFuPJyKxmCWFVohBrImpKrVFDeCckCnDP+uQL
 EW/s0DiDT3yZxA6du1L4mKEoaWrXD9BNaq3wQ4OZagQynFWAg8YZJDWst252xUOT/EAE
 RhESLY9vKHMrc/dwR+mMAEAlFpVm+zS868hZQWT/InDG8A0gAcu0PJmpgaPD5VYC7sCN
 RO24xlB3p9dVhGPM9hbuX+sA2vhNPsZp530/HlL7CivroQedlgiWziwD4aP/ho+HmOuv
 JW9w==
X-Gm-Message-State: AO0yUKXFjQ3lDT0Sv5sXh/M69KANNAZ4ogyzhSb1KPAtrT8iQt4+6zsE
 lOZXXn23mgSXCNqnMSFjZjY9/Q==
X-Google-Smtp-Source: AK7set8b2rlhX348pEVZwAiyiNzbr5WsrF+1U3Q2/yLAxIP8qV2deCSRxw+yqnkPELl5t3fXWkIcFA==
X-Received: by 2002:a05:6808:6198:b0:37a:fcd6:5c09 with SMTP id
 dn24-20020a056808619800b0037afcd65c09mr1040712oib.49.1676487452214; 
 Wed, 15 Feb 2023 10:57:32 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/10] enable write_misa() and RISCV_FEATURE_* cleanups
Date: Wed, 15 Feb 2023 15:57:16 -0300
Message-Id: <20230215185726.691759-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:36 -0000

Hi,

In this new version the most notable change was in the write_misa()
logic. I decided to follow Bin's suggestion and removed the verification
at the start of the function.

As the result, the patch that removes RISCV_FEATURE_MISA was merged with
the patch that makes this change (patch 2).

I also removed the v2 acks from it since the patch now does something
different than before. Patch 2 is also the only patch that is missing
acks.


Changes from v2:
- all patches but patch 2 are acked/reviewed
- patch 2:
  - remove the RISCV_FEATURE_MISA validation from write_misa()
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03934.html


Daniel Henrique Barboza (10):
  target/riscv: do not mask unsupported QEMU extensions in write_misa()
  target/riscv: always allow write_misa() to write MISA
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 ++++---
 target/riscv/cpu.c        | 19 ++++---------------
 target/riscv/cpu.h        | 28 +++++-----------------------
 target/riscv/cpu_helper.c |  6 +++---
 target/riscv/csr.c        | 18 +++++-------------
 target/riscv/machine.c    | 11 ++++-------
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++++----
 9 files changed, 31 insertions(+), 70 deletions(-)

-- 
2.39.1


