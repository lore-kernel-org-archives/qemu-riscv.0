Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268FD606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vrull.eu header.i=@vrull.eu header.a=rsa-sha256 header.s=google header.b=f6TfCMVE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZ6O-0006xY-Vt; Mon, 23 Nov 2026 13:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6N-0006wl-Ih
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:49:19 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6L-0004mO-AS
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:49:19 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c499b5be0f1so58187366b.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 10:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459754; cv=none;
 d=google.com; s=arc-20260327;
 b=R3AYoRtUHXwTEiRWv9L7p7sZYAmuuGASsNtCwXsG1kHkaoCtSATW0C77HnutOj48gc
 W5FmS/sy41/uvG3KNJsX7L79NEtMx08ydZCu+lazk+i3IgDW41EzJ+7dJTs+W5FByD6d
 xn2WDAu64PMNgOJdDtq3eXTMhCw3toEh2CNCCRSytEUSK2dYQ+NDqr+tNs2f50TO6qL7
 QOp0GyWJ06ttGK2xswtc5ZM+vDHwuFzRybQE38UIY/M7xHE2VHtdYmSoYBLaQQXOWOBF
 4veZFV1lGAbtvxvPgHjbz3XBTcit5zzuIAHmYLPwgQFbwHs7c8lOTxAjNvRbvnY6IPUe
 gRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=H3vKXMAflPu8ciMnikCd2ZlI0IVNDNTpnFzIttGhauo=;
 fh=7mWdsy/5XMvAkfsN5DClESuSM6oCD+Tf2uP0qtv024I=;
 b=maxgyC4/mi+b6P9r0EhHR3NFKJSA/0yWFm3TjWpAJsqomO7e4UwDu5WPo3Jm48/gDZ
 7tD3Y9OnPuV49Z6VmDcbA1Q+S8X3FHFoRiktrpvZZFaE2fYO7KjI+iX39gXBbVgFCWcr
 9gc0/V8t6+M7XvVeXfHZFHHV7PdEc6fs9b6TpOhyRI2AglYsizVGW7Y58bWeM3vlYj20
 t3rbcGnj8kSbqmDffTlrVCE4ST+vkA2myyJdcnB6140mFmrTp9BEAn9tDWBj0Qetj1R4
 /nVFPkh6Ik5bBNLIkls16aqw4uNVpBKbETbKj0FGbafbvY6edU2yhfVKHjJOMFNCZsh0
 CTbg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1795459754; x=1796064554; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=H3vKXMAflPu8ciMnikCd2ZlI0IVNDNTpnFzIttGhauo=;
 b=f6TfCMVEd70xHbhDQLkn0rOZaNEAmMaHCdQ9D26dRkpyouUAJahOEW5xx4F1tfpIHB
 RPQtLDYlbuW9mBkZuURQSsxYVUzC9krg+MNBGNfsktp9fK4AZ3fSgm5MwFhXk9XwglTn
 ckbNmCLkXsPb8kRdNybzWfdCxkTq9OtoxOFFxMcv0Rp2tr1NJk1NosTzsYSId/EdJM6A
 Gp2DC94ZCSz8aqh5i4jSkyTgWCeTBewcov4UhbbT0QxtqLUsiNzOL7QosCSsl0xRYZaj
 O0mKmby6Umuq4I+mpc82iSDPxvB8r2MzkBsnkAoWFbJrisLe2JXOfALG8CovyDN9c0UA
 sVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795459754; x=1796064554;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=H3vKXMAflPu8ciMnikCd2ZlI0IVNDNTpnFzIttGhauo=;
 b=1TpxENIHxC+B8lwwvR95ECw0pxxKy87fFKQ+dxESYxYa5mukjG5i3BkICjRoxUADV1
 vE4UAyod+M9Kxtvgy+Lte/7PqbMBiHcEXzBehni2xdkBNpj5wqmnDwC5djoCl/xiGMRr
 LQpDGpTF+VjG0+YjdWjZX+VfLAy4YPkAQGwZjpQB18QyCmtkQ0VdI06pWf2B82YN5DzJ
 HItPB0cvwqku3aoS9wKKyxTgrgW0Gx4VuqtA0Q1KEWaBu7w1TbfNileYPzB4DkDczjgI
 x12NjBHrVCanqxBz667qliuQRBfHbGxHUZ3vcojuRAttkEBKjtfb5NKP7nnzWEnECVxM
 qn4A==
X-Forwarded-Encrypted: i=1;
 AL+hErFVVr1BO8e5iJPNx3/m2eTAzGsqxMHJIq/QN6mlNkQvj3b+Yxjwl1vxVZgUlap0xwzBJ7MKfi+JVCpq@nongnu.org
X-Gm-Message-State: APuU4Z/04inZkuMs6ZqZqvoAje1GKGgKrN8ju0ixpC5RMADaIN1CChHs
 E9hBuXvpiaBUCiq1TTk/5FVJKSYJ0OUAlK1PEGDZ+MS2AIzMEszsuSqaduD3Nye5DF60qAujc5z
 jH9tntRujpS8h6A5BX6TgK9+lFcHtLOUJt3QdSij+2A==
X-Gm-Gg: AZFdTZf95Zw/f2z5xXL7Ru24XnPNSw1xA2isOdzThAbn3aunrVB3lVI3x8peIagjxKx
 227B5Ei5duVxBg6qc23immrQ83bVM9lzN1IqnG+8ACK3hIVH2fc7OxKZA7QAoeb55mc3L7O1hJh
 tDBDobVRPnM9HpEjXA90085JU8urlByQCUqYBobcpG1FZ3C9zQmvqKoyE4nTU3SEqEEYdMXpcYI
 tvgqcfa8IIUiFHL0jA5A5VMFIANow44q782m8Nxvy2kPyWk3SjSCUJa/OVx0eklOUVTS/bZb9G8
 /y/myJelruzoNT/JDELg3Q04NXkBPsZuMuW+rMoIk+Av8z0f6nlXVbbRuELumq6pNaQkJX1b4/J
 C1Jhj6K4Y7wzGJ68aHWvkWY9uozALFwu5d/9rMp5JM4g5pF1lC2w5L1q1F8qOqlCeDwFN3J+FDK
 meJLvtWGUmR0bapQ==
X-Received: by 2002:a17:906:3513:b0:c51:3808:8026 with SMTP id
 a640c23a62f3a-c513a53d964mr927634466b.3.1795459754529; Mon, 23 Nov 2026
 10:49:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
In-Reply-To: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Nov 2026 19:49:03 +0100
X-Gm-Features: Aa3M54peIETSo0bMXfkCi6XNmUlOo53xehP8su23dIJ5r_mdLYEY8fi00bWZBwc
Message-ID: <CAAeLtUAfoRHoesNXTaVCtXxqhdhcwgi8KmT=x32e=eC9uonTjA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] RISC-V: Experimental fetch support for 48-bit and
 64-bit instructions
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x62d.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:04, TANG Tiancheng <lyndra@linux.alibaba.com> wrote:
>
> QEMU's RISC-V TCG implementation currently supports only 16-bit
> compressed instructions and 32-bit instructions. This series adds
> experimental support for fetching 48-bit and 64-bit instructions and
> for halfword alignment, following Zl draft 65c377a [1].
>
> This work is motivated in part by an AME proposal that encodes operand
> datatypes in instructions and is still under evaluation [3]. Larger
> immediates and longer-range direct calls are other uses under discussion
> [1,2]. This series provides instruction-fetch, alignment and trap-reporting
> support for long instructions, without implementing individual instruction
> semantics.
>
> The x-zl CPU property is disabled by default and supported only under
> TCG. When enabled, the translator and built-in disassembler share the
> length rules, and halfword alignment does not require C/Zca. Compressed
> decoding remains disabled if C/Zca are disabled. Complete 48/64-bit
> encodings still raise illegal-instruction exceptions, and the
> disassembler prints "unknown".
>
> For an undefined length, fetching stops after the third 16-bit parcel
> and no instruction bits are reported. This avoids additional fetches
> solely for trap reporting. Feedback on this choice would be useful.

QEMU advertises Sstvala/Shvstvala on every CPU at priv >= 1.12 (they
show up in riscv,isa), and Sstvala requires stval to hold the faulting
instruction for illegal-instruction exceptions.  For an encoding
longer than ILEN that is the first ILEN (64) bits, so parcel D must be
fetched. Details on 6/8.

> Patch 1 fixes incomplete instruction reads in the disassembler and can
> be taken independently of Zl support.

Given that 1/8 is a standalone fix, it could go in now.  Just submit
it as a separate fix.

> The code was built for RV32/RV64 user and system emulation. RV32/RV64
> bare-metal tests check RAM-boundary fetches and trap values, halfword
> jumps and returns, and rejection of compressed instructions with C/Zca
> disabled. The Zl tests and existing MEPC regression passed with Capstone
> enabled and disabled.
>
> [1] https://github.com/riscv/riscv-long-instruction/blob/65c377a665feb29a4848384ad566a9873c5fd423/src/unpriv/zl.adoc
> [2] https://github.com/riscv/riscv-isa-manual/pull/3269#issuecomment-5328426143
> [3] https://riscv.atlassian.net/wiki/spaces/AMEX/pages/2445836308/2026-11-09+AME+Meeting+Notes

This link is not publicly accessible; please drop it or point to a
public document.



>
> ---
> TANG Tiancheng (8):
>       disas/riscv: Reject incomplete instruction reads
>       target/riscv: Share instruction length helper
>       target/riscv: Prepare Zl instruction alignment
>       disas/riscv: Decode Zl instruction lengths
>       target/riscv: Limit instruction bits to the trap CSR width
>       target/riscv: Fetch 48-bit and 64-bit instructions
>       target/riscv: Enable experimental Zl fetch support
>       tests/tcg/riscv: Check Zl fetching and halfword alignment
>
>  disas/riscv.c                               |  49 ++++++---
>  disas/riscv.h                               |   4 +-
>  target/riscv/cpu.c                          |   6 +
>  target/riscv/cpu.h                          |  10 +-
>  target/riscv/cpu_cfg_fields.h.inc           |   1 +
>  target/riscv/insn_length.h                  |  29 +++++
>  target/riscv/internals.h                    |  17 +--
>  target/riscv/tcg/cpu_helper.c               |   7 +-
>  target/riscv/tcg/csr.c                      |   7 +-
>  target/riscv/tcg/insn_trans/trans_rvi.c.inc |   8 +-
>  target/riscv/tcg/op_helper.c                |  10 +-
>  target/riscv/tcg/translate.c                | 101 ++++++++++++-----
>  tests/tcg/riscv/zl/zl.S                     | 165 ++++++++++++++++++++++++++++
>  tests/tcg/riscv32/system/meson.build        |   9 ++
>  tests/tcg/riscv64/system/meson.build        |   9 ++
>  15 files changed, 359 insertions(+), 73 deletions(-)
> ---
> base-commit: f29ccc287a6cfdd51d3a4fd17fbe9af3310a0ac5
> change-id: 20261117-zl-master-8ebcaae0953f
>
> Best regards,
> --
> TANG Tiancheng <lyndra@linux.alibaba.com>
>
>

