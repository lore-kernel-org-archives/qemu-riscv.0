Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMx79-0006kD-L9
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 15:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx78-0006jg-BN
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx75-0002i2-Rq
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id t18so15381862wro.1
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 12:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9lo2K6GQSn2b50esA2/wF8fWoSdV5uNQzm7zIK6gS7A=;
 b=N0o1V+d9l/rFdInUTnB/gVGHS5U1OU9v4E1C/i2OmVmlw/pAwgDdjI7otUNQ8wT5tH
 KbEFSl+ngJ8b8leINdy3o49lCfZzAdQnkJ0ThOzFmHrgiVQ1ouVZxJuMNQiTkeCDUL0T
 qOcbemp5jQ0fI7Oy28CGj1U5NrJjHkZzbHZoIUevSEtq/HCk6Z0pVRoYAk028hk00qLx
 L4uuD9Iuo3EhqSW28Jt4ksirEpMMmU/LHPKMz73vNn4GoaXvcEKJ/deyoOOWgSeOmB2U
 BZXEUCbIEl5hpLIS6ZYJqxNBpW4hOi9hFcK+2Bkbmeb+jsJcu27hS43VUmUsTxeWwujU
 4KnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9lo2K6GQSn2b50esA2/wF8fWoSdV5uNQzm7zIK6gS7A=;
 b=emMMV/o0eQKP2lMhGALyZkiI1htdLVWub+08MBrg+fllpLjSomS8tkXo57C+vYM5GQ
 6hpD8GcfHw1CtlbukJam3Xdr4osnvF82x1tLoKVK0j+QFMusNHcs8ypMst616ByPTbgg
 Fk2AUDRRsZVikfULQz1sblzRMqukzQscnwx5ieYX99pKGxa73/xURyZPStn6+NSr0vey
 tQg2+iDJKdEJAbzKkggm5VNvHOWy/W1L302Y7hye6KcBFTpHR+3mJLagiWF7v+udOMD0
 ++J9Lgr9UAwsgRcy0l9b82CiP4rwN02NjEjl1seEnGnC0kMfbmvEdrRGCdLB2iYNEVBt
 oV9A==
X-Gm-Message-State: AO0yUKU1AJZgNrzBjMq2fuJm42JBPKZ04w5r+vinOijRB9Oho7lOMG1w
 4kmlb1rtW1t6HtSNyPIZuhMAQ8eIj62FaiEn
X-Google-Smtp-Source: AK7set8/gJH9TBdlmv9Sn+CMed9Jfew4Op53Qk6INDv4ykz6JFEf5RYzw5eF7wdILFuk6bPa7fChQA==
X-Received: by 2002:a5d:6645:0:b0:2bd:ee0c:26a3 with SMTP id
 f5-20020a5d6645000000b002bdee0c26a3mr4133292wrw.8.1675196416488; 
 Tue, 31 Jan 2023 12:20:16 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:15 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v5 00/14] Add support for the T-Head vendor extensions
Date: Tue, 31 Jan 2023 21:19:59 +0100
Message-Id: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 20:20:22 -0000

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

Changes in v4:
- Address review comments from Richard Henderson

Changes in v5:
- Remove hard coded constants from gen_*pair_tl()

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
 target/riscv/cpu.c                         |   55 +-
 target/riscv/cpu.h                         |   12 +
 target/riscv/cpu_vendorid.h                |    6 +
 target/riscv/helper.h                      |    1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 1094 ++++++++++++++++++++
 target/riscv/meson.build                   |    1 +
 target/riscv/op_helper.c                   |    6 +
 target/riscv/translate.c                   |   31 +
 target/riscv/xthead.decode                 |  185 ++++
 10 files changed, 1398 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/cpu_vendorid.h
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xthead.decode

-- 
2.39.1


