Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKy4-0002gl-VB
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKy1-0002ec-LD; Wed, 20 Oct 2021 19:25:53 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKy0-0004y6-0b; Wed, 20 Oct 2021 19:25:53 -0400
Received: by mail-io1-xd31.google.com with SMTP id b188so21816849iof.8;
 Wed, 20 Oct 2021 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KburKiCZbVTyjCbtVPKjAFjVDWB3N6OVqk3JNX/W04A=;
 b=ntylmFP1eRV19YtPLr9agvr1amI13Ah3aS3XAlf4BDC3ShLtqDXtxiVJG5IkACwvOe
 xSaokWM0KMykCvQvuULtLpdPQvMjhZqiCqU+w2+kGSHAoJAhjZybGAV9GpVygzCA3VJJ
 zBn4gAdRRu3wwmspSK13YattBIz+ppr9sm+u2D6l5VO71eEnHveXTrPStYJdHMTKnPX2
 q9E0IvAJrc7gDaUOl2N+8Nmgr/CV/7aDClP0W6Kaj69N5gBI4JGUZY6hprwitTI/CECM
 GjkyMOvaAdUPuVSn3Py2eCUeCkclM8BUk9g/FHkzVZtxAvyIEdn9gcKfugNAALYalWIE
 6Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KburKiCZbVTyjCbtVPKjAFjVDWB3N6OVqk3JNX/W04A=;
 b=ywRn99Xx95Aakr77FUiOB4rhK/HjCcWYkbrqtVQ1fMi2zGO7zEI6IQRQcEqA1C07S8
 oPe3yThFI+GAhCJ/kKO/kzrJdDOcIVq/yUlPWxoORNTcktYxHVqfzhrPxgYkgmisaH0J
 Mwwgs7zxfC3UYpi62bcvvjMOmsmxlj9IlfS/8cZAVem2p4hklMx4qpIVMkn+APx4IMuv
 raIy0XnRofAau1LLXzC9GWgbQoCuUXpakW6dMkTmc+SxqshUDNLgS0/9FJ/GXYQrg/Zj
 PyQD503wnBQqlQM9ZyKfSyCdEIwIt7IafuVSb5u+WpH7U4JVbJK9B+ccLZAHWdZvjDxc
 iqDg==
X-Gm-Message-State: AOAM530i5ynO0mBljIbJNrmFW/mnnv+v21T5WbOxeVXPvvAMACewv4oq
 QOA0un4ORSab/XJbIy8FNePLTFL3FilBMLG5zcc=
X-Google-Smtp-Source: ABdhPJyOpXx3sfyaxCA848B24NDXF9u8gXhgdDqTC0kUwYZN1CHw6K8tcyWNvm3o143PjeyHTtCzKITi6ZzBwLgXYP8=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr1458580ioq.57.1634772348344; 
 Wed, 20 Oct 2021 16:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211020030653.213565-1-frank.chang@sifive.com>
 <20211020030653.213565-7-frank.chang@sifive.com>
In-Reply-To: <20211020030653.213565-7-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:25:22 +1000
Message-ID: <CAKmqyKMgoJs0=rHbkiUjSZQ0+VWNSzyLR0hpyiO5UDee=Cnc-g@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] target/riscv: zfh: add Zfh cpu property
To: Frank Chang <frank.chang@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:25:53 -0000

On Wed, Oct 20, 2021 at 1:15 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e6..8c579dc297b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> --
> 2.25.1
>
>

