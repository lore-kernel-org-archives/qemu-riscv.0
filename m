Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPjZQ-0008KT-5R
	for mharc-qemu-riscv@gnu.org; Fri, 26 Mar 2021 06:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPjZK-0008Hs-Oa; Fri, 26 Mar 2021 06:19:55 -0400
Received: from exmail.andestech.com ([60.248.187.195]:31465
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPjZ4-0008Am-FO; Fri, 26 Mar 2021 06:19:52 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12QAIWk1001833;
 Fri, 26 Mar 2021 18:18:32 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Mar 2021
 18:18:32 +0800
Date: Fri, 26 Mar 2021 18:18:33 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Alistair Francis <alistair23@gmail.com>
CC: "open list:RISC-V" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Ruinland Chuan-Tzu
 =?utf-8?B?VHNhKOiUoeWCs+izhyk=?= <ruinland@andestech.com>, Bin Meng
 <bmeng.cn@gmail.com>, "x5710999x@gmail.com" <x5710999x@gmail.com>, "Alan
 Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?=" <alankao@andestech.com>
Subject: Re: [PATCH V3] target/riscv: Align the data type of reset vector
 address
Message-ID: <20210326101833.GA21700@andestech.com>
References: <20210325094150.28918-1-dylan@andestech.com>
 <CAKmqyKMGROe+k8=f=_Vw8eLwo-PF-ENQeoD+WSte_G8dRHmatg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKMGROe+k8=f=_Vw8eLwo-PF-ENQeoD+WSte_G8dRHmatg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12QAIWk1001833
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Mar 2021 10:19:56 -0000

On Fri, Mar 26, 2021 at 04:19:09AM +0800, Alistair Francis wrote:
> On Thu, Mar 25, 2021 at 5:43 AM Dylan Jhong <dylan@andestech.com> wrote:
> >
> > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > ---
> >  target/riscv/cpu.c | 6 +++++-
> >  target/riscv/cpu.h | 2 +-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7d6ed80f6b..8a5f18bcb0 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
> >      env->features |= (1ULL << feature);
> >  }
> >
> > -static void set_resetvec(CPURISCVState *env, int resetvec)
> > +static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
> >  {
> >  #ifndef CONFIG_USER_ONLY
> >      env->resetvec = resetvec;
> > @@ -554,7 +554,11 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > +#if defined(TARGET_RISCV32)
> > +    DEFINE_PROP_UINT32("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> > +#elif defined(TARGET_RISCV64)
> >      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> > +#endif
> 
> Thanks for the patch!
> 
> I don't want to introduce any more define(TARGET_* macros as we are
> trying to make RISC-V QEMU xlen independent.
> 
> The hexagon port has an example of how you can use target_ulong here:
> 
>     DEFINE_PROP_UNSIGNED("lldb-stack-adjust", HexagonCPU, lldb_stack_adjust,
>                          0, qdev_prop_uint32, target_ulong);
> 
> can you do something like that instead?
> 
> Alistair
>

Hi Alistair,

Thanks for the comments.
But so far I did not see a way to satisfy both 32/64bit reset vector define.

The problem occurs in the 5th parameter of DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _type).
We need to specify the _prop parameter to one of the PropertyInfo struct as shown below:

    extern const PropertyInfo qdev_prop_bit;
    extern const PropertyInfo qdev_prop_bit64;
    extern const PropertyInfo qdev_prop_bool;
    extern const PropertyInfo qdev_prop_enum;
    extern const PropertyInfo qdev_prop_uint8;
    extern const PropertyInfo qdev_prop_uint16;
    extern const PropertyInfo qdev_prop_uint32;
    extern const PropertyInfo qdev_prop_int32;
    extern const PropertyInfo qdev_prop_uint64;
    extern const PropertyInfo qdev_prop_int64;
    extern const PropertyInfo qdev_prop_size;
    extern const PropertyInfo qdev_prop_string;
    extern const PropertyInfo qdev_prop_on_off_auto;
    extern const PropertyInfo qdev_prop_size32;
    extern const PropertyInfo qdev_prop_arraylen;
    extern const PropertyInfo qdev_prop_link;

Currently, there is no structure like "qdev_prop_target_ulong".
So, we still need to use an if-else condition to determine the attributes of the 5th parameter.
Something like this:
    #if defined(TARGET_RISCV32)
        DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint32 target_ulong),
    #elif defined(TARGET_RISCV64)
        DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
    #endif
I think this is not be what you meant.

The other architectures seem to ignore this, they just choose one of the attributes(qdev_prop_uint32/64) as their parameter.

So now we have 2 options:
1. Use "qdev_prop_uint64" as the 5th parameter
    DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),

2. Use if-else condition
    [patch v3]

Or if you have other opinions, please bring them up and discuss them together.

Thanks,
Dylan
 
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0a33d387ba..d9d7891666 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -303,7 +303,7 @@ struct RISCVCPU {
> >          uint16_t elen;
> >          bool mmu;
> >          bool pmp;
> > -        uint64_t resetvec;
> > +        target_ulong resetvec;
> >      } cfg;
> >  };
> >
> > --
> > 2.17.1
> >
> >

