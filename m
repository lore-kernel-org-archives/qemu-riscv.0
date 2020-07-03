Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrAMY-00019w-9v
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 21:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrAMW-00015n-DY; Thu, 02 Jul 2020 21:19:32 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:34228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrAMU-0005Mv-UY; Thu, 02 Jul 2020 21:19:32 -0400
Received: by mail-yb1-xb41.google.com with SMTP id l19so1832445ybl.1;
 Thu, 02 Jul 2020 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJYRLJU1nGbebkdEaZI1GrtzuGIGfHc8B6xnBzBoyeE=;
 b=CPh/qorq3t+omt0z6ifBqdnEy2sc8a7hBFoXoEvOLxf3i5u0YkDopB6TWZnxPmJIBZ
 wAATUQqc6ioNdaqIvU0fiATD8vdXANgfYh799pK+9a9u8bUy9h1yjoOnXXnXgg35F3Wr
 4rgwPK2raCzcf0CAerMwvZxlnYd3JoI9B8TzEqdCP8qMnNd6ndoD+U9iOWhV5/dVZMcw
 kwJIMWo1XT2kxU3EtE+unCCucuKQ2OjItnNM76tiOZPBIgm8kE6q+pcutiO5MgKoZCzy
 ortVt8y2MrbiRsDj23Bj1V5piKrz5A7NDQpWyIaec2L6Tw53j/PHT0UFWmgSGiLI5G23
 mjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJYRLJU1nGbebkdEaZI1GrtzuGIGfHc8B6xnBzBoyeE=;
 b=Xni0kd+T8yv6sj6hA34fuVAnDcs89oScc036TIC50sbf8VnyDw0/htyMfPqQ3lEksb
 UU4saS316QGoXKF0c4+5x3g6t45fd7w0BI05WRVWDI1QO7Rm+gywwzNDOY7ycS7bGm+A
 930sZSbETkEarlNwVu9epY2zwqNHvVecuHcOxkmHz9XuMhAGMOeqmINmpOT+ItJpTsgR
 6JBGhzGJA2VjEdGm1M2OrDK1hf39l14Kxl2MrET7gvtKZREBiRVEQnFtU3+FQVEQJhmN
 ZF2w4GGHGpgxR3HTe7qHM3CT1tFDcrAYQKn8chwyNng/CMO/SOy/ozh2L8xdRXYinhdG
 L4nw==
X-Gm-Message-State: AOAM533NPS6Fmck8hB7y3tvVekN237lLE0txRPYa+yEZhsgt9SWDiwmx
 FHNFUe6h6YB0MAhx6gkpLfzFaecnpAuzzaXBclk=
X-Google-Smtp-Source: ABdhPJwPk+8MN2r+y8rlxM47hHb1B0YViRYGUUEwABz65QU9F5CJX3R49M+3JMiXMPWbmAK4txaC/EzjkwlBy4lE/Zg=
X-Received: by 2002:a25:800c:: with SMTP id m12mr56637950ybk.239.1593739169906; 
 Thu, 02 Jul 2020 18:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200701183949.398134-1-atish.patra@wdc.com>
 <20200701183949.398134-5-atish.patra@wdc.com>
In-Reply-To: <20200701183949.398134-5-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 3 Jul 2020 09:19:18 +0800
Message-ID: <CAEUhbmXea4nf9pq-6bumtK-rE8b0B7EF-agptnX5T_Hpm5EfgA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: Support 64 bit start address
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 03 Jul 2020 01:19:32 -0000

On Thu, Jul 2, 2020 at 2:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Even though the start address in ROM code is declared as a 64 bit address
> for RV64, it can't be used as upper bits are set to zero in ROM code.
>
> Update the ROM code correctly to reflect the 64bit value.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  hw/riscv/boot.c     | 6 +++++-
>  hw/riscv/sifive_u.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

