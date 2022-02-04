Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFt9X-0008Qq-CN
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 02:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFt9J-0008PN-3G; Fri, 04 Feb 2022 02:36:55 -0500
Received: from [2607:f8b0:4864:20::d29] (port=37878
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFt9F-0004TZ-LX; Fri, 04 Feb 2022 02:36:52 -0500
Received: by mail-io1-xd29.google.com with SMTP id n17so6331184iod.4;
 Thu, 03 Feb 2022 23:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LSsJok1WBjpGawp96mw1W0MItezkTwdxqjv9Y6KbXQA=;
 b=fjl1Ef1l23zQJE6JO/y71pjN2C0+AMgPi83QxM3QXzp6XoI7bIqt0SONtIsWkCZlae
 SomTn6NZz6CWwN8U4y2wdm1sarOyeLLVR06A5NDCEIIo0eeQXnGfwM3w13TkMnQVJA6G
 2YZdF9eO9jm8n6/O+3JGCcavqnZcFO6m8GAWTV2krXxtUpzc1e0TZAKe0kqrluG0MtgX
 s/4tjoDH5mUbCGmSZk6PjsFo9Yf4YiLFdENdpV2WOqv99vyben2YfuChN4obklkspdgL
 Bp4rAL0PGlqBXVLoDIUtE+7rfgtwzJWkhYPM9o083bgbiQYiO/VKWYQuX/Yiifz6lNhZ
 hvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LSsJok1WBjpGawp96mw1W0MItezkTwdxqjv9Y6KbXQA=;
 b=s8E822AtKuefXnZB3bwxJArPaUEHU4RlMZQEjRxG9nfFk5jlnQf2roqg3bBWZeN12X
 NJRF8LwQlDoNwgtTiroMSEmPAscCcsEzXlyfehFU58mcpJn1DiPirPMrAuDsYPvJua0Y
 qj6p89s9Atm4DMvPyb7cOgLjzyAL/1DN51FE6CDnKQmVK4pN6GGemdSeLmKfdHuLju0p
 XwIjmMDsFdQq6knKx+9QsMAv/bFTjwOZXEki9Jp4URMUW2RYaZfMBw39hvSL4i+991lO
 SlF6BwQyryqzs/eafzh9kd+GaZvmsj1rtnYDRWePDxhuxlAHr8sbd5Aby+BtIYq1ykpB
 INkw==
X-Gm-Message-State: AOAM533kmVio2uMFpIpM9+fgR1Gy9aa0jluAccG77JN/Wg2QQk298RsT
 bAAw4tQoCy1ia9QZdmpMgfyE7r7o+QGWg1ROzWQ=
X-Google-Smtp-Source: ABdhPJxRc5bV8oDw/EPLKv/g1KIHEdqP1IKw5OLPF3XjEQI0q7J2STzosJjs/R/19ulCvHZCqpg2wxX4JVu8h52dPzc=
X-Received: by 2002:a05:6602:727:: with SMTP id g7mr757686iox.90.1643960207774; 
 Thu, 03 Feb 2022 23:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
 <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
 <9fe41ac9-f0d9-1122-7ec3-3f20e3667826@linaro.org>
 <CAKmqyKNpefaQMZcW1CsKK22wKMRUxbkPjPAOumei+5NCQsLEVQ@mail.gmail.com>
 <2cb994f2-85e1-451f-c83c-a8403135cdc0@linaro.org>
In-Reply-To: <2cb994f2-85e1-451f-c83c-a8403135cdc0@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Feb 2022 17:36:21 +1000
Message-ID: <CAKmqyKMRmjwu_DQvZduYwnBwxp1KsY07wzKVLzdw30PWBBEjZA@mail.gmail.com>
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 04 Feb 2022 07:36:59 -0000

On Wed, Feb 2, 2022 at 10:37 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/1/22 15:40, Alistair Francis wrote:
> >> Alistair, you're only changing the reporting of MMIO faults for which read permission is
> >> missing.  Importantly, the actual permission check is done elsewhere, and you aren't
> >> changing that to perform a write access check.  Also, you very much need to handle normal
> >
> > I'm a little confused with this part.
> >
> > Looking at tcg_gen_atomic_cmpxchg_i64() for example we either:
> >   1. call tcg_gen_qemu_ld_i64() then tcg_gen_qemu_st_i64()
> >   2. call table_cmpxchg[] which eventually calls atomic_mmu_lookup()
> >   3. call tcg_gen_atomic_cmpxchg_i32() which is pretty much the same as
> > the above two
> >
> > That means in both cases we end up performing a load or tlb_fill(..,
> > MMU_DATA_LOAD, ..) operation as well as a store operation.
>
> Yep...
>
> > So we are already performing a write permission check...
>
> ... but we're doing so *after* the load.
>
> Which means that for a completely unmapped page (as opposed to a read-only page) we will
> generate a read fault, which generates RISCV_EXCP_LOAD_ACCESS_FAULT and *not*
> RISCV_EXCP_STORE_AMO_ACCESS_FAULT.
>
> So we need to check for write permission first, before performing the load.

Isn't that what this series does though, albeit for IO accesses only

Using probe_write() solves part of this problem. If we have RAM at the
address but no permissions to access it, then probe_write() will
generate a store/AMO fault. But it won't help if nothing is mapped at
that address.

Let's say you are performing an atomic operation at an unmapped
address 0x00, in M mode (so no MMU). probe_write() will eventually
call riscv_cpu_tlb_fill() and get_physical_address(). On a system
without an MMU and no PMP enforcement we get full read/write/execute
permissions from riscv_cpu_tlb_fill(). So probe_write() succeeds.

>
> > Can't we just do the check in the slow path? By the time we get to the
> > fast path shouldn't we already have permissions?
>
> No, the fast path performs the permissions check on one bit [rwx] depending on which tlb
> comparator it loads.

If you have permissions then that's fine. I thought we went via the
slow path if the permission check fails?

Alistair

>
> > As in add a new INDEX_op_qemu_ld_write_perm_i32/i64, make edits to
> > atomic_mmu_lookup() and all of the plumbing for those?
>
> That's one possibility, sure.
>
>
> r~

