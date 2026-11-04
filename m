Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7D6070323
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FGrRUMUF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOguA-0006TW-Te; Wed, 04 Nov 2026 14:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgu6-0006IM-Sv
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:15 -0500
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgu4-0002ha-BT
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:14 -0500
Received: by mail-dy1-x1336.google.com with SMTP id
 5a478bee46e88-3535a54bed9so1457217eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821451; x=1794426251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SNutt+qYtfpwfxPL8boOG9dw1u9CAIyu7M5FLo74O0o=;
 b=FGrRUMUFWa1OGyt7LVGAXWzF3vvCJRCIi6qPAL2iVoJEvW7VjCT+NxYkZMBuMToMTH
 aaBoRiWZ2MJJjFva6j4U67bzHTiQPSFjyezcR6cBbjJIJPV1F6wW9zp0ScZF35MFVQGI
 fgKyFjmPIvo/HvADzOGraZTzTwm4Wmr4v9Q57qShOFowi+sm0mUJM3RbkrJ3s9WjUhb2
 uJzoZn0nRrbi8qzhJ/TAgYEaf1rMa19xXcfHZ5jKKFWCLfdpT+hv+9AjxyWbbG86i8EG
 aRpnHAejUDqDjnYe6Z3XtBfHZaF1UJ4MdQQ9ODNQyvnDsR43p2E10JF4d0x1iCp2xCLz
 Q8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821451; x=1794426251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SNutt+qYtfpwfxPL8boOG9dw1u9CAIyu7M5FLo74O0o=;
 b=dVT39nMN5v+tYm2HxLuZ9lwGoVdGJKorq9wQyJzH+q1zMCJVgtvZ2nVaalCErPPtY6
 vCpE4WHU4gzfm6fX8L1la3qhEO4JyaEuzRCVHyW5zc/pPyDn73DsMLewsBHBbrFMME+l
 5KisinbCOliRvKIFRvsWNSsDlPSpFH4MQxOzGDVB9XY0Zqfp3Xft5BUFmw4GjjwCLnpL
 h/nL6I//KfSZnkEEftmH5ih9WOmmZGHsgzG7Pif1DgGtB7c4s3v+m1vCKoA2B5ypUpy/
 cO6egb5wBFbUMwCOotBaqmsctHIEaDUkUxwMuNqznIDbKhogE0n1cU9MVXe3EFf8gxGV
 d70w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzgvUKnZRj4q0d9LTo+UNkSU3uRX2liB6+oCsVp1nsDvyWrs/SYAex9AKqwTpb0YH3BkGJey/cJHFLP@nongnu.org
X-Gm-Message-State: APuU4Z+bxn24N5pWU7Z/fLqaGJaDY3ZiXQIGO65IuCblnJQszgHvz1Qp
 6Zi+7HaSlx9Y47Od95KPaqHDIrcs8Gx8wjqKdaPD31nhn1SIU8Lt8BDYyJJR/QK4dJI=
X-Gm-Gg: AYBFou2phBCEX9h4Ig9aR+nqR26UqtIpBw942DGbDiWEmTTZkTT4xq1woAoXmBXXt8j
 LoRDwnvZ6H/VghHrQP1RP8YeRLY9eUY36akfV7o7DglI7ICoOUYNwLHGC365j27msQSaCuBKfT1
 c55dEyycHm5MDsbqwuhNUeOGNLt1bR2yAufGUNJKoZUcvKXmZJtSEhvE7p/eDllqtfVq/Ai1aKC
 eAE4AK0G899VNBmggoTxbteRMRTs7I3WAUfN5eXbByTK4Llil4KUvUDc3n/jVmstytt0Ax1QPsG
 8e6hzA0gOtA+hTEf/EtkCBSg0t5IV+WM7eSPcwP5AG/g7JwtCHubqATVL/YCIDPSxF2U6LTbCXk
 uDSyGZ+iFTbOg5tem0Zb/U5rsvRl792kxfEiBRwsWzj0oYVcg93KDrYgp5VJuqO3d6Q6vqDbm+J
 ABcqE3ylVbFFSapuFKrU+o7iTOzmgJTgpCj3Fdch3wnqtiKpoYYQpwI7UoBAOR29tLBe3fzwLAD
 jmfebyhHzMp7pdRv4YpD8hY1TGrHLKt6t4LKupDl9z8LAzaT6taLjRnzRjHQgWvAuN+HHCJA9bG
 OAJY7rQoE6AJ5zP0RHls6PStJMBhUkCAG+a+OEQa4TodlEkcUZv8yagKKiu0/FVrCoxMwnHo9A+
 dcL+qrKdviaS4TTGLtWt2voalbDdz
X-Received: by 2002:a05:7300:fe41:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a42401999mr24584054eec.6.1793821450714; 
 Wed, 04 Nov 2026 11:44:10 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:44:10 -0800 (PST)
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
Subject: [RFC PATCH 37/38] disas/riscv: Support Zvfbdota32f extension
Date: Thu,  5 Nov 2026 03:41:52 +0800
Message-ID: <20261104194155.679241-38-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1336;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds support to disassemble Zvfbdota32f instructions.
- vfbdota.vv

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv-op.c.inc | 1 +
 disas/riscv.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index 58f6ddac35a..779fc26a27c 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -538,6 +538,7 @@ OP(vdivu_vv, "vdivu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vdivu_vx, "vdivu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
 OP(vfadd_vf, "vfadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
 OP(vfadd_vv, "vfadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
+OP(vfbdota_vv, "vfbdota.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
 OP(vfclass_v, "vfclass.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfcvt_f_x_v, "vfcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfcvt_f_xu_v, "vfcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
diff --git a/disas/riscv.c b/disas/riscv.c
index a124cbb4bbe..8330ba34a30 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2647,6 +2647,7 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 36: return &op_vfwdota_vv;
                 case 38: return &op_vfqwdota_vv;
                 case 39: return &op_vfqwdota_alt_vv;
+                case 43: return &op_vfbdota_vv;
                 case 44: return &op_vfwbdota_vv;
                 case 46: return &op_vfqwbdota_vv;
                 case 47: return &op_vfqwbdota_alt_vv;
-- 
2.56.0


