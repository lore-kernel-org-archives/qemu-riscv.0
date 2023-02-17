Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSq2Z-0003mB-Hk
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 20:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSq2X-0003lF-Dm; Thu, 16 Feb 2023 20:59:57 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSq2V-0006uv-MC; Thu, 16 Feb 2023 20:59:57 -0500
Received: by mail-ed1-x530.google.com with SMTP id fj20so10059277edb.1;
 Thu, 16 Feb 2023 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=prsORwPvRTB6uchzeR6pJmJMqUQUQPDTex/He3lGljk=;
 b=o9ER2LNG0RcR5JBXEWXCpPND8xNRYqKYucYb+fG2ZuGfFLDnO0abdZSCXkFjKQNBFE
 X/kMGrirL2izlRboIVS4LwkXjcc7rAIc7btYMRF/xrej3a/YmHvpI9sxTfKB5muMdJph
 gdqRSb45KeKjAkJqh0FvJ1qShEpNLvzWffJ0/or7ZST42xQv9/eILBQUP4Yvi/L7Qzs9
 ESewUbZyX7imNENbvCwliixF5/1/KWLa0ENiCnzZC5JRbKbnO95qDY3DT+At4xPiMaIt
 caRwF+IcDUTEWdkPfByT/aWixojDZA+1/lrtau55uxD7+e3iLchbWjy869uCOlGauiBz
 MsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=prsORwPvRTB6uchzeR6pJmJMqUQUQPDTex/He3lGljk=;
 b=8HfCQ1Zb3J/xZ87eE7pty/l3Z6yrnB4cyvhfDJfjn3CReRrszmKxuHi+F4SS0Q/0gd
 gWST4BvrUS7WDpO9po3AeZWQc6CL5mq2wkGAInPvVD176efpRn5HacPIwgOPw8RII/Hx
 6Pf9xLIf4b6sFkoCq/X+fM96n6dbAc1VWTIohHjrirOwJSdsTn0PR7NtpGzqS+PzxCgZ
 ndlt9T6JmRqoKWx12Xa4M5q6HZhyc6Ju3QdeiqEVkJgANm9vuJlmnxEBtP4FUzRClzth
 aVDKtrI8+he7CBdJMcjIXsuWDyiURzpeHmfjMLzFq/1AGhZgiCUWOAoePDb6aIV/QMMz
 O8Yg==
X-Gm-Message-State: AO0yUKUCH9+zdQM1AjRDPLoaozazqZUp68PGAQaV4JqUKDjtH2JGtgfn
 PYNYpso+sqOVTi7gJEWMZ5dhK45q5zl6bnlzxEk=
X-Google-Smtp-Source: AK7set882sRqJdpGZ6eVq5sUF8EpYrWw69+G3RT+4gG4BG4zqRw0/dYC3jgmmpeDajXH1+oAuJnUHXng1myYpbgn3p0=
X-Received: by 2002:a17:907:3d91:b0:8af:2e89:83df with SMTP id
 he17-20020a1709073d9100b008af2e8983dfmr3027680ejc.6.1676599193581; Thu, 16
 Feb 2023 17:59:53 -0800 (PST)
MIME-Version: 1.0
References: <CAEUhbmX6Qb1aAdZC+d2F=n5qLo60XGiE3e0xTco1TgNgDxAKVg@mail.gmail.com>
 <mhng-af7566fe-2c88-460b-8cd4-f52b198bbff4@palmer-ri-x1c9a>
In-Reply-To: <mhng-af7566fe-2c88-460b-8cd4-f52b198bbff4@palmer-ri-x1c9a>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 17 Feb 2023 09:59:42 +0800
Message-ID: <CAEUhbmWQtabLO-whpqO8WDCgjXTfb7wQoqdWezzAUY-JSg9T2w@mail.gmail.com>
Subject: Re: [PATCH 18/18] target/riscv: Move configuration check to envcfg
 CSRs predicate()
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 01:59:57 -0000

Hi Palmer,

On Fri, Feb 17, 2023 at 12:40 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 14 Feb 2023 18:22:21 PST (-0800), Bin Meng wrote:
> > On Tue, Feb 14, 2023 at 10:59 PM weiwei <liweiwei@iscas.ac.cn> wrote:
> >>
> >>
> >> On 2023/2/14 22:27, Bin Meng wrote:
> >> > At present the envcfg CSRs predicate() routines are generic one like
> >> > smode(), hmode. The configuration check is done in the read / write
> >> > routine. Create a new predicate routine to cover such check, so that
> >> > gdbstub can correctly report its existence.
> >> >
> >> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> >> >
> >> > ---
> >> >
> >> >   target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
> >> >   1 file changed, 61 insertions(+), 37 deletions(-)
> >> >
> >> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> > index 37350b8a6d..284ccc09dd 100644
> >> > --- a/target/riscv/csr.c
> >> > +++ b/target/riscv/csr.c
> >> > @@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
> >> >   }
> >> >
> >> >   /* Predicates */
> >> > -#if !defined(CONFIG_USER_ONLY)
> >> > -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> >> > -                                       uint64_t bit)
> >> > -{
> >> > -    bool virt = riscv_cpu_virt_enabled(env);
> >> > -    RISCVCPU *cpu = env_archcpu(env);
> >> > -
> >> > -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> >> > -        return RISCV_EXCP_NONE;
> >> > -    }
> >> > -
> >> > -    if (!(env->mstateen[index] & bit)) {
> >> > -        return RISCV_EXCP_ILLEGAL_INST;
> >> > -    }
> >> > -
> >> > -    if (virt) {
> >> > -        if (!(env->hstateen[index] & bit)) {
> >> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >> > -        }
> >> > -
> >> > -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
> >> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >> > -        }
> >> > -    }
> >> > -
> >> > -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> >> > -        if (!(env->sstateen[index] & bit)) {
> >> > -            return RISCV_EXCP_ILLEGAL_INST;
> >> > -        }
> >> > -    }
> >> > -
> >> > -    return RISCV_EXCP_NONE;
> >> > -}
> >> > -#endif
> >> >
> >> >   static RISCVException fs(CPURISCVState *env, int csrno)
> >> >   {
> >> > @@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
> >> >       return umode(env, csrno);
> >> >   }
> >> >
> >> > +static RISCVException envcfg(CPURISCVState *env, int csrno)
> >> > +{
> >> > +    RISCVCPU *cpu = env_archcpu(env);
> >> > +    riscv_csr_predicate_fn predicate;
> >> > +
> >> > +    if (cpu->cfg.ext_smstateen) {
> >> > +        return RISCV_EXCP_ILLEGAL_INST;
> >> > +    }
> >>
> >> This check seems not right here.  Why  ILLEGAL_INST is directly
> >> triggered if smstateen is enabled?
> >
> > This logic was there in the original codes. I was confused when I
> > looked at this as well.
> >
> > Anyway, if it is an issue, it should be a separate patch.
>
> Seems reasonable to me, it's always nice to split up the refactoring types.  So
> I queued this up as 4ac6c32224 ("Merge patch series "target/riscv: Various
> fixes to gdbstub and CSR access"").
>
> I had to fix up the From address on the patch you re-sent and there was a minor
> merge conflict, but otherwise things look sane to me.  I'll hold off on sending
> anything for a bit just in case, though.
>

There are some open comments in this series I need to address. Please
drop this v1. I will send v2 soon.

Regards,
Bin

