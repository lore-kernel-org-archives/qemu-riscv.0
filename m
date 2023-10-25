Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C43BC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:15:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfb9-0005jj-Ss; Wed, 25 Oct 2023 11:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfb5-0005hs-Op
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:15:03 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfb3-0003l0-F1
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:15:03 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-584042e7f73so3325753eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246900; x=1698851700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3EycMYI800mCjoad+AIrSiAoDJQpEk4wNkfXQSFIHE=;
 b=ZN59RBTZuNJN6iGMGa9Ldw9Vtqx3h6G4liGf7RPn7UNvx0KbDR+zRlZaHwTJY6AFgD
 y8zbSdXQCa1f9+8QBAJYWf0JS5GEanTPJMHEcjbGB52flLf+G6jujxCDE4kFwZUyEAol
 AG1D2MPv/bw4GALwn7F4BLX0zIddSvHLTbAikszCxEO/aC8DLDBSAQ/ece3KyYMEb8ry
 5Ycfbsk3wzSn8NeD1rpBxhzNqzFyiN0nsMFFkKmPBdLups0LlepY6wIY7eJM81SMK9Rv
 agB1/Ca2RBTEz2wX2ReJnCI3WJCVMojzBgkPfZTFyC9CKnb14C4I0S3O8r7WXoy2K61+
 RdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246900; x=1698851700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3EycMYI800mCjoad+AIrSiAoDJQpEk4wNkfXQSFIHE=;
 b=RGYZesvOKJGABkNlv7n67UITcW1WrP/1ye7zdnPI5fYW7xRO6vcv8/QisEk1lTXUyB
 D0V0PUIjS8D+TvzoS6TfxtVT89drqDIfa+c/YRBShbmvee9dFGGq71SL1g1uOLEGU7gT
 iTqMBPzcsZq5Dq1L+fTanuXWIviytVSy8nHRKKt4JPCgkGPWkEU8RWGdAqDw9lKqeLfs
 tY53FdcBC9lpQZCy/CB0D9kXMuyFTWywnDwdbOGUdgE4ajhy1n8TB9onkO2Z1xL9aYsP
 NfocvBtlUqM9SJsWmLceoT81tHtqyRwYUnTUFk9XXxvnTVSvx43nCusC4ibMc5zkh/ka
 qsCw==
X-Gm-Message-State: AOJu0YwQxOPNnBJXRS6HCj+EVz9zQ1MK78713R72k2JtixBWTdeIpY1e
 8KyhszixHg4yjUDQLnjTeIwGyg==
X-Google-Smtp-Source: AGHT+IGIpaRSQUsFJWpAcTdTX7cHMgleJXAwuMHM8uioSLV4f7U56eNGdShcLhz00F5Dwd1ln1xKhg==
X-Received: by 2002:a05:6359:a04:b0:168:d169:44 with SMTP id
 el4-20020a0563590a0400b00168d1690044mr10539780rwb.1.1698246899907; 
 Wed, 25 Oct 2023 08:14:59 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:59 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 13/14] disas/riscv: Add support for vector crypto extensions
Date: Wed, 25 Oct 2023 23:13:37 +0800
Message-Id: <20231025151341.725477-14-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=max.chou@sifive.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch adds following v1.0.0 ratified vector crypto extensions
support to the RISC-V disassembler.
- Zvbb
- Zvbc
- Zvkb
- Zvkg
- Zvkned
- Zvknha
- Zvknhb
- Zvksed
- Zvksh

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv.c | 137 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index 6d60033abab..5bfa9390c45 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -862,6 +862,47 @@ typedef enum {
     rv_op_fltq_q = 831,
     rv_op_fleq_h = 832,
     rv_op_fltq_h = 833,
+    rv_op_vaesdf_vv = 834,
+    rv_op_vaesdf_vs = 835,
+    rv_op_vaesdm_vv = 836,
+    rv_op_vaesdm_vs = 837,
+    rv_op_vaesef_vv = 838,
+    rv_op_vaesef_vs = 839,
+    rv_op_vaesem_vv = 840,
+    rv_op_vaesem_vs = 841,
+    rv_op_vaeskf1_vi = 842,
+    rv_op_vaeskf2_vi = 843,
+    rv_op_vaesz_vs = 845,
+    rv_op_vandn_vv = 846,
+    rv_op_vandn_vx = 847,
+    rv_op_vbrev_v = 848,
+    rv_op_vbrev8_v = 849,
+    rv_op_vclmul_vv = 850,
+    rv_op_vclmul_vx = 851,
+    rv_op_vclmulh_vv = 852,
+    rv_op_vclmulh_vx = 853,
+    rv_op_vclz_v = 854,
+    rv_op_vcpop_v = 855,
+    rv_op_vctz_v = 856,
+    rv_op_vghsh_vv = 857,
+    rv_op_vgmul_vv = 858,
+    rv_op_vrev8_v = 859,
+    rv_op_vrol_vv = 860,
+    rv_op_vrol_vx = 861,
+    rv_op_vror_vv = 862,
+    rv_op_vror_vx = 863,
+    rv_op_vror_vi = 864,
+    rv_op_vsha2ch_vv = 865,
+    rv_op_vsha2cl_vv = 866,
+    rv_op_vsha2ms_vv = 867,
+    rv_op_vsm3c_vi = 868,
+    rv_op_vsm3me_vv = 869,
+    rv_op_vsm4k_vi = 870,
+    rv_op_vsm4r_vv = 871,
+    rv_op_vsm4r_vs = 872,
+    rv_op_vwsll_vv = 873,
+    rv_op_vwsll_vx = 874,
+    rv_op_vwsll_vi = 875,
 } rv_op;
 
 /* register names */
@@ -2008,6 +2049,47 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "fltq.q", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
     { "fleq.h", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
     { "fltq.h", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "vaesdf.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesdf.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesdm.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesdm.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesef.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesef.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesem.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaesem.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vaeskf1.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
+    { "vaeskf2.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
+    { "vaesz.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vandn.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
+    { "vandn.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
+    { "vbrev.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vbrev8.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vclmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
+    { "vclmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
+    { "vclmulh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
+    { "vclmulh.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
+    { "vclz.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vcpop.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vctz.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vghsh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
+    { "vgmul.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vrev8.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vrol.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
+    { "vrol.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
+    { "vror.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
+    { "vror.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
+    { "vror.vi", rv_codec_vror_vi, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
+    { "vsha2ch.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
+    { "vsha2cl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
+    { "vsha2ms.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
+    { "vsm3c.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
+    { "vsm3me.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
+    { "vsm4k.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
+    { "vsm4r.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vsm4r.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
+    { "vwsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
+    { "vwsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
+    { "vwsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -3176,6 +3258,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 0:
                 switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vadd_vv; break;
+                case 1: op = rv_op_vandn_vv; break;
                 case 2: op = rv_op_vsub_vv; break;
                 case 4: op = rv_op_vminu_vv; break;
                 case 5: op = rv_op_vmin_vv; break;
@@ -3198,6 +3281,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     }
                     break;
                 case 19: op = rv_op_vmsbc_vvm; break;
+                case 20: op = rv_op_vror_vv; break;
+                case 21: op = rv_op_vrol_vv; break;
                 case 23:
                     if (((inst >> 20) & 0b111111) == 32)
                         op = rv_op_vmv_v_v;
@@ -3226,6 +3311,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 47: op = rv_op_vnclip_wv; break;
                 case 48: op = rv_op_vwredsumu_vs; break;
                 case 49: op = rv_op_vwredsum_vs; break;
+                case 53: op = rv_op_vwsll_vv; break;
                 }
                 break;
             case 1:
@@ -3323,6 +3409,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 9: op = rv_op_vaadd_vv; break;
                 case 10: op = rv_op_vasubu_vv; break;
                 case 11: op = rv_op_vasub_vv; break;
+                case 12: op = rv_op_vclmul_vv; break;
+                case 13: op = rv_op_vclmulh_vv; break;
                 case 16:
                     switch ((inst >> 15) & 0b11111) {
                     case 0: if ((inst >> 25) & 1) op = rv_op_vmv_x_s; break;
@@ -3338,6 +3426,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 5: op = rv_op_vsext_vf4; break;
                     case 6: op = rv_op_vzext_vf2; break;
                     case 7: op = rv_op_vsext_vf2; break;
+                    case 8: op = rv_op_vbrev8_v; break;
+                    case 9: op = rv_op_vrev8_v; break;
+                    case 10: op = rv_op_vbrev_v; break;
+                    case 12: op = rv_op_vclz_v; break;
+                    case 13: op = rv_op_vctz_v; break;
+                    case 14: op = rv_op_vcpop_v; break;
                     }
                     break;
                 case 20:
@@ -3406,6 +3500,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     }
                     break;
                 case 17: op = rv_op_vmadc_vim; break;
+                case 20: case 21: op = rv_op_vror_vi; break;
                 case 23:
                     if (((inst >> 20) & 0b111111) == 32)
                         op = rv_op_vmv_v_i;
@@ -3437,11 +3532,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 45: op = rv_op_vnsra_wi; break;
                 case 46: op = rv_op_vnclipu_wi; break;
                 case 47: op = rv_op_vnclip_wi; break;
+                case 53: op = rv_op_vwsll_vi; break;
                 }
                 break;
             case 4:
                 switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vadd_vx; break;
+                case 1: op = rv_op_vandn_vx; break;
                 case 2: op = rv_op_vsub_vx; break;
                 case 3: op = rv_op_vrsub_vx; break;
                 case 4: op = rv_op_vminu_vx; break;
@@ -3466,6 +3563,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     }
                     break;
                 case 19: op = rv_op_vmsbc_vxm; break;
+                case 20: op = rv_op_vror_vx; break;
+                case 21: op = rv_op_vrol_vx; break;
                 case 23:
                     if (((inst >> 20) & 0b111111) == 32)
                         op = rv_op_vmv_v_x;
@@ -3494,6 +3593,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 45: op = rv_op_vnsra_wx; break;
                 case 46: op = rv_op_vnclipu_wx; break;
                 case 47: op = rv_op_vnclip_wx; break;
+                case 53: op = rv_op_vwsll_vx; break;
                 }
                 break;
             case 5:
@@ -3554,6 +3654,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 9: op = rv_op_vaadd_vx; break;
                 case 10: op = rv_op_vasubu_vx; break;
                 case 11: op = rv_op_vasub_vx; break;
+                case 12: op = rv_op_vclmul_vx; break;
+                case 13: op = rv_op_vclmulh_vx; break;
                 case 14: op = rv_op_vslide1up_vx; break;
                 case 15: op = rv_op_vslide1down_vx; break;
                 case 16:
@@ -3686,6 +3788,41 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 7: op = rv_op_csrrci; break;
             }
             break;
+        case 29:
+            if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
+                switch ((inst >> 26) & 0b111111) {
+                case 32: op = rv_op_vsm3me_vv; break;
+                case 33: op = rv_op_vsm4k_vi; break;
+                case 34: op = rv_op_vaeskf1_vi; break;
+                case 40:
+                    switch ((inst >> 15) & 0b11111) {
+                    case 0: op = rv_op_vaesdm_vv; break;
+                    case 1: op = rv_op_vaesdf_vv; break;
+                    case 2: op = rv_op_vaesem_vv; break;
+                    case 3: op = rv_op_vaesef_vv; break;
+                    case 16: op = rv_op_vsm4r_vv; break;
+                    case 17: op = rv_op_vgmul_vv; break;
+                    }
+                    break;
+                case 41:
+                    switch ((inst >> 15) & 0b11111) {
+                    case 0: op = rv_op_vaesdm_vs; break;
+                    case 1: op = rv_op_vaesdf_vs; break;
+                    case 2: op = rv_op_vaesem_vs; break;
+                    case 3: op = rv_op_vaesef_vs; break;
+                    case 7: op = rv_op_vaesz_vs; break;
+                    case 16: op = rv_op_vsm4r_vs; break;
+                    }
+                    break;
+                case 42: op = rv_op_vaeskf2_vi; break;
+                case 43: op = rv_op_vsm3c_vi; break;
+                case 44: op = rv_op_vghsh_vv; break;
+                case 45: op = rv_op_vsha2ms_vv; break;
+                case 46: op = rv_op_vsha2ch_vv; break;
+                case 47: op = rv_op_vsha2cl_vv; break;
+                }
+            }
+            break;
         case 30:
             switch (((inst >> 22) & 0b1111111000) |
                     ((inst >> 12) & 0b0000000111)) {
-- 
2.34.1


