Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC6C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:51:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzhmV-0002MW-Bj; Thu, 18 May 2023 13:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pzhmT-0002Ik-TW
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 13:51:13 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pzhmQ-0001fJ-R2
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 13:51:13 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-554f1ae1fbeso181314eaf.3
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 10:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684432269; x=1687024269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ruaX81lcewPWbISG1VbfmYqGcrj7LG5k7xeyff7fcJc=;
 b=D8rbvNu8PJIqslBSsQAkHZX185aWVexnTZPOE/A8bmbigznzgoFZ2iBZCTWPu3/A63
 SE/zeHeDPcwqKymnVon2zxfZjVAPMy+hq85hdLApEGS5sTCfKRrWaceWwCNRvZs/rgW7
 bFCZDSUOGiWZVa3vWzT5sMcA5i+9g76Z/9CfEVrzGHpqqUvROWqNcUSnSfw7PzyVh66q
 iiacFS2ku+XUPVKlyP37uQte1Ud4Y/zuGa0BzLp5kzPq0Ao+9+LYu3QtueiVlOYycQof
 wpayzCiRrgpQTp0w27ML51+VbnDsieeeH75I2T4JLa0GD4KshntQwsKc/FV+rZPiH3k1
 RVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684432269; x=1687024269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ruaX81lcewPWbISG1VbfmYqGcrj7LG5k7xeyff7fcJc=;
 b=TtuQ3ZFQ+wymjHf3T2wpfvVEpYKgx2CzGM1+MjVWPizMSEHdSHgkGgR72YwVHNwzUj
 pQnKTWSNsgE1DXeKMb15Db4kBt2LqKh6eBOnAc/UlohTpWmfAfTAhIq8DjB6Tj5wAPxk
 lHJNq5DIrrvVueoW0BdeAbbN1ZSoopWRyKGQE8baiWoNymubEGIJsL6Xa+VzBwC9/Vem
 vrU034D0i5uOpduFo3pQV42s4UX4wmFYJ/PSeh+5RsUU0l0fIu50KG8uSaPmjoaj2oM8
 EuYcfxjcSPeQmO039Y4gLQiPA8VXIDT9Ns6UufyQ2cgxBfWeUCHqlAnz5icALPPm90Oy
 AyNA==
X-Gm-Message-State: AC+VfDwXPQq8YAP9tWcQsl20MU2h5hzaIKM2D2yeOjpgC7HRe3OH+KH6
 oKX0KwsPOswZ/In3L1pCpl5+zA==
X-Google-Smtp-Source: ACHHUZ5fQAwDu6ympZVsI72T4TK4fShTDl5EA8smcAFfy87v61Ipobka13v2sSR/O02yiUZq+j0a7Q==
X-Received: by 2002:a4a:ea06:0:b0:54b:ce85:490a with SMTP id
 x6-20020a4aea06000000b0054bce85490amr15280723ood.0.1684432269559; 
 Thu, 18 May 2023 10:51:09 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a05683014cd00b006ab22bb324asm890832otq.10.2023.05.18.10.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 10:51:09 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 0/3] Smstateen FCSR
Date: Thu, 18 May 2023 23:20:55 +0530
Message-Id: <20230518175058.2772506-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oo1-xc29.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below.
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence splitting the patch 4 of the original series into three and
re-submitting along with the original patch 5.

Changes in v5:
- Ammend patch 1 commit message
- Add reviewed-by tag

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


