Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdFz9-0001VY-4r
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 14:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rth7680@gmail.com>)
 id 1mdFgw-0004FI-Cp; Wed, 20 Oct 2021 13:47:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rth7680@gmail.com>)
 id 1mdFgn-000131-52; Wed, 20 Oct 2021 13:47:54 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so3592908pff.3;
 Wed, 20 Oct 2021 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3u02ffGnaKIHZjuFlaXATPxHUVZkCd5WOwZHeAmjUjY=;
 b=kfhMPWjZeYrzPYcVpu6LERO/4VnlUDax4MTG/Rexu6gTVyo5iesDoWwV65Z/3KWAqA
 K1w9AnwmWZvQ4+s2VB/ix1CXkV8Ewo91HeEiBUALppRiDINnPANo7SnxX1/N5RgHh70u
 chNvflx3aUXRSxfoF+E+8tYKPyKobN5hPCxwUlPm964hGwXniIeUSG7kdM0FP/1qwHE9
 qsfy3Owtdey/3SgM+FQRXSPNfVgLystCZVFBBmF12SCOxoPAwBh4WVR1bxFG0VAuQZKh
 SP4A7uji1vhkFSqqGncQedsAHwBOg5Jo57SB9jutNztMEW+hOkCd6mT32+tR18it0n+M
 51uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3u02ffGnaKIHZjuFlaXATPxHUVZkCd5WOwZHeAmjUjY=;
 b=0TvXPEWbEnSaueQcI7sBecM12gZyzNR3rzW/yxmuqABBbW/6X4DGRavvXEf2iNmjZ4
 oFbDDCQfl7JE254jiXuJ8kuUnWdSG+o3qoUJAVNjI9X/u55VxMolkQ7eaNQrRjOkRJ1U
 xFQAHtxafm0qAwTXvsIpP1N4/RkL4Niw5NkfgSd6yZBh7Uc2xB2jcBOjzIBDbvVnBipO
 Zcct1XxHI4CxywItq4fV8KeeBNh74UaoXxV4Q3xfCy4Lp/Msop/TWzN7Ah5GEnEiUgB6
 3I5j//UXlAUz2nhD7ltVMp3ovs1weHgeLkBjHyYPkFqq0gC2pqImESG/bBa0dc3/NtC1
 SNhg==
X-Gm-Message-State: AOAM533qjUlO30s/654LFrqdyeBnjVM+rIRTKFqMuyaODw6WgSQIdSXR
 SqiMr0KGaKTL0T1aI8R7UOo=
X-Google-Smtp-Source: ABdhPJyLJ8/gx+pzQbDJmpoKCDMbJrecJkPGQBcv30GmhSSWk3Gh+sxaBXl0mpbzd+S08OAPUc4MIA==
X-Received: by 2002:a63:84c3:: with SMTP id k186mr549697pgd.462.1634752059507; 
 Wed, 20 Oct 2021 10:47:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.googlemail.com with ESMTPSA id f11sm2732916pgv.76.2021.10.20.10.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:47:39 -0700 (PDT)
Subject: Re: [PATCH v3 11/21] target/riscv: support for 128-bit bitwise
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-12-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <rth7680@gmail.com>
Message-ID: <1eb7ef2b-b636-3c93-a2d3-4d498da9865d@gmail.com>
Date: Wed, 20 Oct 2021 10:47:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-12-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=rth7680@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 20 Oct 2021 14:06:42 -0400
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
X-List-Received-Date: Wed, 20 Oct 2021 17:47:54 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> The 128-bit bitwise instructions do not need any function prototype change
> as the functions can be applied independently on the lower and upper part of
> the registers.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/translate.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e8f08f921e..71982f6284 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -429,6 +429,17 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
>   
>       gen_set_gpr(ctx, a->rd, dest);
>   
> +    if (get_xl_max(ctx) == MXL_RV128) {
> +        if (get_ol(ctx) ==  MXL_RV128) {
> +            uint64_t immh = -(a->imm < 0);
> +            src1 = get_gprh(ctx, a->rs1);
> +            dest = dest_gprh(ctx, a->rd);
> +
> +            func(dest, src1, immh);
> +        }
> +        gen_set_gprh(ctx, a->rd, dest);
> +    }

If ol < RV128, you're storing the low dest into the gprh, which is wrong.  It should be 
the sign-extension of the low part.  But that should happen for all writes.

Earlier, I suggested gen_set_gpr128 instead of gen_set_gprh.
I think this should be written

     if (get_xl(ctx) == MXL_RV128) {
         TCGv src1h = get_gprh(ctx, a->rs1);
         TCGv desth = dest_gprh(ctx, a->rd);

         func(dest, src1h, -(a->imm < 0));
         gen_set_gpr128(ctx, a->rd, dest, desth);
     } else {
         gen_set_gpr(ctx, a->rd, dest);
     }

Where gen_set_gpr will handle the sign-extension to 128-bits.


> @@ -443,6 +454,17 @@ static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
>   
>       gen_set_gpr(ctx, a->rd, dest);
>   
> +    if (get_xl_max(ctx) == MXL_RV128) {
> +        if (get_ol(ctx) ==  MXL_RV128) {
> +            dest = dest_gprh(ctx, a->rd);
> +            src1 = get_gprh(ctx, a->rs1);
> +            src2 = get_gprh(ctx, a->rs2);
> +
> +            func(dest, src1, src2);
> +        }
> +        gen_set_gprh(ctx, a->rd, dest);
> +    }

Similarly.


r~

