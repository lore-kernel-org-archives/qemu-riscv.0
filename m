Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZbqG-0003LH-4Y
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 13:10:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZbqE-0003K5-Kd; Wed, 30 Mar 2022 13:10:42 -0400
Received: from [2001:4860:4864:20::29] (port=37673
 helo=mail-oa1-x29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZbqC-00044I-Vp; Wed, 30 Mar 2022 13:10:42 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-dee0378ce7so12329006fac.4; 
 Wed, 30 Mar 2022 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHeCRC20ST7Kyb/hTyoPyq5l0EvclDmpT7l3wHzPBNg=;
 b=Ft5SQZA6Kio+tm8cnThYUFtc8MJ52ILODJ4xhtr6LhrLeoD8qcgnooIttfebmSE03x
 eSUCiqfsMFae3xjpIvgSc2z5cW0p/zQjwberHUHDKs1Fbb+erU0sdhK/RZ/+5K2f22Qr
 ytDRUyzJM04jF9goPSwicTi5cgK+6U6bAXcIcQeI+G/hheEBAsvkmNgWevbpaQDm9PlX
 DudqdnzTQIz7Z2DSMu9fkUkB+mtqUncHVJjgd/jVQALTxKwKa1jGCl/hQZwwj9YWQqqf
 ris5c/k28zXJvBv1cl/b/WMVZ2hWOhs3ooR/jWpYPoOkyA2lT9nPC+NBm6HeKjS8DQ/k
 X/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHeCRC20ST7Kyb/hTyoPyq5l0EvclDmpT7l3wHzPBNg=;
 b=w/HFOHn09hBmr9SWA4hGpIpTnktorT4CkNUvGMxzuorR2Euim9B6P6iSdEzvgE7rnw
 zv7FWEIDPi+VnbNu7IXceSW5JfqZQNRIrYdq6+/fA0cpcHugqx4x2QW71IDmpIs4C8Fs
 0QwKdtqcdEzNC8y18u0PC2unPMi541/rahliDteKVII5jraOd5Gq3hqCEWgP1sc81dD4
 qNyuV7YurQMQZTkieES/cErgiNDN6CR1quD6v0PQivWkxVFc8gFtI7ywGWMkzfrg/JBw
 KjIuQud5edKitoHKpk5EGlqM0sq+B+l41HhAkQCF935kK6i5BZ7NkgIsfEM0xvlsKtPK
 THhA==
X-Gm-Message-State: AOAM530oHMgMOQgpYOJLKy0yty6bhxR+X4e5TXa5ZH08kpyjFRFuGL43
 dmxbuP4t5UBJxmi8D5Hrqsk2Qx97dQE/zKrstdo=
X-Google-Smtp-Source: ABdhPJz/qRqJABaRDW6hfj2wuXCY7z9bFyU8DaKwPf8JOfX3D3HtZVvI744Vr0reqiRlPneG+aNgYULtQk44dY5FjYM=
X-Received: by 2002:a05:6870:d0c5:b0:dd:ad86:85ee with SMTP id
 k5-20020a056870d0c500b000ddad8685eemr337415oaa.10.1648660239156; Wed, 30 Mar
 2022 10:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <621d67f0.257cf.17fdad5aa33.Coremail.phantom@zju.edu.cn>
 <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
In-Reply-To: <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Wed, 30 Mar 2022 20:10:28 +0300
Message-ID: <CA+4MfELoEGOW_+kFiOu1t7MD-nEFg7rcc34By+ukh=1qF=5iig@mail.gmail.com>
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: phantom@zju.edu.cn, Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::29
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=idan.horowitz@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 17:10:42 -0000

On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>
> Presumably you mean "revert" here?  That might be the right way to go,
> just to avoid breaking users (even if we fix the kernel bug, it'll take
> a while to get everyone to update).  That said, this smells like the
> sort of thing that's going to crop up at arbitrary times in dynamic
> systems so while a revert looks like it'd work around the boot issue we
> might be making more headaches for folks down the road.
>

The opposite in fact, I did not suggest to revert it, but rather undo
the revert (as Alistair already removed it from the apply-next tree),
since my original patch fixes buggy behaviour that is blocking the
testing of some embedded software on QEMU.

Idan Horowitz

