Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVWuY-0000zE-ML
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 07:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oVWuM-0000tu-UV; Tue, 06 Sep 2022 07:38:29 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oVWuK-0003Rf-AA; Tue, 06 Sep 2022 07:38:22 -0400
Received: by mail-pg1-x529.google.com with SMTP id c24so10358095pgg.11;
 Tue, 06 Sep 2022 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=j6nQrA/+TNrrrVQl4cbrDYXY4CdHW6pYceHYJydCKiQ=;
 b=RSZsRS0eR32Y598HBE/WEA+RwM+dABqrhR/VcjAqNBS9m0hQvtLPaUyEawHxPxNld3
 AobaDBF51e78xEx29P8HhjVXg+9qLGg5lr7h8JpWdJxr1fKEycvm1XgeBIYffkPuBGXa
 69QHGOlj69vByo3ZwdDq4bmfnHw6LKl+kZwATjboSR68H76/7h6yNAhVc9KXu/Z9Zk4T
 JEGZb6IE+QCHSJVDw9qmYkO1lZnCRtTKMT4r12BtzackPHz2S3P+jStfsa9NBFpqFD1O
 UkxY6uL0Jc9AWRfnRmecZquS2pBl/ftmPoPGp+mCdtM4V0/iYVpLgxCk0nWaCiI63akk
 oBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=j6nQrA/+TNrrrVQl4cbrDYXY4CdHW6pYceHYJydCKiQ=;
 b=k6QU9udryCH3qK3iMzpYXWhVZVgeiJ1xumGamOnu21KnEi+Ja+rGw86GL1SXkyg10X
 nlm/WRjpsPdiDbL2pka0Ye8/qi7AZMblIiR0LErg+c5HOjNM088+lSxCVbbp/beGU/NQ
 T7QHmiYiRZ5J7eBpj1pApodPkl4v3DrCVEt4mEoKUogJ7vN+yKFXQP1Q8Ap+WPoA9paz
 3Gja6D1P+djRO75rPwZjMgOm4LOpStJ+xohKMQRstzLlQk96bwcYDk50hUl+Qd72v7nF
 CNweaJDSm7m41onyDV79spaLbAdRFg1SluAxBvrruQw04s6pVCXwqZmW/kYs++IuuxiB
 vM+w==
X-Gm-Message-State: ACgBeo1sdvN4ryR3/80jMuh7T2Ifc21ttHD640XUkrGktlmbLUfg4uzu
 qUONK70gLayh4ffu8mclL+y8cGH6D03K5wasHV6XrwVcwA8PSA==
X-Google-Smtp-Source: AA6agR5R7JBX+G9vsX99AHDe+ENcKLLfbw8qGoGYfIgviRkbBU7ksGZ2kcysY2yRk1Wa/a2jLhnjzR8vAYtiCOeHAXo=
X-Received: by 2002:a63:ed15:0:b0:430:48ac:3771 with SMTP id
 d21-20020a63ed15000000b0043048ac3771mr24156207pgi.423.1662464297242; Tue, 06
 Sep 2022 04:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220905163939.1599368-1-alex.bennee@linaro.org>
In-Reply-To: <20220905163939.1599368-1-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 6 Sep 2022 13:37:50 +0200
Message-ID: <CAKmqyKPtuT+BT7S=G3v05=s00p4OE8X+tNaccNsN7sn3yJwbcw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/system: clean up code escape for riscv virt
 platform
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 11:38:31 -0000

On Mon, Sep 5, 2022 at 6:39 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> The example code is rendered slightly mangled due to missing code
> block. Properly escape the code block and add shell prompt and qemu to
> fit in with the other examples on the page.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/riscv/virt.rst | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index f8ecec95f3..4b16e41d7f 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -168,14 +168,19 @@ Enabling TPM
>
>  A TPM device can be connected to the virt board by following the steps b=
elow.
>
> -First launch the TPM emulator
> +First launch the TPM emulator:
>
> -    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
> +.. code-block:: bash
> +
> +  $ swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
>          --ctrl type=3Dunixio,path=3Dswtpm-sock
>
> -Then launch QEMU with:
> +Then launch QEMU with some additional arguments to link a TPM device to =
the backend:
> +
> +.. code-block:: bash
>
> -    ...
> +  $ qemu-system-riscv64 \
> +    ... other args .... \
>      -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
>      -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>      -device tpm-tis-device,tpmdev=3Dtpm0
> --
> 2.34.1
>
>

