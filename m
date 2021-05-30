Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnK3j-00044X-Gt
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 07:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnK3h-00044F-Rv; Sun, 30 May 2021 07:56:45 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnK3f-0007hR-PA; Sun, 30 May 2021 07:56:45 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y2so12419516ybq.13;
 Sun, 30 May 2021 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K0fc8e1HHHtBcKClRVaIq/iLSE4L5dRZKMduIBEFfUM=;
 b=PLr6fcIqlprXSRq4NxSsYibaBkx2ReQbbBE+CGjxuoe+wGN5feaff+5OI1p2Y+XtyQ
 8bMc/gmZ3ySxwW3ukvoyfZVwsaIsRuA5QjV+PCVvaoAer7LrqhgaXMKuNlvY9Xc1abza
 RfDGkIsFWvQG87iAUk/6yDHEr+AUAaLKiJJbialtiQBDzmTCfWzlQBfqVbpW779R84Xd
 LM65sbBPWDyeACYY9X6QcW+PFsdvmCe2mLL846o8JMqWl0VM8BMXYC2+4OKQfEhv5Nih
 /WzuAMZG+hPyS376zUhlGusDDuoJeFogPxR3AEayG6cH+dwWsH1STdYy2ULpbJRiS7CR
 MbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K0fc8e1HHHtBcKClRVaIq/iLSE4L5dRZKMduIBEFfUM=;
 b=oIV2A+t2KmCDC5baH5pytGTGk8S45PZhNxmzdPEMlGPvUdXrtjKCDmJSMRl2L5fOfk
 PsDKcBRPxaduHo6Zj7WW9OhsUNh0I+OqnGPpP9FQdWxLbjD8+bPz4Vpn9y0a59xt3ktM
 z6Wiq1drEuDGRA7CaitEqusI9JRu34ruJ8sZqK+SK2tgGswcPGO1Fcnl0BFm2SiS/1jb
 Sbsff5KOmy9Pq0BkOryS73R1w8tSovC9PTbaA+7QQSFLIgdoP4ajTM/wQ8NQoFSSRur8
 4eGLsr/eft4tK/gkn7r9fV8k7t3IZnW4uW2X/m+BrFF1hzYo+jA00qIJn/+/otZebBpn
 OA9w==
X-Gm-Message-State: AOAM530EwagVRSV6aVln+k290KdtE8grY9S+JlrISUSMoQ3HLgL9YVy0
 s5qggd3aimDv3vPKpR4XgHprb90KhgMdSoud2rk=
X-Google-Smtp-Source: ABdhPJx2MFkv0UFLRx+7Q7a9BWqcxb8c+AJmtiToSBIt3pSbMfig3rQ845uwuzU3PNWcwJol9A+Ie7NJhIP7SiMctLs=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr23335291ybo.517.1622375802034; 
 Sun, 30 May 2021 04:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210530104922.466175-1-lukas.juenger@greensocs.com>
 <20210530104922.466175-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210530104922.466175-2-lukas.juenger@greensocs.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 30 May 2021 19:56:31 +0800
Message-ID: <CAEUhbmWTZ=6tVLAc9eGff2-QjZ8oNnT6G2gJoHBMGsZ2WyjE1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, mark.burton@greensocs.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Sun, 30 May 2021 11:56:46 -0000

On Sun, May 30, 2021 at 6:49 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> Make function names consistent
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  hw/char/sifive_uart.c | 44 +++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

