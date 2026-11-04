Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A5608ED5E
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=nhFWejhP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtl-0004c3-6i; Wed, 04 Nov 2026 14:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgth-0004Jb-Vx
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:50 -0500
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtg-0002d3-An
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:49 -0500
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-3282db206d3so2090954eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821427; x=1794426227; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XxWi9YB98aQL9BBN0D43RwVI8CRHP+26kZ+FN4VV2Bo=;
 b=nhFWejhPOwkNIZi1x2r7Lkq6G0yNQlOzfBJBDk5ErYr587FFwm83hVXNkCL+3rl9nj
 h5rw1bmp0SJtUWH3J4XK4WQ9DUOY+KKBJ8Z06Yo8Eqmfwfxkpm5a+s2cTW4ys6fXABeQ
 EsS77YXJplTK3HjC5djiuHmdtKBl9p0EMvprbwp2x+S8jsldyjPsy1J4EaM6A4TJB40n
 sAO40xpFGYutgUN+xEQpyVR3rwHvLS2m6/tMlLL+CRR4pHrj+W69VIDLnT9IsDvnezwv
 ZMxJ1P9Bu6J8q8OwmCTjN/k6LeO3NlMrIl1kvUbAGITuPjNXnfWDacIvN3B/kLc+VUkx
 ZQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821427; x=1794426227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XxWi9YB98aQL9BBN0D43RwVI8CRHP+26kZ+FN4VV2Bo=;
 b=Oy8e0PX18dGGfdlxIu1P5tFs9kWi5uMJoS8NH2rTulF2cSjFoipEqHfI98DcVrRAsq
 1ChMgFAKFXO95hSfcROGr+myeIvLD2RevdDGESqRm4hLQTn7XmDWW32mCTMDxTPddtmi
 RkZa3oYiDPpKKYADPi4szmqRVD0nLOynyH50GTocyFiMDhPYmfeZbDerD68iw06rjgVy
 iIwCLsxW7PR7kYcpFdtI2mz4nP2Qg0OMDiehQUrGGkq3TENnbUqqEPORbbEHhrM+MV4U
 oiRFdCq5h07Z2DjXr7DQHv+wtEqJK6FFWMo4CnJjtwfpKsyJ+Tu7yZUYu4GbHzD46Noq
 gdrQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRlmlavJ45h7L6uEdvPe3NPO99PORl7lfPFt2hC8bjsWvGH8+DkSjP+oRBtppYlncknZoL0rYogr/+@nongnu.org
X-Gm-Message-State: APuU4Z99uyauZTvuvZytPZVJNAbykfQN4l7Q11dovq6MPAnWSdmTiXLd
 kUCVCVUY09QfuPZHsRyNCbXARmhWromff1Y56yj/HP8PQRetc2cslESpYoqabe+7LZ4=
X-Gm-Gg: AYBFou0zTkvqhMtljuXKtJNqFymhfv+bEwVxEqx8cenrK3zE8h1Kyr7We8F4K7kRk3e
 Vn++nE/9UH5HCLTkJqJKk/UiamvpVc3CBGF2UBXMWF+b+98Yp4CX7rQG0UcD4UANMWJ5WQ9ZO6/
 I/PUh4WIyq2ZhsYtsonCBN1LJW4c2AzQB2llZEpmFqkz/xb31HXzA7aRFmKPSyn8GHedSBRulv1
 wqrj8yxfn8P731cfsO0MC9nAjnfsU+SpBf8CqfYUIiFGm0y/ny8AzZIAbBC+/xEAG7PThGO66BI
 8c7BvD2xapGHjYKuVoYRMD1ONoAn53z+8HJC7RSTwGPaRtk+IKqKSGBHN7IHYCJ8jF0IHdnyN+P
 foPyM5vcgCiZ/eLVDyUx6OzxbyyJNSr1MzMHhM7LAL+GdLwywFzjhdRuabpXbEnE5y3dxB2EIV/
 7zfSQS36DATGfzhNgxxbhBoSpxQK0DHmJ3bn3u+c1TOS+3sT/1Pelnt7nol+wCcMS4PSShl4mGM
 PJVJjAlzEWXFC8d23eYo9E5qsVzTCuKv6N03yNXi3Q99V4crZylWBsqysM+dHLXaN1tR8VYh2a6
 10uDw1C3kQsQIFamJU4421XZ9qX3F2ShBzSh08QTougss7rpMYhFwHsELiL695nJKfl/bK21usW
 Ei5e16FfjAcdol6Y15QIYPTB584fSTcedyU3ffLTGEPRUOFQfqw==
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id
 5a478bee46e88-36a423408a1mr25257155eec.8.1793821426759; 
 Wed, 04 Nov 2026 11:43:46 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:46 -0800 (PST)
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
Subject: [RFC PATCH 29/38] disas/riscv: Support Zvfwbdota16bf extension
Date: Thu,  5 Nov 2026 03:41:44 +0800
Message-ID: <20261104194155.679241-30-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132f.google.com
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

Adds support to disassemble Zvfwbdota16bf instructions.
- vfwbdota.vv

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv-op.c.inc | 1 +
 disas/riscv.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index bb01ebb8a6c..b24ffb45d8e 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -608,6 +608,7 @@ OP(vfwadd_vf, "vfwadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
 OP(vfwadd_vv, "vfwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vfwadd_wf, "vfwadd.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
 OP(vfwadd_wv, "vfwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
+OP(vfwbdota_vv, "vfwbdota.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
 OP(vfwcvt_f_f_v, "vfwcvt.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfwcvt_f_x_v, "vfwcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
 OP(vfwcvt_f_xu_v, "vfwcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
diff --git a/disas/riscv.c b/disas/riscv.c
index 0534b8f4d64..af41c2204f5 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2647,6 +2647,7 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 36: return &op_vfwdota_vv;
                 case 38: return &op_vfqwdota_vv;
                 case 39: return &op_vfqwdota_alt_vv;
+                case 44: return &op_vfwbdota_vv;
                 }
             }
             if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
-- 
2.56.0


