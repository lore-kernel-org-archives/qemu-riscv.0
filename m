Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm4rr-0003fD-Iw
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4rn-0003eq-KW; Mon, 10 Apr 2023 23:40:23 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4rl-0000xN-Og; Mon, 10 Apr 2023 23:40:23 -0400
Received: by mail-ua1-x92b.google.com with SMTP id z23so4743379uav.8;
 Mon, 10 Apr 2023 20:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681184419; x=1683776419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2L+gG7C4IDVZYm9AdMbcfEMZg6MShSRpd0ab4+qTyE=;
 b=nat+M5XpxzRQi6b0HSaFtdSSq2jbPZFDUBmKmtSTlCCukr9rZvljIxpMuM4VqBsc39
 LUn5CZOyEULvr4PZOD+KchtFMKM7d7Fg972iGqo9A2lMC17oHAVkE16s4GYWti9VFJhG
 QudEQDRBECc9wZ5ckZjRSJ7wOtBvmNuElD9Bwm7OrLl9m9jZPS+93Q9Y6JkRHedRaU05
 +15WoR8zy0DQHe3NOxDmjltlqQbC63FWDliUp67XuPYRCnvXEelToAcY9U+3TChoX1nV
 ZUQf4B19/mTusEx4A4RQEwHBpC6JpW0nsvOmIVfp0woqeyni248F8ffXp/FWMt4UNjDu
 G2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681184419; x=1683776419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2L+gG7C4IDVZYm9AdMbcfEMZg6MShSRpd0ab4+qTyE=;
 b=aLPp3z14+qzBbA2amhBt5lJ8zH1jtK5gbosmQT7XqHKXFpywaBErUtaHJZQnaiqNk5
 nCC54VJ+WM6RD7Gf1mvOYm59SD053NrYOjANQsZTSEvJT37mrkDYYVhBzfPXFHwA+F8p
 QhDOYiyLLs6b9dGTX8Bhz8qOja5D1OTPRnLX5mm7iDWisICCd6hrU2F61F+z9Ou8YefD
 uFk4hqeWv3UTpWsPfjWzHvLMBBUIVq7HYU8/NV8zfUXyawalo+gWgf2iiKusXAGqCtzT
 /85mTu+qSxFncbuolFQgK1OLoTkjUcSkpd6NtFkpPZfRQsBB7rAexNdlxupdgyvwRKzU
 DlLw==
X-Gm-Message-State: AAQBX9fYRpBOpK6jB02nnCMcSCSor16GwFvu+kPzX4Jjz4jeDc9+SLgX
 2k6NHk4oJwSHVvq/SJn8RVR7WSL/R+/ju8k0yKQ=
X-Google-Smtp-Source: AKy350Yh8ZTUjdw+lQdgKKPDjEEP+znoHy4yDtMnINvI89LvWtsVxcwh+Oj1YwvbLsG833npuVrAkmt1XnFtM1UZlQw=
X-Received: by 2002:ab0:5b8c:0:b0:765:c225:c914 with SMTP id
 y12-20020ab05b8c000000b00765c225c914mr7999286uae.1.1681184419099; Mon, 10 Apr
 2023 20:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-13-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-13-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:39:53 +1000
Message-ID: <CAKmqyKO1RfCANJZGWoWNu-M=1RYE1Gj5aQ3TfQnmf1x0z_gO7Q@mail.gmail.com>
Subject: Re: [PATCH v6 12/25] target/riscv: Introduce mmuidx_sum
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:40:25 -0000

On Sat, Mar 25, 2023 at 9:55=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In get_physical_address, we should use the setting passed
> via mmu_idx rather than checking env->mstatus directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/internals.h  | 5 +++++
>  target/riscv/cpu_helper.c | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 7b63c0f1b6..0b61f337dd 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -37,6 +37,11 @@
>  #define MMUIdx_M            3
>  #define MMU_2STAGE_BIT      (1 << 2)
>
> +static inline bool mmuidx_sum(int mmu_idx)
> +{
> +    return (mmu_idx & 3) =3D=3D MMUIdx_S_SUM;
> +}
> +
>  /* share data between vector helpers and decode code */
>  FIELD(VDATA, VM, 0, 1)
>  FIELD(VDATA, LMUL, 1, 3)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 888f7ae0ef..7e6cd8e0fd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -852,7 +852,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>          widened =3D 2;
>      }
>      /* status.SUM will be ignored if execute on background */
> -    sum =3D get_field(env->mstatus, MSTATUS_SUM) || use_background || is=
_debug;
> +    sum =3D mmuidx_sum(mmu_idx) || use_background || is_debug;
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels =3D 2; ptidxbits =3D 10; ptesize =3D 4; break;
> --
> 2.34.1
>
>

