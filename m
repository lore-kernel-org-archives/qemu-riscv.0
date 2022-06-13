Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o0Y10-000421-2H
	for mharc-qemu-riscv@gnu.org; Sun, 12 Jun 2022 20:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Y0y-00040M-AB; Sun, 12 Jun 2022 20:33:08 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Y0u-0003v8-Ox; Sun, 12 Jun 2022 20:33:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id e11so4403309pfj.5;
 Sun, 12 Jun 2022 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=syQRzEQ+clGVmGE6aJAVSi3Xr/cIVNp/s11Ly2vDVgQ=;
 b=htU987u0agV2KY67tpYuzahVfmg3k6ofKAhDN6YTNbrvl0/s97neE8OhPJn9el/i0+
 hSydcSEt9n2NYrdmpR7QQH46D8tV8mffsD1x4Wt/rIPxgiSoQ2cTIZf5aIpBobvCVzLf
 YS08rGXqihSLJ4PlogPxL15c14CVObqK/cJVhfENo1bAzzhBVYmHcx8x2YMivXST7Oxa
 wLeKAyP425cHRRAT+dEUn49ZJuP17qaogwIal7sRmO3fupoHr2XS8RyHCY9Jm3wOs5aK
 sNovxwNnVRduca4ghtrFbKJeMZne1kNhgb/tkvEkbASMpQsUYClVZR8VdFpqF3POaWf2
 Ju0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=syQRzEQ+clGVmGE6aJAVSi3Xr/cIVNp/s11Ly2vDVgQ=;
 b=Q6XgwbJCsiD+n8mlCHCPr/cLe5JTxuGwW9b7Ay1Vexy+tYrM9sd/Dj5904zGurcL3c
 OgwV4h3fUt0zgwoIXw9/7xf+Dcxdf69J2o7KZ8Cb9P/LTaE2r3HWTMRXVBLqaHtAPGXe
 4AViO0LTgVIFT26G4wN3UHDeFIJWxFhM7+FcTBMmQJD+MUD+Uza9QymZOuq0T7CAf5sR
 Fvan2MUvmauFF8xA8gmY1IM9AKVZEocCcmNLG1Ur/yol2394O3qa0YnV8xgZClPqo9r6
 K88esvCXn2kTPBTKD6WvULFRtIMJ74KAqkzxhVKR9Qe/cggD2vxNYk4VSz03BYpZcKi8
 eq+Q==
X-Gm-Message-State: AOAM533czJuas0ls+cQ3FpL9wSIRK19QQ7GepkUMAnCQlAeQ3Xg3tU9B
 0GyJTvOIv+3EXKlYePzlolftuEX3DPSWAz6RsRA=
X-Google-Smtp-Source: ABdhPJwPBXpBJQaYdRLMCcLOicc3fkyZSABTrPkFm2Ooh3p9YQbb5iBlhMszkUKhM2i3TrAdXz2qXYQzXIXTYgefJSs=
X-Received: by 2002:a65:5786:0:b0:3fd:7145:ceef with SMTP id
 b6-20020a655786000000b003fd7145ceefmr38331536pgr.361.1655080383080; Sun, 12
 Jun 2022 17:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
In-Reply-To: <20220609010724.104033-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:32:36 +1000
Message-ID: <CAKmqyKPOj2YesmskC5q9Xai3D0edb6TzvxkfzdkK7tork3QAPw@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Remove the redundant initialization of
 env->misa_mxl
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jun 2022 00:33:08 -0000

On Thu, Jun 9, 2022 at 11:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> env->misa_mxl was already set in the RISC-V cpu init routine, and
> validated at the beginning of riscv_cpu_realize(). There is no need
> to do a redundant initialization later.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a91253d4bd..61d1737741 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -752,7 +752,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              ext |= RVJ;
>          }
>
> -        set_misa(env, env->misa_mxl, ext);
> +        env->misa_ext_mask = env->misa_ext = ext;

You're right that we don't need to set `misa_mxl`, but isn't it
cleaner calling the helper function here instead of manually assigning
it?

Alistair

>      }
>
>      riscv_cpu_register_gdb_regs_for_features(cs);
> --
> 2.34.1
>
>

