Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nvpcH-0008QX-PM
	for mharc-qemu-riscv@gnu.org; Mon, 30 May 2022 20:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpcF-0008NU-Ke; Mon, 30 May 2022 20:20:07 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:46369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpcE-0005eK-4D; Mon, 30 May 2022 20:20:07 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d39f741ba0so16205455fac.13; 
 Mon, 30 May 2022 17:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v9yLNrG6l0TFkQ92L+tL5tHOH+nEKsuWiWBDUxEUOcQ=;
 b=YAmYy+oTwdG4KZ5yC9DlMXmeTakI4pAid8fmGHo8fvnhQwt9kGG7Z7om2rv3KyPN34
 q9xRDIi5/9l/GeWAEDlxg5QvFjSv3DFBp+hWSMQDxou1SeUoEvkXzz60xZI5IIi3pu0I
 3b4EaBj+IxJqBM618FsLE5qyE43aKR7u8+kDNwWDdg9fcID45+e5OztUl75t+QVAbh6g
 yIIPY/D1lmAH9uneAglS8z/IOf9sfZhGhmWJKDzvGGpLwaAIjT4iafeGNXr7EeI3OuWo
 rZltBVxNw5bfPZs3DAImMPlrR6PpemXhLIDn83P/CqKDR/7n/FYKyiHYh0NT5hlcidal
 IQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v9yLNrG6l0TFkQ92L+tL5tHOH+nEKsuWiWBDUxEUOcQ=;
 b=HAdr7jw1LK/AhweAn5ipsJJj6uYiD7Ga9KeZ6dLxpa/m8zgH2Z0RjiK4BU+tt+ohMv
 YM4gMb1myUYeSxGZ2MqLQzh/vd1rPJN7690SdXu3KKugK1jG9V52fmkXBb7gS2G2IHZv
 UL8eSsYff8y8CcStUEWV3I5cYGDpAVB7JH3PsvfO+cD7BdxRYIYBwN7iWcnRbDGtuQPO
 H2tHL1DTt7FTPbK1J+uV5XR3VeHKH9mLIkBAoOhC/XHQ5d4H6H9PugeKU4VvCN99+LTj
 WcMuK/MlDMuZAO36lfJVZIUrrhpnUr82ryCKjBSfoOqmO6IIgH/gVJYAZ24OBeFKFgkz
 KVgQ==
X-Gm-Message-State: AOAM53002k579NJ3epHHBr/NYbCYUkQFPTUlLxq2RxA80aaZ1mQZWOyZ
 JZ+/1vwTbeihMjH1sLTTIlIo0cCLoI8idjQDG6M4ogzMs5j1bXTU
X-Google-Smtp-Source: ABdhPJyuw1KcbBAW1IyIAwO2Ds6rFXL/+th2oi+B1768m00GNuoE5uVaqVi67evQA394woBSm8qbGZ2OKaXmaDMCicA=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr11748958oae.278.1653956404719; Mon, 30
 May 2022 17:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509091339.26016-1-alistair.francis@wdc.com>
 <e8feb9d9-b9da-c1d7-a978-5966a6bd30f8@amsat.org>
In-Reply-To: <e8feb9d9-b9da-c1d7-a978-5966a6bd30f8@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 May 2022 10:19:38 +1000
Message-ID: <CAKmqyKMukniKikfExp0KCpUkDLECfifuq4x6X1WzKTWXJjFRqQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as hw/core/uboot_image.h
 maintainer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Tue, 31 May 2022 00:20:08 -0000

On Tue, May 31, 2022 at 1:38 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 9/5/22 11:13, Alistair Francis via wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 662ec47246..9ba30cec8a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2173,6 +2173,7 @@ Generic Loader
> >   M: Alistair Francis <alistair@alistair23.me>
> >   S: Maintained
> >   F: hw/core/generic-loader.c
> > +F: hw/core/uboot_image.h
> >   F: include/hw/core/generic-loader.h
> >   F: docs/system/generic-loader.rst
> >
>
> Alternative patch subject:
>
> "MAINTAINERS: Cover hw/core/uboot_image.h within Generic Loader section"

Thanks!

Applied to riscv-to-apply.next with the updated commit message

Alistair

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

