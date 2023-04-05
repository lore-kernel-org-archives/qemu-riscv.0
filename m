Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjwEZ-0001bc-Gq
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 02:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwEX-0001bG-0p; Wed, 05 Apr 2023 02:03:01 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwEV-00069s-28; Wed, 05 Apr 2023 02:03:00 -0400
Received: by mail-ua1-x932.google.com with SMTP id t20so7348540uaw.5;
 Tue, 04 Apr 2023 23:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680674577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EV6fhwStLX6DcJsla9gqnmpGq8wEwPcdWdDR3iglnNA=;
 b=oXjHDOPSta85SEYNIos9Gah8E+MnnvnH29NMx3mE9IQhnZaJsvw+Q9qrZNaj3MaOni
 6JhouzkWWbk3w2IczN8NAcYNj9GcVWkM8J7nbqkZ/btckQMTN4P8LLoUpo99VRtX7NIy
 SAsKz8lmoVACTLFgvtEcvoi50oFztd3uFwzSDyoITIdFWtcMK0Gtb7Fubr1dlYTqql7R
 xC/YZADu/iko4JEs41cwjNBei4b7fCHhvPU3WTsznRmhZUdjpGlX0h0LA2E4nYOYe9wl
 4Fp37UQPc56tSo99Vgd4jnu9ddZTstHIjvklPqPPJZZjTpQl+wbUMI8NWRC00bPZgivD
 1eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680674577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EV6fhwStLX6DcJsla9gqnmpGq8wEwPcdWdDR3iglnNA=;
 b=K3nevG6ffVwpmqgsDJASmX3sDOz0O97tBZyZoyrnhtFYa/cy9mPgpAZbIIcecWTVdg
 YtvMKpYvNnwtjVduDDADDtNtlP7zS1OtPYGin3vzh99hhqt9JEUELemRKj6QCUMHk8l7
 Ux5kZpHlYmLJeqbe/fwm9QfeF5yTPIeJVsKuVEpHGgABHiDl3JqVuWUnyo00c9jsZCif
 9oZluQaQ0ZttD8KPmI6eTd9Rbc2EIQqtMZBonNSftxO29MY08ItVbXC/t+HdhrYdBLlI
 28x28Ob2Ub9ULc0S0Ht1uTkRDxsnChc7tRKVU+J9zyJxydt3TsC/XUXhKVx3uil9mTU7
 uCWA==
X-Gm-Message-State: AAQBX9dBsQX75AA5DB/nwRYz8AUKty3wyvEEHJpS7p5m0v9DQH5MWRxb
 wFswZt8FfiGZzE9a9JNyWye6o3F81XpkrZxLsf8=
X-Google-Smtp-Source: AKy350YRT+7ySwtZPQ+UFwDVexM505pskK1tS1ZcNopmQGb0zeCAMzTp1bmBerDXrT4r0+7bICFMzvud70wFsAVxn5g=
X-Received: by 2002:a9f:305c:0:b0:68a:5c52:7f2b with SMTP id
 i28-20020a9f305c000000b0068a5c527f2bmr3365842uab.1.1680674577142; Tue, 04 Apr
 2023 23:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:02:31 +1000
Message-ID: <CAKmqyKODX+VvSm5374KSsdVkyUFzHPttfPnxyuNX0TSAs77BHA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix addr type for get_physical_address
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 06:03:01 -0000

On Wed, Mar 29, 2023 at 8:20=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Function get_physical_address() translates both virtual address and
> guest physical address, and the latter is 34-bits for Sv32x4. So we
> should use vaddr type for 'addr' parameter.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..cd6fbaeddc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -739,7 +739,7 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>   * @env: CPURISCVState
>   * @physical: This will be set to the calculated physical address
>   * @prot: The returned protection attributes
> - * @addr: The virtual address to be translated
> + * @addr: The virtual address or guest physical address to be translated
>   * @fault_pte_addr: If not NULL, this will be set to fault pte address
>   *                  when a error occurs on pte address translation.
>   *                  This will already be shifted to match htval.
> @@ -751,7 +751,7 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>   * @is_debug: Is this access from a debugger or the monitor?
>   */
>  static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> -                                int *prot, target_ulong addr,
> +                                int *prot, vaddr addr,
>                                  target_ulong *fault_pte_addr,
>                                  int access_type, int mmu_idx,
>                                  bool first_stage, bool two_stage,
> --
> 2.25.1
>
>

