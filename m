Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbbU4-0006Bu-L6
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 00:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbU3-0006BA-2a; Wed, 28 Apr 2021 00:07:31 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbU1-0007IX-7N; Wed, 28 Apr 2021 00:07:30 -0400
Received: by mail-ed1-x536.google.com with SMTP id s15so72534312edd.4;
 Tue, 27 Apr 2021 21:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrmLPHYpeRDGLVXBq7JGpx12BzAdRGWWpAXtkmLzF44=;
 b=gPGi1aE9+sPMcBd9TciuEpoKaHN0cNyeUSA6ZOH8T0hhsCdBkhL2IBxBMdygDpIE7u
 8crpqp0CcJW5RVz25FZShZdnJgFuIvzFaw8lMuKhsRrDHO47qGNkak0g2AL3dC6GP93Z
 DpXOS4eVH5VABDe+7Meo6srT5PLGQ/oWtOajtuAdz4GFFtYxvxTDLmKeyWs/8jZrPgSL
 jWUHSaZ71WyVHb+Au48tWBgSvfDk/ibCdCdqx138aVOcBKdxd2+0FEm3ob7WiwHDSI7F
 izgtFe/NZaIKwGgI1CPLiYj5rIJZPU5kFEXeS/tF1WZO3OPjMGgIadRQbSA8AdO0GYPt
 GIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrmLPHYpeRDGLVXBq7JGpx12BzAdRGWWpAXtkmLzF44=;
 b=ZYCBTCbMp1c+ATWQ4KX8Oc5oeJoHDygCKCdaieTORtVFy+H1AdmlvNG2sYeitFPXjE
 I/96elHtNn6+WjGaasgnTQ93r6ACymxzlP59DHO66o5j4y7eNhprDr3OmuPvZ3r2r0rf
 +AjfnaQBwRBxC+epWAZ+oVdPRh2Zjy+ZJ2PLzPkO+JjC+22XfDmVxi1OKf4aeIWQVE1z
 FHUT0m/tBEoLczhZbdq1Qo1xSWmT5lm7zFwxoEuvkT/f0nHZatt/oPfPBL7rTBoU09Be
 EevmtnSOLtiXolmEziA1pK/5U9ykFOjGLs7SDRPMt6v/kKrr0smyxAx1kND6r0V6NEaK
 JxyQ==
X-Gm-Message-State: AOAM532snz/dJDWhE193D1HCgQmAXNWCYx1SnO5NDu6P4Ym5oPC3U5k/
 +fTh+oN725E9srKFUJLDhBI=
X-Google-Smtp-Source: ABdhPJylxFDvp3LUoWRZcndVyEJDczGZ27ONxF2dy35fk2oCSnJcdhj2AjNJqMUiQ41v6MjbnfDrjg==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr8115529edd.348.1619582847204; 
 Tue, 27 Apr 2021 21:07:27 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id t6sm576219eds.66.2021.04.27.21.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:07:26 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH RESEND v8 0/6] RISC-V Pointer Masking implementation
Date: Wed, 28 Apr 2021 07:07:23 +0300
Message-Id: <20210428040723.8719-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Apr 2021 04:07:31 -0000

v8-resend:
Resending to trigger recheck due to minor codestyle issues.

v8:
Hi folks,

Finally we were able to assign v0.1 draft for Pointer Masking extension for RISC-V: https://github.com/riscv/riscv-j-extension/blob/master/pointer-masking-proposal.adoc
This is supposed to be the first series of patches with initial support for PM. It obviously misses support for hypervisor mode, vector load/stores and some other features, while using temporary csr numbers(they're to be assigned by the committee a bit later).
With this patch series we were able to run a bunch of tests with HWASAN checks enabled.

I hope I've managed to addressed @Alistair's previous comments in this version.

Thanks!

v7:
Hi folks,

Sorry it took me almost 3 month to provide the reply and fixes: it was a really busy EOY.
This series contains fixed @Alistair suggestion on enabling J-ext.

As for @Richard comments:
- Indeed I've missed appending review-by to the approved commits. Now I've restored them except for the fourth commit. @Richard could you please tell if you think it's still ok to commit it as is, or should I support masking mem ops for RVV first?
- These patches don't have any support for load/store masking for RVV and RVH extensions, so no support for special load/store for Hypervisor in particular.

If this patch series would be accepted, I think my further attention would be to:
- Support pm for memory operations for RVV
- Add proper csr and support pm for memory operations for Hypervisor mode
- Support address wrapping on unaligned accesses as @Richard mentioned previously

Thanks!

Alexey Baturo (5):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  32 ++++
 target/riscv/cpu.h                      |  34 ++++
 target/riscv/cpu_bits.h                 |  66 +++++++
 target/riscv/csr.c                      | 236 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  42 +++++
 9 files changed, 419 insertions(+)

-- 
2.20.1


