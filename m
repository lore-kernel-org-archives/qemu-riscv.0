Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1litIV-00025o-KP
	for mharc-qemu-riscv@gnu.org; Tue, 18 May 2021 02:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1litIS-00021V-Vb; Tue, 18 May 2021 02:33:41 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1litII-0000iC-Bc; Tue, 18 May 2021 02:33:40 -0400
Received: by mail-io1-xd31.google.com with SMTP id n10so8333200ion.8;
 Mon, 17 May 2021 23:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7i+hLaKPb5dREm4JlA/uMq9TMKG+OVVottv84+2WRbA=;
 b=Slt+bHOkAwm8RauoaNdDrciRMrr13R4JjyIhEHCUGXbeGeZOfEziLcqH/nVpOQyJtF
 CAcuIKUO+wBbrEmhlxH4f7wvU2u7LOE/WaXuO7PcgS4FMMxf7cYLdYpmbuIiSK4+9AS1
 tTqgnnlgeBzyIyIQBlmRJC72eekThE9bW4ufbixVfDym8Cmm0rRHXQX/M85VyJT+czxh
 sNcIzhI1zdpac22xnF5ZTt2H7SgeKufqpY6mqfmYstzClOGB2DDMmnnLVze1/Nx02Yy/
 oYDWYeIB2HGrhv+B/xz/JjFsN8WnNzK7keZp4gdUouaWkhCgvZrU9WNw1Ovjj2K3KOVy
 G/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7i+hLaKPb5dREm4JlA/uMq9TMKG+OVVottv84+2WRbA=;
 b=jiP/YfKC95qz4yCRLBxsdUulX0H8qoV8OYVCVD/ePgVS87x2cfijuX9LUnaJ9lCN6q
 By/oq0SzaTxXSaAQ4jZ+98cv7wndmhfFXIvuGxWqJxNkROiciDya7SAiz3MFopBTV/Z1
 ce0wrlePrErrBeMucAjdtw1W+7/L7LXgq8q49yC4O49oRFGNPP5fmH7b7bKUwKbAOg8R
 BSmyKUIrXApBNkcEeIWX+OU6xdhG8JHThpXQBtxIT9JCLmsCiIlFbza89d1EbBzit9T6
 pLcHB4dafSMPEa9Z6i0+hQZxQKHx2tSvqtrEV3H8nEgT7HScxon2bInI4zxQ09gfggM8
 uWlQ==
X-Gm-Message-State: AOAM5322O/7ZNp4HgZa+nXRYGuak/JQf/998Tqik5mgo9eJVif6gW+7g
 j0YJWKV4jV7QBq0rXc4uMzTsLat9/o7NSLHmvQo=
X-Google-Smtp-Source: ABdhPJw3++MfmypaeHrI0jg5Nc8/TiGXmCmSZW3mTIOOEOiuqfx+8T2Ek4rxZRmJE7m8H0S9jAOVhNWvdN02ITMBn/I=
X-Received: by 2002:a05:6602:242b:: with SMTP id
 g11mr2977913iob.105.1621319608246; 
 Mon, 17 May 2021 23:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210516205333.696094-1-f4bug@amsat.org>
In-Reply-To: <20210516205333.696094-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 May 2021 16:33:02 +1000
Message-ID: <CAKmqyKNE71tnXwuXP_3MRybeFEmfMS=6KoJ8w4GaH-y3zE_buQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Do not include 'pmp.h' in user emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Tue, 18 May 2021 06:33:42 -0000

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

