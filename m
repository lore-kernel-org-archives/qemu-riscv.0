Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqnZ-0001HM-MW
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnY-0001Fy-Dg
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:36 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnW-0003nk-FA
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:36 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-547607ce4fdso136907eaf.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083653; x=1684675653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6H5RDZ62iD8yxl8AhCci22u0WqPBo4HlaZPhbbtR9qs=;
 b=VhFK4GCtEuEnABX0ofcssQ6gZH2nzAjfIVHk5qDC9T4M+PNo1NK24TCwGUM921itlw
 mro2ykLRGzrp7aMxFMp50OGzHZqWMP9zrctD2WBl3MdulRNoCXOh110jgrWfY4JB0bGu
 hGoBonq5vV49FfdNaLWicnsBI6oTB4/pk4UvMDZfraMa3RhjgNXDkHR8hf3hHrtgbJlQ
 N7SKsfBv3wNaG9NHsDuFyYpsPmdsQnt04bmvZ0Fb57Ty1/uBS1w/gl2yz/7th1oRPaq2
 6Rw6BG12Jqp25ITiwnv7nPg3RGRc7of07Rs7vEo5pnJfg+xVasIjqBaWzs0d9yPo0vVc
 lvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083653; x=1684675653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6H5RDZ62iD8yxl8AhCci22u0WqPBo4HlaZPhbbtR9qs=;
 b=iIXvwA1EeZ/ZsA80RDWnQYzmIlwiFD/YnAL5ry+710SkDTb3pJmVA7MPyUV5+jrAew
 nFKC4cGzQPSTpuQcZ9PclvMUuu7Z2PGzUZ16pPbgZL3T00GdWsMecDnRdsrqb1R32Opr
 f42E+P5t0G83i0i4SCvRm1j3BN/cRCwUpTOAssV87thw9I+yclNvAD3LBixwFAr7rIT3
 D9Noi2JVWcMMhSa8wzvoPjOe2pMFat7uuMbQgboz57lJz2WaLd0VpiRg3lnI/ISLC6CK
 90i/Ls+B2RGVwvf76kuBqZETsvg35V4243pDqHdJgUbZTJKB3e15x5M16SDMUM8rgFsa
 hD+Q==
X-Gm-Message-State: AAQBX9f7Fywyuxcc/cYph70wUt1bqi5CnzsUB+LVaWeS//J0BCmNTHW+
 DOD533JUSW2OaccU3UHUe7VcTw==
X-Google-Smtp-Source: AKy350bDwxl8DWNpjO1IjOFBvVK7NAEve967Aklf3ZMLpiV0JKRXXp7JAc/5C7fY/pXPvU+cmBDu4Q==
X-Received: by 2002:a54:4189:0:b0:38e:8377:3102 with SMTP id
 9-20020a544189000000b0038e83773102mr2346982oiy.4.1682083652955; 
 Fri, 21 Apr 2023 06:27:32 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 00/11] target/riscv: rework CPU extension validation
Date: Fri, 21 Apr 2023 10:27:16 -0300
Message-Id: <20230421132727.121462-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 13:27:36 -0000

Hi,

This version dropped patch 12 from v7. Alistair mentioned that it would
limiti static CPUs needlesly, since there's nothing preventing a static
CPU to allow for extension changes during runtime, and that misa-w is
enough to prevent write_misa() during runtime. I agree.

I also amended the commit message of patch 11 to remove any mention
about misa_ext_mask rollbacks (which the code wasn't doing). The patch
itself is changing validate_set_extensions() to avoid misa_ext_mask to
be overwritten during write_misa() in the first place, so no
misa_ext_mask rollback should be even mentioned.


Changes from v7:
- patch 12: drooped
- patch 11: use a sane commit message.
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg02916.html

Daniel Henrique Barboza (9):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv: rework write_misa()

Weiwei Li (2):
  target/riscv: Mask the implicitly enabled extensions in isa_string
    based on priv version
  target/riscv: Update check for Zca/Zcf/Zcd

 target/riscv/cpu.c                      | 333 ++++++++++++++----------
 target/riscv/cpu.h                      |   3 +
 target/riscv/csr.c                      |  47 ++--
 target/riscv/insn_trans/trans_rvd.c.inc |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc |  14 +-
 target/riscv/insn_trans/trans_rvi.c.inc |   5 +-
 target/riscv/translate.c                |   5 +-
 7 files changed, 244 insertions(+), 175 deletions(-)

-- 
2.40.0


