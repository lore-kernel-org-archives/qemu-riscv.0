Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGOK-0007De-2a
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGOC-0007BQ-6b; Mon, 21 Feb 2022 16:38:37 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=40901
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGO9-0008Bd-N5; Mon, 21 Feb 2022 16:38:35 -0500
Received: by mail-io1-xd2d.google.com with SMTP id t11so11872713ioi.7;
 Mon, 21 Feb 2022 13:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NOa8ZzfsCS3LsUDQxl2Le+NUdrn5anq8nnYsxVMQeNo=;
 b=OmpX+gprrxSGeDaRFtQyeXHzNbwrmzsWz0Gm0VXuOE+BvzhOLw7WGideaQhN3uY+2N
 OqhbrsFL6l/H60gexKJUKQYBvaLEveZi2Y3zQf4KX34F8JyJAX21vf3icKzk3UAEJ7IB
 n6RZUNyshw91/40nr2H9qJbk/OEQ9M96Mh0OmyUyY9q946r+vPcVOl9ApzSQmKo8pbqt
 7URIrLOhYCld4AdV2ozNqgJxDD1lNGpuUX5Hw//0m5d4URwC6c7DWSKMP5lD/iSWX7Qh
 D2isf2Xolg6uLb8kMm41k1PFD/w1Z4aK3Rk23L39VzBS73imH54lYK0yaIzpz43K+Bg7
 jWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NOa8ZzfsCS3LsUDQxl2Le+NUdrn5anq8nnYsxVMQeNo=;
 b=AgW2t6GYZ/q5wTEClpB19+aMoXpegpMJG4s2nz4kZGPtZdYuTWFdZIYb9likIhkRM0
 mgq96KtsdIt3LI39GoKbrDyrl8N/HHpchw3op6FPrtusCO+cGPzBKAUOxK3zKGF6ztNL
 EeX42O0MdN11cmv4QoFcFqEQynKWFC269AzaLszQGdxHferarwFKv2iC/zFqIPye5kP5
 MKrwFQYgoheOHMY8tXUWTCGdLZSdCb60aK41w+dTiZWskSIuiZstQ8M08ifoUoiktpDA
 Xrx861KHjh5+BSZMb3Q2NjoAWUGhzfYPwv7jTeimhqzo/kIwYb37RPOi7m5JuAbd/DCP
 XR0g==
X-Gm-Message-State: AOAM533JtrsdNm2yA43lXEVKuZW0lQul2xoGgNzlHKA7ygxQM09Tsrlq
 0foUfGHLwbZmFM4bI0W9kl3gPwWJ4Jid6rc/6To=
X-Google-Smtp-Source: ABdhPJxG8U6En81W19bWVBT47k5OFmjbmF2CkPey1O4F12638+709VtkOecUdGAVwBPKSX6lMwD5bKKqythn68gXfY0=
X-Received: by 2002:a05:6638:218a:b0:30f:ade1:d2e0 with SMTP id
 s10-20020a056638218a00b0030fade1d2e0mr16589261jaj.267.1645479512400; Mon, 21
 Feb 2022 13:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20220206091835.1244296-1-atishp@rivosinc.com>
 <20220206091835.1244296-3-atishp@rivosinc.com>
In-Reply-To: <20220206091835.1244296-3-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:38:06 +1000
Message-ID: <CAKmqyKNa8g-cWx+ATBF2+Jx9RwJc-up2D1G_Y4-DkB09EnfrFg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] target/riscv: Add the privileged spec version
 1.12.0
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Feb 2022 21:38:38 -0000

On Sun, Feb 6, 2022 at 7:37 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Add the definition for ratified privileged specification version v1.12
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e5ff4c134c86..60b847141db2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -86,6 +86,7 @@ enum {
>  enum {
>      PRIV_VERSION_1_10_0 = 0,
>      PRIV_VERSION_1_11_0,
> +    PRIV_VERSION_1_12_0,
>  };
>
>  #define VEXT_VERSION_1_00_0 0x00010000
> --
> 2.30.2
>
>

