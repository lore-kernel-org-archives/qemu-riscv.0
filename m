Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C27C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:11:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8fS9-0001nF-1e; Mon, 12 Jun 2023 07:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRn-0001hA-2l
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:55 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRj-0002No-FV
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:54 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977ed383b8aso689538366b.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686568250; x=1689160250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iEPrSTUBUF64Pcu4RndB2Ut3V0hkd3LCo+drJPvpapI=;
 b=P7pswv/636uwif/SSu7y7MnsPIQokVTf80pu6+xibg3C7ItmJ15sVVQdrimDqZhxAC
 faSE96+MdXw6kTXdD/GbJK9xUbJZ7aikmqwabWoo9VC8pF5G0FPKjaqMX5KK7lR3mnLy
 rSGBWnJax1P3snoJruzngt2my+lbdpvp17wNThyU0mQyI73kgMlmp5eS56dii5n9hvl9
 54WDHsm47L+RLMGACJhuDCUIR7hN84nl8NdiHeUQYfFwa3XlMT9TuVw+IqrfUCVIKgW4
 gXJnIlFy0kLykUZM+VUyNd310EEEh08nlUMgaCualLSWpKSNKFI0fk5GMPWUNuX09wsE
 IYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686568250; x=1689160250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iEPrSTUBUF64Pcu4RndB2Ut3V0hkd3LCo+drJPvpapI=;
 b=HTGl0GHKhZMnGFS3ZWNKaReQdYVR3XNETm13JTJsn+1HSIYVjIDToU90srf0tP5Ld4
 D5OBEfGw9Z43cw8KUCRlpX2pzLVvOUXBSZ7fFCI8EvipgsKkhtYagNNVQ40uNJod7Zmn
 mvxKtVMHL7J6F2xUK9fMMnWrwND+7SM2a3S+40/1j2tHxXPLgPXE+MZThUZrT+mHHSRQ
 BYrkEQwRqFtlBh77SlEhDlFpwsgX5RqEq3LMqxrrN/afzZ9Y7pKhMRtZ+ajFIGCIPm9+
 HDUqrG5ByiUVyWXdHufROp2a3SfpuEnXA/W3rLffrkVz2Dp1X+SYAn0PNb4vMfD8qZlt
 oGlg==
X-Gm-Message-State: AC+VfDxMur386awvMwkMe4Ds4JQllcfgYmUkBNdMh9CXIXOiiqcFd4Ju
 KM9Gx7/sRYyhubArjixvepeWheJ5Gka2jL+FNjM=
X-Google-Smtp-Source: ACHHUZ6lh4Sa0gWyUnwg4MXwLmHepvXqPJLwFKzOHq7IQ/HKeP3mr+/cAxphkLcL4pkL2iCiULMkCw==
X-Received: by 2002:a17:906:7952:b0:966:1984:9d21 with SMTP id
 l18-20020a170906795200b0096619849d21mr10558993ejo.9.1686568249909; 
 Mon, 12 Jun 2023 04:10:49 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709064a1700b00978723f594bsm5000948eju.101.2023.06.12.04.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 04:10:49 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 8/8] disas/riscv: Add support for XThead* instructions
Date: Mon, 12 Jun 2023 13:10:34 +0200
Message-Id: <20230612111034.3955227-9-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x630.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

Support for emulating XThead* instruction has been added recently.
This patch adds support for these instructions to the RISC-V disassembler.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 disas/meson.build      |   1 +
 disas/riscv-xthead.c   | 707 +++++++++++++++++++++++++++++++++++++++++
 disas/riscv-xthead.h   |  28 ++
 disas/riscv.c          |  69 ++++
 disas/riscv.h          |  12 +
 target/riscv/cpu_cfg.h |  11 +
 6 files changed, 828 insertions(+)
 create mode 100644 disas/riscv-xthead.c
 create mode 100644 disas/riscv-xthead.h

diff --git a/disas/meson.build b/disas/meson.build
index e0ee326411..8f64e378f9 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -8,6 +8,7 @@ common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c', 'nanomips.c'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files(
     'riscv.c',
+    'riscv-xthead.c',
     'riscv-xventana.c'
 ))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
new file mode 100644
index 0000000000..99da679d16
--- /dev/null
+++ b/disas/riscv-xthead.c
@@ -0,0 +1,707 @@
+/*
+ * QEMU RISC-V Disassembler for xthead.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "disas/riscv.h"
+#include "disas/riscv-xthead.h"
+
+typedef enum {
+    /* 0 is reserved for rv_op_illegal. */
+    /* XTheadBa */
+    rv_op_th_addsl = 1,
+    /* XTheadBb */
+    rv_op_th_srri,
+    rv_op_th_srriw,
+    rv_op_th_ext,
+    rv_op_th_extu,
+    rv_op_th_ff0,
+    rv_op_th_ff1,
+    rv_op_th_rev,
+    rv_op_th_revw,
+    rv_op_th_tstnbz,
+    /* XTheadBs */
+    rv_op_th_tst,
+    /* XTheadCmo */
+    rv_op_th_dcache_call,
+    rv_op_th_dcache_ciall,
+    rv_op_th_dcache_iall,
+    rv_op_th_dcache_cpa,
+    rv_op_th_dcache_cipa,
+    rv_op_th_dcache_ipa,
+    rv_op_th_dcache_cva,
+    rv_op_th_dcache_civa,
+    rv_op_th_dcache_iva,
+    rv_op_th_dcache_csw,
+    rv_op_th_dcache_cisw,
+    rv_op_th_dcache_isw,
+    rv_op_th_dcache_cpal1,
+    rv_op_th_dcache_cval1,
+    rv_op_th_icache_iall,
+    rv_op_th_icache_ialls,
+    rv_op_th_icache_ipa,
+    rv_op_th_icache_iva,
+    rv_op_th_l2cache_call,
+    rv_op_th_l2cache_ciall,
+    rv_op_th_l2cache_iall,
+    /* XTheadCondMov */
+    rv_op_th_mveqz,
+    rv_op_th_mvnez,
+    /* XTheadFMemIdx */
+    rv_op_th_flrd,
+    rv_op_th_flrw,
+    rv_op_th_flurd,
+    rv_op_th_flurw,
+    rv_op_th_fsrd,
+    rv_op_th_fsrw,
+    rv_op_th_fsurd,
+    rv_op_th_fsurw,
+    /* XTheadFmv */
+    rv_op_th_fmv_hw_x,
+    rv_op_th_fmv_x_hw,
+    /* XTheadMac */
+    rv_op_th_mula,
+    rv_op_th_mulah,
+    rv_op_th_mulaw,
+    rv_op_th_muls,
+    rv_op_th_mulsw,
+    rv_op_th_mulsh,
+    /* XTheadMemIdx */
+    rv_op_th_lbia,
+    rv_op_th_lbib,
+    rv_op_th_lbuia,
+    rv_op_th_lbuib,
+    rv_op_th_lhia,
+    rv_op_th_lhib,
+    rv_op_th_lhuia,
+    rv_op_th_lhuib,
+    rv_op_th_lwia,
+    rv_op_th_lwib,
+    rv_op_th_lwuia,
+    rv_op_th_lwuib,
+    rv_op_th_ldia,
+    rv_op_th_ldib,
+    rv_op_th_sbia,
+    rv_op_th_sbib,
+    rv_op_th_shia,
+    rv_op_th_shib,
+    rv_op_th_swia,
+    rv_op_th_swib,
+    rv_op_th_sdia,
+    rv_op_th_sdib,
+    rv_op_th_lrb,
+    rv_op_th_lrbu,
+    rv_op_th_lrh,
+    rv_op_th_lrhu,
+    rv_op_th_lrw,
+    rv_op_th_lrwu,
+    rv_op_th_lrd,
+    rv_op_th_srb,
+    rv_op_th_srh,
+    rv_op_th_srw,
+    rv_op_th_srd,
+    rv_op_th_lurb,
+    rv_op_th_lurbu,
+    rv_op_th_lurh,
+    rv_op_th_lurhu,
+    rv_op_th_lurw,
+    rv_op_th_lurwu,
+    rv_op_th_lurd,
+    rv_op_th_surb,
+    rv_op_th_surh,
+    rv_op_th_surw,
+    rv_op_th_surd,
+    /* XTheadMemPair */
+    rv_op_th_ldd,
+    rv_op_th_lwd,
+    rv_op_th_lwud,
+    rv_op_th_sdd,
+    rv_op_th_swd,
+    /* XTheadSync */
+    rv_op_th_sfence_vmas,
+    rv_op_th_sync,
+    rv_op_th_sync_i,
+    rv_op_th_sync_is,
+    rv_op_th_sync_s,
+} rv_xthead_op;
+
+const rv_opcode_data xthead_opcode_data[] = {
+    { "th.illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
+    /* XTheadBa */
+    { "th.addsl", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    /* XTheadBb */
+    { "th.srri", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "th.srriw", rv_codec_r2_imm5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "th.ext", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, 0 },
+    { "th.extu", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, 0 },
+    { "th.ff0", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "th.ff1", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "th.rev", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "th.revw", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "th.tstnbz", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    /* XTheadBs */
+    { "th.tst", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    /* XTheadCmo */
+    { "th.dcache.call", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.dcache.ciall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.dcache.iall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.dcache.cpa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.cipa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.ipa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.cva", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.civa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.iva", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.csw", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.cisw", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.isw", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.cpal1", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.dcache.cval1", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.icache.iall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.icache.ialls", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.icache.ipa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.icache.iva", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "th.l2cache.call", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.l2cache.ciall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.l2cache.iall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    /* XTheadCondMov */
+    { "th.mveqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.mvnez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    /* XTheadFMemIdx */
+    { "th.flrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.flrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.flurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.flurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.fsrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.fsrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.fsurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.fsurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    /* XTheadFmv */
+    { "th.fmv.hw.x", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
+    { "th.fmv.x.hw", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
+    /* XTheadMac */
+    { "th.mula", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.mulaw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.mulah", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.muls", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.mulsw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.mulsh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    /* XTheadMemIdx */
+    { "th.lbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, 0 },
+    { "th.lbuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lbuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lhia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lhib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lhuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lhuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lwia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lwib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lwuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lwuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.ldia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.ldib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.sbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.sbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.shia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.shib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.swia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.swib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.sdia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.sdib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
+    { "th.lrb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lrbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lrh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lrhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lrw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lrwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lrd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.srb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.srh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.srw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.srd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.lurd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.surb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.surh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.surw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    { "th.surd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
+    /* XTheadMemPair */
+    { "th.ldd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
+    { "th.lwd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
+    { "th.lwud", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
+    { "th.sdd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
+    { "th.swd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
+    /* XTheadSync */
+    { "th.sfence.vmas", rv_codec_r, rv_fmt_rs1_rs2, NULL, 0, 0, 0 },
+    { "th.sync", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.sync.i", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.sync.is", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "th.sync.s", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+};
+
+void decode_xtheadba(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 1:
+                switch ((inst >> 25) & 0b1111111) {
+                case 0b0000000:
+                case 0b0000001:
+                case 0b0000010:
+                case 0b0000011: op = rv_op_th_addsl; break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadbb(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 1:
+                switch ((inst >> 25) & 0b1111111) {
+                case 0b0001010: op = rv_op_th_srriw; break;
+                case 0b1000000:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_tstnbz;
+                    }
+                    break;
+                case 0b1000001:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_rev;
+                    }
+                    break;
+                case 0b1000010:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_ff0;
+                    }
+                    break;
+                case 0b1000011:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_ff1;
+                    }
+                    break;
+                case 0b1000100:
+                case 0b1001000:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_revw;
+                    }
+                    break;
+                case 0b0000100:
+                case 0b0000101: op = rv_op_th_srri; break;
+                }
+                break;
+            case 2: op = rv_op_th_ext; break;
+            case 3: op = rv_op_th_extu; break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadbs(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 1:
+                switch ((inst >> 26) & 0b111111) {
+                case 0b100010: op = rv_op_th_tst; break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadcmo(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 0:
+                switch ((inst >> 20 & 0b111111111111)) {
+                case 0b000000000001:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_dcache_call;
+                    }
+                    break;
+                case 0b000000000011:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_dcache_ciall;
+                    }
+                    break;
+                case 0b000000000010:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_dcache_iall;
+                    }
+                    break;
+                case 0b000000101001: op = rv_op_th_dcache_cpa; break;
+                case 0b000000101011: op = rv_op_th_dcache_cipa; break;
+                case 0b000000101010: op = rv_op_th_dcache_ipa; break;
+                case 0b000000100101: op = rv_op_th_dcache_cva; break;
+                case 0b000000100111: op = rv_op_th_dcache_civa; break;
+                case 0b000000100110: op = rv_op_th_dcache_iva; break;
+                case 0b000000100001: op = rv_op_th_dcache_csw; break;
+                case 0b000000100011: op = rv_op_th_dcache_cisw; break;
+                case 0b000000100010: op = rv_op_th_dcache_isw; break;
+                case 0b000000101000: op = rv_op_th_dcache_cpal1; break;
+                case 0b000000100100: op = rv_op_th_dcache_cval1; break;
+                case 0b000000010000:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_icache_iall;
+                    }
+                    break;
+                case 0b000000010001:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_icache_ialls;
+                    }
+                    break;
+                case 0b000000111000: op = rv_op_th_icache_ipa; break;
+                case 0b000000110000: op = rv_op_th_icache_iva; break;
+                case 0b000000010101:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_l2cache_call;
+                    }
+                    break;
+                case 0b000000010111:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_l2cache_ciall;
+                    }
+                    break;
+                case 0b000000010110:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_l2cache_iall;
+                    }
+                    break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadcondmov(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 1:
+                switch ((inst >> 25) & 0b1111111) {
+                case 0b0100000: op = rv_op_th_mveqz; break;
+                case 0b0100001: op = rv_op_th_mvnez; break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadfmemidx(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 6:
+                switch ((inst >> 27) & 0b11111) {
+                case 8: op = rv_op_th_flrw; break;
+                case 10: op = rv_op_th_flurw; break;
+                case 12: op = rv_op_th_flrd; break;
+                case 14: op = rv_op_th_flurd; break;
+                }
+                break;
+            case 7:
+                switch ((inst >> 27) & 0b11111) {
+                case 8: op = rv_op_th_fsrw; break;
+                case 10: op = rv_op_th_fsurw; break;
+                case 12: op = rv_op_th_fsrd; break;
+                case 14: op = rv_op_th_fsurd; break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadfmv(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 1:
+                switch ((inst >> 25) & 0b1111111) {
+                case 0b1010000:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_fmv_hw_x;
+                    }
+                    break;
+                case 0b1100000:
+                    if (((inst >> 20) & 0b11111) == 0) {
+                        op = rv_op_th_fmv_x_hw;
+                    }
+                    break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadmac(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 1:
+                switch ((inst >> 25) & 0b1111111) {
+                case 0b0010000: op = rv_op_th_mula; break;
+                case 0b0010001: op = rv_op_th_muls; break;
+                case 0b0010010: op = rv_op_th_mulaw; break;
+                case 0b0010011: op = rv_op_th_mulsw; break;
+                case 0b0010100: op = rv_op_th_mulah; break;
+                case 0b0010101: op = rv_op_th_mulsh; break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadmemidx(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 4:
+                switch ((inst >> 27) & 0b11111) {
+                case 0: op = rv_op_th_lrb; break;
+                case 1: op = rv_op_th_lbib; break;
+                case 2: op = rv_op_th_lurb; break;
+                case 3: op = rv_op_th_lbia; break;
+                case 4: op = rv_op_th_lrh; break;
+                case 5: op = rv_op_th_lhib; break;
+                case 6: op = rv_op_th_lurh; break;
+                case 7: op = rv_op_th_lhia; break;
+                case 8: op = rv_op_th_lrw; break;
+                case 9: op = rv_op_th_lwib; break;
+                case 10: op = rv_op_th_lurw; break;
+                case 11: op = rv_op_th_lwia; break;
+                case 12: op = rv_op_th_lrd; break;
+                case 13: op = rv_op_th_ldib; break;
+                case 14: op = rv_op_th_lurd; break;
+                case 15: op = rv_op_th_ldia; break;
+                case 16: op = rv_op_th_lrbu; break;
+                case 17: op = rv_op_th_lbuib; break;
+                case 18: op = rv_op_th_lurbu; break;
+                case 19: op = rv_op_th_lbuia; break;
+                case 20: op = rv_op_th_lrhu; break;
+                case 21: op = rv_op_th_lhuib; break;
+                case 22: op = rv_op_th_lurhu; break;
+                case 23: op = rv_op_th_lhuia; break;
+                case 24: op = rv_op_th_lrwu; break;
+                case 25: op = rv_op_th_lwuib; break;
+                case 26: op = rv_op_th_lurwu; break;
+                case 27: op = rv_op_th_lwuia; break;
+                }
+                break;
+            case 5:
+                switch ((inst >> 27) & 0b11111) {
+                case 0: op = rv_op_th_srb; break;
+                case 1: op = rv_op_th_sbib; break;
+                case 2: op = rv_op_th_surb; break;
+                case 3: op = rv_op_th_sbia; break;
+                case 4: op = rv_op_th_srh; break;
+                case 5: op = rv_op_th_shib; break;
+                case 6: op = rv_op_th_surh; break;
+                case 7: op = rv_op_th_shia; break;
+                case 8: op = rv_op_th_srw; break;
+                case 9: op = rv_op_th_swib; break;
+                case 10: op = rv_op_th_surw; break;
+                case 11: op = rv_op_th_swia; break;
+                case 12: op = rv_op_th_srd; break;
+                case 13: op = rv_op_th_sdib; break;
+                case 14: op = rv_op_th_surd; break;
+                case 15: op = rv_op_th_sdia; break;
+                }
+                break;
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadmempair(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 4:
+                switch ((inst >> 27) & 0b11111) {
+                case 28: op = rv_op_th_lwd; break;
+                case 30: op = rv_op_th_lwud; break;
+                case 31: op = rv_op_th_ldd; break;
+                }
+                break;
+            case 5:
+                switch ((inst >> 27) & 0b11111) {
+                case 28: op = rv_op_th_swd; break;
+                case 31: op = rv_op_th_sdd; break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
+
+void decode_xtheadsync(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch (((inst >> 0) & 0b11)) {
+    case 3:
+        switch (((inst >> 2) & 0b11111)) {
+        case 2:
+            /* custom-0 */
+            switch ((inst >> 12) & 0b111) {
+            case 0:
+                switch ((inst >> 25) & 0b1111111) {
+                case 0b0000010: op = rv_op_th_sfence_vmas; break;
+                case 0b0000000:
+                    switch ((inst >> 20) & 0b11111) {
+                    case 0b11000: op = rv_op_th_sync; break;
+                    case 0b11010: op = rv_op_th_sync_i; break;
+                    case 0b11011: op = rv_op_th_sync_is; break;
+                    case 0b11001: op = rv_op_th_sync_s; break;
+                    }
+                    break;
+                }
+                break;
+            }
+            break;
+            /* custom-0 */
+        }
+        break;
+    }
+
+    dec->op = op;
+}
diff --git a/disas/riscv-xthead.h b/disas/riscv-xthead.h
new file mode 100644
index 0000000000..fcd42746e7
--- /dev/null
+++ b/disas/riscv-xthead.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU disassembler -- RISC-V specific header (xthead*).
+ *
+ * Copyright (c) 2023 VRULL GmbH
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef DISAS_RISCV_XTHEAD_H
+#define DISAS_RISCV_XTHEAD_H
+
+#include "disas/riscv.h"
+
+extern const rv_opcode_data xthead_opcode_data[];
+
+void decode_xtheadba(rv_decode *, rv_isa);
+void decode_xtheadbb(rv_decode *, rv_isa);
+void decode_xtheadbs(rv_decode *, rv_isa);
+void decode_xtheadcmo(rv_decode *, rv_isa);
+void decode_xtheadcondmov(rv_decode *, rv_isa);
+void decode_xtheadfmemidx(rv_decode *, rv_isa);
+void decode_xtheadfmv(rv_decode *, rv_isa);
+void decode_xtheadmac(rv_decode *, rv_isa);
+void decode_xtheadmemidx(rv_decode *, rv_isa);
+void decode_xtheadmempair(rv_decode *, rv_isa);
+void decode_xtheadsync(rv_decode *, rv_isa);
+
+#endif /* DISAS_RISCV_XTHEAD_H */
diff --git a/disas/riscv.c b/disas/riscv.c
index c7bfd4ed32..94e568a7e9 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -18,11 +18,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "disas/dis-asm.h"
 #include "target/riscv/cpu_cfg.h"
 #include "disas/riscv.h"
 
 /* Vendor extensions */
+#include "disas/riscv-xthead.h"
 #include "disas/riscv-xventana.h"
 
 typedef enum {
@@ -3869,6 +3871,26 @@ static uint32_t operand_zcmp_rlist(rv_inst inst)
     return ((inst << 56) >> 60);
 }
 
+static uint32_t operand_imm6(rv_inst inst)
+{
+    return (inst << 38) >> 60;
+}
+
+static uint32_t operand_imm2(rv_inst inst)
+{
+    return (inst << 37) >> 62;
+}
+
+static uint32_t operand_immh(rv_inst inst)
+{
+    return (inst << 32) >> 58;
+}
+
+static uint32_t operand_imml(rv_inst inst)
+{
+    return (inst << 38) >> 58;
+}
+
 static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
 {
     int xlen_bytes_log2 = isa == rv64 ? 3 : 2;
@@ -4233,6 +4255,38 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
     case rv_codec_zcmt_jt:
         dec->imm = operand_tbl_index(inst);
         break;
+    case rv_codec_r2_imm5:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->imm = operand_rs2(inst);
+        break;
+    case rv_codec_r2:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        break;
+    case rv_codec_r2_imm6:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->imm = operand_imm6(inst);
+        break;
+    case rv_codec_r_imm2:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->rs2 = operand_rs2(inst);
+        dec->imm = operand_imm2(inst);
+        break;
+    case rv_codec_r2_immhl:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->imm = operand_immh(inst);
+        dec->imm1 = operand_imml(inst);
+        break;
+    case rv_codec_r2_imm2_imm5:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->imm = sextract32(operand_rs2(inst), 0, 5);
+        dec->imm1 = operand_imm2(inst);
+        break;
     };
 }
 
@@ -4446,6 +4500,10 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b11111));
             append(buf, tmp, buflen);
             break;
+        case 'j':
+            snprintf(tmp, sizeof(tmp), "%d", dec->imm1);
+            append(buf, tmp, buflen);
+            break;
         case 'o':
             snprintf(tmp, sizeof(tmp), "%d", dec->imm);
             append(buf, tmp, buflen);
@@ -4711,6 +4769,17 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
         void (*decode_func)(rv_decode *, rv_isa);
     } decoders[] = {
         { always_true_p, rvi_opcode_data, decode_inst_opcode },
+        { has_xtheadba_p, xthead_opcode_data, decode_xtheadba },
+        { has_xtheadbb_p, xthead_opcode_data, decode_xtheadbb },
+        { has_xtheadbs_p, xthead_opcode_data, decode_xtheadbs },
+        { has_xtheadcmo_p, xthead_opcode_data, decode_xtheadcmo },
+        { has_xtheadcondmov_p, xthead_opcode_data, decode_xtheadcondmov },
+        { has_xtheadfmemidx_p, xthead_opcode_data, decode_xtheadfmemidx },
+        { has_xtheadfmv_p, xthead_opcode_data, decode_xtheadfmv },
+        { has_xtheadmac_p, xthead_opcode_data, decode_xtheadmac },
+        { has_xtheadmemidx_p, xthead_opcode_data, decode_xtheadmemidx },
+        { has_xtheadmempair_p, xthead_opcode_data, decode_xtheadmempair },
+        { has_xtheadsync_p, xthead_opcode_data, decode_xtheadsync },
         { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacondops },
     };
 
diff --git a/disas/riscv.h b/disas/riscv.h
index 460196510c..052a0c4281 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -159,6 +159,12 @@ typedef enum {
     rv_codec_zcmp_cm_pushpop,
     rv_codec_zcmp_cm_mv,
     rv_codec_zcmt_jt,
+    rv_codec_r2_imm5,
+    rv_codec_r2,
+    rv_codec_r2_imm6,
+    rv_codec_r_imm2,
+    rv_codec_r2_immhl,
+    rv_codec_r2_imm2_imm5,
 } rv_codec;
 
 /* structures */
@@ -185,6 +191,7 @@ typedef struct {
     uint64_t  inst;
     const rv_opcode_data *opcode_data;
     int32_t   imm;
+    int32_t   imm1;
     uint16_t  op;
     uint8_t   codec;
     uint8_t   rd;
@@ -283,5 +290,10 @@ enum {
 #define rv_fmt_push_rlist             "O\tx,-i"
 #define rv_fmt_pop_rlist              "O\tx,i"
 #define rv_fmt_zcmt_index             "O\ti"
+#define rv_fmt_rd_rs1_rs2_imm         "O\t0,1,2,i"
+#define rv_fmt_frd_rs1_rs2_imm        "O\t3,1,2,i"
+#define rv_fmt_rd_rs1_immh_imml       "O\t0,1,i,j"
+#define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
+#define rv_fmt_rd2_imm                "O\t0,2,(1),i"
 
 #endif /* DISAS_RISCV_H */
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0b4fe4b540..6b7e736bc2 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -157,6 +157,17 @@ static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
         return cfg->ext_ ## ext ; \
     }
 
+MATERIALISE_EXT_PREDICATE(xtheadba)
+MATERIALISE_EXT_PREDICATE(xtheadbb)
+MATERIALISE_EXT_PREDICATE(xtheadbs)
+MATERIALISE_EXT_PREDICATE(xtheadcmo)
+MATERIALISE_EXT_PREDICATE(xtheadcondmov)
+MATERIALISE_EXT_PREDICATE(xtheadfmemidx)
+MATERIALISE_EXT_PREDICATE(xtheadfmv)
+MATERIALISE_EXT_PREDICATE(xtheadmac)
+MATERIALISE_EXT_PREDICATE(xtheadmemidx)
+MATERIALISE_EXT_PREDICATE(xtheadmempair)
+MATERIALISE_EXT_PREDICATE(xtheadsync)
 MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
 #endif
-- 
2.40.1


