Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liT4t-0000dn-6m
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 22:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liT4s-0000dS-Aq; Sun, 16 May 2021 22:33:54 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liT4q-0006ks-P3; Sun, 16 May 2021 22:33:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id l7so6529005ybf.8;
 Sun, 16 May 2021 19:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V7wEQKqwQ5OwwmeDdQ+DZv3iAllQc9fyfYQrfy4q71E=;
 b=OaFMee8tVZKlExJiEatUiFTa4bRH69+wmMUkGRoEmNFxdidcCVi9EUqS7ue5KMyoux
 ZIeMCbioyMft8Xh3hkjdDAzXoYUA9dhdJVoz0WB4MYe8zXre/lBKEV70eYusYKcgQIcL
 Orjg43K9WbVNzsyMZY+GBz9XcKKaqQPRUaiR9nCN6wCdCuu8AaRbyAe7dVLy8CbGSJ2y
 sGOHEQp18c0TZ55AjNQvqzDORllw3JOTyY84DfZwbXj4k6OcNIjmYIdQSKuPMkjaMe4q
 QzbLm8lAg/ppdbNBHStx20jEmjSUytvRNFVK2ZLgBY3bwQ1+KW8JFdTZHfcO+IMwyJ/j
 UMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V7wEQKqwQ5OwwmeDdQ+DZv3iAllQc9fyfYQrfy4q71E=;
 b=m4/omGaHdgmkZ9wIyYHlQfqExNJAfyj/pJxtsNCyMcPDQr9xr0KKBCq53dv6H9nKvW
 NUhU/ShZgxQ1kzEeT3Phba0DYOp6MZjQ3lzmlyOX0Q2ogivwcfMi1wL0hGfu68tU2iGj
 C2vmgP5UL7RoH1G7r8tVBpRlqrgisSOKCqueihUkH7ekYWCe9Q3yH0CiqBRZNpuuBXYd
 l5HsTL4XksvhNtLFXwanDj6FPxUJEyeIt1kucIQgHSsFFq03fe70XH20FKWIa5i1cECW
 L+oGZ+h8DVcDU+VJE0OPsXTyo8dDAm4M8PQiDiZBZdEPLZ4p3DhYZd9wuoWmH7TLYmur
 55Sg==
X-Gm-Message-State: AOAM531B3Gv4mF9W5VrDaycuDBe04GkpqFDOQ1ySFns7xEGo5jh1jyWq
 BDvRgM/G+pBncL9LWUMlSo9Jd8TMDe96ry+/Y3Y=
X-Google-Smtp-Source: ABdhPJzLl2Jw72lxHtZWF0L2mEb/j2OekdEF6PBYwnXGYYIlpq9eU21SYITbzwvau9pP9ze0rb+j5Bi9/v4rOahkNpw=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46586081ybu.332.1621218830803; 
 Sun, 16 May 2021 19:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-2-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-2-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:33:39 +0800
Message-ID: <CAEUhbmVYC6BE5En83KdujZu7uEbg4DKgNiz0MRUeWVAM7KdWiA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Mon, 17 May 2021 02:33:54 -0000

On Sun, May 16, 2021 at 1:37 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Per the kconfig.rst:
>
>   A device should be listed [...] ``imply`` if (depending on
>   the QEMU command line) the board may or  may not be started
>   without it.
>
> This is the case with the NVDIMM device (it is certainly possible
> to start a machine without NVDIMM) , so use the 'imply' weak
> reverse dependency to select the symbol.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  default-configs/devices/ppc64-softmmu.mak | 1 -
>  hw/arm/Kconfig                            | 1 +
>  hw/i386/Kconfig                           | 1 +
>  hw/mem/Kconfig                            | 2 --
>  hw/ppc/Kconfig                            | 1 +
>  5 files changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

