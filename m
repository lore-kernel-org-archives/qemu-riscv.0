Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm62y-0007DA-Um
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm62w-0007Cj-T2; Tue, 11 Apr 2023 00:55:58 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm62v-0007Zl-4L; Tue, 11 Apr 2023 00:55:58 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id a9so6717487vsh.3;
 Mon, 10 Apr 2023 21:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681188955; x=1683780955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cZx0MqiQYGWShtcILn1LNaybvVNchry31ZFtSv5/7o=;
 b=RnI1gm7JzPb1cWamqpL920FWU1IM2zCDhqbxQ1ehRCnYxNnXFPf98oqbtQh5uNqIU4
 0kIgfn31wTl/OEUU8x4p1RtuiN0Z4Ig4NXyDQXWLUtKSn04eM3GwZUqk1GXpn9fO7uBf
 NofERvgMiz5MaHxZE+vm3uLlcP2wqa2bw4/4Dez2xNdU+k0Nr0WXDmQCjqIQ7Q6CFSeT
 8xjhb+Qf4HD9vdEjiMZ1Y3rhkIaW/Dl4Pqm5Ad4FGzeE7Spo+yP0Kgs9957i3xFP/iWw
 EsansAJ/i8mtbsZjYta3yFDAZuWt4Yadl5bjm32ruoV3XDRzJDhaLSaCNHVGGrRiYO6t
 n8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681188955; x=1683780955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cZx0MqiQYGWShtcILn1LNaybvVNchry31ZFtSv5/7o=;
 b=ck9A6CQGGep52ndB+O7I6JimKKIIKC1WVy4yCEa/U4XTYtsJF1++k86PeUSZxjAIXS
 Cw3WYqL5LWceehNw6nSZ3/qgMSQLnXOqNLvdhW8XpHJZYl517K7D2awhQOhC233afjwV
 v6/9eHlrBLDDxvV+dtAxzMfXADP6w/+ebMtNOE60ck/TRJ/A7/AOegEQFdlZna9STU7c
 dmRVFbtcwn9ay6k58xmNZV3+JYrwn4cGfsFTE8sLx72Jri0eHril/UKEdfaCmKPjYrxw
 dzh1Ke/Y70wJTGoSIx/96F569T17Ro4Fdqbcu6wZcvD6TQcwIPM94SkmAMQgbt/50mds
 l06g==
X-Gm-Message-State: AAQBX9dHbO5yr/8QnrDUgje/0Gw1ImZtQKTKN/XowbUeVv2irjKmmj/R
 4Ibn/kAxBqFk7NWLEu/nPOmb+xvHcgNcgz64S7U=
X-Google-Smtp-Source: AKy350Y/FdWgpTXYiIk0YXJ3DbsPApN6PPEmppMoonLyzeJPTfGlgEKrVUe8U5/fgaSozFwE6u7DSKtvpPlm/E0Jkag=
X-Received: by 2002:a05:6102:b16:b0:42c:6f4b:dfec with SMTP id
 b22-20020a0561020b1600b0042c6f4bdfecmr3284804vst.0.1681188955563; Mon, 10 Apr
 2023 21:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-25-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-25-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:55:29 +1000
Message-ID: <CAKmqyKMJV0b60tAektVonn1JzP0mS-HHTe7Hyb7CFPcgAJ8qDQ@mail.gmail.com>
Subject: Re: [PATCH v6 24/25] target/riscv: Reorg access check in
 get_physical_address
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 11 Apr 2023 04:55:59 -0000

On Sat, Mar 25, 2023 at 9:51=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were effectively computing the protection bits twice,
> once while performing access checks and once while returning
> the valid bits to the caller.  Reorg so we do this once.
>
> Move the computation of mxr close to its single use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 69 ++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 33 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 82a7c5f9dd..725ca45106 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -762,7 +762,7 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>   * @is_debug: Is this access from a debugger or the monitor?
>   */
>  static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> -                                int *prot, target_ulong addr,
> +                                int *ret_prot, target_ulong addr,
>                                  target_ulong *fault_pte_addr,
>                                  int access_type, int mmu_idx,
>                                  bool first_stage, bool two_stage,
> @@ -793,20 +793,14 @@ static int get_physical_address(CPURISCVState *env,=
 hwaddr *physical,
>
>      if (mode =3D=3D PRV_M || !riscv_cpu_cfg(env)->mmu) {
>          *physical =3D addr;
> -        *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        *ret_prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>          return TRANSLATE_SUCCESS;
>      }
>
> -    *prot =3D 0;
> +    *ret_prot =3D 0;
>
>      hwaddr base;
> -    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
> -
> -    if (first_stage =3D=3D true) {
> -        mxr =3D get_field(env->mstatus, MSTATUS_MXR);
> -    } else {
> -        mxr =3D get_field(env->vsstatus, MSTATUS_MXR);
> -    }
> +    int levels, ptidxbits, ptesize, vm, sum, widened;
>
>      if (first_stage =3D=3D true) {
>          if (use_background) {
> @@ -849,7 +843,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>        levels =3D 5; ptidxbits =3D 9; ptesize =3D 8; break;
>      case VM_1_10_MBARE:
>          *physical =3D addr;
> -        *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        *ret_prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>          return TRANSLATE_SUCCESS;
>      default:
>        g_assert_not_reached();
> @@ -984,6 +978,27 @@ restart:
>          return TRANSLATE_FAIL;
>      }
>
> +    int prot =3D 0;
> +    if (pte & PTE_R) {
> +        prot |=3D PAGE_READ;
> +    }
> +    if (pte & PTE_W) {
> +        prot |=3D PAGE_WRITE;
> +    }
> +    if (pte & PTE_X) {
> +        bool mxr;
> +
> +        if (first_stage =3D=3D true) {
> +            mxr =3D get_field(env->mstatus, MSTATUS_MXR);
> +        } else {
> +            mxr =3D get_field(env->vsstatus, MSTATUS_MXR);
> +        }
> +        if (mxr) {
> +            prot |=3D PAGE_READ;
> +        }
> +        prot |=3D PAGE_EXEC;
> +    }
> +
>      if ((pte & PTE_U) &&
>          ((mode !=3D PRV_U) && (!sum || access_type =3D=3D MMU_INST_FETCH=
))) {
>          /*
> @@ -996,17 +1011,9 @@ restart:
>          /* Supervisor PTE flags when not S mode */
>          return TRANSLATE_FAIL;
>      }
> -    if (access_type =3D=3D MMU_DATA_LOAD &&
> -        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
> -        /* Read access check failed */
> -        return TRANSLATE_FAIL;
> -    }
> -    if (access_type =3D=3D MMU_DATA_STORE && !(pte & PTE_W)) {
> -        /* Write access check failed */
> -        return TRANSLATE_FAIL;
> -    }
> -    if (access_type =3D=3D MMU_INST_FETCH && !(pte & PTE_X)) {
> -        /* Fetch access check failed */
> +
> +    if (!((prot >> access_type) & 1)) {
> +        /* Access check failed */
>          return TRANSLATE_FAIL;
>      }
>
> @@ -1071,20 +1078,16 @@ restart:
>                    (vpn & (((target_ulong)1 << ptshift) - 1))
>                   ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>
> -    /* set permissions on the TLB entry */
> -    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> -        *prot |=3D PAGE_READ;
> -    }
> -    if (pte & PTE_X) {
> -        *prot |=3D PAGE_EXEC;
> -    }
>      /*
> -     * Add write permission on stores or if the page is already dirty,
> -     * so that we TLB miss on later writes to update the dirty bit.
> +     * Remove write permission unless this is a store, or the page is
> +     * already dirty, so that we TLB miss on later writes to update
> +     * the dirty bit.
>       */
> -    if ((pte & PTE_W) && (access_type =3D=3D MMU_DATA_STORE || (pte & PT=
E_D))) {
> -        *prot |=3D PAGE_WRITE;
> +    if (access_type !=3D MMU_DATA_STORE && !(pte & PTE_D)) {
> +        prot &=3D ~PAGE_WRITE;
>      }
> +    *ret_prot =3D prot;
> +
>      return TRANSLATE_SUCCESS;
>  }
>
> --
> 2.34.1
>
>

