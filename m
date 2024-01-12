Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8A9C47DA2
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 21:40:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOPEN-0003nX-Gx; Fri, 12 Jan 2024 16:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEL-0003md-Ig
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEJ-0001W3-Qf
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:21 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d427518d52so51187015ad.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 13:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705095498; x=1705700298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LRzs9ZaJ0C0Ls3A/zkLCMuqO3DrtoAL1rrVLbilLyEY=;
 b=oVb4MSKjxC6MoWoFTquQ/0nDD7yWVDqjiJM5WJyR6kHg9NkSmR36MrZNcqdIIBG4XX
 JfsDVOBbKSxUpd2imG1ncBAkDvAsW6B3/F6f/B2U7SExxeLlnkB8r2NGYMD9oBAxYBdk
 KZyUbY1sa23XyKGoBp96l/4GuQtCEnuN6lBDGPWTifSCdyQzJ3E/e31ELeejRUIseOo5
 xlrK+O59anWY249UM190uV7QVrP71TqPddF8v7VCDsQPdijcwYVkpVD+GfefVSudFBzP
 Ulou5n4Atmor/xljphXuRkSZ5cX61XJwYtEvKCx9JQA+kHAjMMQKd+KZvJmQbB/QQuPa
 dvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095498; x=1705700298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRzs9ZaJ0C0Ls3A/zkLCMuqO3DrtoAL1rrVLbilLyEY=;
 b=bam8CM8tCtQ9ide6eEjz0rQBGK8Kb9RP92EvXdyUkmkuxjS36JYxabsOqHaYPERuA/
 0OeUiEsCMTkPkLcb0+I72NE5YRzPZ8AUzcPCojRaU7xQ34tY+lu3j296/QX4NZDYLZVM
 KvnmMHrf79Iw0u+awRTirpQauC+gTFnnTlATEJmFRLOSB1CkAq8J+BhN1i+MBYNN1yyh
 6MdLdQ1rK4guLJTzxRTeT5lLBT8tEc4hvdb6L1TVjhHiA/E3GqXiiWXgoAiHjUvhJueJ
 gSGt19sMWZjRU/1OSt/hjrflfn8TRmPrnQFIDH92uT4H8gsMfJOQ0lL9sWt1Ipq7Qj9i
 uCkQ==
X-Gm-Message-State: AOJu0YyKBlhqXBIshm4W3aStBqk86Jb4ysztWSOnuj4ZX600fabz8Ikq
 4sbU+JSjUz0GCjtCICR98S+Sy8gzbBtWCA==
X-Google-Smtp-Source: AGHT+IF06wawnhhkAcMEpKWA4rl6NuOTIPEgjc/aTOehstUDH0eyDLhNQIRIPMFxugwDLEtPx8e9fw==
X-Received: by 2002:a17:903:11d1:b0:1d3:bceb:ba62 with SMTP id
 q17-20020a17090311d100b001d3bcebba62mr2775378plh.45.1705095498285; 
 Fri, 12 Jan 2024 13:38:18 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 lf8-20020a170902fb4800b001d5b2967d00sm364727plb.290.2024.01.12.13.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:38:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/13] target/riscv: add 'cpu->cfg.vlenb',
 remove 'cpu->cfg.vlen'
Date: Fri, 12 Jan 2024 18:37:59 -0300
Message-ID: <20240112213812.173521-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

When working in the KVM Vector support, adding support for the 'vlenb'
register, I noticed that we have a *LOT* of code that uses 'vlenb', in a
far greater amount than 'vlen', and we resort to do 'vlen >> 3' every
time we need 'vlenb'. The conclusion is that we're storing the wrong
state - we should store 'vlenb' instead. 

We can't just get rid of the 'vlen' property since it has been exposed
to users already, but what we can do is to change our internal
representation. Users will keep setting 'vlen' but we'll store it as
'vlenb' internally. 

To fully remove 'vlen' we need to either use 'vlenb' to retrieve it
(i.e. vlen = vlenb << 3), if we can't help but use 'vlenb', or try to
rework the logic to avoid using vlenb. This was the case of patch 12,
where we avoid using 'vlen' to calculate 'vlmax' in a condition where
vl_eq_vlmax is true.

There was a minor performance gain after these changes, in particular
after patch 07. Performance gain isn't our goal here, but at least we
have evidence that we're not making the emulation slower with these
changes.

Patches based on Alistair's riscv-to-apply.next.

Daniel Henrique Barboza (13):
  target/riscv: add 'vlenb' field in cpu->cfg
  target/riscv/csr.c: use 'vlenb' instead of 'vlen'
  target/riscv/gdbstub.c: use 'vlenb' instead of shifting 'vlen'
  target/riscv/insn_trans/trans_rvbf16.c.inc: use cpu->cfg.vlenb
  target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb'
  target/riscv/insn_trans/trans_rvvk.c.inc: use 'vlenb'
  target/riscv/vector_helper.c: use 'vlenb'
  target/riscv/vector_helper.c: use vlenb in HELPER(vsetvl)
  target/riscv/cpu.h: use 'vlenb' in vext_get_vlmax()
  target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb' in MAXSZ()
  trans_rvv.c.inc: remove vlmax arg from vec_element_loadx()
  trans_rvv.c.inc: use cpu_vl in trans_vrgather_vi()
  target/riscv/cpu.c: remove cpu->cfg.vlen

 target/riscv/cpu.c                         |  12 +-
 target/riscv/cpu.h                         |   3 +-
 target/riscv/cpu_cfg.h                     |   2 +-
 target/riscv/csr.c                         |   4 +-
 target/riscv/gdbstub.c                     |   6 +-
 target/riscv/insn_trans/trans_rvbf16.c.inc |  12 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 200 +++++++++++----------
 target/riscv/insn_trans/trans_rvvk.c.inc   |  16 +-
 target/riscv/tcg/tcg-cpu.c                 |   4 +-
 target/riscv/vector_helper.c               |  27 +--
 10 files changed, 155 insertions(+), 131 deletions(-)

-- 
2.43.0


