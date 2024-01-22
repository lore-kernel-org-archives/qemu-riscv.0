Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5598C47DDB
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:12:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwtO-0006R4-FR; Mon, 22 Jan 2024 11:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtL-0006QL-TE
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:20 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtJ-0005Hm-Ip
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:19 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5ce9555d42eso2823815a12.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939876; x=1706544676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2KydqUaZaC//XIffXRRDLDmyjP4IgRQT4Nned4Jp2zE=;
 b=IqnWM3JSL9bFnjfi4Uhhg0fICZEbFy8TUQ3umzf/dOVBzbJ7LCPhSTRTzqfqPhlg1Z
 Put/mrPAjd75TuD6a3r/rnEjfx0Kbsi3jhqo4sIfinSn1A0f+v2JO6VECqqyEHFSOwrD
 d2K+qoVERavMeiM57CQAT99ws2b8R2HTNzVAireZiisY2Egv31f1V8LzP0WO8Jy3QIgn
 Iv4/mvYYB59yBa1gCvc7CmDMt2gtMzoUVliWiWlaaPbJFTizQKR5eWeD0Cx6z7PzzyAr
 Kd3tnXYcMs2LYwlVOs03ymecMTNd0oZ6xAo4Alp77AGmturFTrmscH11tPpRvyqY2Zog
 qAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939876; x=1706544676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2KydqUaZaC//XIffXRRDLDmyjP4IgRQT4Nned4Jp2zE=;
 b=l/+1xzdXOPR4zWuuyFwVKjrz3rK62gy/T9WksMPCfJA51AZ47PWFGlPvZovifLR8Cp
 b166XpLMqb/zvBrB8D3lhyfUOPO8vSeU+RMGVQJm+jT9QbazqVx2ZWkRRFFjEj0RFVTC
 KiNDYOuUtKuqQrkFPnWpH2Kq/WopNPX5F8MImAdtFdaSBdOJ65xs49nuqRtkkDjdFYcs
 0qh1TidWyc8kHd3WE8UIDmzfsMf3YMT2IVgO8IXuudfS3h4PjSvPkShU55dfKWLhfWgw
 mGp55ows8/wvRJXIWRykuz+fU1eP8TcV1aTKKYmt04YOcp3dwlF4IpNCF15CwDEQPEp2
 IPEQ==
X-Gm-Message-State: AOJu0Yz4BPoPinIui+FjTXtBGus68BfB72OnEKXZWLX4wdh/dyhEMjIp
 +YF9CqfuaoVw1TqUpWalMnzB+lJ71x9JkHLsKkwjMW3sWQJH6BvEtpdeMVTaADo=
X-Google-Smtp-Source: AGHT+IFdhWw0fAHoE+45Umrd7oahkUp8yFY2KDVZshhSQUO7P2nO7RU/H0tY6Klb9SIyCU+PM45KVQ==
X-Received: by 2002:a17:90a:1287:b0:290:119c:1f7 with SMTP id
 g7-20020a17090a128700b00290119c01f7mr1834086pja.27.1705939875699; 
 Mon, 22 Jan 2024 08:11:15 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 00/13] target/riscv: add 'cpu->cfg.vlenb', remove
Date: Mon, 22 Jan 2024 13:10:54 -0300
Message-ID: <20240122161107.26737-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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

This new version is rebased with a newer riscv-to-apply.next branch
(@ 096b6b0729). No other changes made.

All patches acked.

v4 link: https://lore.kernel.org/qemu-riscv/20240116205817.344178-1-dbarboza@ventanamicro.com/

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


