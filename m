Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05C606B3BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=LdbGQFjg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtx-0005a4-03; Wed, 04 Nov 2026 14:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtu-0005OR-8g
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:02 -0500
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgts-0002er-Jx
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:02 -0500
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-36d6765756fso990859eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821439; x=1794426239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ohqauE+X1k2Aa1PJoa/sZh9BgjfoRi6y5dDmTqKezlc=;
 b=LdbGQFjgH+CTtuILE6b7/+lqkmoesff+4hDlF2usoo5usl5LV5XgFbdECq94IEmRb6
 jLxH/c37PpXX+CaP7YVFDjnUn5nUNx3pQNBTKKsqbek9KGxApYFpfzPTRO4JfxDuK+Yg
 yCIEXDvI1JnyBkJ7Qn9fETsBVBswAKCt3zx9E1R85HmcS6Z4nkWWq/LHzmjkU2Rs5yi7
 inmXUlg6I9luvX9OuJBOQLSphI/+SIa2oSy+qFIbMjQsLvDUQrwBar2nbIGSTv/y8I4h
 pU9SUY41GMPUsN0hz7v1lt0SXWQsJGkW8m25+TPImpCaPYuOgf/dAFmzI91pXD5OIMXv
 2dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821439; x=1794426239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ohqauE+X1k2Aa1PJoa/sZh9BgjfoRi6y5dDmTqKezlc=;
 b=ajZcDKd2bjVUWJF08TVjEklMNvMYaxIOngLF9Ww4t14kH4gimFcrizKN4r9RHS7JyB
 MbDZuZP8U3uGRfAFqE7xXXa+Y5GI6M1zGfaKYBMLyy4bjH4kPqPrGjipv5I4a0Q42HVo
 36eBzANPUQ1uMTr544euqoRdJlG7jnH6BK3mkM7zB8aqjcPz2bzRc9d4z4ciQFYKVdYI
 2lqtG1Yi5ZGOtXc5d7BmPiKrV8pH7y6VkIZ5/yGmS+1NAh5K4bdDb9g/DKe14jfalipN
 jWIV2ZQNJv2dyokxfeoVLIdKm33V8AP9swhqFzFvk2EDRzBhcZYC/g9GKDebChQEWPgo
 gbtQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZX5My3UbmCdA9Qx32aXivjYjl/9QIOLvpJSFdos5Byr7bINlg4+PUE0q1fBmzp4Zv4vBWourycgQp@nongnu.org
X-Gm-Message-State: APuU4Z896K3mxawACLmP+fTaOPxv5tOyH8U7zI1B9jMaTYDQOAQXxjD4
 H0OX2foUMnYdqynGdpGjxPzJuNShu3rxqQ6TKaLqHdgmOaoyPgasBgadZm/1CqdhP4M=
X-Gm-Gg: AYBFou05LoIW6gDXRm0unEglVmhYbaXjfeqo/B9nru1U9sAhbKh6lUgi5w2DYBYzGv3
 Hdc7JuCkFiDjqKXmkg16NFVXcsvQT0aYGYtZm+FgW8myLlv4ISlI95Qq7/dwiWwg5RPe/3Be/Hm
 3mmlS/N5gzzD1wMyNUjdH7fhsyRbcO7hw7hOR9EISOcHuQoUVvn8e78wDGNAZ2uoTmutGNgs45+
 YyTfJZkF9mF2bqx2VNwUcZmvHpPcJIJYhQQ2GvP563Km+nhqwPwnjl4HHyhxbuw42vX0lGpeWLb
 NK0kT7vXLPdwBIvigb1e5j+cdYSxtnaRlP7A37jtoCFtspFpL6Cg/nfaj5ykHljmz1ulM3+eqM0
 aAhhNqhtKgByxO1OEAMWRoMKBhCgFApV4SJRAkQ/F8OWW4yRaLLGU+jd6a3jYewa0A2jb76dMHS
 52/y4T8yrKh/fBP0cENoqycEvFNxJguPvl15XX8b0ud4SGVgqNmp9GM0oUOXfsx1NSWoA0HiC6b
 xHWvQGnyeac/VQASU25Qe5sjl4I84qWRGCxTt78Y0TZCh5PFIXMSjajBn205ZC8tJ0vhoiGCFjh
 RqH/sSlLAfdYb/Sqoita1b5jXKgIe1LkmTDisxihk6HYmcpyzcy24LkplpIFv/iq4a45FH6Okgj
 kyuENtWcYq0HZ0AY5tSqZK55+XdG2SocaYrC4FySppzR1dEQA3g==
X-Received: by 2002:a05:7300:d0a5:b0:36a:1b23:a1cd with SMTP id
 5a478bee46e88-36a4239359bmr23484086eec.9.1793821439045; 
 Wed, 04 Nov 2026 11:43:59 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:58 -0800 (PST)
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
Subject: [RFC PATCH 33/38] disas/riscv: Support Zvfqwbdota8f extension
Date: Thu,  5 Nov 2026 03:41:48 +0800
Message-ID: <20261104194155.679241-34-max.chou@sifive.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds support to disassemble Zvfqwbdota8f instructions.
- vfqwbdota.vv
- vfqwbdota.alt.vv

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv-op.c.inc | 3 +++
 disas/riscv.c        | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index b24ffb45d8e..58f6ddac35a 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -583,6 +583,9 @@ OP(vfnmsac_vf, "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
 OP(vfnmsac_vv, "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
 OP(vfnmsub_vf, "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
 OP(vfnmsub_vv, "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
+OP(vfqwbdota_alt_vv, "vfqwbdota.alt.vv", rv_codec_v_r_ci,
+   rv_fmt_vd_vs2_vs1_ci_vm)
+OP(vfqwbdota_vv, "vfqwbdota.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
 OP(vfqwdota_alt_vv, "vfqwdota.alt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vfqwdota_vv, "vfqwdota.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vfrdiv_vf, "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
diff --git a/disas/riscv.c b/disas/riscv.c
index af41c2204f5..a124cbb4bbe 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2648,6 +2648,8 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 38: return &op_vfqwdota_vv;
                 case 39: return &op_vfqwdota_alt_vv;
                 case 44: return &op_vfwbdota_vv;
+                case 46: return &op_vfqwbdota_vv;
+                case 47: return &op_vfqwbdota_alt_vv;
                 }
             }
             if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
-- 
2.56.0


