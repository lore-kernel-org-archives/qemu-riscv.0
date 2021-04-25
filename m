Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laniB-0003ma-0i
	for mharc-qemu-riscv@gnu.org; Sun, 25 Apr 2021 18:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lani9-0003kk-AK; Sun, 25 Apr 2021 18:58:45 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:38565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lani6-00081N-Tu; Sun, 25 Apr 2021 18:58:45 -0400
Received: by mail-io1-xd2b.google.com with SMTP id q25so10691510iog.5;
 Sun, 25 Apr 2021 15:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OeIe/ni38eJ458hhrD8Qj9mWN7ocTimJAkzvo3zoBTg=;
 b=n9ujx78Q+R4hQbiBrsBRfixqN9a6m7o5H3yFZYapPLWY1iBonQN/EACjs7mikD+iDI
 5m0pH8W0KraFP53iGDW4eh2Rea6g8GUf1LGke5Ijb/b+cn+2UCy8+fAxm7SQHUOu097f
 W4RC51UCDE+d9PSy09t71KJwXdBsPGhd2tFTTMajMSgPuCXFc0LKtn1X/4LHpbFbryDm
 usKtDWkRRRjnsXw9wrHoRSQ0TUW/gLv4JgMph9wQv1J0R/ascuLuNoAmRPpdQsL7DW6o
 d0tu6NggwTiRwHfxx5jBkCcYIYvyRQHgG0fkAm/3iMsG7v2R805ck6OV5L8HQvxmtg41
 KWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeIe/ni38eJ458hhrD8Qj9mWN7ocTimJAkzvo3zoBTg=;
 b=difhYe6VPyUtWTRVyngyQWhP6O1BktXWQZ/XJG2nK2Gi2eK1+R+KppYydcrtbYF2iw
 zghv0xUvRRpnRHeiLkyYsKvTi1SIjaqjBOsN6zOz1BuuatbfRrdnZDqssH9xDHI+wkq6
 ne3z3z7wzB1rs/yUEGJ8XuHLjouBZceHPdciDnBiGSvFqbAaeXxkxhJ7w26Pkk5zcpA9
 NfPYBfBNMroYGIU0WGO9IYmXy/6GNyBFnd0a963D1uS09cyoSGmhSRttiks8pkQtdf8j
 rE271yGRFD9xNexdz1Ltus0T/HqObNXr30dz3U/YZxIk0ucDK36AqZESpul7MbldBvnG
 TBCg==
X-Gm-Message-State: AOAM532gA/BZqYeGulxtr40D6sWMfsBhStQ1mMsjGA2+C8yxGcVDgNa4
 vTr/STW7jEp/gnUue7OmEglJYybtcOcc+hfPJ28=
X-Google-Smtp-Source: ABdhPJz1Qfqf6g1rXJLPGXq8AKpLkYjZmBjLkLRFHZ2xoKJIVExL6nK5AWG0B1L9crw2JXWjvn+z/uf7uyruoN/Uf1g=
X-Received: by 2002:a5d:9496:: with SMTP id v22mr11958732ioj.175.1619391521176; 
 Sun, 25 Apr 2021 15:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
 <2ea910ea-690a-bdac-bcdf-436bbe28964e@linaro.org>
In-Reply-To: <2ea910ea-690a-bdac-bcdf-436bbe28964e@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Apr 2021 08:58:12 +1000
Message-ID: <CAKmqyKP5tuddPKiSOt1V6YyDjV+9VAM2vU=F1BvLgwXWHm=VKg@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Sun, 25 Apr 2021 22:58:45 -0000

On Sun, Apr 25, 2021 at 3:08 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/23/21 8:34 PM, Alistair Francis wrote:
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -74,8 +74,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> >
> >   #ifdef TARGET_RISCV32
> >   # define is_32bit(ctx)  true
> > -#elif defined(CONFIG_USER_ONLY)
> > -# define is_32bit(ctx)  false
> >   #else
> >   static inline bool is_32bit(DisasContext *ctx)
> >   {
>
> Rebase error?

This is required to avoid warnings/errors before this commit as
`is_32bit()` isn't called until this patch.

Alistair

>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

