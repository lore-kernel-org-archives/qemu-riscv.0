Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdur8-0004ZW-NN
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 09:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdur7-0004Wm-Bc; Fri, 22 Oct 2021 09:45:09 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdur2-00031G-FF; Fri, 22 Oct 2021 09:45:09 -0400
Received: by mail-yb1-xb35.google.com with SMTP id t127so6971629ybf.13;
 Fri, 22 Oct 2021 06:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vszriO1IBSOAuJceu7gtp7WLl0Q6H7WA2rXcDnWA3Mw=;
 b=n3zx0Xd0Ms/c6byaiQ4Q4Ykmn2RE4GXFI+lfkTOV5yg9sooNSMz/D7QRkaG9rDSdmM
 gLQb2Si6pEbiLzqY0T36kvlzqW0FiapxTIR+DfQRZfCd5hs8S9eKGaOEjEAVrV/Mayrs
 +YtZWnCyTROLwpSH1GMEP7Wq6ZGl3896iGuhP3fdtnlKaOFkyBTbpRv/pH4hKGvuYv4p
 58fFxQkeJNtauIOUfGUfeM3ZJa8gO5GxQVBS/ii9FCPdIr2bumhRg+HN/O+OnsIIKlmS
 trPnthyn9SNK1AcPhXyd0yErpFx0Ihuh1obzQtlCfdEJFwDE7NQpYmCQX1cHju131wI5
 fiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vszriO1IBSOAuJceu7gtp7WLl0Q6H7WA2rXcDnWA3Mw=;
 b=b0nefz7qkijDdLoPr+1dWsA0qISxH3soEdLsvKRiOd5DLuoCxUsB84r4kA9SBi2eqz
 +ecZcsNvdlTk28Bj1xJVCdbwqQJ/EigCqCqjPrL83DPq+7Rg9t/IpJU/GGBFQRf5foUB
 0yHJCUtLFa102ir1qH8JIt9AsPhV0U5/davbhtHUhb99023twtPtIyLEI3/3gaTgAJOl
 /uJh9WfEReTCY2zziFvhTOgetg5+qc+jhodBg8FTXXP/OnfMTq9MADFaxcHHOtM1qxH4
 aUjusgGTKUrquPEGSP3b77ZOkBELbRyhDQK/PNUV0ZONanUoMPyACrObbkqpYR+6+0xL
 hTzg==
X-Gm-Message-State: AOAM530vmvHagoFtGnMJCg+lg+mGijegUKdlOZYfVJO4x3/Rg5UGneTf
 yKCZyx86CghLIPJLXBOwyId6Nt8W21sB1iHhQjg=
X-Google-Smtp-Source: ABdhPJwW20OKIVYvwWuypNS90CukigDn2MC6jjJV34fHaHAFkdzhnlPreZp6Muxse4hUdyW4THnFMaof0O96zoCVQnA=
X-Received: by 2002:a25:c750:: with SMTP id w77mr6479867ybe.109.1634910300104; 
 Fri, 22 Oct 2021 06:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
 <de9e8c6a-8850-b607-11ee-a1d54436e2e8@amsat.org>
In-Reply-To: <de9e8c6a-8850-b607-11ee-a1d54436e2e8@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Oct 2021 21:44:49 +0800
Message-ID: <CAEUhbmWfwif69ekzn_mGoGoCxMR7i28-gPzJE58e+KS0SFn02w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
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
X-List-Received-Date: Fri, 22 Oct 2021 13:45:09 -0000

On Fri, Oct 22, 2021 at 6:38 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 10/22/21 08:01, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Using a macro for the PLIC configuration doesn't make the code any
> > easier to read. Instead it makes it harder to figure out what is going
> > on, so let's remove it.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  include/hw/riscv/virt.h | 1 -
> >  hw/riscv/virt.c         | 2 +-
> >  2 files changed, 1 insertion(+), 2 deletions(-)
>
> No cover letter, so using the first patch.

It's also better to include a changelog in each patch otherwise it's
hard to track what has changed compared to v1, especially the v1 was
posted 1.5 months ago.

>
> Series:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Regards,
Bin

