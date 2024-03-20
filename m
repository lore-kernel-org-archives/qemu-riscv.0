Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01525C54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 07:28:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmqMC-0006Bc-LP; Wed, 20 Mar 2024 03:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rmqMB-00069Z-2a
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:27:27 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rmqM9-0003gG-Gf
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:27:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e6b5432439so6073245b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 00:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1710919644; x=1711524444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOaigCZs+BnuWhUv4wDibuU2PGEb2drtLYE0whFxmy4=;
 b=QejeSH5xKWtLJAhqwxSd9Q+8TjVfdfDmBjs1S2OKJwj+9FIoSskJ/UuqGai5Ue0W9B
 KR3XDpnUbcjKGJbRUzWtU0WSXIkAV8LW4MN1h/TyluEPsLuOwgx+HIjl9JEQ4O02zST2
 PqkkQ9Rfb/X0frJujZcXmFDnrBcU/c6YfKHeYjh3yQ2vD8WBZNcwlwj3WZNdftTyJFLY
 SsjPP0g1xtwYIp5AouXNxlzWWRxi8/+43NE6JYitZgytH09V2P7CRx4rSduUTsVdM5aS
 /1cIQwMdRPZbsh+jrQiCH4wmkrMb3/IAKFBBoOEpkzYybtCw915Nxg3jFZSM1/55oXnu
 MHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710919644; x=1711524444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOaigCZs+BnuWhUv4wDibuU2PGEb2drtLYE0whFxmy4=;
 b=orHqz2UyXDfQeS/w+mQUmGq3uYWA4sSRWfwFCzSRzZJu60232XbNDe/6QgC7K5ep32
 SD+UXKRPd2KTP9q/sdwwpCQYNjbsf15DzFLbJW4Ly3NpT3S6MED07Ar9/WA8IiNP3N5S
 dQXpJzDHBwibobwHAfLDSuSbSHr2b9+wIgFaPHL8RvrcTaPfzehw9WWtxu0nEVjkL/dB
 hH5YO7ktD/j5XcQJjvd1VxLMYQ3UgMAiYbCTXly+wylgtU/ix9b+txV7+oisMTcOO8Kb
 OcbpKMd1Il1YQuq/9Qh2289nUjD3Ul4V9k0WqW8F5Pc35pryCrF4p+HR4K8FOODpEi2J
 /uJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY3RvVkcTgmDMVX3OYV7yu7PZW//6hFC87WMTc0FTdZxOyl3gwkTsScnU1Nmx19q97S6sxqnSxF8U5xjzT+29IJEA4AXg=
X-Gm-Message-State: AOJu0YyoJ0nebstbQYtDvlNdDO69YRXAO0pARkz7HmUIgm3z5gU88iDo
 +0n8sB31PEI96a8exX+Dbm9d5a5HsxaXPTsA1S4rGQNpoj0yOjBhTa/cdEUTO7Q=
X-Google-Smtp-Source: AGHT+IHBNdXqFDMQnnF0XTcwB8TlA80BiQWdbrYGg9WH5g36TNXw4R3rKHVWmaOk+mHNv+ktXykx1w==
X-Received: by 2002:a05:6a00:1805:b0:6e6:830:cd13 with SMTP id
 y5-20020a056a00180500b006e60830cd13mr20201631pfa.23.1710919644204; 
 Wed, 20 Mar 2024 00:27:24 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 p10-20020a056a000a0a00b006e6b45debe8sm10811376pfh.78.2024.03.20.00.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 00:27:23 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/riscv: rvv: Check single width operator for vector fp
 widen instructions
Date: Wed, 20 Mar 2024 15:25:03 +0800
Message-Id: <20240320072709.1043227-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320072709.1043227-1-max.chou@sifive.com>
References: <20240320072709.1043227-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42b.google.com
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

The require_scale_rvf function only checks the double width operator for
the vector floating point widen instructions, so most of the widen
checking functions need to add require_rvf for single width operator.

The vfwcvt.f.x.v and vfwcvt.f.xu.v instructions convert single width
integer to double width float, so the opfxv_widen_check function doesn’t
need require_rvf for the single width operator(integer).

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ef568e263d..6cb9bc9fde 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2331,6 +2331,7 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
@@ -2370,6 +2371,7 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
@@ -2402,6 +2404,7 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
@@ -2441,6 +2444,7 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
@@ -2941,6 +2945,7 @@ GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_widen_check(s, a) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8);
 }
-- 
2.31.1


