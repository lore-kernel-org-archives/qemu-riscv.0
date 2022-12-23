Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8fM6-00046U-Hy
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 05:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8fLz-00045f-8f; Fri, 23 Dec 2022 05:32:44 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8fLx-0001Sf-N1; Fri, 23 Dec 2022 05:32:38 -0500
Received: by mail-ed1-x530.google.com with SMTP id r26so1343197edc.5;
 Fri, 23 Dec 2022 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WNFmCIK7WmoJOBMrpWS4ALNw5uhFz+D5/ikd4+Asd44=;
 b=hB/GofbKO//DjBA6h/d0saap+GIzwU9QIQvNrmlO7GEfwjR/QqIlNvuFS0nvX3GEWm
 vNfBcM8vJV64NkwcHYF8D/Sr/oahLxocv1D4XFegyTkLf2vHNLR77dR9kaqDKD305xxc
 4yOVq3dSC6zL6JtYBb7JE4VYyGFXlf7efjs6Tp8v6eyRg14owDInmXg5E1KSUI8wD22a
 bw6jMxyzAi2A1E1Dwxajlv5nOCYbQE+C3tj68VrFnEANXtvpo3Nbc5Ct4x9UW39L0g8q
 6dlDU8dn4ga41BZVlcaoGXI3O+0Cr7aESm6aTg0HkFNhtEjyDbPdJndoglKK2w9fCK1/
 ZNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WNFmCIK7WmoJOBMrpWS4ALNw5uhFz+D5/ikd4+Asd44=;
 b=KS+l5RyHW4cdMmGCfBNNLHeAGTBbRNzuWdm4pEEIcSR4JPODMsGqIFGPYlS240AT6Y
 +AkDH/fEl9846y+HJF3g2QuiYILpjStA+/sqkvY30hoaareTyALtb9+lBBTLRLYUpLZK
 tU7MF7Rgsjx2jNFsm7giDqjgznwNRbBxB4mWpA0MlQbELzC6SxvFB62ZfPNX1f+24UVl
 sBriaQKzENUSJ1yIPL6g8SchTWZstHvq6EZJO6Yb1cj+RGh8OiKFHOiag3rSdqkTlsfG
 0eFdhdb27zTFk9A8DwQDocwL4qF+jLDRuOFvZa+cRixzqm8Rxn0h1KJcf4+5MKxLRfoa
 4b0A==
X-Gm-Message-State: AFqh2kq3PxAM65tUq+VdQSPrmEUu0K7SHRnjDPWqycspok8R6TMt6WBI
 2EJ0Ao9GIcKV6xgUte7h2D2o8ljoaE7eLMki5tw=
X-Google-Smtp-Source: AMrXdXu1H81/FOVPhv/LmXjpr6OHlv54jIPu/I6x6Spz4T+UMiIAU66PpB0jg8xPubiyHimTNrCnFzREjazahYAT5o4=
X-Received: by 2002:a50:c01d:0:b0:46b:5812:a03a with SMTP id
 r29-20020a50c01d000000b0046b5812a03amr842414edb.91.1671791555230; Fri, 23 Dec
 2022 02:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-9-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-9-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 18:32:23 +0800
Message-ID: <CAEUhbmWF3PCibJOiRKMLXerBk6MTpCHc7=C_gH6L3hsX4zxNng@mail.gmail.com>
Subject: Re: [PATCH 08/15] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Dec 2022 10:32:44 -0000

On Thu, Dec 22, 2022 at 2:24 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The sifive_u, spike and virt machines are writing the 'bootargs' FDT
> node during their respective create_fdt().
>
> Given that bootargs is written only when '-append' is used, and this
> option is only allowed with the '-kernel' option, which in turn is
> already being check before executing riscv_load_kernel(), write

being checked

> 'bootargs' in the same code path as riscv_load_kernel().
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/sifive_u.c | 11 +++++------
>  hw/riscv/spike.c    |  9 +++++----
>  hw/riscv/virt.c     | 11 +++++------
>  3 files changed, 15 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

