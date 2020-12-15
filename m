Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kp6mo-0001YE-2T
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 04:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kp6mi-0001X5-TA; Tue, 15 Dec 2020 04:38:23 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kp6mh-0005uV-8M; Tue, 15 Dec 2020 04:38:20 -0500
Received: by mail-yb1-xb42.google.com with SMTP id j17so18318009ybt.9;
 Tue, 15 Dec 2020 01:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pph+Y1E2QGiM9vvSTKeuV7rOj4n+JAOwnhbD9mJ2qLo=;
 b=jh/nxfmBJws3dRLWi2pO9qfJuo2uo/KyfcujnOvXoICC2wh4Ue9T4OwKot2n8OqHqp
 nnpFYeFTQXeFSqMwT4MsXZaVwOvqvFhlT8dL6Gmuf0KzBSN0iRGHpuQKfv+/wY65W4vS
 uAI9w1eOf/ItuXLx6eBw31bJk0pabBaJ/ryKrQxawlVGiGY0urVYK+Os0IF8S4sN5Cjf
 ll6MeauKeuWXdrspjR1SVTEmllCCp+Faqav72AEFXhCyuLByfO3tqpu8C3/+aFjrbzrq
 ZSu97B0UAJJpYhdrDhN8dcsLynbUCC+ZgYLq+VzXyPBC1IQcCbzOo/VaUp5rfet0+Sj8
 BYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pph+Y1E2QGiM9vvSTKeuV7rOj4n+JAOwnhbD9mJ2qLo=;
 b=uXUn8d73j2ih6tfJcw1dvtHR2qGGoxEFvsa38VRhhnYm67IyvvxhSrlnUBg7MWgDo5
 TNAp86+okxR06mX0FECL/maplf5cXL1D16LnsFRicvMZhrBbP5b+DKQ43rMv2qUKTiD/
 0f0KwTHGihIqiWLONSl/ErkMuWRy/LVjNw1Dj5i3BqiCoNG0MpIMffDvb/4UxGPSIs63
 WM4Gl6Z/d43mll+/TgHOWKfUc4ffd5LvhCDYMhuUMRZUXCGXUn6qMiGfO+kXasKEJt3e
 3li0h6H1qGw4scGlaEHNX8WJ9JELlN1E2IX4MKdPrc4PZRKJDwJun3TgEwPVwGgWIFEs
 sHVw==
X-Gm-Message-State: AOAM533amw+Hx9BwMzyiKS66iYwMd0Q+K1BN0wLfpuB5dMqxuK4oSry0
 sRsmhXpMZvP/AeHl9kQ+QA0J3ARP8OHev5R5Mfw=
X-Google-Smtp-Source: ABdhPJzZiEQT0nZPYL4IWZ2aZHv2ni/NP2n6tgS06aHibN3YkCROhWGLLLULlyRt2ThO5fOQVsct/Gfrq4TVxLADmy4=
X-Received: by 2002:a25:4744:: with SMTP id u65mr45722065yba.239.1608025097845; 
 Tue, 15 Dec 2020 01:38:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <2cffe9cb8055c9451872b3a08192e19fec12fb1a.1607967113.git.alistair.francis@wdc.com>
In-Reply-To: <2cffe9cb8055c9451872b3a08192e19fec12fb1a.1607967113.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Dec 2020 17:38:06 +0800
Message-ID: <CAEUhbmUhKuhEPU=RyRN3CVYDh=oGoQF1e-tSX=jODw4c2Ub1kA@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
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
X-List-Received-Date: Tue, 15 Dec 2020 09:38:24 -0000

Hi Alistair,

On Tue, Dec 15, 2020 at 4:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The helper functions defined in helper.h specify that the argument is of

I can't find the helper.h that declare these functions?

> type target_long. Let's change the implementation to match the header
> definition.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/fpu_helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index bb346a8249..507d7fe7fa 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -224,13 +224,13 @@ target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
>  }
>
>  #if defined(TARGET_RISCV64)
> -uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
> +target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      return float32_to_int64(frs1, &env->fp_status);

float32_to_int64() returns int64_t, so there is a truncation if
changing it to target_ulong for 32-bit.

>  }
>
> -uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
> +target_ulong helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      return float32_to_uint64(frs1, &env->fp_status);
> @@ -248,12 +248,12 @@ uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
>  }
>
>  #if defined(TARGET_RISCV64)
> -uint64_t helper_fcvt_s_l(CPURISCVState *env, uint64_t rs1)
> +uint64_t helper_fcvt_s_l(CPURISCVState *env, target_ulong rs1)
>  {
>      return nanbox_s(int64_to_float32(rs1, &env->fp_status));
>  }
>
> -uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t rs1)
> +uint64_t helper_fcvt_s_lu(CPURISCVState *env, target_ulong rs1)
>  {
>      return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
>  }
> @@ -337,12 +337,12 @@ target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
>  }
>
>  #if defined(TARGET_RISCV64)
> -uint64_t helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
> +target_ulong helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
>  {
>      return float64_to_int64(frs1, &env->fp_status);
>  }
>
> -uint64_t helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
> +target_ulong helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
>  {
>      return float64_to_uint64(frs1, &env->fp_status);
>  }
> @@ -359,12 +359,12 @@ uint64_t helper_fcvt_d_wu(CPURISCVState *env, target_ulong rs1)
>  }
>
>  #if defined(TARGET_RISCV64)
> -uint64_t helper_fcvt_d_l(CPURISCVState *env, uint64_t rs1)
> +uint64_t helper_fcvt_d_l(CPURISCVState *env, target_ulong rs1)
>  {
>      return int64_to_float64(rs1, &env->fp_status);
>  }
>
> -uint64_t helper_fcvt_d_lu(CPURISCVState *env, uint64_t rs1)
> +uint64_t helper_fcvt_d_lu(CPURISCVState *env, target_ulong rs1)
>  {
>      return uint64_to_float64(rs1, &env->fp_status);
>  }

Regards,
Bin

