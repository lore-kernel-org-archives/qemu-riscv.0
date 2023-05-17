Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A06C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzHel-0000x0-VF; Wed, 17 May 2023 09:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHei-0000wH-7j
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:28 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHeg-0000Tn-LP
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:28 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5527456ede6so316973eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684331844; x=1686923844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fh+dZlMqIDxD4os3T8AmNXRxu0WF5B0Z0kLs6+9OaCA=;
 b=cIv9+bdtOomexHwwG+FnH3VVltSJtsPzGhlPvf6femDS7N68+2obGFMiib9k4MbheX
 VRDm7uUkQ7UagkjShKSxLvisTW+6YOAhE5iOifLrA2Dv4hcyZup9R0mHM5vWYYsKQk4Z
 0d8MpKnSkLRdTlXgsN9iVwHn6C0/SfSEzDp+dNdzfBplqpcy6K4fhpr2kxJIflqYPRRZ
 mGpAM1xlmEZqgGtjfALfILcpR5V4uoDoNe5m2maL1TvfVhpJRm4ZrtW8yG+Avu3sxQhT
 svkGGe85tfANrCdxPKVPttcj+uq2qFoK8DrcY+sLFTRJKyfannG0zmLgFsJSzB/JFOrD
 Rr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684331844; x=1686923844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fh+dZlMqIDxD4os3T8AmNXRxu0WF5B0Z0kLs6+9OaCA=;
 b=ZiqZIciQr3sxVtfqvc5z9wxuHqEF4lBhGBNEQv/rPayJkd270HsUeV/8P15bfX2b7t
 k1ZhwebRoYAErJzoJrIHwgFbuxxYYud3G+BiZ1xQxoSQRm6zWrXDobkTneA+CpXRPswV
 EUpZ+K+LRaP4azyO+uuQ6Uhu0OS9VdpSg8Oz+7TchvjJpwiUrqANN/ikZcPexNnrD8gy
 A9O2W4R9MfJwO4MSnosDheieygJGziP5EsUgh8uxQE/633LNRFbF068Maqbr7k+tOpgp
 ELRkJqE6mzRlV0UXHQuJF2RYmBGGljaovYtpgX8GSGMW/LTZH15LDBkZz+d1m2dBtgta
 45Eg==
X-Gm-Message-State: AC+VfDw1l7LiZA75hT0Qpezy219gizZsd3aGIhn16KYnD9laUq5rkxSE
 /XiDiljwiR4FRNvVaQElZGVH1w==
X-Google-Smtp-Source: ACHHUZ5FCLSDrJo2mDiB1n5xqcjXwVrQQymZDbEZ/1GgfMT2L0NO+MTULrKWx0gf48/gsKh9SSOZeg==
X-Received: by 2002:a4a:7606:0:b0:54f:7f89:55e1 with SMTP id
 t6-20020a4a7606000000b0054f7f8955e1mr13676949ooc.2.1684331844498; 
 Wed, 17 May 2023 06:57:24 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a544815000000b00383d9700294sm9409562oij.40.2023.05.17.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:57:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 00/11] target/riscv: rework CPU extension validation
Date: Wed, 17 May 2023 10:57:03 -0300
Message-Id: <20230517135714.211809-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
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

In this version we have a change in patch 11. We're now firing a
GUEST_ERROR if write_misa() fails and we need to rollback (i.e. not
change MISA ext).

No other changes made. 

Changes from v8:
- patch 11:
  - log a GUEST_ERROR if we decided to keep the current env->misa_ext
    value because the user value failed our validation
- v8 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03584.html


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
 target/riscv/csr.c                      |  51 ++--
 target/riscv/insn_trans/trans_rvd.c.inc |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc |  14 +-
 target/riscv/insn_trans/trans_rvi.c.inc |   5 +-
 target/riscv/translate.c                |   5 +-
 7 files changed, 248 insertions(+), 175 deletions(-)

-- 
2.40.1


