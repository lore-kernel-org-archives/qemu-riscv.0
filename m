Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcesM-0000JD-97
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 22:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcesK-0000IX-Hm; Mon, 18 Oct 2021 22:29:12 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcesJ-0005yc-08; Mon, 18 Oct 2021 22:29:12 -0400
Received: by mail-yb1-xb33.google.com with SMTP id l80so4210873ybf.4;
 Mon, 18 Oct 2021 19:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUX6HqnBXnb5do0lyUb9/PxfIe82Nn5Nrk4m9ugOL8k=;
 b=OW1vONyfcbHDmBgDhgElwOkhSwItaPXp9P537NOOynq+ElGhTDkcWTN8SNuJZfslab
 M9/t9uGdSxEdYoMjVpkBToJSqQeA5RDOmrDTs8M0uvdxkx6LsyRZ4yUVdeNIm93to7N/
 VV4/jydOnGJvrg68S54rgmIiQgKY3agmVWvbWUU2kcwj3wKccZ3/BvKtGftavxtj+D/m
 uNp2lFfU1nUbgUlvyRjQsaZrp9NYpCVpk82uR7eQQ70y4vokvNkP9ghaIWDDCg2FoSiX
 dXPlNvG3wpaxoxi1rT5t/7MFCzQFxDYGjJPA3SCRadat68Nh98pzkigH9MHB44b5Ge+T
 K3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUX6HqnBXnb5do0lyUb9/PxfIe82Nn5Nrk4m9ugOL8k=;
 b=JKK/YSkjxpdZ5eoGvAtOG/G4AJfNjNPyFfrYAti/YBEudjRVsh1J+MFogylIQXoQiO
 1VGPcjAmTyogGbA0RUoG047iMjI7KMuToS828PLqTiAVD3vxBFucVBGV6/4S9WmhBQ2o
 KLHrVQgSOb8cxVxVE3M97MkQm+PgDaQAjfjaxa5n1ecf1yrk8ONH6cUfqYh5RyAxI4uT
 qbkdPGGTZfb/bSXOS2UPLuww/d2CJwNJdlM52l+RaKehhlkjIQQo5AoMQzhH6XIXKYj/
 lhiBvYe0hsqFI00DB+rLFaZ0eyYMuDHtHyO11rydGVKtl+I7FxZG8m+SSsxrn+/l7f39
 npDQ==
X-Gm-Message-State: AOAM530yOyZ4HmarrIvoGObgI5Vj69DXYvDRpYyvD5EDr4R4ceSdD/tu
 MbAN9WFTzwLY0x5O/CmFm0iJIRIv/RuG8tqhsgk1QDB+idc=
X-Google-Smtp-Source: ABdhPJyZ9FoNzyjVtzMHPDR+dQRYxs1/nwXY+N3l6EqVbBVLs61pi6wRRFwcXaqNtSnh/19aQV3gOwNUmvHs9mx2O5k=
X-Received: by 2002:a25:346:: with SMTP id 67mr31432162ybd.345.1634610549558; 
 Mon, 18 Oct 2021 19:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
 <b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alistair.francis@wdc.com>
In-Reply-To: <b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 19 Oct 2021 10:28:58 +0800
Message-ID: <CAEUhbmUEv5RLN2MrXEyn4P6vaQADxRWMEK1qPPMuqYxY-6mbxQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/riscv: Organise the CPU properties
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 02:29:12 -0000

On Mon, Oct 18, 2021 at 12:32 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>

Possible commit description:

Organise the CPU properties so that standard extensions come first
then followed by experimental extensions.

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

