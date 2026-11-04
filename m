Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689A60CCF71
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=f5iDXnGl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtL-0003H4-PT; Wed, 04 Nov 2026 14:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsv-0002Xz-Jx
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:03 -0500
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgst-0002SX-Vg
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:01 -0500
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-33fb4680717so1920078eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821378; x=1794426178; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cwvRn9AQqLZTwdydkldOoO+I3sh0PMkOoD8zxlRNQ0I=;
 b=f5iDXnGlZDMV6QC4/XeCP8z/m/2kbB3wQ6MkIPpcS5pbkMfvRnto9VActRN5+gJ5Um
 UijUFDfGQ8yuIamE7UPWIzV3Hgb1faRy1PwZp+knkbIRIi8TD4jW61F3/x3f6pMXRLwG
 FofIuaQO9BzQyIIv361uLnSHg7U4WHH8Ki9S2iaLF5t8OjGyt1l/GLuHCtk3k72ynobF
 Oyp1ErUOxNk3QH8n8SuBFwDAJKWq/zlkRwDtgvnJvPKQwiUqY4W3YLQSDP6DkqgDq590
 ZzqqzJU6qkNcFxLVRpwD9+76y+0nwT9MUrEQ0rLneN7AdQvv0ZjBEDviZIpN9C0wrfmr
 jYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821378; x=1794426178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cwvRn9AQqLZTwdydkldOoO+I3sh0PMkOoD8zxlRNQ0I=;
 b=V93G2+jzc7NQFTmITi3+8uo0DwH99bHY4oL7SnHUScxq1XQFHPSLdx+xU65EYJRqBT
 hiQCLdzJy0moVEAR6m49sAWDDq475N5SPTfNAkO4Bkb14adUtvVdkM+onRxab65neXvk
 LCiAVL1OUdDfzOVnxi5sVpc7kBtiGYm+v5otVNpI6oSeagixCGqccodCHJQ/Jqhqo1h4
 yvTRndjrnNZUIbp/yq5j/3P3rZVnsS7Fyffjnvpv7wTrO2bXuUROkN/c2AnklfupQU53
 ZQ6Qch8aVww3lI5TW8JMxPZIYFQLkPhwnqboZr7a8Dg2LPf17tNtPHj5H09kujm/tt0X
 qvgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+r7f/M8jLV2stYQ/BPDjDodmVZu0tcE1WsNvk2oJxpOD8sJ3ZhIbLkgnvDNAXWZBwYRaA8KxAYIDE@nongnu.org
X-Gm-Message-State: APuU4Z/vlkv8XDDK8vZgY7T46guKbhkL7jLJqXfnY5FNUjl0ut3+YQqI
 nfxmpbdXnJsrD/K9t3R1PyrbaZZZChaazQYVEXT6mnoGlATvZ5cvBJvpoxYBcrUPlr0=
X-Gm-Gg: AYBFou2C3WR1Cy6qxgTpFzbGjX2L9caITNdgLiW55TfJ8Lgfu/o6oZQly6i/19gARK+
 h+d/GUmVOfJ75riy3m8DxgrYIfDMlMKTgnv2qsea/pv75yE3ELrSSMYLPdO91g5KsNeYGJv99VR
 mKFDKYzMiiaddL0yPL0l3PPwOCmKADWxiqWBTKdiYjYvJydDQXQELhUY2sMOHDvIxTKfx4C2PcM
 Hd96nA/zw6qlq2ntl2ikJ62duzQcCqD6sM6JOqNX2lHv5ySYmf+26qsg3a9JJBwxKlqLdKks8Ga
 rXdGbwt1s9grG0z9t8rDCkRAGXUUV1itWLuHZvsaaDGR/O/3kODLnaJrxKwLMHtl9sJwpStIxwP
 LI/O2A6Zf/rxdLx7vQlfR0AZjUTW+NYDucyePXQJBqe437IeioVKtLw1YR2sfDv/KSQyOA18plN
 Lkcm/fLCcpzVBmrOGDWKsFB2Yuhs1jqV2coinIqskWs4hJoeDTVbiOxBE9SpQPC191sjE1KjGTp
 MdZiAXndUzgPamCSV4SN2Bs15pSj1xjY6+nBJn/DAVsNNxtOlSa94hsx7JRnuuu8Ty+TdBS+4gy
 IlIC5rV9eKIbaa6krKbWgpO8aubxONLvz3zB5SKHd+kzikA54tkvMCuA6pzDlmehrRqCgOMu0cO
 SFSdralaI4iZEQhdDxIi0spaBS/he
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id
 5a478bee46e88-36a422084d2mr25971797eec.1.1793821378294; 
 Wed, 04 Nov 2026 11:42:58 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:58 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 14/38] disas/riscv: Support Zvfwdota16bf extension
Date: Thu,  5 Nov 2026 03:41:29 +0800
Message-ID: <20261104194155.679241-15-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132c;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add disassembler support for the vfwdota.vv instruction from the
Zvfwdota16bf extension.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv-op.c.inc | 1 +
 disas/riscv.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index ec767ccbf8b..aeb9423f130 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -614,6 +614,7 @@ OP(vfwcvt_rtz_xu_f_v, "vfwcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfwcvt_x_f_v, "vfwcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfwcvt_xu_f_v, "vfwcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfwcvtbf16_f_f_v, "vfwcvtbf16.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
+OP(vfwdota_vv, "vfwdota.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vfwmacc_vf, "vfwmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
 OP(vfwmacc_vv, "vfwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
 OP(vfwmaccbf16_vf, "vfwmaccbf16.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
diff --git a/disas/riscv.c b/disas/riscv.c
index 2acded0c915..62feb4c653e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2640,6 +2640,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 39: return &op_vqwdotas_vv;
                 }
             }
+            if (((inst >> 12) & 0b111) == 1 &&
+                ((inst >> 26) & 0b111111) == 36) {
+                return &op_vfwdota_vv;
+            }
             if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
                 switch ((inst >> 26) & 0b111111) {
                 case 32: return &op_vsm3me_vv;
-- 
2.56.0


