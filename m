Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B8C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:58:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8yu-00015V-2W; Thu, 10 Aug 2023 12:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU8ys-00014r-8J; Thu, 10 Aug 2023 12:57:50 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU8yq-0004Pt-Kr; Thu, 10 Aug 2023 12:57:50 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-4476a2a5bc9so475447137.2; 
 Thu, 10 Aug 2023 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691686667; x=1692291467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zM6EQIFNdflLVpqWWJxwrb1E+qms2swLkFruSu/PQ88=;
 b=oteP19AT6BmFdhFoZ2d7PQlEetDdc6KmiQgVtzBb4ySg6iw1Eaa6xKUuDgSPkxe1b4
 jYwNaDmrNgyQTGOI5taBGm8qhDiGY1ae6gHwDL6UlcwZD/peGYcujyy0OLTuimehcjaA
 A/DIgHZDCIM2uvXEFXandzfOpPhx4Hjs2HppNi15xZHkuRdHz6uySqP3loAUocAAtJec
 4tQJ6RiONtluLvWrqAhezYlnb/4C5O9QFr1gqWMQBWr9cKeNidcG5Vs3RQMilpCbT1md
 HNe+2vb/D8qsQuqVA256g799QKRIm7MacYfXQlsoyewKz76IElGmPXguNrTxIPqX4lFf
 6EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691686667; x=1692291467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zM6EQIFNdflLVpqWWJxwrb1E+qms2swLkFruSu/PQ88=;
 b=O+LAW7jXqaZdUB+nIdeRtcKIP5aJ9YYf4YcOUwcvdW4bGh6xoDmcBgtCahS21NrVI3
 dJEFXwKXVyF9DhjiEkOh2r2Oww2zOKo+GwN5uO3hmJOnLRPsScVi+sVBVmZcXEBz85yc
 ZaWrOLDh7Lx/BHljEFDnKw+qiPLjffl+/MuJ9fZIkcm/vlVpZeAnwV6xBuyb+lRDDWCD
 TctnlvDhuu0HxAwNKTHIZpykz5PaJfXjqGxjeT81NXLdJX6Ed2EQpR6QlpvVzfUtRfju
 xJa9um9e/EQlYoxQBdTnYQgZgigUVpms95FmRBDZw3SxCTwJGnwi6O2FE3es3WHLZ7Pw
 UmYw==
X-Gm-Message-State: AOJu0YwMrso+qwEE/+Sap4LWm1NYo0y3dEB12JgbQ349hWqIsOi1Ng6Y
 joLNl2mItVpgLuDMfi2Uy8Ht9EppmgXA2sMjx8U=
X-Google-Smtp-Source: AGHT+IEE0OYKxDJgfnlCsMSrdhxVBgZu3fuxLJx8I5342BVP1JbLbJdEbeDO+D7Ea6/OWsm+ZS+vZbaC7gzGQ9nbiew=
X-Received: by 2002:a67:e456:0:b0:443:5f9e:9864 with SMTP id
 n22-20020a67e456000000b004435f9e9864mr2579405vsm.17.1691686666931; Thu, 10
 Aug 2023 09:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230802180058.281385-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230802180058.281385-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 12:57:20 -0400
Message-ID: <CAKmqyKMy3J3HmF=DZfh0Xs=BYcQviRUP3bO_eAdhgmrWALQujA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Aug 2, 2023 at 2:02=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
> a target_ulong val, i.e. a 64 bit field in a 64 bit host.
>
> Given that we're passing a pointer to the mvendorid field, the reg is
> reading 64 bits starting from mvendorid and going 32 bits in the next
> field, marchid. Here's an example:
>
> $ ./qemu-system-riscv64 -machine virt,accel=3Dkvm -m 2G -smp 1 \
>    -cpu rv64,marchid=3D0xab,mvendorid=3D0xcd,mimpid=3D0xef(...)
>
> (inside the guest)
>  # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> mmu             : sv57
> mvendorid       : 0xab000000cd
> marchid         : 0xab
> mimpid          : 0xef
>
> 'mvendorid' was written as a combination of 0xab (the value from the
> adjacent field, marchid) and its intended value 0xcd.
>
> Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
> use it as input for kvm_set_one_reg(). Here's the result with this patch
> applied and using the same QEMU command line:
>
>  # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> mmu             : sv57
> mvendorid       : 0xcd
> marchid         : 0xab
> mimpid          : 0xef
>
> This bug affects only the generic (rv64) CPUs when running with KVM in a
> 64 bit env since the 'host' CPU does not allow the machine IDs to be
> changed via command line.
>
> Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM=
 CPUs")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 9d8a8982f9..b1fd2233c0 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
>  static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
>  {
>      CPURISCVState *env =3D &cpu->env;
> +    target_ulong reg;
>      uint64_t id;
>      int ret;
>
>      id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
>                            KVM_REG_RISCV_CONFIG_REG(mvendorid));
> -    ret =3D kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
> +    /*
> +     * cfg.mvendorid is an uint32 but a target_ulong will
> +     * be written. Assign it to a target_ulong var to avoid
> +     * writing pieces of other cpu->cfg fields in the reg.
> +     */
> +    reg =3D cpu->cfg.mvendorid;
> +    ret =3D kvm_set_one_reg(cs, id, &reg);
>      if (ret !=3D 0) {
>          return ret;
>      }
> --
> 2.41.0
>
>

