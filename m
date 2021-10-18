Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcKeF-0000Vn-9D
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 00:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKe8-0000UB-2d; Mon, 18 Oct 2021 00:53:12 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKe6-0005Ea-Jj; Mon, 18 Oct 2021 00:53:11 -0400
Received: by mail-il1-x136.google.com with SMTP id k3so3191433ilo.7;
 Sun, 17 Oct 2021 21:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7oDd07h1tSNvOpmOlFMqjvORWq9jYg5hGpHUrRQd60k=;
 b=VYpbkEV9GXAMsTZj0EUU8DCrd/QCRPLFBSUmhj0UaU/7xMFg0KtpJnryXB2GsJSWwh
 MAuyBhUbT6TJ4+98NMrp31vP3YXaAFVaHpIQSbGcwstUiq1pFKooqxbcoRGgO4t+4WAH
 EzyERDtkj5Tyl9xqFHcfxXiWgNvmNVt3xolaSzRsapakQihdtD4i5BoqEq73jPf030xz
 1rN56fxWxkxxK4fz0/IQIx9v4j2r/V2IsyGcFJuivj5c5IJb8/wFdfe9SYeC+gVUBDPE
 aZn4g9vF+WKICpx2/D+kMfiHVMjZZgs7gHijHCSi6/A66Tul6IE9vtJ9rc2FwUTojCIU
 rVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oDd07h1tSNvOpmOlFMqjvORWq9jYg5hGpHUrRQd60k=;
 b=iI0udno+wZLdD+JvUqOkn+ol/MuzNBx3gmbgUmcPZ+R/JQrPV21X3yeVm4gw78u5vg
 7k2zsYR0aDbHDAxDUbmarQlpXLYwZDpEO/lHoS3gqc+EJspCLJMgKsO4YZ+k5vTf7JS2
 O7wTsrXKoUb3GfLgFzkzS1w2n0TC/51VCcfMzZo6kU/jVy4If/XZYtp67zpQMkne0LGP
 4nb2IVbbQeb965hxxJzYQwxAJrePzdTJToQV/dz7Is+d06p2bNghTjRgCUG9Peid/yGj
 nDt8h3wPXxr+KbzBfONBkwbdyER8oDV25lHB/VDn/8v6KzXmf1ke3f6Gin7LmOv9nqTb
 /jjQ==
X-Gm-Message-State: AOAM532V2RA3/Pk9krzsR39MdzLKQocILUKl+bLo3MMjGpXkUi2KBSZM
 HUNC0sRoS43pvz85b8jtg7ZcSSN+9m5DMSPnq8U=
X-Google-Smtp-Source: ABdhPJyDLvmLoYtPJO4dmzYh6KUlmxglS4dsTbOL5Q2CAdhWeYb8AgRuuhOLOGlin0z2w/D/tkB/X8HovfFLCBUC3uw=
X-Received: by 2002:a05:6e02:1885:: with SMTP id
 o5mr12654487ilu.221.1634532788590; 
 Sun, 17 Oct 2021 21:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-15-richard.henderson@linaro.org>
In-Reply-To: <20211016171412.3163784-15-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 14:52:42 +1000
Message-ID: <CAKmqyKOZd-gtes+_sQ=ndjqu9nfujE_Kc==Jueno+ds6Pg7neQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] target/riscv: Compute mstatus.sd on demand
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 04:53:13 -0000

On Sun, Oct 17, 2021 at 3:32 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The position of this read-only field is dependent on the
> current cpu width.  Rather than having to compute that
> difference in many places, compute it only on read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This means that the value reported by riscv_cpu_dump_state() and GDB
will both be incorrect though?

Alistair

