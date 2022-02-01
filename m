Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEkyA-00073b-1o
	for mharc-qemu-riscv@gnu.org; Mon, 31 Jan 2022 23:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEky8-00072H-45; Mon, 31 Jan 2022 23:40:40 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=33448
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEky6-0000OS-Hf; Mon, 31 Jan 2022 23:40:39 -0500
Received: by mail-io1-xd2c.google.com with SMTP id y84so19808505iof.0;
 Mon, 31 Jan 2022 20:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b2jnqckeZ/6TLfasN+xZyDJXiHIkS5FYYOTHKUJgduc=;
 b=fHtsuVwl/1diMAZt+TqC2pOt97tiT6HP7gFWnHAdlCxDdONkU1GMQY4u8ZJ3ECkCIv
 AvrjE23w9GwO+tMAwxYGqz9mSNN7+Xu/2Wv7WXuydZeGYW+yAyxc1MzbxSF57d2UT9z+
 A0luIXz4OvvAeBok8+/K7RAyEiPmcVnsc+sxBR4Vq2RBk9TcwFbBscl1xnLQezSlLe+v
 sLdw09CaTpF0I2mg7H466NAcM4/iY+ARD1I6DdZA+Y9Q7vdeUYpbl75rix0+HlBlW76A
 9tvmQy1BiTzFzBFldLkQTJSMu13D7pds4GP2PEu7NKaZ207M7X120BW3+h6PLBqWBwrM
 fwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b2jnqckeZ/6TLfasN+xZyDJXiHIkS5FYYOTHKUJgduc=;
 b=GPnXNTCw2rCb73oiBptD/q9mslUTynyP6wIFtTQ1zznQLqosLvDx6tU/hGT2OdcR9N
 TYpahhOOGeFnup04MZI4QCy9/1l9GM3caovmGI4sEQUmPpQyvXxmB8heGrdnkRTAggdc
 DQEEK71moLLQH7cmKoQdv7xY8PfQcKv/FRtghtwS75koz/a7vDKR6J0SkTLYhbRXIanm
 A+VlMNfbPIMuKYK7IVwVpzzoQFYy+GZaJWPDFB3syzWWOFfRHrG7dQrOEx8R7Nc5U5Xc
 m2zOlgkyJI6PxXrmESl0b3cXRKmZfMhOZlXXL2JNrkFKewshbpWcNEynyFpbqTGhqwGh
 RnNQ==
X-Gm-Message-State: AOAM532SK0ThhpXNlqcnDtQMvoT19LwGaxrX6JL4sbXf4EGufwUC06Ct
 DsvSd2ZPRvjsdNil2DEjGeKBQaaBtrZrSX49bqk=
X-Google-Smtp-Source: ABdhPJyOecxkxs7RlRi1PG6z91vyjVL3rSALBf/kT9z8BncN4f5AGEzbScDx/MQTcYftYW/ALa1JZZnGeYhY0xXyZW8=
X-Received: by 2002:a05:6638:1028:: with SMTP id
 n8mr12531953jan.318.1643690437091; 
 Mon, 31 Jan 2022 20:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
 <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
 <9fe41ac9-f0d9-1122-7ec3-3f20e3667826@linaro.org>
In-Reply-To: <9fe41ac9-f0d9-1122-7ec3-3f20e3667826@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 14:40:10 +1000
Message-ID: <CAKmqyKNpefaQMZcW1CsKK22wKMRUxbkPjPAOumei+5NCQsLEVQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Feb 2022 04:40:40 -0000

On Wed, Jan 26, 2022 at 10:09 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/24/22 4:17 PM, LIU Zhiwei wrote:
> >
> > On 2022/1/24 =E4=B8=8A=E5=8D=888:59, Alistair Francis wrote:
> >> From: Alistair Francis <alistair.francis@wdc.com>
> >>
> >> This series adds a MO_ op to specify that a load instruction should
> >> produce a store fault. This is used on RISC-V to produce a store/amo
> >> fault when an atomic access fails.
> >
> > Hi Alistair,
> >
> > As Richard said,  we  can address this issue in two ways, probe_read(I =
think probe_write
> > is typo)
>
> It is not a typo: we want to verify that the memory is writable before we=
 perform the
> load.  This will raise a write fault on a no-access page before a read fa=
ult would be
> generated by the load.  This may still generate the wrong fault for a wri=
te-only page.
> (Is such a page permission encoding possible with RISCV?  Not all cpus su=
pport that, since

It's not. RISC-V doesn't have write only pages, at least not in the
current priv spec (maybe some extension allows it).

> at first blush it seems to be mostly useless.  But some do, and a generic=
 tcg feature
> should be designed with those in mind.)
>
> > In my opinion use MO_op in io_readx may be not right because the issue =
is not only with IO
> > access. And MO_ op in io_readx is too later because the exception has b=
een created when
> > tlb_fill.
>
> You are correct that changing only io_readx is insufficient.  Very much s=
o.
>
> Alistair, you're only changing the reporting of MMIO faults for which rea=
d permission is
> missing.  Importantly, the actual permission check is done elsewhere, and=
 you aren't
> changing that to perform a write access check.  Also, you very much need =
to handle normal

I'm a little confused with this part.

Looking at tcg_gen_atomic_cmpxchg_i64() for example we either:
 1. call tcg_gen_qemu_ld_i64() then tcg_gen_qemu_st_i64()
 2. call table_cmpxchg[] which eventually calls atomic_mmu_lookup()
 3. call tcg_gen_atomic_cmpxchg_i32() which is pretty much the same as
the above two

That means in both cases we end up performing a load or tlb_fill(..,
MMU_DATA_LOAD, ..) operation as well as a store operation.

So we are already performing a write permission check, if that fails
on RISC-V we correctly generate the RISCV_EXCP_STORE_AMO_ACCESS_FAULT
fault. I guess on some architectures there might be a specific atomic
fault, which we will still not correctly trigger though.

The part we are interested in is the load, and ensuring that we
generate a store fault if that fails. At least for RISC-V.

> memory not just MMIO.  Which will require changes across all tcg/arch/, a=
s well as in all
> of the memory access helpers in accel/tcg/.

Argh, yeah

>
> We may not want to add this check along the normal hot path of a normal l=
oad, but create

Can't we just do the check in the slow path? By the time we get to the
fast path shouldn't we already have permissions?

> separate helpers for "load with write-permission-check".  And we should a=
nswer the

As in add a new INDEX_op_qemu_ld_write_perm_i32/i64, make edits to
atomic_mmu_lookup() and all of the plumbing for those?

Alistair

> question of whether it should really be "load with read-write-permission-=
check", which
> will make the changes to tcg/arch/ harder.
>
>
> r~

