Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6fLo-0003qY-It
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 14:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fLh-0003kE-Cu; Mon, 01 Feb 2021 14:59:03 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:38272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fLd-0006S7-Qo; Mon, 01 Feb 2021 14:59:01 -0500
Received: by mail-il1-x135.google.com with SMTP id a1so16848191ilr.5;
 Mon, 01 Feb 2021 11:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SKyyWMxTpIpg6K+Vsby9Djb/AwohucHSDi/F4Vwzhw4=;
 b=tzTFUWGIt/jbJtBuJEOSSbOZaKaI/R57rNrNjA8YZkHq4YFzseAlCTndZHILaE0jjV
 XcN+fRSEEU92OM/RtuReIeds9T4kTj6oMvCIeoFuqeugMhE8uPUxkDim8oGn5265kVhA
 c/Mxax7i/l0tfw3u4UvkQPpCQGcEfcuhYCBs++N8aX6/TbdPfAHfBrtbHy3dwW5zU5r3
 BIDo6KA5T/F4plzh1syDUlxXYmhjWkCT32nGWL2Qsg8t9wPW/bE4Y+Am7ejYW0ZieG3G
 ncYPSJN9tTZ+uqV1pzdlxnqjDJTPP4reCJ32WdQeXHLsfdGd8ua5dpq6kASDikckmGi+
 X2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SKyyWMxTpIpg6K+Vsby9Djb/AwohucHSDi/F4Vwzhw4=;
 b=WLLlZ7Gj2WfmHEH2//2tm7rm+9Yjb2FQHivxwIxjwow53a55YRs9d5WV4vf6EBUATT
 yZWwrBz8aAyQD/KCHJq5l0rUPBJJp03OWoxNxYjYbCpEFvrPorWrPHQ25KX0NP6LkzhU
 MyTZcbA72sj4xneKiuAIzJryLXXUik95pd7c05nGjVdpzLM79v2FXylqe+Kwk/UXXjXs
 A5tmY0DwW39JE7LcoF8lYO1cAld4zfj/6Dz66ypyvjHKH0451dnIublt3vDq49Sm6s7z
 yS720KIbO4IGq2UtvuM9+n5qDlGOWj96o6M0M/x7EAunBU1V1CyDXF1i4AEE4LBaUKFJ
 bLJQ==
X-Gm-Message-State: AOAM530tQCjjNCV7rljLesAtwoejpXkktsu8DojwrE0MhFAvUZ8RYlTc
 gk2B6WU8wFijO3QsKqaFh7iUjuMu6Y/ym04KvpU=
X-Google-Smtp-Source: ABdhPJySdadrxzzwNF2ryS4eN2JSOOO0w7oSrLlIH48L7SH5Oad7lB269hmQan6Yq4xbgfKqAhNAqAnZAYBRgk3WZjk=
X-Received: by 2002:a05:6e02:963:: with SMTP id
 q3mr14399945ilt.227.1612209534947; 
 Mon, 01 Feb 2021 11:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-9-f4bug@amsat.org>
In-Reply-To: <20210131111316.232778-9-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:58:27 -0800
Message-ID: <CAKmqyKNLM9TRr9PhAOk+fqcW9d7T8P5BRE0YJrkGfE52t1Pg3A@mail.gmail.com>
Subject: Re: [PATCH 08/10] default-configs: Remove unnecessary SEMIHOSTING
 selection
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Cornelia Huck <cohuck@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, 
 Marek Vasut <marex@denx.de>, Qemu-block <qemu-block@nongnu.org>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Greg Kurz <groug@kaod.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Mon, 01 Feb 2021 19:59:07 -0000

On Sun, Jan 31, 2021 at 3:24 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
> shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
> already selects SEMIHOSTING. No need to select it again.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/devices/arm-softmmu.mak     | 1 -
>  default-configs/devices/riscv32-softmmu.mak | 1 -
>  default-configs/devices/riscv64-softmmu.mak | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 0500156a0c7..341d439de6f 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -41,6 +41,5 @@ CONFIG_MICROBIT=3Dy
>  CONFIG_FSL_IMX25=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
> -CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-config=
s/devices/riscv32-softmmu.mak
> index d847bd5692e..5c9ad2590ef 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-config=
s/devices/riscv64-softmmu.mak
> index d5eec75f05e..d5b2e25b6df 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
> --
> 2.26.2
>
>

