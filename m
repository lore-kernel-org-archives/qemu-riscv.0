Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mD1uS-0006f6-4K
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 05:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mD1uQ-0006Xm-8i; Mon, 09 Aug 2021 05:49:26 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mD1uO-0002Ok-Mz; Mon, 09 Aug 2021 05:49:26 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id c137so27968426ybf.5;
 Mon, 09 Aug 2021 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PrHpvK97It637PSbAxyMOq7cMQvzIspToMw8Q6umli8=;
 b=pZlanwEa8Y7c70UZ5Q33LAYHBt1fv4FNwfgisJafBMLCnYmHM+kY0MEIBplewGQ+S3
 7cbOr8XKPYjKXsPkUalDhnfkl+91C5tCdcz+RovZ4Zz0cZXbv5EuhEXDNPdnwTM/34MD
 USw4/MS9I7Bg+r7rSSjTEppLv7S6nredYCwxaeJCsMtIjis1QQ5zCbqQFR5n9/sm2ETl
 z3nf54/XgV0c1JE1KzxGCFeUc3ZJCc5kV8rbOhQrJtwm+iAyIxtxb/gfpIRfwsjxYghE
 jYT2AF1jOzfEmQxp+sOPW5GmNp5Pfn274V/Z37EjZyXLyX5RINeIYesgENRrfd0qCqD/
 5JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PrHpvK97It637PSbAxyMOq7cMQvzIspToMw8Q6umli8=;
 b=LNwYO3T1ZppZS5cCFRR23IEBABUf5We2+SBPUGH3bmODr3FurPJZ1dWFnebLuOK6UB
 6iaVaqBeZbV5rJ/VFEpSEzWlq9r0JCDztBeg91tgo+WBKign2q1HSNDuqDBm6esyGNSE
 NKA+RJbXXX+Y0Ix9K7MJn8fOuA02/5GG9pogMAeiHwdZuMGqqRt/EkqNkHjoohpeQn1c
 5vkH3xZfNDyXWI3nmoNmIIP1ntOTaYU2xYmht7ghwyJOE3PLjmZ3e18cYem/KEqK2PiU
 +4hMweDiNOQ8n/QEIsccLnjrNWT2JxYaPVMDtkX6Wv0IE1z6WT3Y+gSpnAdGl0LSxkY3
 vKIQ==
X-Gm-Message-State: AOAM532OANyVjOZovwXMHnJs8/1E81B7PigbaMjEoCXWZeCUn3rR0pla
 s1s9p33SJDJJZgvraHu8/YF4IBBu6RRRwslbIJE=
X-Google-Smtp-Source: ABdhPJwMPI3yobqHn/7k8FuyCL7VxYvOJvQmdYbIZxFwyuze1skrTTtfVrpQVuNqaiqho/K0IdGiXaEiJQ4dUDxhVTU=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr31868602ybg.306.1628502563346; 
 Mon, 09 Aug 2021 02:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210809070727.9245-1-zhiwei_liu@c-sky.com>
 <CAEUhbmXNPE8cmor-V8Vpza79Vt=hgKsP1OE_zeJupAaaF0UdqA@mail.gmail.com>
 <9c3b4476-d640-0b7f-df48-c91ebde2dab6@c-sky.com>
In-Reply-To: <9c3b4476-d640-0b7f-df48-c91ebde2dab6@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Aug 2021 17:49:12 +0800
Message-ID: <CAEUhbmU1SNVeE2qKtY4841Na8=zL+V9qeC6q7YWW=-piV7-MTQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add User CSRs read-only check
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 09 Aug 2021 09:49:26 -0000

On Mon, Aug 9, 2021 at 5:45 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/8/9 =E4=B8=8B=E5=8D=885:35, Bin Meng wrote:
> > On Mon, Aug 9, 2021 at 3:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> > nits: please write something in the commit message
> OK
> >
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >> ---
> >>   target/riscv/csr.c | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 9a4ed18ac5..ea62d9e653 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -1422,11 +1422,11 @@ RISCVException riscv_csrrw(CPURISCVState *env,=
 int csrno,
> >>       RISCVException ret;
> >>       target_ulong old_value;
> >>       RISCVCPU *cpu =3D env_archcpu(env);
> >> +    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
> >>
> >>       /* check privileges and return -1 if check fails */
> >>   #if !defined(CONFIG_USER_ONLY)
> >>       int effective_priv =3D env->priv;
> >> -    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
> >>
> >>       if (riscv_has_ext(env, RVH) &&
> >>           env->priv =3D=3D PRV_S &&
> >> @@ -1443,6 +1443,10 @@ RISCVException riscv_csrrw(CPURISCVState *env, =
int csrno,
> >>           (!env->debugger && (effective_priv < get_field(csrno, 0x300)=
))) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >> +#else
> >> +    if (write_mask && read_only) {
> > This can be merged by the !CONFIG_USER_ONLY case.
>
> Do you mean
>
> #if !defined(CONFIG_USER_ONLY)
>       if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
>           return -RISCV_EXCP_ILLEGAL_INST;
> }
> #else

Should be #endif

>       if (write_mask && read_only) {
>           return -RISCV_EXCP_ILLEGAL_INST;
> }
>
> #endif

and drop this #endif

Regards,
Bin

