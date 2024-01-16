Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B2DC47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:02:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqVz-0004ZF-49; Tue, 16 Jan 2024 15:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqVw-0004YG-Pm
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:28 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqVt-0007Yo-LD
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:27 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso4719734a12.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438704; x=1706043504; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MUB7Myh4rjNQ/5dmzsPShxDu3PdTnbapVCP1Y/zIvBg=;
 b=KOY/z/apqIjysIbI6GF86x53HPffUJhmh3AqaUV2H60AEBdn+AI8xNC8Jjw5cTNcmr
 +HDxC2kNjz9jurYNHUWfiradxN0vxp/6lV8cKDbzqYOom+YRtjfkeKrU/1E4VLBcHJNh
 vIz4zxzopwn4x69wB88SumDgg8RTYWd8mzUchhVMnXFi6BxyiLzU/aV2VPQooddI4DH9
 Z+hbGqmhXEaztvMDKWUw4SwkObUTh8ggTsC1K1AdonmLxL1oKs3K1qn9xvf2rermoQys
 pdsFxam3mMIEkzRBuD7mwx1Yu+Ta7HmLmF0O2dNt9mZRdvXowabkRhAzON777Q7c3Rxt
 aTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438704; x=1706043504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MUB7Myh4rjNQ/5dmzsPShxDu3PdTnbapVCP1Y/zIvBg=;
 b=pfXScTedwv4Nd9zkL2XP+d7YFqO71+wahotgyOwRM9SgvLnJ50O2XIQ3okjtHmmTAo
 9jc5zfxXgGVX1Z5gbEgbTTtORHkE62XiuGlA7gVK8+WvUoSYicJ9F6oZ0JcnkpHayTP8
 sLWaRP+lQgG4TVGEhqIKRwFb+tWVbulbQ8+wiKeWkkZBei2v73c7MOkebgjE6XbYKqMC
 XKzzxdhVNRMP3VCd5ZUKbkAiFZjzeetngZlTTvqGvAu2qbak5VNOn+tEHPQE+0gtPX6j
 gX/l17sI6EquNRSij31lc/DsTtP4QT22Psy3LDhhN5G4hP2htiC0nAsI6VwF2ls2Cu1i
 x+vQ==
X-Gm-Message-State: AOJu0YzNew+q9D3lq12N5uHvwqLwRdUFQMJw2GOLbper+s1L+7YNSbg+
 Bi9f7qSb3Kflk21mPGYHUdUg9Kc84DnjdA==
X-Google-Smtp-Source: AGHT+IF50iRtVez2fCrc9V9S3oNWiGwJajcAkIO00cOVolvM3Q79TrkSZcRBwo3k3aq6atrOUT5dew==
X-Received: by 2002:a17:90b:4b4f:b0:28c:be8e:ac7c with SMTP id
 mi15-20020a17090b4b4f00b0028cbe8eac7cmr4491624pjb.16.1705438703981; 
 Tue, 16 Jan 2024 12:58:23 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:23 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/13] target/riscv: add 'cpu->cfg.vlenb',
 remove 'cpu->cfg.vlen'
Date: Tue, 16 Jan 2024 17:58:04 -0300
Message-ID: <20240116205817.344178-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

In this v3 the most significant change is with vext_get_vlmax() from
cpu.h. The logic used in this function is also used in at least two
other places, trans_vrgather_vi() and trans_vrgather_vx(), and we need
to make changes in them to remove 'vlen' occurrences.

Instead, we're adding an extra patch (11) to rework vext_get_vlmax()
arguments to make the function usable in trans_vrgather_v*(). This
rework includes some naming changes in local variables - we're using
'vsew' and 'vlmul' more often to be less ambiguous when reading code. 

Series based on Alistair's riscv-to-apply.next.

Patches missing review: patches 10, 11, 12.

Changes from v3:
- patch 8:
  - changed fractional LMUL comment to show the expansion
- patches 9 and 10: switched places
- patch 10 (former 9):
  - use 'vlen' in vext_get_vlmax() to avoid a negative shift 
- patch 11 (new):
  - change vext_get_vlmax() to use 'vlenb', 'vsew' and 'lmul'
- patch 12 (former 11):
  - use vext_get_vlmax() instead of calculating vlmax manually
- v2 link: https://lore.kernel.org/qemu-riscv/20240115222528.257342-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (13):
  target/riscv: add 'vlenb' field in cpu->cfg
  target/riscv/csr.c: use 'vlenb' instead of 'vlen'
  target/riscv/gdbstub.c: use 'vlenb' instead of shifting 'vlen'
  target/riscv/insn_trans/trans_rvbf16.c.inc: use cpu->cfg.vlenb
  target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb'
  target/riscv/insn_trans/trans_rvvk.c.inc: use 'vlenb'
  target/riscv/vector_helper.c: use 'vlenb'
  target/riscv/vector_helper.c: use vlenb in HELPER(vsetvl)
  target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb' in MAXSZ()
  target/riscv/cpu.h: use 'vlenb' in vext_get_vlmax()
  target/riscv: change vext_get_vlmax() arguments
  trans_rvv.c.inc: use vext_get_vlmax() in trans_vrgather_v*()
  target/riscv/cpu.c: remove cpu->cfg.vlen

 target/riscv/cpu.c                         |  12 +-
 target/riscv/cpu.h                         |  14 +-
 target/riscv/cpu_cfg.h                     |   2 +-
 target/riscv/cpu_helper.c                  |  11 +-
 target/riscv/csr.c                         |   4 +-
 target/riscv/gdbstub.c                     |   6 +-
 target/riscv/insn_trans/trans_rvbf16.c.inc |  12 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 152 ++++++++++-----------
 target/riscv/insn_trans/trans_rvvk.c.inc   |  16 +--
 target/riscv/tcg/tcg-cpu.c                 |   4 +-
 target/riscv/vector_helper.c               |  43 +++---
 11 files changed, 148 insertions(+), 128 deletions(-)

-- 
2.43.0


