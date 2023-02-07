Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPELT-0005hy-Gf
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 22:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPELR-0005he-Ur; Mon, 06 Feb 2023 22:08:33 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPELH-0001Ih-CU; Mon, 06 Feb 2023 22:08:33 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id k6so14903298vsk.1;
 Mon, 06 Feb 2023 19:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=44Zji4UkG2JMCVgwOWwwU78WxsX66yvpm/FwQSnpvUc=;
 b=jT1rvtmwSRGOaS3JO0Xv3SCLlEllJSk9UD2OjTs/ywN8Y/58vLXOIxqrltpajRaXVU
 Cw2cfeWl4had1eHChevyg/J5GsFyePoybfH30or5IzTk2cKsWEAWOt0qSjDjGNP/Po5I
 /xldq0j5u76ARP1drvIKb9IqBaWC/p21L8kOpleWlC54YFxumqTCBwyzlUjRG1Vb7HYD
 R2dadnDbHnoMXzTkT6kdHTn2mVPHAE1zQbRujtRmlV8KseT/Ux0UPZqe0gbwqo1ujgnb
 Ml7i7gNNlWGc6jABl4zjlar1yxZQYdgfrxZ58XOUoRtdNzLQA6AQUwk71y214Ye+p4zT
 jFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=44Zji4UkG2JMCVgwOWwwU78WxsX66yvpm/FwQSnpvUc=;
 b=XIdbPgI179HFjI441UtjZYaXGPGRYxggdxF3B6wFx+zDMjepoqR5xu2x/ZXflioPTb
 d67kSCsEWqOVf1p/8aCAjq2QVpS0acMZygoOFrGHaiWqqe33bJgS8zrU3vTWW3I0pUAf
 WOuev/dnQIp/cCh2J+1EJPg7IB4krj4ywkOMpnoK0QJtEi6pOn8nQWGi4jXpjIXj8zWh
 YVp49mvViRG6eaiyRpSl+EoaMNjqIKE2UpARZ8lyeqmJAc9F27NWl08JCJLufpyz1C3D
 7bJMr/wR5QZJkZwSl4VJbngxrIFJaamD5Cdpoq2rRjMpyKwbAvw4vT/vPOJOgy3gZ+bv
 Jwww==
X-Gm-Message-State: AO0yUKXxWM0hT5RJ0WhYIVp76q6tWECSgtU53GpRlHifhJXmlgaD0qaG
 pg1s6i7b0w6zrj8CB374TGdS78qrBvNTpKfIQl/X1u0mrus=
X-Google-Smtp-Source: AK7set9/3Rd57ZvTGu1lXCWU0P7zutGe60U1rPBIZETHMM9l/hZToge+JkqR4xL3iqwPy2XbNde+/aqB4nxTPZjPR8U=
X-Received: by 2002:a67:c297:0:b0:3fe:5a64:f8ea with SMTP id
 k23-20020a67c297000000b003fe5a64f8eamr351760vsj.54.1675738916824; Mon, 06 Feb
 2023 19:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20230206085007.3618715-1-bmeng@tinylab.org>
In-Reply-To: <20230206085007.3618715-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Feb 2023 13:00:00 +1000
Message-ID: <CAKmqyKO_=reUVP_EBfnLUmuuSCUonOghF0TUdhSmRGW+xf9Mvw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Simplify virt_{get,set}_aclint()
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Tue, 07 Feb 2023 03:08:34 -0000

On Mon, Feb 6, 2023 at 6:51 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> There is no need to declare an intermediate "MachineState *ms".
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  hw/riscv/virt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a11b4b010..bdb6b93115 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1577,16 +1577,14 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
>
>  static bool virt_get_aclint(Object *obj, Error **errp)
>  {
> -    MachineState *ms = MACHINE(obj);
> -    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
>
>      return s->have_aclint;
>  }
>
>  static void virt_set_aclint(Object *obj, bool value, Error **errp)
>  {
> -    MachineState *ms = MACHINE(obj);
> -    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
>
>      s->have_aclint = value;
>  }
> --
> 2.25.1
>
>

