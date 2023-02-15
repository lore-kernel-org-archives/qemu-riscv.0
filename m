Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS7RP-0007nx-DD
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 21:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pS7RN-0007nZ-6b; Tue, 14 Feb 2023 21:22:37 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pS7RK-0000L9-Cq; Tue, 14 Feb 2023 21:22:36 -0500
Received: by mail-ej1-x62a.google.com with SMTP id mc25so7373193ejb.13;
 Tue, 14 Feb 2023 18:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1T6xQeXcykUPkMe9CK3angKeDaq6b04UtRqXSCinhv0=;
 b=WuHJqiPvEBQ7Neh/XGtnY0PwHTm9fsvVAb89NXlaFUj6KRDB/dx+4mtnoPG1Vwdwpn
 wp3KIqnOa9TsdbtoYf3ZksqoFlpfYX1lDpu2oienpS+kn+gB9ypzicR+gEo5EMJIg5Vf
 AJWMoVILSAwbbcZUgJg4JF/jAla3UzkwsFiz0bFTDm9VbrZ5yU+E1pdId1+RUI5BiYDw
 MPbYl4PSJxdhtF0362j0oJCtsCZKaNzfnf/z4nAmNXLGLm9MWnEELABKkdo1IoPe+S3j
 t1oSSJHjh5snMKdkTlFwOS1b3ZjC/jxiuWyTpPyyX8zLuCM8My5dvwAXUqDw5ydYPY6j
 ScQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1T6xQeXcykUPkMe9CK3angKeDaq6b04UtRqXSCinhv0=;
 b=kjBwxPDNAzkLTTtwbbjfyiTYvFOFSs/wxIEnLuAP5o/6QIfm1wVreGnH+CSCEztAk7
 GdoLppa1kjruFTghxVF94qUo/T/ZNoZ8mOj1/1p234b81QJ+Inx2XYc9C9g1sEfhMg0g
 Q27L7w/iEpXLRpdM46wjbDWTjEdIq0VwOdJ3YrdgKLfJEDKuEA7rPFEY5ypGmN2HhiDL
 Ku83zvbjMKO7ETHwKXPa+8RpxlZ5b95r1YY+D7lNqbkiMvK7mRpScD5jtrf/X4m0IOrf
 AykK2JDkY6nytd8iIxdRsyCeDlSvMenBnSzZrk6uFyjVxvqOYL5PBZSqVWUGrPoiDtdy
 8gcw==
X-Gm-Message-State: AO0yUKXe58qIPh0i8WFWJdyJLQWptyOMW8QUnzXR1Flvb6itMjaneV+V
 pYgAllRA5eoLNI96Juw5QTQ15OA+BVab9WtNt8k=
X-Google-Smtp-Source: AK7set/MD9TRBXcAtuo4Q/eWnpJRFMlTiCyKlX9NuWzPcmArUjm83k4pIGsQo4TBvZ6EybLjR7Rg4Pa1t/rIow/IsUo=
X-Received: by 2002:a17:906:af10:b0:877:747c:373e with SMTP id
 lx16-20020a170906af1000b00877747c373emr280878ejb.6.1676427752456; Tue, 14 Feb
 2023 18:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20230213180215.1524938-19-bmeng@tinylab.org>
 <e0c10cb9-c83b-bb35-3041-0f388dc48267@iscas.ac.cn>
In-Reply-To: <e0c10cb9-c83b-bb35-3041-0f388dc48267@iscas.ac.cn>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 10:22:21 +0800
Message-ID: <CAEUhbmX6Qb1aAdZC+d2F=n5qLo60XGiE3e0xTco1TgNgDxAKVg@mail.gmail.com>
Subject: Re: [PATCH 18/18] target/riscv: Move configuration check to envcfg
 CSRs predicate()
To: weiwei <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 02:22:37 -0000

On Tue, Feb 14, 2023 at 10:59 PM weiwei <liweiwei@iscas.ac.cn> wrote:
>
>
> On 2023/2/14 22:27, Bin Meng wrote:
> > At present the envcfg CSRs predicate() routines are generic one like
> > smode(), hmode. The configuration check is done in the read / write
> > routine. Create a new predicate routine to cover such check, so that
> > gdbstub can correctly report its existence.
> >
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> >
> > ---
> >
> >   target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
> >   1 file changed, 61 insertions(+), 37 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 37350b8a6d..284ccc09dd 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
> >   }
> >
> >   /* Predicates */
> > -#if !defined(CONFIG_USER_ONLY)
> > -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> > -                                       uint64_t bit)
> > -{
> > -    bool virt = riscv_cpu_virt_enabled(env);
> > -    RISCVCPU *cpu = env_archcpu(env);
> > -
> > -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -
> > -    if (!(env->mstateen[index] & bit)) {
> > -        return RISCV_EXCP_ILLEGAL_INST;
> > -    }
> > -
> > -    if (virt) {
> > -        if (!(env->hstateen[index] & bit)) {
> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -        }
> > -
> > -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -        }
> > -    }
> > -
> > -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> > -        if (!(env->sstateen[index] & bit)) {
> > -            return RISCV_EXCP_ILLEGAL_INST;
> > -        }
> > -    }
> > -
> > -    return RISCV_EXCP_NONE;
> > -}
> > -#endif
> >
> >   static RISCVException fs(CPURISCVState *env, int csrno)
> >   {
> > @@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
> >       return umode(env, csrno);
> >   }
> >
> > +static RISCVException envcfg(CPURISCVState *env, int csrno)
> > +{
> > +    RISCVCPU *cpu = env_archcpu(env);
> > +    riscv_csr_predicate_fn predicate;
> > +
> > +    if (cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
>
> This check seems not right here.  Why  ILLEGAL_INST is directly
> triggered if smstateen is enabled?

This logic was there in the original codes. I was confused when I
looked at this as well.

Anyway, if it is an issue, it should be a separate patch.

>
> It seems that smstateen related check will be done  for
> senvcfg/henvcfg{h} when smstateen is enabled.
>

Regards,
Bin

