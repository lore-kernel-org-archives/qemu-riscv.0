Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdDCE-0006e1-6p
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 11:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdDC9-0006bz-G3; Wed, 20 Oct 2021 11:07:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdDC6-0003RJ-RB; Wed, 20 Oct 2021 11:07:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 77-20020a1c0450000000b0030da2439b21so2565166wme.0; 
 Wed, 20 Oct 2021 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BuctDYWOCUxUSqgxbj2U7nMheTqAbIzFCYzFQBRp+Ng=;
 b=SJ0/n5e5OfRN05x0sPa72TSR6D0xTxiXhddXX7RhVUn5B65e5Ch7DRVXXrgIsNSIUH
 4duYYWhgl2wcSY47ozX/TraWZv11NePuK1KuApiCtuDX4I1lpIk7u3TmjO3xSfpf6+Ui
 R+RfyPD8bakIQuN4stkmTiU/YHnequEYnx4YLuDQ+f/J2kuAVkey078wTQwm8/0Ak/pV
 BXCtKDzfnYPOtx4KMVL+UYzHqBWIvXir54M23dxd2W/ClMAGE8Lq/i7+4zN672Nxq7Pf
 cRil+1/YV+NNRoqAz6rPgpGh8aouVzVgRYMgKAE3W5vyaP44gO5AZmEUeMAklEs0opoz
 uDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BuctDYWOCUxUSqgxbj2U7nMheTqAbIzFCYzFQBRp+Ng=;
 b=GEr88OWk1cOmfhOSxOySKKuyDAq6B5b84AxFu+iRd+K33oNIMbER3US1NPGgQJwnsf
 75ec1epsUlw8X1U68H5kGj/qP3kloRkhsBdnFB3oql7ZCExE/gTLtyWav91mn9uP/42n
 +DLwprWonA+CF4XvP0eaSJoNO1wE8PiNc428ERft+NjvGuz4TH1PCe9oEDwSXiuGTdxB
 p8MGyT0slsHH7TtvAn5tMYiBmo/hrgXUvM178IpHhWvH7uZHH/e2gOYU5dAM0N7mynQL
 WViRu6lhx9kLqES+C54LqMt43y284sqIUsGQpXHiRS3AgkRJzoPIkUePIedo5ZKILqA+
 cIbQ==
X-Gm-Message-State: AOAM530QxxpmdekRKBCR2KhGYZkPLH1c1hox2pM8ydJiKr1jepwlTkjz
 HziQx3Cx1uBEUy1msUS/uC8=
X-Google-Smtp-Source: ABdhPJyrNHZ7vW3jzuJGhkrsvCkLKBd4wRhj/b7eAKet6O00jTf8TmIDbLicwY8da9HB2Veh4HEX0Q==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr13864402wmk.9.1634742472865;
 Wed, 20 Oct 2021 08:07:52 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id x7sm2216648wrq.69.2021.10.20.08.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 08:07:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <fdc3d6b9-e784-6acc-06c2-62aed8e33319@amsat.org>
Date: Wed, 20 Oct 2021 17:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 01/21] memory: change define name for consistency
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-2-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211019094812.614056-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.267,
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
X-List-Received-Date: Wed, 20 Oct 2021 15:07:58 -0000

On 10/19/21 11:47, Frédéric Pétrot wrote:
> Changed MO_Q into MO_UQ so as to avoid confusion, as suggested by
> Philippe Mathieu-Daudé.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>  include/exec/memop.h                       |  8 ++++----
>  target/arm/translate-a32.h                 |  4 ++--
>  target/arm/translate-a64.c                 |  8 ++++----
>  target/arm/translate-neon.c                |  6 +++---
>  target/arm/translate-sve.c                 |  2 +-
>  target/arm/translate-vfp.c                 |  8 ++++----
>  target/arm/translate.c                     |  2 +-
>  target/ppc/translate.c                     | 24 +++++++++++-----------
>  target/sparc/translate.c                   |  4 ++--
>  target/ppc/translate/fixedpoint-impl.c.inc | 20 +++++++++---------
>  target/ppc/translate/fp-impl.c.inc         |  4 ++--
>  target/ppc/translate/vsx-impl.c.inc        |  4 ++--
>  tcg/aarch64/tcg-target.c.inc               |  2 +-
>  tcg/arm/tcg-target.c.inc                   | 10 ++++-----
>  tcg/i386/tcg-target.c.inc                  |  4 ++--
>  tcg/mips/tcg-target.c.inc                  |  4 ++--
>  tcg/ppc/tcg-target.c.inc                   |  8 ++++----
>  tcg/riscv/tcg-target.c.inc                 |  6 +++---
>  tcg/s390x/tcg-target.c.inc                 | 10 ++++-----
>  19 files changed, 69 insertions(+), 69 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 04264ffd6b..c554bb0ee8 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -88,26 +88,26 @@ typedef enum MemOp {
>      MO_SB    = MO_SIGN | MO_8,
>      MO_SW    = MO_SIGN | MO_16,
>      MO_SL    = MO_SIGN | MO_32,
> -    MO_Q     = MO_64,
> +    MO_UQ     = MO_64,
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 633b8a37ba..e31f454695 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1443,13 +1443,13 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
>  #ifdef HOST_WORDS_BIGENDIAN
>      [MO_UW] = helper_be_lduw_mmu,
>      [MO_UL] = helper_be_ldul_mmu,
> -    [MO_Q]  = helper_be_ldq_mmu,
> +    [MO_UQ]  = helper_be_ldq_mmu,
>      [MO_SW] = helper_be_ldsw_mmu,
>      [MO_SL] = helper_be_ldul_mmu,
>  #else
>      [MO_UW] = helper_le_lduw_mmu,
>      [MO_UL] = helper_le_ldul_mmu,
> -    [MO_Q]  = helper_le_ldq_mmu,
> +    [MO_UQ]  = helper_le_ldq_mmu,
>      [MO_SW] = helper_le_ldsw_mmu,
>      [MO_SL] = helper_le_ldul_mmu,
>  #endif

> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1935,24 +1935,24 @@ static const uint32_t qemu_ldx_opc[(MO_SSIZE + MO_BSWAP) + 1] = {
>      [MO_UB] = LBZX,
>      [MO_UW] = LHZX,
>      [MO_UL] = LWZX,
> -    [MO_Q]  = LDX,
> +    [MO_UQ]  = LDX,
>      [MO_SW] = LHAX,
>      [MO_SL] = LWAX,
>      [MO_BSWAP | MO_UB] = LBZX,
>      [MO_BSWAP | MO_UW] = LHBRX,
>      [MO_BSWAP | MO_UL] = LWBRX,
> -    [MO_BSWAP | MO_Q]  = LDBRX,
> +    [MO_BSWAP | MO_UQ]  = LDBRX,
>  };
>  
>  static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
>      [MO_UB] = STBX,
>      [MO_UW] = STHX,
>      [MO_UL] = STWX,
> -    [MO_Q]  = STDX,
> +    [MO_UQ]  = STDX,
>      [MO_BSWAP | MO_UB] = STBX,
>      [MO_BSWAP | MO_UW] = STHBRX,
>      [MO_BSWAP | MO_UL] = STWBRX,
> -    [MO_BSWAP | MO_Q]  = STDBRX,
> +    [MO_BSWAP | MO_UQ]  = STDBRX,
>  };

> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 9b13a46fb4..b621694321 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -862,7 +862,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
>  #if TCG_TARGET_REG_BITS == 64
>      [MO_SL] = helper_be_ldsl_mmu,
>  #endif
> -    [MO_Q]  = helper_be_ldq_mmu,
> +    [MO_UQ]  = helper_be_ldq_mmu,
>  #else
>      [MO_UW] = helper_le_lduw_mmu,
>      [MO_SW] = helper_le_ldsw_mmu,
> @@ -870,7 +870,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
>  #if TCG_TARGET_REG_BITS == 64
>      [MO_SL] = helper_le_ldsl_mmu,
>  #endif
> -    [MO_Q]  = helper_le_ldq_mmu,
> +    [MO_UQ]  = helper_le_ldq_mmu,
>  #endif
>  };

Some '=' are now mis-indented.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Also this subject would be more appropriate:
"exec/memop: Rename MO_Q definition as MO_UQ"

Regards,

Phil.

