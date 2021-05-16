Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liPyF-0008OB-Jo
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 19:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPyC-0008N4-Kf; Sun, 16 May 2021 19:14:48 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPy4-0004MW-Od; Sun, 16 May 2021 19:14:46 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r4so3379656iol.6;
 Sun, 16 May 2021 16:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7i+hLaKPb5dREm4JlA/uMq9TMKG+OVVottv84+2WRbA=;
 b=CEgIv1OaOYHj6DriQG7Ww7dHH6qCnYchJq80BoS187ZfHrLZ2wTC1fbXamBx3d/8Mz
 SwpFzlwt3eBCiuvFHZdXJCMi4GyGiD6AUBsRuEK9kILB+1wV9Y1FK7J9eK0v+oHxuLxN
 XGhFaRGxnEUtWV7fkFWMGNpazdm9rNceZgTEyr6SqDVnxUz4NEf+OufZ8fyIxK7WO2JJ
 BE5Wt9Ift9BCylJtIa8KBI8q+Pli4Vp7pEACeHxcqqshKpj/lJHyo/O7e+YamrNjIEj7
 s4Tc5PRxzYHeFtmEc4UCUq1uZtBNoJ+Y2SzkMj8beU5gi61iux/CfuC0v29xruwGEwUM
 G7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7i+hLaKPb5dREm4JlA/uMq9TMKG+OVVottv84+2WRbA=;
 b=ErplDr014QrUAx6x7arUyUzc0nqoCOgsqlSyHBK4168keeJFDG1rjdVAQmTgFsbLww
 hrGCYYi+oJWxJjEmqMfA0PscmUB6Pdt2G2wx2KrZwMwk3ldbWVd+fGjtvEEcRadBBn8i
 V91w8GSlZGBT5GbxCy18DAV0m1hTcFllEeu6tmXKXyBSQnw3oS7lXlstz3zjjqwis9Zx
 fiyhDJ1PnishU4DldJKP1gIjKrSbXQaj6DvUmZsmgDQh9/cV4CQ5yMkItR/QP2Hrf2FJ
 6+DK1IXv6Exkn8alFRyYWYs03nwpBv5UGd3JAMwHx03i2Bkuc8ZLjxDxd1sXliHfCzen
 t5HA==
X-Gm-Message-State: AOAM533X3XkrmCZGXPY/jPxzTjEhbf5Jtxstt9TY5ptuVmZ7pLDPSGjm
 1tfIcO/cfxZoHS1oOusuFYn2ZUUW7yBUHcYgTn4=
X-Google-Smtp-Source: ABdhPJxDVMxnBKY8Z4fyksCt2LmNg6lv3E1HxWQnitD/7fwFEX39Kh9sUdoBZBlIWKHtf7r264VMBhRV5acCzeuDib0=
X-Received: by 2002:a02:b107:: with SMTP id r7mr4226719jah.8.1621206879046;
 Sun, 16 May 2021 16:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210516205333.696094-1-f4bug@amsat.org>
In-Reply-To: <20210516205333.696094-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 May 2021 09:14:12 +1000
Message-ID: <CAKmqyKO-Jp79AiE2Pubrgi17Tdro2p45y4AucXndFQkvdJGnZQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Do not include 'pmp.h' in user emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sun, 16 May 2021 23:14:49 -0000

On Mon, May 17, 2021 at 6:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Physical Memory Protection is a system feature.
> Avoid polluting the user-mode emulation by its definitions.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7e879fb9ca5..0619b491a42 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -97,7 +97,9 @@ enum {
>
>  typedef struct CPURISCVState CPURISCVState;
>
> +#if !defined(CONFIG_USER_ONLY)
>  #include "pmp.h"
> +#endif
>
>  #define RV_VLEN_MAX 256
>
> --
> 2.26.3
>
>

