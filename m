Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pub46-0004iw-5E
	for mharc-qemu-riscv@gnu.org; Thu, 04 May 2023 11:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub3H-00043u-71
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 11:39:28 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub3F-0002rD-Dm
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 11:39:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso1254082a12.2
 for <qemu-riscv@nongnu.org>; Thu, 04 May 2023 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683214763; x=1685806763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCpRlDguvEjAb+xFSEilMlq7+yQCqd5fPfosF9kyQDg=;
 b=EEcBaBWcDiqJ08RRatzOE7TDLM3AiIoz9h7WWtHZHhmqJCBrQr991BzWT/RvAbVHrv
 +ETJrHGpfEyX7LTa2WkCNZozB5/aK9vydWf4CpcStkJFdAqTZvKgAPYT3hRs6HtedC1M
 fmMQ2FLdZaskIc2b5t6WIVSqcPc18vw02eGNV0VD5qJgS7my9PXB4/cddbsuskBGTZgz
 aYLSFE510RG3nfR9TtX0dgiLmAzzB5rIXqPoSIRwRLvMich8IwwFUI97/gdcr2gp0TzX
 mOHhwtN0DriCyFLW8I/XZ9UJ2fqwckWenrD+yGp7FN9cW37Wa5aNu5THjEmc6gbU2pw3
 Q/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683214763; x=1685806763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCpRlDguvEjAb+xFSEilMlq7+yQCqd5fPfosF9kyQDg=;
 b=PD00pLVPXX/jmhlWmwldKPwLMvqorCKNwp12N6V6UfNa0yVZ2DeTro6F1mo58SfiqV
 eizc70BUwn33bbaRVwJq5eFXQ6mZIBm6MCmWK/gXtWIkcOOzHF/5mlfVwXkbJu09tSWE
 VgybKeRZZ6aITrZTOm0zxCTyrPQ0m4ZIPjmO/jP4KbFmOM/79dcjn3mtPfffpLc/L7Qe
 TJCknVvgFRUINB2kumqX0752jLG56JpqQlXYD/OlSL0WIifQzRZhlcezGwA2291+Pqfd
 alMtnlaBuc9HHmzVNiTik/gp1ws07PBrTicQvBMY6afKCs5hnJcQBGiVlqRiKgdASAlx
 m7Bg==
X-Gm-Message-State: AC+VfDxNOLXASL32FSyGVdLADpE8F0FYRhxBEiVCYsAM7donEPdByT6L
 VHcgaM6xAraFRUxrN9mchcujrvplQqz/p/DKVZcAeA==
X-Google-Smtp-Source: ACHHUZ7HawQI3rHbfUDkI/xOB5Bb5SyM1pN4vgRaAmTPiSZY0AZXIlW6RfIxsYmASUxLtC/0SpCNcFv8xcCYJtnO7CY=
X-Received: by 2002:a50:ee8c:0:b0:506:b228:7aff with SMTP id
 f12-20020a50ee8c000000b00506b2287affmr2091106edr.23.1683214763344; Thu, 04
 May 2023 08:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-5-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:39:12 +0100
Message-ID: <CAFEAcA8LMQ6rfbCBB=sPfnDG0Uk9qaTZQXbH4D55veQgFNOqvg@mail.gmail.com>
Subject: Re: [PATCH v4 04/57] accel/tcg: Reorg system mode load helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Thu, 04 May 2023 15:39:29 -0000

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of trying to unify all operations on uint64_t, pull out
> mmu_lookup() to perform the basic tlb hit and resolution.
> Create individual functions to handle access by size.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/**
> + * mmu_watch_or_dirty
> + * @env: cpu context
> + * @data: lookup parameters
> + * @access_type: load/store/code
> + * @ra: return address into tcg generated code, or 0
> + *
> + * Trigger watchpoints for @data.addr:@data.size;
> + * record writes to protected clean pages.
> + */
> +static void mmu_watch_or_dirty(CPUArchState *env, MMULookupPageData *dat=
a,
> +                               MMUAccessType access_type, uintptr_t ra)
> +{
> +    CPUTLBEntryFull *full =3D data->full;
> +    target_ulong addr =3D data->addr;
> +    int flags =3D data->flags;
> +    int size =3D data->size;
> +
> +    /* On watchpoint hit, this will longjmp out.  */
> +    if (flags & TLB_WATCHPOINT) {
> +        int wp =3D access_type =3D=3D MMU_DATA_STORE ? BP_MEM_WRITE : BP=
_MEM_READ;
> +        cpu_check_watchpoint(env_cpu(env), addr, size, full->attrs, wp, =
ra);
> +        flags &=3D ~TLB_WATCHPOINT;
> +    }
> +
> +    if (flags & TLB_NOTDIRTY) {
> +        notdirty_write(env_cpu(env), addr, size, full, ra);
> +        flags &=3D ~TLB_NOTDIRTY;
> +    }

Maybe worth a comment that the NOTDIRTY flag is only ever
set for the addr_write TLB entry? This confused me for a bit...

> +    data->flags =3D flags;
> +}
> +
> +/**
> + * mmu_lookup: translate page(s)
> + * @env: cpu context
> + * @addr: virtual address
> + * @oi: combined mmu_idx and MemOp
> + * @ra: return address into tcg generated code, or 0
> + * @access_type: load/store/code
> + * @l: output result
> + *
> + * Resolve the translation for the page(s) beginning at @addr, for MemOp=
.size
> + * bytes.  Return true if the lookup crosses a page boundary.
> + */
> +static bool mmu_lookup(CPUArchState *env, target_ulong addr, MemOpIdx oi=
,
> +                       uintptr_t ra, MMUAccessType type, MMULookupLocals=
 *l)
> +{
> +    unsigned a_bits;
> +    bool crosspage;
> +    int flags;
> +
> +    l->memop =3D get_memop(oi);
> +    l->mmu_idx =3D get_mmuidx(oi);
> +
> +    tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
> +
> +    /* Handle CPU specific unaligned behaviour */
> +    a_bits =3D get_alignment_bits(l->memop);
> +    if (addr & ((1 << a_bits) - 1)) {
> +        cpu_unaligned_access(env_cpu(env), addr, type, l->mmu_idx, ra);
> +    }
> +
> +    l->page[0].addr =3D addr;
> +    l->page[0].size =3D memop_size(l->memop);
> +    l->page[1].addr =3D (addr + l->page[0].size - 1) & TARGET_PAGE_MASK;
> +    l->page[1].size =3D 0;
> +    crosspage =3D (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
> +
> +    if (likely(!crosspage)) {
> +        mmu_lookup1(env, &l->page[0], l->mmu_idx, type, ra);
> +
> +        flags =3D l->page[0].flags;
> +        if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
> +            mmu_watch_or_dirty(env, &l->page[0], type, ra);
> +        }
> +        if (unlikely(flags & TLB_BSWAP)) {
> +            l->memop ^=3D MO_BSWAP;
> +        }
> +    } else {
> +        /* Finish compute of page crossing. */
> +        int size1 =3D l->page[1].addr - addr;
> +        l->page[1].size =3D l->page[0].size - size1;
> +        l->page[0].size =3D size1;

Should this local variable be named "size0" ? It seems to be
the size of the access done to page[0], not the size of the
access to page[1].

> +
> +        /*
> +         * Lookup both pages, recognizing exceptions from either.  If th=
e
> +         * second lookup potentially resized, refresh first CPUTLBEntryF=
ull.
> +         */
> +        mmu_lookup1(env, &l->page[0], l->mmu_idx, type, ra);
> +        if (mmu_lookup1(env, &l->page[1], l->mmu_idx, type, ra)) {
> +            uintptr_t index =3D tlb_index(env, l->mmu_idx, addr);
> +            l->page[0].full =3D &env_tlb(env)->d[l->mmu_idx].fulltlb[ind=
ex];
> +        }
> +
> +        flags =3D l->page[0].flags | l->page[1].flags;
> +        if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
> +            mmu_watch_or_dirty(env, &l->page[0], type, ra);
> +            mmu_watch_or_dirty(env, &l->page[1], type, ra);
> +        }
> +
> +        /*
> +         * Since target/sparc is the only user of TLB_BSWAP, and all
> +         * Sparc accesses are aligned, any treatment across two pages
> +         * would be arbitrary.  Refuse it until there's a use.
> +         */
> +        tcg_debug_assert((flags & TLB_BSWAP) =3D=3D 0);
> +    }
> +
> +    return crosspage;
> +}


> +/**
> + * do_ld_mmio_beN:
> + * @env: cpu context
> + * @p: translation parameters
> + * @ret_be: accumulated data
> + * @mmu_idx: virtual address context
> + * @ra: return address into tcg generated code, or 0
> + *
> + * Load @p->size bytes from @p->addr, which is memory-mapped i/o.
> + * The bytes are concatenated with in big-endian order with @ret_be.

"in big-endian order with"

> + */
> +static uint64_t do_ld_mmio_beN(CPUArchState *env, MMULookupPageData *p,
> +                               uint64_t ret_be, int mmu_idx,
> +                               MMUAccessType type, uintptr_t ra)
>  {
> -    validate_memop(oi, MO_UB);
> -    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
> -                       full_ldub_mmu);
> +    CPUTLBEntryFull *full =3D p->full;
> +    target_ulong addr =3D p->addr;
> +    int i, size =3D p->size;
> +
> +    QEMU_IOTHREAD_LOCK_GUARD();
> +    for (i =3D 0; i < size; i++) {
> +        uint8_t x =3D io_readx(env, full, mmu_idx, addr + i, ra, type, M=
O_UB);
> +        ret_be =3D (ret_be << 8) | x;
> +    }
> +    return ret_be;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

