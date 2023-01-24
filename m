Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSW-0006xa-4t
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 14:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSU-0006x6-Pm
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:54 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSS-0002P3-Oi
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so14985387wrv.7
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 11:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/BuPCCzeVMT700hCD09q4gQbIM0CVhWL+hkSNJ1dZsc=;
 b=fH8e7Z/dgwZNqfKM7X6zspadqq2zBnSry1iMilX/FW09/n9p+K4LH/IPH7OODXBp7P
 9XCRvhWcon5+0+mYJb9VIBQh4dbFwgI/2xqiuK6qnT0/8SQg1Qvq26D8mvnMBz0tCd7T
 lyLghynS59Na+QNBiOen5URl/ik1Wl3uosM45FA1BAWATSiVGwjWl0eHwbofKOXbff9a
 W/+geOaQwqJXAnu2BUhQHFMycao97W5IuueRraLeuaw1kBeK30fPtTD9unE/wMuels8h
 ka1551u84fSrFny/mWKUYMvNkoSrz5MksyVPVQanzQyXigKsSkj365LOy3AwSeBghb6F
 Io8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/BuPCCzeVMT700hCD09q4gQbIM0CVhWL+hkSNJ1dZsc=;
 b=0MAfYdz0kh2tQ3tTDsn6Cc+B13uu2LpVKnvM/+eJ4Voe44ydRDNXCHLQvMYc3uxn09
 LDcYAviiXQIGZaetY04Po4IzvPblztc99RXNhHsaIOdMaS0SHORFY5wXHN7XNj3+Dhr1
 R7nDGVehzd+dCaAFtf22H2B74aBexLM9tgLpIXV35VFzjmkaFWSOBFm0nxzVXPfDbL4h
 8MdeRp3brvXEnIFJ4YpMp+nIMkLmyVGgQ20IkhN+YYoOHO814gyuexnuVJtomHyyW4Ma
 GdQ5v1FxdWTrmXUyOhnPGH2GKYEyf0xU7qSjweuLhpoYiCwh5Tqc62m6VMknEGSBVhlQ
 jtAg==
X-Gm-Message-State: AFqh2kqprEULecjXoJ18G05rbbmDQSpk968EJCfL8UOmKmI6sTqmVgCI
 KbXFUcTq9kFqpA92nq5QyK9kVi5Zqr5Auopq
X-Google-Smtp-Source: AMrXdXuir3MsUGs8ChGTseq9EovoXBaPfVL4+tRhJXmfIHVNI8tRF2sFs8HnSCMtmOVvtpMuDk33Jw==
X-Received: by 2002:a5d:6f15:0:b0:2bb:dcf9:482b with SMTP id
 ay21-20020a5d6f15000000b002bbdcf9482bmr30954820wrb.47.1674590390050; 
 Tue, 24 Jan 2023 11:59:50 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.11.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 11:59:49 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v3 00/14] Add support for the T-Head vendor extensions
Date: Tue, 24 Jan 2023 20:59:31 +0100
Message-Id: <20230124195945.181842-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 19:59:55 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This series introduces support for the T-Head vendor extensions,
which are implemented e.g. in the XuanTie C906 and XuanTie C910:
* XTheadBa
* XTheadBb
* XTheadBs
* XTheadCmo
* XTheadCondMov
* XTheadFMemIdx
* XTheadFmv
* XTheadMac
* XTheadMemIdx
* XTheadMemPair
* XTheadSync

The xthead* extensions are documented here:
  https://github.com/T-head-Semi/thead-extension-spec/releases/latest

The "th." instruction prefix prevents future conflicts with standard
extensions and has been documentented in the RISC-V toolchain conventions:
  https://github.com/riscv-non-isa/riscv-toolchain-conventions

Note, that the T-Head vendor extensions do not contain all
vendor-specific functionality of the T-Head SoCs
(e.g. no vendor-specific CSRs are included).
Instead the extensions cover coherent functionality,
that is exposed to S and U mode.

To enable the extensions above, the following two methods are possible:
* add the extension to the arch string
  E.g. QEMU_CPU="any,xtheadcmo=true,xtheadsync=true"
* implicitly select the extensions via CPU selection
  E.g. QEMU_CPU="thead-c906"

Major changes in v2:
- Add ISA_EXT_DATA_ENTRY()s
- Use single decoder for XThead extensions
- Simplify a lot of translation functions
- Fix RV32 behaviour
- Added XTheadFmv
- Addressed all comments of v1

Major changes in v3:
- Drop XMAE patch
- Rename priv level test macros

Christoph Müllner (14):
  RISC-V: Adding XTheadCmo ISA extension
  RISC-V: Adding XTheadSync ISA extension
  RISC-V: Adding XTheadBa ISA extension
  RISC-V: Adding XTheadBb ISA extension
  RISC-V: Adding XTheadBs ISA extension
  RISC-V: Adding XTheadCondMov ISA extension
  RISC-V: Adding T-Head multiply-accumulate instructions
  RISC-V: Adding T-Head MemPair extension
  RISC-V: Adding T-Head MemIdx extension
  RISC-V: Adding T-Head FMemIdx extension
  RISC-V: Set minimum priv version for Zfh to 1.11
  RISC-V: Add initial support for T-Head C906
  RISC-V: Adding XTheadFmv ISA extension
  target/riscv: add a MAINTAINERS entry for XThead* extension support

 MAINTAINERS                                |    8 +
 target/riscv/cpu.c                         |   54 +-
 target/riscv/cpu.h                         |   13 +
 target/riscv/cpu_vendorid.h                |    6 +
 target/riscv/helper.h                      |    1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 1081 ++++++++++++++++++++
 target/riscv/meson.build                   |    1 +
 target/riscv/op_helper.c                   |    6 +
 target/riscv/translate.c                   |   31 +
 target/riscv/xthead.decode                 |  185 ++++
 10 files changed, 1385 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/cpu_vendorid.h
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xthead.decode

-- 
2.39.0


