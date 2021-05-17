Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liTLW-0008HR-IS
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 22:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTLI-0008E6-Vh; Sun, 16 May 2021 22:50:54 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTLE-0000cJ-Vn; Sun, 16 May 2021 22:50:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id g38so6525362ybi.12;
 Sun, 16 May 2021 19:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fZIOsQUrBkZvi+ciKm2Uumgy22UcWqJLtRILnCE1td4=;
 b=jerZTbdLyPbV90c7j5HQN1SSjT39/uR2cYVvSJWwN1Jc2wjS7+DtqQhqGKEDIIXk9k
 i3tpcEbX/N9pQYIbeIkjo3lnlA794OuYbmnmN+SybPNnG8uzNmBkvdSrSjKV/Px2QnQk
 rejTZqza6ivNpobSGKEgGeJTK1M9c2lMSUhqZEs4uDNMbLDLlA0BNAXfRvTBiZ0wDCyQ
 F5VEpOl2amUoic4PjQUvvbzPHkWX2ZTzf5o8tpfPNqupmFzlgvc0Er+YkllcM/anP47K
 ttoIxmD3pZERe0pn5hniHdTRSZtQ9jUY2FfGQ2erQEBi0cK+kTWy9vgfnm/KsRpMGRkP
 jBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fZIOsQUrBkZvi+ciKm2Uumgy22UcWqJLtRILnCE1td4=;
 b=KSwps4pfoSfPNeuzFsJOJLpKkbO8YKZtdjLJpj6YSDq6z1T4oxfm0HNx/FUdxU7hTS
 ujmHzcsBbbzM+Ddx5cFMEB1F9W2MOpRbVzbCKQIW+nyPn9/X8BR5bhg6d0LQg73eaOow
 3SUFSUnGRLNTJjXvpWATV9FyWHu9gnel6laTEV0pEBHik+Ai6KyhdiL6XBHJO+Y5EN1w
 l2sbZCus6KzQ7FmQ5kH7pKhiqm2bzRuMNYUNYpdLspo4/hXSVKO+Hg3+henOsSmOf3RO
 PBfH6cxpUnsMb1ZQsyCPSzpS/R9CIgF41963QvDUG+GjxKiW7wIykBt4M+JsdDGK/hep
 DFJQ==
X-Gm-Message-State: AOAM533DfrWnRdWzSH30JaZLC5qc4+8PaHD/seOTkM73rcnKsylEI17b
 Mzfu6TRq4yJg8wH4pIuppNzICoZpHNfCqxrfY4E=
X-Google-Smtp-Source: ABdhPJxD774U0vQS+WgtAgejNCMvAhM3mBN+xgubqJn/mB24K+wBX7fSSKmtXRJ052PiumjJQPAI1Q75nAVle5UPRx0=
X-Received: by 2002:a25:afcb:: with SMTP id d11mr13785848ybj.306.1621219847229; 
 Sun, 16 May 2021 19:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-11-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-11-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:50:36 +0800
Message-ID: <CAEUhbmVBV9vyvU3y7mz71iABDx5A4TBR1qHDZRtj2NcZ_n+ObQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] hw/isa/vt82c686: Add missing Kconfig
 dependencies (build error)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Mon, 17 May 2021 02:51:03 -0000

On Sun, May 16, 2021 at 1:43 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The VT82C686 device model misses various dependencies:
>
>   /usr/bin/ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b=
_realize':
>   hw/isa/vt82c686.c:622: undefined reference to `i8259_init'
>   /usr/bin/ld: hw/isa/vt82c686.c:624: undefined reference to `i8257_dma_i=
nit'
>   /usr/bin/ld: hw/isa/vt82c686.c:627: undefined reference to `mc146818_rt=
c_init'
>
> Add them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/isa/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

