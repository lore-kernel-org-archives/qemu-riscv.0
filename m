Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltReO-0008Uz-B2
	for mharc-qemu-riscv@gnu.org; Wed, 16 Jun 2021 05:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ltReK-0008Sx-ND; Wed, 16 Jun 2021 05:15:53 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ltReD-0005ri-3Z; Wed, 16 Jun 2021 05:15:50 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id b13so2043982ybk.4;
 Wed, 16 Jun 2021 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vXmhzDqLuz2y5ngXRfNBrk6SvB2qIjqGK3wrwOmZ1OA=;
 b=AW6cBg8B/ln3xZbZvvbd8V7idmmG+z8DJ9ENAynSDstJLh2i5rTbed+wI+0yx2TDdP
 i+Di7xLsZwVUmqVtMSFLa0HsFG1pWbioBLaECvICUn7EgBTBXHWrHiuRlG2xAWn2sLbi
 uOSxPBy+rZV1ilRTPNHLSqATlOxaFD5cvcpkHNQxHLQGSL+5Rs/vj7Mb47uzDkDhqzpB
 yQY9KNAJgLW5nGzPxQH732aU4ZVcRU+06MV4poY0QrxsN/nFFqmgMDNVRIP1ytaSVzCG
 HtGw+cj+IpTlmFLK8mgxgyrZrSZRZ+Vtms+UwZO2St45NNq+wUM0dVFuMLISGqvxLXBm
 4wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vXmhzDqLuz2y5ngXRfNBrk6SvB2qIjqGK3wrwOmZ1OA=;
 b=UOXRueNjyPfe6LKvajtvnx/zNCJMHeerPQsnWeoJHfE4RTLbLgRmu5M1iaHpQ+WM/Q
 nfkgg1GjAmKStzKNKrBvGJCAW1ys0BiIF1DF76OaNJIVk10wJDCYL6uhsDIFhv34f/fc
 xShAeCjfVSF29o4TtANHDOoteNFqoyKEpWWfNYgyn3seGqcrAX6Xdx2zuqnK9nVjdcEX
 Fs2PzGjduS0LLD+OhFWuL9exvXAMc2jiI5DRbyLOkpXsE70uQi+vTaYCBaf4fHuNmlvN
 CSNeHZLHA5xB4IRxqTlyBBKYwfiQPp8Z2kIIl2nzXNyk+OPcbDaBtaeMNPSJkAd+FWrD
 JSPQ==
X-Gm-Message-State: AOAM531TOxbAfqg9QlMjEqTjAkzVcVkFMh4b0H2VpfaEVsLP/P2gAIYN
 A82qhnnd4nGSLkX4CpgypO79TQyurhPVQ+mllaY=
X-Google-Smtp-Source: ABdhPJz+PQqN9lpZZwP2LOmtC5ylsb8XM38lMTimpbKh4kl1rxwaIw2zcOusJ1dIU3Fbu5DC8/tVPJeFluLn46480O0=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr4875348ybc.122.1623834942370; 
 Wed, 16 Jun 2021 02:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210616064334.53398-1-lukas.juenger@greensocs.com>
 <20210616064334.53398-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210616064334.53398-2-lukas.juenger@greensocs.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Jun 2021 17:15:31 +0800
Message-ID: <CAEUhbmVhAUhQLgD+4eWBiDgfjAFed-=Tb6ejwWUywEq1wg7LWg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hw/char: Consistent function names for sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, mark.burton@greensocs.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Wed, 16 Jun 2021 09:15:54 -0000

On Wed, Jun 16, 2021 at 2:43 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> This cleanes up function names in the SiFive UART model.

typo: cleans

>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  hw/char/sifive_uart.c | 46 ++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

