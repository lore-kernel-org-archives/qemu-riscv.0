Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1ty9-00064x-Hv
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 11:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1ty4-00061E-Rq; Tue, 19 Jan 2021 11:34:56 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1ty1-00072M-3y; Tue, 19 Jan 2021 11:34:56 -0500
Received: by mail-io1-xd2f.google.com with SMTP id p72so16020503iod.12;
 Tue, 19 Jan 2021 08:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dk9ZyFCanndlMcbIB9VPHqikpM9HVvVQdAmjGS9Xko=;
 b=RMEqpenYkKK2ZiS4c60We1z40lh27Ls+hNMKnDDl0aQiBIduJ53kNoJYzz9mfed2si
 r5MqnX1Gnww0/t/D1QDfy6W22PyTzrIrj+lBwKcpidS1OF5bcEu2qZgAiUmnj0CIZ+3m
 DpAZ7ukxNAaGJ0zA9kFS3uC4OXWLk66fUQ95Xz//JDXQWnwaBGZYx25mTfSSqsqCASsv
 nmYQrTkNWHtViL4YqRqLHszG6GjNPOXVerMz3Bs+jGqQMY0Xj4wWr80LIPlOmB+5lxdM
 OW6+tfUpYPaXO4BascofcbwTQvQU9ABcOhA0xDeypMIzyitMDVmsgxbNkZWxwfCmAlm1
 lymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dk9ZyFCanndlMcbIB9VPHqikpM9HVvVQdAmjGS9Xko=;
 b=NjUZ3Wm7FsFPyG1VaIDDKabI2SFYHpMA1vFomM1/Aoo/RE1z6eNwzHuIidVbKtkzHm
 sCTZk/eYlolrQy7GVOmWj0UKjBU6HSfp2sLlUcFAJkIqlDwAcT4/Sp1zgDiBcrcEEjfo
 G6+3xTiJa+EMBHWs/fZuIGp9/R2JEkO6NBDOxRXWvZfQXIKpGatGJ7+Mdgo6b3CjCbnb
 db4G4Pp9j9F7EedpFCHV7txB+FRpCEMlvob9ooqnd+XSgka33XOfKH2f9uip5bKdpepC
 pssBY3rlc90sa7A4t9iAECsJ/U2DWq0kXqPLibwekdl0k/R5R9nUF4TNOosPPWJrTrAC
 S2lQ==
X-Gm-Message-State: AOAM533Y11it56INtX1UEowWg5J/0JAX+LC9M4AyAd1alnKq3dBWgYrb
 4E2uxmKHbjNZdgIsLstsAYaxcQ1HwdwFmoX+hKsskK0y1Mg=
X-Google-Smtp-Source: ABdhPJyGa03PUQMTYQqU116GPKhKpxpaTEgO67OD6giIIwTMY6IUzSzg7vVyJ3Xw+P4DN7lxhcJeLKKggtdylVEV9BE=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr4108150ild.267.1611074091719; 
 Tue, 19 Jan 2021 08:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-3-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 08:34:25 -0800
Message-ID: <CAKmqyKO6_S7S4ZnuVf7xbJPi3WxKrR+oiEOD+f6y5cDEMVzA9Q@mail.gmail.com>
Subject: Re: [PATCH v6 02/72] target/riscv: Use FIELD_EX32() to extract wd
 field
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 16:34:59 -0000

On Tue, Jan 12, 2021 at 1:44 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a156573d281..bc3f212ceac 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
>
>  static uint32_t vext_wd(uint32_t desc)
>  {
> -    return (simd_data(desc) >> 11) & 0x1;
> +    return FIELD_EX32(simd_data(desc), VDATA, WD);
>  }
>
>  /*
> --
> 2.17.1
>
>

