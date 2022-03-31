Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1na32V-0002Ar-9i
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 18:13:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1na32P-00027j-Ry; Thu, 31 Mar 2022 18:13:08 -0400
Received: from [2607:f8b0:4864:20::d2e] (port=36835
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1na32N-00008N-BN; Thu, 31 Mar 2022 18:13:05 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b16so1204830ioz.3;
 Thu, 31 Mar 2022 15:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGiLCSdDqf0Qc9gs/x29dNMZY61XRE1r90GaN1X6Zx8=;
 b=LJFjktyDQr5Z+j10MzHSi4ZEMPleRmpAU+0ill0SBM2A/tlDXrQVLd5HgqSSC5SKcE
 IYoLIRy/4zAIRJ4lUfKQdGby9EEDhrmuOSniNhmfdb6qjxqYfxTjNr+rDwLfIXmN7kMy
 XQBJAiX7z6NvmKHTT1U3iNCY8JRSyAv3p43JnLI1BgT0b9mfvTjiUJ3gSe2eBxXsL9ZR
 sb3f6zl4xkCUWPILs1uCfpzYuUERVcDIj5iIMn6AXWpwpHrmYrrVQz1mymBUNQD8ewa3
 mc3j+nZh19FdEVzjUaOk1i7bi9Hc6F9XguKO5uKGDdi0v+5XpOk9oblf1cX/F6mVGzLE
 h7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGiLCSdDqf0Qc9gs/x29dNMZY61XRE1r90GaN1X6Zx8=;
 b=2bMrArxJSBCWWl0w8Q4JinDKVKHcMhrxp+JkDAc7Clg5HZofMg8mZP28aLHNxviBI+
 /eR+HwbCdbAfAg2LQufVGSMAcmsEviZb3wRSMeOFACb7UL0pbwZsF+rXbT5Y4ISFhVtY
 AX7fvqUtBFU3GJ/3d4dtQVly+SXbql4+TYY2oXhPg2DLd2K6My1bYXrZVsYKEC4d8xDq
 qi6YlkXWAuewT36GFuDKFltsuD+5fMHQfvrVj9GZI1sZv3lnMxyMnQ+4JwtFzPQtvZ/W
 pcF81Arg77ax38s7Bb6/VxEnbnmPltsuM5d42R+7/d9XaD+YMll1BCw3amEUFZRWHAn6
 OZag==
X-Gm-Message-State: AOAM532PFpanB+sADDstzA+SC9uCwcYt3Ua6dZ8ljDD8hZ81wH2vqe+z
 DJOcvSY7PyX7ChglqhiFn894qn78RkXLdLjHUg4E38wp4rjnsOiD
X-Google-Smtp-Source: ABdhPJyLxVUnV0YB6rNNboSEAaxvke2mbm0qFuBwf1o8xvuEZIA2L38oupvGCISvLpBiFJpc7WsXeHdwt1zbyrwSx0w=
X-Received: by 2002:a05:6638:3727:b0:323:acce:dd0c with SMTP id
 k39-20020a056638372700b00323accedd0cmr2091671jav.267.1648764781196; Thu, 31
 Mar 2022 15:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220330165913.8836-1-palmer@rivosinc.com>
In-Reply-To: <20220330165913.8836-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Apr 2022 08:12:35 +1000
Message-ID: <CAKmqyKOn6ABmA2SZgXvhMq=2q_m7faPYanDQcxhyGEx_34oFrw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Avoid leaking "no translation" TLB entries
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 22:13:09 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

