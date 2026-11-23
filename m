Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B25606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.a=rsa-sha256 header.s=google header.b=A6uSgjvl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZ6X-0006zu-JU; Mon, 23 Nov 2026 13:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6V-0006z4-Du
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:49:27 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6S-0005Vl-Kq
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:49:27 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6bab1084463so251214a12.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 10:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459763; cv=none;
 d=google.com; s=arc-20260327;
 b=rkPDtgPEi2/59BI3Vs/UHy2OqpBt4KYTRUGm4TzjEpU6EnyT6XJzV9GTgdklWM2RWj
 XJT+C27Sb3fCCsnaIxsrdPWGFZZEY/uDNKPeHIgQaj+hwjisFgGHYSnyFXSnYGagk1qA
 6APS9bZ7QPeYqy3uvJOYHrslnL0gGSpg4XC9L9aK5UTP8w832cODXtEDgeLW2phWLLDZ
 QDjHlfp0sd0jVnfcdmOYj9OjwgOdLnUPBjkyBM5dowA84wQ8RC6a85S1QeDBue9HaCEd
 Ap2KScwOs99mXQiiLjJLC/HG5Sy9pC6DNHJm+M0i9oQnV+4qo08EW1dhnRxHG+Rx+jly
 kN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tJm/yeW80cQWpl+rJ31NlK8xX8dbaBfxOxkZ+dUOvEQ=;
 fh=64jQT1di6+XOWA0V8XloYKBFKR9p4XpHYt86TVuXZTU=;
 b=D0nKJW6OmjUJ9K1A5WVXSn+hXWsZe/jAT9TV4YeNUz4o5KMeahZ8WVpGVfbncfbfVk
 kvZQqTEmVEoEHglxlULyvcEePj9wwj1b2SJjIK3aF7cRMDEMKlSK7sv8av+8FrZnE+9E
 OUHqF4JqhBCpIn1d8ML8FDFvVzihnYerCuh1BwtWcYHpXFp1lHnHM+cfqx8Vze3CMxgN
 k9ePDZ0rYqwphilOPeBLGkf0fEeBjssbeIUd6ijmaU8a4ODlymHm1SEbbGItVToLYl38
 mnPpliE0MkeNCZEleXRWt8rd2Jf8bPVgAVyzYc6HrB++AdzaOVqdmsfsJI6mBCRxTeDc
 t3YQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1795459763; x=1796064563; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=tJm/yeW80cQWpl+rJ31NlK8xX8dbaBfxOxkZ+dUOvEQ=;
 b=A6uSgjvlRykubiS/57ysMEzrAKKDzvh1NBTmsksFqaq7+QqzUFeLDYlaC6C6xtFou5
 ae4lcqWeleBfj3PYUSmVfaOF7NQjQlOOVIZV17RYLhPzeLsOpIgATjmep1qE/FpxkVXg
 gfEhJBXVmrJ22KgIfRHdSLmT7esexr6m5o/WEI7BXW648xP1n+CUCb5ARbju7remZGPJ
 e4zoPZwkpic9TKCtryt7o7qAtQgui30QlmqgDiRgcd9d43dEHMXcX7Yyp1W9m9Ki458S
 wmUU1Edoy8QIUydcZiqd5UVYo8Nb3M86EqKDeLgk26kOAMOt3KjTAEtTgrnTKJ8fK8R7
 Qa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795459763; x=1796064563;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tJm/yeW80cQWpl+rJ31NlK8xX8dbaBfxOxkZ+dUOvEQ=;
 b=khxDgfuddZjxxOLaqEHYdNC3Fb45Jhl61keaqU2eUSzEZ7dAgYvnkvNKhZrQi8zt46
 l4+6Y+TfOydBv40axrcCp/KuTedHxkWoVVxZCygQWF9ijyXnHDFvvkF/1SQSMOJNSN/f
 khp8GTnaU+FhkAafZjOuSGwHpeqV3a02NMH+Mq/dbFQx3LEx8g2ohs3kMCO1irOv15HF
 mt858rAXzYgxi0WH+/HoWKpW4DuLdcxzaFVtJ2u27e3rn+msEtlitXUT/mp9VZtsRvRb
 LJ3MoGITq9qofJPibjjcxDBA+oMgbY20PGjs+NH/NubLBPLTC36er8+1aaUoDELYaKY4
 2Fug==
X-Forwarded-Encrypted: i=1;
 AL+hErH3qLhNzhbW56CGHLjuTmJLJxgpvJta3rH2prS00M4uxSLLUwErXeEwzfi85oPVPqAts0Sh7UxXuS2p@nongnu.org
X-Gm-Message-State: APuU4Z9zhsw2/SKXmR9oPeDVylrsmmmmBmwGO1ttRraRNfiXJCCOg8FD
 svOabPJ03/aJtBGjWAIgvrjIzgqqPgG9z+vf2Lp9USKCsJ3MB1wUYmGrucmbfMHOLvJVyBmNUSH
 5HSFem7XN0+bLACKdULvBfG3q/7oMwN0qMhYpSTXnKQ==
X-Gm-Gg: AZFdTZeDh6NCGooX1I9V+YjvNyaYxohpzXyKm8jZiqPx7UHk1bnvsdfXzeMQJAvG0ZT
 MrJsUjYBhkXNNAEZGlR8JcnJ2C06MBk6ShFGvSu/H1AGDORb9rUSfIjnS4bH6pmqEnOEZYwwzwG
 YsCDWJ+fJXgL9p9YneTQYLEhE+ZgN9k5aykK4cWnG954yjTeB7Y00O4Bif8M4Zky98OX1KU5onM
 tnCSLw5369QNYUeTQBn730nCG/vJ6xYQZ2p1nqW4Mmuncnq8tRKSkRnpc9pHvCW9QDsHH574pMp
 YK39j3cFZRQQkl30CgvRsjxIOf+6ywdAP93CPhTx1duDe5JXmVvEvTKQA8dTjZ68BftTWdRvOF6
 smqaDxfmSazf2vD/mJwaed3mDLLiEYN09MpMuuQ0gU0fh8uHmCpOwrJD008TNhqlA/8yx3anjv9
 HbPkNaIiApOr/Vmw==
X-Received: by 2002:a17:907:932:b0:c51:8bf:9f22 with SMTP id
 a640c23a62f3a-c513a5c0549mr910894866b.2.1795459762996; Mon, 23 Nov 2026
 10:49:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
 <20261118-zl-master-v1-1-129f85e0f887@linux.alibaba.com>
In-Reply-To: <20261118-zl-master-v1-1-129f85e0f887@linux.alibaba.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Nov 2026 19:49:11 +0100
X-Gm-Features: Aa3M54o-INz7dwpmjkFdIBYUDVeUs62n-0LCc8hpPoHaR8NShcyJR7cjP2Anhnk
Message-ID: <CAAeLtUDm7zA3Y_c2QoBKL+oNGhbzm-B5Xg9jy+oyqPbjVuM6JA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/8] disas/riscv: Reject incomplete instruction reads
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x534.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:03, TANG Tiancheng <lyndra@linux.alibaba.com> wrote:
>
> If a later parcel read fails, print_insn_riscv() decodes the available
> bits with the missing bits left as zero. A truncated instruction can
> therefore be displayed as a complete, unrelated instruction.
>
> Report every failed required read at its actual address and return -1.
> If the first 2-byte read fails, return -1 instead of the error code from
> read_memory_func(). The disassembly loops would otherwise treat the
> positive error code as an instruction length.
>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>


> ---
>  disas/riscv.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ca0d6e90b37321e8c2b7ec07f3ae51f0797585cc..eb4851b4cd4b14a43cc6592bd5011c6df53ec219 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -3510,12 +3510,8 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
>      for (n = 0; n < len; n += 2) {
>          status = (*info->read_memory_func)(memaddr + n, packet, 2, info);
>          if (status != 0) {
> -            /* Don't fail just because we fell off the end.  */
> -            if (n > 0) {
> -                break;
> -            }
> -            (*info->memory_error_func)(status, memaddr, info);
> -            return status;
> +            (*info->memory_error_func)(status, memaddr + n, info);
> +            return -1;
>          }
>          inst |= ((rv_inst) bfd_getl16(packet)) << (8 * n);
>          if (n == 0) {
>
> --
> 2.43.0
>
>

