Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1u0i-0000i0-Pk
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 11:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1u0f-0000e2-TX; Tue, 19 Jan 2021 11:37:37 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1u0c-0007m0-QI; Tue, 19 Jan 2021 11:37:37 -0500
Received: by mail-io1-xd34.google.com with SMTP id d81so25629063iof.3;
 Tue, 19 Jan 2021 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e0ss7NliYShxPbLg2oxQZ+54H9rOvsHlimRM8y0Bwj8=;
 b=dIl0KBG7TAm0cdZn+3v5ImxzaDGRpx9j/zUafqFu9AO8gVY1Kjgae17X/WJre5i3QO
 kQpGbyJ8e8TDXqeSy1F8nCmUnxHlg7KcErLheKz59dSo0u7+ogskjw76WuGhnPfJXidP
 2vr8Vsikpa8pjixw67OZYU4ZwmCtPoTu71XMFu4nfZAzUoIZit5EiNaXEE+PC5DSlUrv
 d+udUzkNQTIPfbFCFilnLDK06WmQR/eM5mP3UUcWrAyqAlkl7Cmf9PeQtbAUiNi8yMnZ
 Z0lM71PvoUaWQ2UL2vQ+S5gAp00iRPj3FejUHS84wWCl0rbJWs5YtqMS3/CuakMuoRWU
 4Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e0ss7NliYShxPbLg2oxQZ+54H9rOvsHlimRM8y0Bwj8=;
 b=PyIvA6u7dVRuyrwcUnXdwBbOw8vLQ1LzytyIKZxBj6jhSLDNZ0tbWpHysO64n04ofL
 bwhCFwrNIa3Ud2WMospcnGtggzFXOyEys7Dqs01DNhZkYh4KWUdQ7OV7+Kgo8kVL1j/j
 SPrvCHwXf1s+l2K1tNjVKhk8/wQPFqZsKn1iDkOcgSQ+geZ9mfiFKe77YGbwX7lth8e7
 OVobc3MWR8+KIWOvn+ys3pbZOj9UCoeAUISFHp8FtbBRdgZTq5C1YkOP2ZYYb6uE28vL
 hw+5lQty+QwVhK7SZREXtyw2M86AHexHjSS4+mHAOLsaK3qujx16kJHXfFUtvU/5Md/A
 nn3g==
X-Gm-Message-State: AOAM530ifVxSKZ8ZyeGHCErnB8Pnb09gKIFHi/bMpy9D5ZA7Ylkixqge
 kQ0uDPclcHnaallVdjUyODiBCKW9qlKHFoxjAUA=
X-Google-Smtp-Source: ABdhPJwL2Uo8clg28PLTnavaKUN6BpVfJpgmm+MX4OIdJeQpeRYu669F54wK1sz0/drSRdIdibkEuU7ZWfdGGHFercc=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr4043745ilv.131.1611074253555; 
 Tue, 19 Jan 2021 08:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-6-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-6-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 08:37:07 -0800
Message-ID: <CAKmqyKM6XxKSKb8+yb_wM59Jgs2S58X1T+PTqT8dOYKnVEApvw@mail.gmail.com>
Subject: Re: [PATCH v6 05/72] target/riscv: rvv-1.0: introduce writable misa.v
 field
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 16:37:38 -0000

On Tue, Jan 12, 2021 at 1:42 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Implementations may have a writable misa.v field. Analogous to the way
> in which the floating-point unit is handled, the mstatus.vs field may
> exist even if misa.v is clear.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a70a78386da..c8b1e4954ec 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -579,7 +579,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
>      val &= env->misa_mask;
>
>      /* Mask extensions that are not supported by QEMU */
> -    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
>
>      /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>      if ((val & RVD) && !(val & RVF)) {
> --
> 2.17.1
>
>

