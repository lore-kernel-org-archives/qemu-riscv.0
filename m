Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn7rR-0004Yd-2e
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 17:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7rP-0004YR-RY; Wed, 09 Dec 2020 17:22:59 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:34157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7rN-00005N-2m; Wed, 09 Dec 2020 17:22:59 -0500
Received: by mail-il1-x144.google.com with SMTP id x15so3236311ilq.1;
 Wed, 09 Dec 2020 14:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhNvrWVF467g3EnfZyoM3nhmkLN1QnInMXkXHQW2a84=;
 b=Uvf4FoQO2/dL8nWVDzgDHJs0WyiLfR5v6Liek7kM3hRMRxSXhCP3L7U+NYgUeSCxTX
 inGOSNF0iELQsnt1gVKfJBDOzlQXBuOEgmzp/a3S100bFOWM4KYHjEOVcC0tQ/fsSO6l
 OJEoGTd2KRRgMOk2ie1mE/9HqbMVp5LBEneIu7RA2vtmdvWWsvGIzfl5eu3f2g9PCZ4Q
 oCBxuX11DDm96MmDvhthjpxMBTCOmXLeULZqCPAFHiYUWs4JAjTYMZkG1lDoX5zca2Pd
 3yW3ODzx5+DOMQpghMGQvaXQy56A4I6cuAZWzk5ickdG78zvI3QAlY66rkCW1Ys8k1np
 JuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhNvrWVF467g3EnfZyoM3nhmkLN1QnInMXkXHQW2a84=;
 b=UAULISgjjddMubrg3hexSN+JadI22J38PMIUjKoe1wbI/AI7cF4ryOXbPb8XlQMZei
 XjQzaN0YKnyDNvgNvc3m5zs6OdRWQnFSqzU1Q7zyY0nE36P2donTcUvtk9MJeQ9UePaB
 bthkOWrYksoWaLXY4yzp0WX/SVJ7Ez7A6lF/emvSpaqBIPJYAb3VvQVV/3iqoLIYK8Yx
 nfeKpKFnVMRwnIFc4nvhKjxr0NdLSm3t0rS39p14Ob7BplwfmQ8t4c0WyEr0GjZY0qsh
 Jia5Qbbxq5ZYaMXq7NEoX8NLwcQsXPDyIMiuCGX2OtEa9wnpx0/TmiV0+oO74VxDSdq7
 k7Jw==
X-Gm-Message-State: AOAM533f1HKdShjLVbKhFq8q6BfZqswdTLftvMFeMhiu37r49XucPuIz
 bu8gsrcsZS3jao4Mpn9fpRiQJnMQxikFOqiPlXY=
X-Google-Smtp-Source: ABdhPJwz0u7deW7MUmOx3rxxpX/3gA3nni5OD+0/Kb/wWDJeR2xwYc5c25odAf7eiL7iS3yb50teG0H9EPy6ZSurJb0=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr5413945ilq.131.1607552575563; 
 Wed, 09 Dec 2020 14:22:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <1b78dbf9afd11bc9e47ce112a0096521a744133c.1607467819.git.alistair.francis@wdc.com>
 <65e90c9b-ca1b-a1c4-78ea-63500ce59ece@linaro.org>
In-Reply-To: <65e90c9b-ca1b-a1c4-78ea-63500ce59ece@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Dec 2020 14:22:29 -0800
Message-ID: <CAKmqyKPfvFxZiW1U-Gd+PFZyKnhZb6e-DNTWeS7fhJmb=P-kng@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
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
X-List-Received-Date: Wed, 09 Dec 2020 22:23:00 -0000

On Wed, Dec 9, 2020 at 7:57 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/8/20 4:56 PM, Alistair Francis wrote:
> > The helper functions defined in helper.h specify that the argument is of
> > type target_long. Let's change the implementation to match the header
> > definition.
>
> Given that these are riscv64 specific, you could alternately change the header
> definition.  Dunno if that's clearer or not, considering an implementation like
> float32_to_int64 -- is it immediately obvious whether or not we are truncating
> the result?

I suspect the headers are going to have to be changed before we have
full dynamic xlen support. This series is already pretty large so here
I just wanted to get it to compile without warnings. I  think the FPU
will take more work so I'm just going to put header changes off until
then.

Alistair

>
>
> r~

