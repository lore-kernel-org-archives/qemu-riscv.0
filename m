Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdwY-0004GZ-M8
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwX-0004GD-9Q
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:04:57 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwV-0001wl-HW
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:04:57 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-16e2c22c3baso2420318fac.8
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fKz3u+npLZGjrgxEI4cRgAM3J03JBHka3BKNEOtAz3M=;
 b=eZEmpSPQyYkU7zfLCNpsMqG2EaSR2tMUyeWlznUFOJuEVE+SOv4+sfTlQ/h3INWHZl
 wTi8x+AUFlUrVZA633mKrnHvB0ub8WerfagXwjwQnHrME1N3zVjhD7O6GOd2ySaQXDa9
 drlcr8OXeX87534ZlRamLcfT00bjLPXttD5Gt3qgrGruYkS4n4ZQue89rDQzO4+MOONc
 9ETUsk/C9aqFbIUuDayMJ98EOwm2G3Ow/Y9xlzdcgznfhLXJW4bdQn4/Z3zim6D7gn92
 caUbvdhpboZhe4k03qeXTECv8ULNbdaXbKiTmAEVJAf8eGjB29NRZew7XUuoWEtqAZe2
 xRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fKz3u+npLZGjrgxEI4cRgAM3J03JBHka3BKNEOtAz3M=;
 b=5yUcioHuXlHV+tpNknVhNSfKc30gJu5P74uJ8SxQppifGQlJSwGB9SI98NClPG1qJT
 gy60mGjuJ1ETs+x3SPjnUB/R/a9JTShUo6Fl1pImI9VQ5Lf9i15nqJb6/MvWcXCGJPIB
 D7ndzSSGwofa9nXVmy0Opcfj6V28yZ0OSuhDjTSfUM1Xk4yVHhnFggRRHpk3TUoAbFXs
 8sQxrW8WwsSw+TR16gt8OnxkAQrXAyHXx/Iu8dbD4h8KIfyvd6cLtKQaOxDPqNK8Gfy8
 1t3fgnil32f1j7eoIocplls0G+pnTIbvvIPRDdNfTBDAk4fjf4prjc1ene3KGduHMGrv
 GpWw==
X-Gm-Message-State: AO0yUKWySDNWLGf83+XYWcbqvErws1WBp2HrV8O3jHOY4Ctovwx18b5C
 ULJ7Nr60z/cZ1Pc6ZpQ08bLSyQ==
X-Google-Smtp-Source: AK7set+YErcfh19D7uBDXSYQTypCe0GxQruQ4bNZQdni661oakCkyLAje3xMEMVyPlkcmcc4ebyyhg==
X-Received: by 2002:a05:6870:f151:b0:16e:84c5:7496 with SMTP id
 l17-20020a056870f15100b0016e84c57496mr309012oac.11.1676552694123; 
 Thu, 16 Feb 2023 05:04:54 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:04:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 00/10] make write_misa a no-op and FEATURE_* cleanups
Date: Thu, 16 Feb 2023 10:04:34 -0300
Message-Id: <20230216130444.795997-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:04:57 -0000

Hi,

In this version we're changing our minds w.r.t write_misa() and we're
now officializing it as a regular no-op. This was proposed as a better
alternative than trying to fix all the potential problems the code has
in the v3 review [1].

If we decide later on that there's a worthwhile use case to support,
where write_misa() needs to be (re-)implemented, we can use git to see
the code that has been removed and use it.

Changes from v3:
- patches without acks: 1 and 2
- patch 1:
  - reformulated: turn write_misa() into a proper no-op
- patch 2:
  - remove RISCV_FEATURE_MISA
v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg04326.html

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg04326.html

Daniel Henrique Barboza (10):
  target/riscv: turn write_misa() into an official no-op
  target/riscv: remove RISCV_FEATURE_MISA
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 +++--
 target/riscv/cpu.c        | 19 +++---------
 target/riscv/cpu.h        | 28 +++--------------
 target/riscv/cpu_helper.c |  6 ++--
 target/riscv/csr.c        | 65 +++------------------------------------
 target/riscv/machine.c    | 11 +++----
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++---
 9 files changed, 31 insertions(+), 117 deletions(-)

-- 
2.39.1


