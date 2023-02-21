Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUXNu-0001tn-T5
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 13:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pUXNt-0001tV-LN
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 13:29:01 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pUXNq-00048K-S8
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 13:29:01 -0500
Received: by mail-ed1-x535.google.com with SMTP id ck15so22192866edb.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mKhGqbzUzdh+cvl0aOjb6n6e5dqvEUM6gR1QVGE0B3I=;
 b=jhAH7HGs/aWYODn02de53G5/CWuN0NS9v82P4u4/PmUZQnYqIfsVhbqepGanusnxmW
 GSjzfqP0aVInWODiSg7HHBMaPGITRN1LB024e+zukRlZ3/YnnzgWgFtsCbIhilDPB2Pd
 +HJFiROPts49bPfkcGrX2OSmpHqJgbO8uoCRiaQ/JSpBERgklt0dIynj+w9u2/cRh+ni
 P5ea72d+OmgWe2/pkON0h6vMbQAp232wZY2ppPlwKO0VgOkM2aMUWlthJTHmtZW8Ww4T
 DrHeOwPQFoNnTTRm2kluNkGdfbi+yA5TIyANqzQXbXoi74ApeoZijPbQ/F7GQnxnV7es
 p1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mKhGqbzUzdh+cvl0aOjb6n6e5dqvEUM6gR1QVGE0B3I=;
 b=jjZQ7NfQUkmGNlg8GQ2dzUHdgNf3DebOCun4a8R05pM25a1Ab8lk5F4BQurTMy2yYe
 QcBlbF5WI4PzHU+6SE5lubSPUno+xmov7jx3tNNYLhH35rT31ePUDyxQx+R8s8c460nD
 hDk75fkpOUZhRv35y9tS1RG7z40IERmweahwzZCW60E7GYn85EnL0RVsQ3VKfUyDVEZD
 hKIo/rZPeWfNGXQfd00mfCPxxt6uJiTjUH1Cz3pCmcS4ZPpKcERIeCgFUpACI2nEDTFF
 MVN1ORG94pzUcI6DhxI0warFfBr9/LU/mWoNwrBYLKbGPdvN3oIRihHv4Dn2HZJAGM42
 d9IA==
X-Gm-Message-State: AO0yUKXBRZWKRiUIFcufN5DKQsRqr9KEieEShEtGPMjJPUcQNQUOn4V6
 nSoPeTOsv0eMbidZd5+MliwUmQ==
X-Google-Smtp-Source: AK7set9/iP/vkhHNKhpFxtNGPYygXga6VsLGvUr/0R0Cf4mQmRfYSfSQoCwb1rcyWZNMnGEiZFzz8A==
X-Received: by 2002:a17:906:b804:b0:888:9bd6:34d2 with SMTP id
 dv4-20020a170906b80400b008889bd634d2mr11076137ejb.63.1677004136754; 
 Tue, 21 Feb 2023 10:28:56 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a1709064ad400b008d21431e705sm3023570ejt.84.2023.02.21.10.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 10:28:56 -0800 (PST)
Date: Tue, 21 Feb 2023 19:28:55 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org
Subject: Re: [PATCH v6 1/9] target/riscv: turn write_misa() into an official
 no-op
Message-ID: <20230221182855.kcetzqail23eslwu@orel>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-2-dbarboza@ventanamicro.com>
 <d2eee59a-0611-d260-53e5-fd6349642c21@linux.alibaba.com>
 <75c223c9-3709-0595-70f0-11e113d21323@ventanamicro.com>
 <20230221170616.xbdedgmdotd7bryf@orel>
 <56c1aedc-b6f8-633c-fadc-ea88c98169cd@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56c1aedc-b6f8-633c-fadc-ea88c98169cd@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2023 18:29:01 -0000

On Tue, Feb 21, 2023 at 03:22:45PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 2/21/23 14:06, Andrew Jones wrote:
> > On Tue, Feb 21, 2023 at 12:49:11PM -0300, Daniel Henrique Barboza wrote:
> > > Hey,
> > > 
> > > On 2/16/23 22:42, LIU Zhiwei wrote:
> > > > 
> > > > On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> > > > > At this moment, and apparently since ever, we have no way of enabling
> > > > > RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> > > > > the nuts and bolts that handles how to write this CSR, has always been a
> > > > > no-op as well because write_misa() will always exit earlier.
> > > > > 
> > > > > This seems to be benign in the majority of cases. Booting an Ubuntu
> > > > > 'virt' guest and logging all the calls to 'write_misa' shows that no
> > > > > writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> > > > > RISC-V extensions after the machine is powered on, seems to be a niche
> > > > > use.
> > > > > 
> > > > > Before proceeding, let's recap what the spec says about MISA. It is a
> > > > > CSR that is divided in 3 fields:
> > > > > 
> > > > > - MXL, Machine XLEN, described as "may be writable";
> > > > > 
> > > > > - MXLEN, the XLEN in M-mode, which is given by the setting of MXL or a
> > > > > fixed value if MISA is zero;
> > > > > 
> > > > > - Extensions is defined as "a WARL field that can contain writable bits
> > > > > where the implementation allows the supported ISA to be modified"
> > > > > 
> > > > > Thus what we have today (write_misa() being a no-op) is already a valid
> > > > > spec implementation. We're not obliged to have a particular set of MISA
> > > > > writable bits, and at this moment we have none.
> > > > 
> > > > Hi Daniel,
> > > > 
> > > > I see there has been a discussion on this topic. And as no-op has no harmfulness for current implementation.
> > > > However, I still think we should make misa writable as default, which is also a valid spec implementation.
> > > > 
> > > > One reason is that may be we need to dynamic write  access for some cpus in the future. The other is we should
> > > > make QEMU a more useful implementation, not just a legal implementation. We have done in many aspects on this direction.
> > > > 
> > > > I prefer your implementation before v4. It's not a complicated implementation. And I think the other extensions on QEMU currently
> > > > can mostly be configurable already.
> > > 
> > > I don't have a strong opinion in this matter to be honest. My problems with the
> > > existing code are:
> > > 
> > > - the code is untested. I cannot say that this was never tested, but I can say that
> > > this has been mostly untested ever since introduced. Which is normal for a code that
> > > is 'dormant'.
> > > 
> > > - the code is dormant and most likely with bugs, but it's still maintained. For
> > > example we have e91a7227 ("target/riscv: Split misa.mxl and misa.ext") that had
> > > to make changes here. So we have the upkeep but no benefits.
> > > 
> > > - we don't have an use case for it. Most OSes doesn't seem to care, and afaik no
> > > applications seems to care either.
> > > 
> > > 
> > > All this said, I think we can reach a consensus of keeping it if we can at least come
> > > up with a way of testing it.
> > > 
> > > 
> > > > 
> > > > Your work is a good step towards to unify the configuration and the check.  I think two more steps we can go further.
> > > > 
> > > > 1) Remove RVI/RVF and the similar macros, and add fields for them in the configuration struct.
> > > > 
> > > > 2) Unify the check about configuration. write_misa and cpu_realize_fn can use the same check function.
> > > > 
> > > > 
> > > > As we have done these two steps, I think we can go more closely for the profile extension.
> > > 
> > > 
> > > Is this the extension you're taking about?
> > > 
> > > https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
> 
> Zhiwei, I looked it up and at first I don't understand how writing MISA is
> related to this profile extension. Are you suggesting that the firmware
> can choose to run a specific profile and then the hardware must adapt to
> it on the fly? Because if not, then we can implement profiles by just
> passing them in the QEMU command line.
> 
> > > 
> > > 
> > > This looks like a good reason to keep the code. Let's see if anyone else has an opinion
> > > about it. We can do the improvements you mentioned above as a follow-up (this series was
> > > really about removing RISC_FEATURE_*) if we decide to keep it.
> > 
> > If we decide to keep it and not guard it by default, then we should test
> > and fix it now. Also, as we're already aware that it has insufficient
> > sanity checks for extension dependencies, then we should fix our general
> > extension dependency checking now too, in order to apply that to this.
> > IOW, trying to keep this, without some guard on it, opens a can of worms.
> > My vote is the same as it was before, merge this series and then revisit
> > this function when someone has a use/test case for it. Nobody said this
> > was never going to have a different implementation, just that the current
> > implementation is known-buggy and there's no reason to expose it now.
> 
> 
> It wouldn't be not guarded by default. In fact, in case we decide to go back
> to what we were doing a couple of versions ago, I would rename the 'misa-w'
> attribute to 'x-misa-w'.
> 
> The 'x' would be an indication that this is really something experimental and
> expectations must be set accordingly if the user decides to enable it. In
> reality, what this 'x-misa-w' would do is to give us more time to stabilize
> the code inside write_misa(). Ideally we would get rid of it when the code
> is stable.

I'm good with bringing the code back under x-misa-w, which is off by
default.

Thanks,
drew

> 
> 
> 
> Daniel
> 
> > 
> > My only concern with the code deletion is that git-blame doesn't blame
> > deleted code. I think we should add a comment describing the history
> > which includes a git commit reference which can be used to see the
> > latest implementation.
> > 
> > Thanks,
> > drew
> > 
> > > 
> > > 
> > > 
> > > Thanks,
> > > 
> > > 
> > > Daniel
> > > 
> > > > 
> > > > 
> > > > Zhiwei
> > > > 
> > > > > Given that allowing the dormant code to write MISA can cause tricky bugs
> > > > > to solve later on, and we don't have a particularly interesting case of
> > > > > writing MISA to support today, and we're already not violating the
> > > > > specification, let's erase all the body of write_misa() and turn it into
> > > > > an official no-op instead of an accidental one. We'll keep consistent
> > > > > with what we provide users today but with 50+ less lines to maintain.
> > > > > 
> > > > > RISCV_FEATURE_MISA enum is erased in the process since there's no one
> > > > > else using it.
> > > > > 
> > > > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > > > Reviewed-by: Bin Meng <bmeng@tinylab.org>
> > > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > ---
> > > > >    target/riscv/cpu.h |  1 -
> > > > >    target/riscv/csr.c | 55 ----------------------------------------------
> > > > >    2 files changed, 56 deletions(-)
> > > > > 
> > > > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > > > index 7128438d8e..01803a020d 100644
> > > > > --- a/target/riscv/cpu.h
> > > > > +++ b/target/riscv/cpu.h
> > > > > @@ -89,7 +89,6 @@ enum {
> > > > >        RISCV_FEATURE_MMU,
> > > > >        RISCV_FEATURE_PMP,
> > > > >        RISCV_FEATURE_EPMP,
> > > > > -    RISCV_FEATURE_MISA,
> > > > >        RISCV_FEATURE_DEBUG
> > > > >    };
> > > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > > index 1b0a0c1693..f7862ff4a4 100644
> > > > > --- a/target/riscv/csr.c
> > > > > +++ b/target/riscv/csr.c
> > > > > @@ -1329,61 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
> > > > >    static RISCVException write_misa(CPURISCVState *env, int csrno,
> > > > >                                     target_ulong val)
> > > > >    {
> > > > > -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> > > > > -        /* drop write to misa */
> > > > > -        return RISCV_EXCP_NONE;
> > > > > -    }
> > > > > -
> > > > > -    /* 'I' or 'E' must be present */
> > > > > -    if (!(val & (RVI | RVE))) {
> > > > > -        /* It is not, drop write to misa */
> > > > > -        return RISCV_EXCP_NONE;
> > > > > -    }
> > > > > -
> > > > > -    /* 'E' excludes all other extensions */
> > > > > -    if (val & RVE) {
> > > > > -        /* when we support 'E' we can do "val = RVE;" however
> > > > > -         * for now we just drop writes if 'E' is present.
> > > > > -         */
> > > > > -        return RISCV_EXCP_NONE;
> > > > > -    }
> > > > > -
> > > > > -    /*
> > > > > -     * misa.MXL writes are not supported by QEMU.
> > > > > -     * Drop writes to those bits.
> > > > > -     */
> > > > > -
> > > > > -    /* Mask extensions that are not supported by this hart */
> > > > > -    val &= env->misa_ext_mask;
> > > > > -
> > > > > -    /* Mask extensions that are not supported by QEMU */
> > > > > -    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
> > > > > -
> > > > > -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> > > > > -    if ((val & RVD) && !(val & RVF)) {
> > > > > -        val &= ~RVD;
> > > > > -    }
> > > > > -
> > > > > -    /* Suppress 'C' if next instruction is not aligned
> > > > > -     * TODO: this should check next_pc
> > > > > -     */
> > > > > -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> > > > > -        val &= ~RVC;
> > > > > -    }
> > > > > -
> > > > > -    /* If nothing changed, do nothing. */
> > > > > -    if (val == env->misa_ext) {
> > > > > -        return RISCV_EXCP_NONE;
> > > > > -    }
> > > > > -
> > > > > -    if (!(val & RVF)) {
> > > > > -        env->mstatus &= ~MSTATUS_FS;
> > > > > -    }
> > > > > -
> > > > > -    /* flush translation cache */
> > > > > -    tb_flush(env_cpu(env));
> > > > > -    env->misa_ext = val;
> > > > > -    env->xl = riscv_cpu_mxl(env);
> > > > >        return RISCV_EXCP_NONE;
> > > > >    }

