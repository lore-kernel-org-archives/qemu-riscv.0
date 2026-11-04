Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B2606D83F
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NuFOuFiA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgst-0002V9-55; Wed, 04 Nov 2026 14:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsc-0002Hf-LX
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:45 -0500
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsZ-0002LU-Ff
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:41 -0500
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-36d6765756fso989201eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821358; x=1794426158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jJ0xIOcIwfU1eBAuLqk68fHdggoXZy15gka4tDDukY0=;
 b=NuFOuFiADn21O/uVMDO5M13vo9GIw7UXHpGjA6VgdCT9fNAnxZyxPLwshMjaXAyt3q
 fbQsi4LZk9v6GYzZlH3gL6+nWNpoCfxOvNyuA9O/yOyOIbyCdK7HARAyOE9Vntbyw6RP
 2m+m3J53w8CBJ3Zx1xZ+QpNs7Mntw1QIU4sswG5CXjgQ3tElb/z9+9kYuiEHUI37j9pe
 I0z6dbklYwPWPBJjGvYjeOgtJ0LbUTnnVoYgApSlG/8MBMQpzD35ZL8ec5PKdcn58y1O
 r8P7VRaiQ/fqbbLXNhuUPw+ocWQu8ONrGMgZYB5MT1xpKArpjL9KuxiLRhKxYK6OyT2g
 v9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821358; x=1794426158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jJ0xIOcIwfU1eBAuLqk68fHdggoXZy15gka4tDDukY0=;
 b=1IQsbktFDeoBmoa5v5SZjxPP3C4xSuLuasMXuf6ksjkt82GMkZDNn6ecCIRjFyxDAR
 ovhhGHO/Cd3e+LgNl4SthE5o9tmLbcCeUbQsATneXOl19x+KBh6A4Q69X0NLwW+RNjrV
 HU4LR8E0E/huPlcoAj9+Dmr2n13vPkgEI12Qu+MaOz+BVJamqtrr5/55LoOtMJsUJHLD
 2jWd6yojK3hHeDmW9lkphQOnPaE57ZkT51W8omOwugkudqcW8pUHbSzkIeneIuSas58v
 s4WJUsRKnGpmzKvThaDiOYz7ohxJRxZGazxrj86F/8u9ehnSqh2E7gqP1Ijgs51iHUnr
 iXow==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrViOR4wUvSQM9oamM4zBdPeTB/Y0UsVV3Z2rxdQ2WtdgVA62mds/SSJdnLHlCPj+75VtdoWKE443p@nongnu.org
X-Gm-Message-State: APuU4Z+S+tgfs/WgledlyeUHw9n4ve9kUyw3AgK+uR6EsliK3L+hTP9Q
 1jMXYI7EA1RDcHgers0zGQpdytpiF9mYLSSYFiSznHVIduCjFdGYacDLSfG7FhSgBO8=
X-Gm-Gg: AYBFou2ZJxk1symGPTz7VFph2IZK3JtAXOkuJNTzcBlQu0Ck/ZjSsrPcs4vShTdmt2e
 A1RfOnNeJGLOpNdK9VNakf4gMdc5gp7Ma6KW4ilxYiDZEEkcwsKG2yvNJV6G99nIwEG2QiMk5hE
 bowGYFJ/AqG37X6A3LShJKUuQnpn0xb8NKkfHGmc3evywSu4l/zWD8j7DDzyHm7dOTaff7MWgOP
 hI4HWKV3JT8T6tGxqMroN8RWHErgX28G/h/yAqMOVrN3XfloE5sfxVVkeR/5YtmC1pgDbx/iqfA
 y2KSZxw/nlMuK5kqpFTrfj202Dz55jfyBsiMeS8gVFm5gWXItb/h+pupOwNtpnAuuYnsi0/k4xE
 FojriaKjEA2zcIy5WU3AwJ92yze2Wp6SFCNPSjV/FvjVYWdF+jSo2+t3zpZU6pKEX6vg/x0s6s/
 hbYQQAjOH5dKV3abmeanX9iqvMHIDbaVwx72K+LF3w9GmjyT3GCwybLndRHhqYzLT61Rj9NepQE
 UKMqSqDU5xCd1s3NjlkfvWBWy94j5tdbuuJKNOTNNlua3wZ5Zd9kX3AjUChgl6njG/c6sm6YT9X
 uHOgfdia44OzucY/5EVL/WaRcPPYRz2h3+t95jZXlc6rqnkjzahc6h+8XzEJ5LCVYdu+fv64jil
 wzBDG1+wD9ErUmTe+a83qTHSuB1C7
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id
 5a478bee46e88-36a423f54a1mr24401899eec.19.1793821357983; 
 Wed, 04 Nov 2026 11:42:37 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:37 -0800 (PST)
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
Subject: [RFC PATCH 07/38] disas/riscv: Support Zvqwdota8i extension
Date: Thu,  5 Nov 2026 03:41:22 +0800
Message-ID: <20261104194155.679241-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132a.google.com
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

Adds support of Zvqwdota8i extensions:
- vqwdotau.vv
- vqwdotas.vv

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv-op.c.inc | 2 ++
 disas/riscv.c        | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index 425473ee61b..ec767ccbf8b 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -770,6 +770,8 @@ OP(vnsrl_wx, "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
 OP(vor_vi, "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm)
 OP(vor_vv, "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vor_vx, "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
+OP(vqwdotas_vv, "vqwdotas.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
+OP(vqwdotau_vv, "vqwdotau.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vredand_vs, "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vredmax_vs, "vredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vredmaxu_vs, "vredmaxu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
diff --git a/disas/riscv.c b/disas/riscv.c
index ca0d6e90b37..2acded0c915 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2634,6 +2634,12 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 29:
+            if (((inst >> 12) & 0b111) == 0) {
+                switch ((inst >> 26) & 0b111111) {
+                case 38: return &op_vqwdotau_vv;
+                case 39: return &op_vqwdotas_vv;
+                }
+            }
             if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
                 switch ((inst >> 26) & 0b111111) {
                 case 32: return &op_vsm3me_vv;
-- 
2.56.0


