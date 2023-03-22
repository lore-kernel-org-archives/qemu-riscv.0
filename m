Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6xt-0006mf-Dq
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6xs-0006mX-FV
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:29:52 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6wg-0006vw-W2
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:29:50 -0400
Received: by mail-vs1-xe30.google.com with SMTP id h27so4233112vsa.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AH5mwmhiqA9Yd2u3XamMvTxiaNQWUcxOpJH0JmREm5o=;
 b=BbSNNdIGZhvRtzQDz6e6W9o9cvEOO7av98FWAREYr52T3e+ZN16Njfa/PwYDJIIVlg
 3ELqtT2DWY/uz/Dk0d/sJolkvLi4Hc1ALVITpAbHbAWRpL1tVRkfXJrNRJRL2v5fUnfq
 jn2OGNE7uXOX/9ysjfxJ7p457QpkdpKmrF28Ug69p8CByr3DFWPAYedgiSgjay8yj2sD
 q3eUtL3FUWNHem/wenFS2cLilbrI6FaH1bnTiOq6ZVcjluCnyZtvqYQzBS4QxrKNKnE4
 tKJrgX6klkmN5t4Vs8nXIa7vv+M/hreVMThFML7ZJ8XqLOjznzz2ZmTGdQpCJhyToBrL
 DPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AH5mwmhiqA9Yd2u3XamMvTxiaNQWUcxOpJH0JmREm5o=;
 b=IOvHI4HAcXp11GgnQL/3ARkOVP0kr038K4hUCq0et0tO/NRRLfrq1/z4Nxppdvls4Z
 G1g2n5PUmAku6jEZJl+z/C8UlhMPhHgkaotiljAWn7ITiJnrWcrfGddcnJSVVQbrzZGM
 8Ozdm21abIqAsdkaB1+NwS92+h+JJNrIdsLqCmOG+azdqFys0Lq9RE55WXGjmNRo7WKZ
 UaWixd95qAB6towh/yUyDYpbte3fRd4lezivYCMYYyDK6zpPK8Dmx9IrOgTHWgu6BIzP
 coB5n2HUeDgSdeBqHmsCEpCrlCpvqlE7H/SRAfTaF4AH6ywJd9SsgerFOQkGk6rz6Y6u
 mx1g==
X-Gm-Message-State: AO0yUKX7pYlGEj2YYgWLTVc/9aZDR2itOH2clRL9zD/BX76A+W5MCRbz
 TOxyVT07k9QjHyLhEhQ8lwEj5oyWD61OWdFCg6o=
X-Google-Smtp-Source: AKy350YXdH2VYjbvwnqnb0wCY1YOQ0fLSBY8DrofjNV3v4PL3EtTPs+uaW2hRw+y+ZVfm17VXYYUZA==
X-Received: by 2002:a05:6870:e315:b0:177:8154:f7e3 with SMTP id
 z21-20020a056870e31500b001778154f7e3mr814125oad.42.1679523622122; 
 Wed, 22 Mar 2023 15:20:22 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 00/25] target/riscv: rework CPU extensions
 validation
Date: Wed, 22 Mar 2023 19:19:39 -0300
Message-Id: <20230322222004.357013-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:29:52 -0000

Hi,

In this version I simplified the logic used in write_misa() after
reviews from Weiwei Li. The patch that handled RVV activation was
removed, making RVV a regular MISA bit to activate/deactivate.

We're also checking whether one of the IMAFD extensions got disabled
during write_misa() and, if that's the case, we'll clear RVG.

Series is based on top of Alistair's riscv-to-apply.next.

Patches acked: 1-5.

Changes from v3:
- patch 11:
  - remove c/u/s cpu->cfg assignment from rv64_thead_c906_cpu_init()
- patch 14:
  - add RVG in set_misa() call inside rv64_thead_c906_cpu_init()
  - remove cpu->cfg.ext_g assignment from rv64_thead_c906_cpu_init()
- patch 15:
  - remove ext_zfinx verification from riscv_cpu_enable_g()
- patch 25:
  - do not call riscv_cpu_enable_g() in write_misa()
  - enable/disable RVG extensions manually in write_misa()
- patch 26: removed
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05097.html


Daniel Henrique Barboza (25):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv: move pmp and epmp validations to
    validate_set_extensions()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv/cpu.c: avoid set_misa() in validate_set_extensions()
  target/riscv/cpu.c: set cpu config in set_misa()
  target/riscv/cpu.c: redesign register_cpu_props()
  target/riscv: put env->misa_ext <-> cpu->cfg code into helpers
  target/riscv: add RVG
  target/riscv/cpu.c: split RVG code from validate_set_extensions()
  target/riscv/cpu.c: add riscv_cpu_validate_misa_ext()
  target/riscv: move riscv_cpu_validate_v() to validate_misa_ext()
  target/riscv: error out on priv failure for RVH
  target/riscv: write env->misa_ext* in register_generic_cpu_props()
  target/riscv: make validate_misa_ext() use a misa_ext val
  target/riscv: split riscv_cpu_validate_set_extensions()
  target/riscv: use misa_ext val in riscv_cpu_validate_extensions()
  target/riscv: rework write_misa()
  target/riscv: update cpu->cfg misa bits in commit_cpu_cfg()
  target/riscv: handle RVG updates in write_misa()

 target/riscv/cpu.c | 654 ++++++++++++++++++++++++++++-----------------
 target/riscv/cpu.h |  14 +-
 target/riscv/csr.c |  72 +++--
 3 files changed, 463 insertions(+), 277 deletions(-)

-- 
2.39.2


