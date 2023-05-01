Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ptU5Q-0003K7-RL
	for mharc-qemu-riscv@gnu.org; Mon, 01 May 2023 10:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU51-0003Du-CW
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 10:00:41 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU4z-0006IC-MT
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 10:00:39 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6a5e7482961so965805a34.3
 for <qemu-riscv@nongnu.org>; Mon, 01 May 2023 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682949634; x=1685541634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NMmiwnaBD6ON+RG9bdRSLuIxQBZQJymmvjm7ZFQcQmk=;
 b=IO6Fvm45VTHzonvKD4p1rgPqZwjhzySTPaWl89uInnmlnCoN3QynYkQeJgz3BVmILQ
 Z+c3t2OK9VaYZn57dDTgLPZ32e3WyatDVgxHCtZ9p2j+n2Iv4ww0KewZaHklTaVTPK0A
 tGZaeqbIsZImguZxdL4pCgsT+S+4IFeiJyeBEgPjNvJoX0sr3RnmEZLOOaP60k55oyTe
 ffOhurDFblOhrgmVXa0w8OWcg/qt8sVl/GX4Z6vw0CYl3ggVPYltt+xT2l589LOocDdH
 OSNg7FAlPSUwFNE48fRSwuw5+3AxL4seITWnVkmUHcl/zwqw8lYwR/tqlyQTo+rpHxA+
 L/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682949634; x=1685541634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMmiwnaBD6ON+RG9bdRSLuIxQBZQJymmvjm7ZFQcQmk=;
 b=UQQ+sO52WqP6UzVvDGJtGpH0XahYTmASzfTv7bgb76tOQmdGFJShHA3YnLSVPTpnn9
 Emth6ukIpamH9E7cNT5OKFcXgjVSvkiGxoQS71hmQ3uIfTaxTSfUs00E7MJ0BtuRLd7q
 2WJ2/NWVgh1El3rPvwRy9CqQRy1twVcoouvFSYyJXKMUzaGDqxy7pa2aUc2D38oPiViL
 NsZCavLhA8hGuCkdhFgUiBV6znebfwfn/3Mj0o2p81R5V88dABGlDBHCT4QC01W2iMwQ
 GFcPXN/DwEn0ybzu0vD3dFyE+ei1QZ/ZoVaKbNQnMA8jOVDTZy5v5n6RoM9AeLA8fieD
 AxaQ==
X-Gm-Message-State: AC+VfDwQIFVZxzwli71WJ2lwzjn1ms7PvzvY+z1txebHazIUN2m+emjO
 8Ow7f9rssTneqZJUDjKkuPKdNQ==
X-Google-Smtp-Source: ACHHUZ756fZ5PGUNVVzNMzGbtAzBYbuoQtaU/n9uuhTzUF/CTJmnYjAPfcaDjXc1/xqqxQc6oPmmyA==
X-Received: by 2002:a9d:6b90:0:b0:6a4:fab4:56a6 with SMTP id
 b16-20020a9d6b90000000b006a4fab456a6mr6648253otq.24.1682949633820; 
 Mon, 01 May 2023 07:00:33 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a9d6c0c000000b006a44338c8efsm10744342otq.44.2023.05.01.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:00:32 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 0/3] Smstateen FCSR
Date: Mon,  1 May 2023 19:30:17 +0530
Message-Id: <20230501140020.3667219-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 01 May 2023 14:00:54 -0000

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below.
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence splitting the patch 4 of the original series into three and
re-submitting along with the original patch 5.

Changes in v4:
- Drop patch 3 
- Add reviewed-by tag

Changes in v3:
- Reuse TB_FLAGS.FS (instead of TB_FLAGS.HS_FS) for smstateen as HS_FS bits been removed.
- Remove fcsr check for zfh and zfhmin

Changes in v2:
 - Improve patch 1 description
 - Reuse TB_FLAGS.HS_FS for smstateen
 - Convert smstateen_fcsr_check to function
 - Add fcsr check for zdinx

Mayuresh Chitale (3):
  target/riscv: smstateen check for fcsr
  target/riscv: Reuse tb->flags.FS
  target/riscv: smstateen knobs

 target/riscv/cpu.c                      |  3 ++-
 target/riscv/cpu_helper.c               |  6 ++++++
 target/riscv/csr.c                      | 15 +++++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc |  7 ++++---
 4 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.34.1


