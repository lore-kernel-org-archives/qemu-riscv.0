Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liNnC-0006nP-IG
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 16:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNnB-0006mq-3c; Sun, 16 May 2021 16:55:17 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNn9-0003Yi-OA; Sun, 16 May 2021 16:55:16 -0400
Received: by mail-oi1-f182.google.com with SMTP id c3so4732940oic.8;
 Sun, 16 May 2021 13:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Z+Jqg8zB90pTz/24w5k0l5idKqlnQQoh/ZDi8GdGz4=;
 b=IDEB5p6dz3QSFpg2mecRuv+JJiMJ77Tp0dkPfzucD9Yl9TQD3o1NHcZKzeS+/FIf0n
 yQQYMNBWEVID4VhzuVvnfNpH6L9Ky0ZD4kMTcdC+of8Wb6o5EtaIcJnMRBzW9Ks/az0l
 UuDzA9774KYOhjNiSaCxOcTnI5pyfNd3tqBnM7EuhENR2uWKMj7JbK3rSrbrQb0QIhtb
 XAraIpaSrPobXJR6qO25UJ/kGmpAneFoWt98353ybGcfXFB0Cy4TNKcnwDJeNIgVQAOr
 AaXQ09emX7KeK37n2VvjC6v/5Rqv7lllY+ibPjJiGfz/2Aiv5+pazKSm+bgfXqTcM197
 5EEA==
X-Gm-Message-State: AOAM533763jnC+HNGlFclRSu5GoIrx0Ow08rpTg3mV0uhu54KH7Cg7gS
 P9T8ixSGkIXIFBZ22qrosCKX+wGU1qCMsByqJNaaAmmABys=
X-Google-Smtp-Source: ABdhPJxzpg5VXnpgXaR0byiXErfhj/Ue98za6dPBe9rt0w8rfiTO3icd5kYlt9Ha6ayEDbwx0dvxcUCyFJg00bp2i7k=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr4599000oiw.121.1621198514013; 
 Sun, 16 May 2021 13:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210516205333.696094-1-f4bug@amsat.org>
In-Reply-To: <20210516205333.696094-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 16 May 2021 22:55:03 +0200
Message-ID: <CAAdtpL78pnuFMctqFR-WnTZPvwPL_Eh=Q9YhZhKKvvuGEt6pYQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Do not include 'pmp.h' in user emulation
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Laurent Vivier <laurent@vivier.eu>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 16 May 2021 20:55:17 -0000

Oops this is v1, not v2.

On Sun, May 16, 2021 at 10:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Physical Memory Protection is a system feature.
> Avoid polluting the user-mode emulation by its definitions.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

