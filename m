Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZmwU-0001uQ-3H
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 01:01:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZmwS-0001u4-IV; Thu, 31 Mar 2022 01:01:52 -0400
Received: from [2607:f8b0:4864:20::129] (port=47055
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZmwP-0000tU-W6; Thu, 31 Mar 2022 01:01:52 -0400
Received: by mail-il1-x129.google.com with SMTP id j15so15952197ila.13;
 Wed, 30 Mar 2022 22:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7RlH3LebpC8Ip1DrZBoxOPQ5pKEGlIY9FS5YAvEsv8=;
 b=OTZxglr+9c6seBAuKBV99Y9rr0jrjEFnI5o1fOpZzXSZzXCWjY+CB8ChKoldoa8YVD
 oIzeTjkWQuf7m4AUFjUx39SGxhWGHejpHPrKQVZvaDT8VtZVBWq8itOJRe/kmNMaZE/c
 1Ct+RL3oi1C4R4IY5PKaKnTqsC9aKtT0/DxaD5U0xvt9nXvbPdvtiZGyfgUjz4tvN+4y
 eFtOOCf94xwfzXa2D2fXaovTHprxZbWBOF7+nGYcUM6L1W+aOT1fu921nehnQ/XS+n3Y
 6/Ny4bqoyPYmpAbZQ5McjZp+MY0FfCRS+XMMLYui0WtTUrIbTKANwf/pu10Xa6NwW2lF
 yTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7RlH3LebpC8Ip1DrZBoxOPQ5pKEGlIY9FS5YAvEsv8=;
 b=Qrgseo/K/X9nwI1VVwMNrMIGYYcou9Pc/3MYbfrXgZBk3ZRmX/9FtZvaAOd9PNXNBp
 GzWD+0DEmgDRqtutamvDPjeNgX0ekAE2v8C50KbBkd0+GSu3Q1x8fHBODq4lKbyfAyh3
 FEAV28m4qsieAmgCzgmkc27ldX9KoIxqihG80OeY0DiF9wqAP611pRipC5dfiVkmGfpy
 hjohqRCaVi+e1RR4ntx9lqBV0GdV1iD+xhfVgbEhiyjTestPwvYF8TXQ7U7vOW9pcmig
 bjpEuTMnM+sWrvFuVvAsO6SbGdW6WsqyXR5N7/8wd0xwqFjlLMaC4Kb79mIuQn3vlwf5
 Z9zw==
X-Gm-Message-State: AOAM532aILyQ+uQfE9bNblWH6uWRfdD04sidCKmVXn/N2vjvBdle3Xrc
 lBuxs/TsuoHVQPvYdREZkVlP1fCny50Q2IEftRQ=
X-Google-Smtp-Source: ABdhPJzZm93CBbAVByA9yRSDi9TbQWqCEwQ4003Rbqs/OEIzEfMBt4v+mz4g5XRIljdQF995yqOoc7F7tIitqvCV9/Q=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr12858944ilb.86.1648702907720; Wed, 30
 Mar 2022 22:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220330165913.8836-1-palmer@rivosinc.com>
In-Reply-To: <20220330165913.8836-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 15:01:21 +1000
Message-ID: <CAKmqyKOyKicnjaPP+JFzOpRwgbtq80d14mpo+K-L1HGVCQ6sZQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Avoid leaking "no translation" TLB entries
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
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
X-List-Received-Date: Thu, 31 Mar 2022 05:01:52 -0000

On Thu, Mar 31, 2022 at 3:11 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The ISA doesn't allow bare mappings to be cached, as the caches are
> translations and bare mppings are not translated.  We cache these
> translations in QEMU in order to utilize the TLB code, but that leaks
> out to the guest.
>
> Suggested-by: phantom@zju.edu.cn # no name in the From field
> Fixes: 1e0d985fa9 ("target/riscv: Only flush TLB if SATP.ASID changes")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Another way to fix this would be to utilize a MMU index that cooresponds
> to no ASID to hold these direct mappings, but given that we're not
> currently taking advantage of ASIDs for translation performance that
> would be a larger chunk of work.  This causes a Linux boot regression,
> so the band-aid seems appropriate.
>
> I think the original version of this was also more broadly broken, in
> that changing to ASID 0 would allow old mappings, but I might be missing
> something there.  I seem to remember ASID 0 as having been special at
> some point, but it's not in the ISA as it stands so maybe I'm just
> crazy.
>
> This, when applied on top of Alistair's riscv-to-apply.next, boots my
> for-next (which is very close to Linus' master).
> ---
>  target/riscv/csr.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0606cd0ea8..cabef5a20b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1844,7 +1844,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>  static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    target_ulong vm, mask, asid;
> +    target_ulong vm, mask;
>
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return RISCV_EXCP_NONE;
> @@ -1853,20 +1853,22 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
>          vm = validate_vm(env, get_field(val, SATP32_MODE));
>          mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
> -        asid = (val ^ env->satp) & SATP32_ASID;
>      } else {
>          vm = validate_vm(env, get_field(val, SATP64_MODE));
>          mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
> -        asid = (val ^ env->satp) & SATP64_ASID;
>      }
>
>      if (vm && mask) {
>          if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>              return RISCV_EXCP_ILLEGAL_INST;
>          } else {
> -            if (asid) {
> -                tlb_flush(env_cpu(env));
> -            }
> +           /*
> +            * The ISA defines SATP.MODE=Bare as "no translation", but we still
> +            * pass these through QEMU's TLB emulation as it improves
> +            * performance.  Flushing the TLB on SATP writes with paging
> +            * enabled avoids leaking those invalid cached mappings.
> +            */
> +            tlb_flush(env_cpu(env));
>              env->satp = val;
>          }
>      }
> --
> 2.34.1
>
>

