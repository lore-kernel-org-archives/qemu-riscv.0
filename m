Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69622C369D5
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Apr 2025 06:00:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8v3G-00038D-GR; Sun, 27 Apr 2025 01:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8v39-000315-Nk
 for qemu-riscv@nongnu.org; Sun, 27 Apr 2025 01:59:36 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8v38-0004ck-3E
 for qemu-riscv@nongnu.org; Sun, 27 Apr 2025 01:59:35 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso783174066b.0
 for <qemu-riscv@nongnu.org>; Sat, 26 Apr 2025 22:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745733571; x=1746338371; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ftPshtP1hB5HWBGk2/JNDIyaKaQuZZKrJSVj3NCbXpg=;
 b=UHkDvgtSodzT2PJ438F5QmV4tBCiT41exJA11WJft7OFMHBOj3f6iNke4LnGJG1rPQ
 uKnuKN+Kozv3Md+e3BXGW39dAyB40mn6aBO3vWMQc+4+SCGJWMgVqPQX+ctnRiqfKuyE
 3la8rC37KDa8adYQ6QpnMLK6EpyTdnV8ylYkAQE708svZizhXTMatnQx6iMXNr/UaPrO
 SVWVtv1Q/Zdo37ogQpYJB3zRRc3boMjROk6VvKPHuBFxIGOaFQTWtA6xuoBI6cx0wZ9H
 1ATnQ+L6NKZ3rAhoqmgwaUa2ZcddCYcDNP9pvKZhnjxHWvY/hgtheRBoos3P/+C3WxA2
 sL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745733571; x=1746338371;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftPshtP1hB5HWBGk2/JNDIyaKaQuZZKrJSVj3NCbXpg=;
 b=jUXUb1jd1S6TdhlC50RxHJITcu8b7hCwvRc37zm6q7F2Cd6es90l20jsfv5PhEH2Pq
 MbTgJWH4dLeb5NC9mEs6vXnxWZIT4OfHu4OQ/JwZ9C6/e8o9huA1N1mtZel6HREfFh9y
 L5bDRmsCC58IPG2D7ZHcAxwXg37FJ1ZTr0JjvBxuONafJg1GJzE924maeO8d5A7bXcwo
 DcPskSN8BbOo0ZMB3GTJCWvI+QmO7xS7W7zYUDRc+8NojUOU0JTsGtFH/80qYUsat5tl
 dy1TKiMG8NrKWocdJn+OTMvhkwIi7W9zhHIILOsW4Fvfe6vPOcOfwjr0cfP+FdvB+tni
 iFzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbLzCCRsfIXj0cGf2Vn/y4wjQkW1mmGRkgp8dkyyxXMTICOe3vkrMiV9mNXawFG+OpZWB/IsfVBw4I@nongnu.org
X-Gm-Message-State: AOJu0YxPxiYRBWCGg1SaHGMZ28WWuGAQr3Lg1bhM64HRFw8es9SgCEZl
 U/qIN+ezyit+AZj7xl+qH+ykJ3285T2K1wnNngfOoro3HkyS1Qf7Tstt0Snkf5w=
X-Gm-Gg: ASbGnctdGN7xwfSX0DL6wE7EMvpifnlgwRivwTCUoCsO9HBtcABgWqHMXuuCz5MxHjB
 m9nz43pdZOMXGFv80/gWhXhcH3OBo9FPYsrOnrlf0pLDL5IE7yticXjgEP5ii8+/i00hQHGL+fe
 bsHItDERkBZ0PXwR8FjYOPbtEwI5z03I/n+AZStFRjnLYR8TOGI5B3tr8ahk1mNOSymVWneNKE4
 sIIrHHmnhkNa5/0EN8oTw6nrAuKEjSr8I8H79bUymjqoIgBIUZNs2pAIJEbwEOBMxin6HPN0Mko
 D7p8Fs1nO4OtyQfj5Zk7fyAUYH81A7sMMljd4kG6RXox8cFb3P+bpdJPmyk0DAo4wIS/RA==
X-Google-Smtp-Source: AGHT+IE/1E9c3j3v/bN/A8FCKQIFB2bSj+DLjIVniRAI/cygsVRGyrxOLZsEURI8DMaiFtI7K0icfg==
X-Received: by 2002:a17:907:3ea3:b0:ac1:ecb5:7207 with SMTP id
 a640c23a62f3a-ace7111e569mr669313866b.29.1745733570889; 
 Sat, 26 Apr 2025 22:59:30 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf893fsm398809366b.96.2025.04.26.22.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 22:59:30 -0700 (PDT)
Date: Sun, 27 Apr 2025 07:59:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v3 8/9] target/riscv: widen scounteren to target_ulong
Message-ID: <20250427-e13fa003b1bfad48e17bcee9@orel>
References: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
 <20250425160203.2774835-9-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425160203.2774835-9-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Apr 25, 2025 at 01:02:02PM -0300, Daniel Henrique Barboza wrote:
> We want to support scounteren as a KVM CSR. The KVM UAPI defines every
> CSR size as target_ulong, and our env->scounteren is fixed at 32 bits.
> 
> The other existing cases where the property size does not match the KVM
> reg size happens with uint64_t properties, like 'mstatus'. When running
> a 32 bit CPU we'll write a 32 bit 'sstatus' KVM reg into the 64 bit
> 'mstatus' field. As long as we're consistent, i.e. we're always
> reading/writing the same words, this is ok.
> 
> For scounteren, a KVM guest running in a 64 bit CPU will end up writing
> a 64 bit reg in a 32 bit field. This will have all sort of funny side
> effects in the KVM guest that we would rather avoid.
> 
> Increase scounteren to target_ulong to allow KVM to read/write the
> scounteren CSR without any surprises.
> 
> Aside from bumping the version of the RISCVCPU vmstate no other
> behavioral changes are expected.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h     | 9 ++++++++-
>  target/riscv/machine.c | 6 +++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5a60d0c52..66d4ddfcb4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -400,7 +400,14 @@ struct CPUArchState {
>       */
>      bool two_stage_indirect_lookup;
>  
> -    uint32_t scounteren;
> +    /*
> +     * scounteren is supposed to be an uint32_t, as the spec
> +     * says. We're using a target_ulong instead because the
> +     * scounteren KVM CSR is defined as target_ulong in
> +     * kvm_riscv_csr, and we want to avoid having to deal
> +     * with an ulong reg being read/written in an uint32_t.
> +     */
> +    target_ulong scounteren;

I'm having second thoughts about this. It seems like it should be
avoidable with the use of an intermediary buffer (which we already
have -- the uint64_t reg) and with tracking the size of the env state
by capturing the size with the new macro used to build the array.
Then,

for reading:
 1. read the kvm reg into a buffer of the size kvm says it is
 2. only write the bytes we can store from the buffer into the env state,
    using the size field to know how many that is

for writing:
 1. put the env state into a buffer of the size kvm says the register is,
    ensuring any upper unused bytes of the buffer are zero
 2. write the buffer to kvm

Thanks,
drew

>      uint32_t mcounteren;
>  
>      uint32_t scountinhibit;
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index df2d5bad8d..f3477e153b 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -401,8 +401,8 @@ static const VMStateDescription vmstate_ssp = {
>  
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 10,
> -    .minimum_version_id = 10,
> +    .version_id = 11,
> +    .minimum_version_id = 11,
>      .post_load = riscv_cpu_post_load,
>      .fields = (const VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -445,7 +445,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mtval, RISCVCPU),
>          VMSTATE_UINTTL(env.miselect, RISCVCPU),
>          VMSTATE_UINTTL(env.siselect, RISCVCPU),
> -        VMSTATE_UINT32(env.scounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINT32(env.mcounteren, RISCVCPU),
>          VMSTATE_UINT32(env.scountinhibit, RISCVCPU),
>          VMSTATE_UINT32(env.mcountinhibit, RISCVCPU),
> -- 
> 2.49.0
> 

