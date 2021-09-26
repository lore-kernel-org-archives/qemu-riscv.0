Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUPZe-0004hQ-G9
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 04:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPZW-0004Yb-4G; Sun, 26 Sep 2021 04:31:43 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPZU-0007jw-FY; Sun, 26 Sep 2021 04:31:41 -0400
Received: by mail-yb1-xb31.google.com with SMTP id r4so16283974ybp.4;
 Sun, 26 Sep 2021 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7NBWhbs0nkDcW5/j8XaV7FscX8Ip4Od9XVxttckHMM8=;
 b=TZeeNU8MQbppO3/q7KjeXBe87Ywxn6w16B74vhvhdbXVZhLumq276Yn1m4zg6TlJmI
 aV7MpUSnV3j3qavcShGBSKsaJuGrcjJZOjCm+v9jvie+WKdo24pNlH5xcD3EuT5mNSYY
 IPrl9921m5dNxvQG6PERiSnFmCCzgHMBRjCKwW5IMWRZzN8mra4dg2MhtmeH6H67+KqA
 StcqruOtWfyuiVHImePftQ8NsP0y2LSfEW4FH3+qvJwa+vL3qfHYMFnerHGQma6sLfzK
 bt/XJwdSuhgan9Wki/1j4/6kF9OfuR9hUaCwq1YyYj7+yWm5XwwTdHMXw1SGAdfFUUhR
 tsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7NBWhbs0nkDcW5/j8XaV7FscX8Ip4Od9XVxttckHMM8=;
 b=4LX1BdoslOLhi4yN18sGN+oV1dqMjBuwxBrzjPfPZstjGK1IdJ1k5Iw+ZgvQANPViy
 YHjGR/IXnLz+4VNgjnVDDgRQunr75J0Mjqfv45hX8M7nmgq5l4xe+tMxPhjHfvNX3llL
 e0cA77oxNlc4BW0UrriRFh+7HjA+YxjM5xM6qc5bjixWnmQuAqmGC7PjXy/Y+1hv/fbz
 YVK1/PjyqzWVl/yQ8rzbVZDlCfnIGn2E2NBP8T5ske02f/MtP58uLSEqW/5S8XSl4Xyr
 GttImYD8dnArjX09MRMyZ9VLwl/7xE40/Hjm1PCxL5E66p4e6OgAiKg5xavtSZwf+Fwb
 aNlQ==
X-Gm-Message-State: AOAM530Se0/sXXagL2GmE0h/4NcbmBhln9UHD1FwsO1RHaBgAIn55OKq
 4/W4ZGo6Aet/gqiXTk3CK0ZePgs2HLoNyEBvARs=
X-Google-Smtp-Source: ABdhPJx9qfXrqMlRb2SnSMwg052Te5KJzo32jNWLgjQ71Dk/JR0EROHL9Sa9c5xlTkz7ddNVVGAjt5zKz+nuaGcPjA8=
X-Received: by 2002:a25:2c15:: with SMTP id s21mr13718020ybs.332.1632645099174; 
 Sun, 26 Sep 2021 01:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-4-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-4-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 26 Sep 2021 16:31:28 +0800
Message-ID: <CAEUhbmXRpHJ1hvC9T0PPnoVQp5b=wLgzZFekwEq47inJxski_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Sun, 26 Sep 2021 08:31:44 -0000

On Sat, Sep 25, 2021 at 9:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
> - Add DeviceReset() method
> - Add vmstate structure for migration
> - Register device in 'input' category
> - Keep mchp_pfsoc_mmuart_create() behavior
>
> Note, serial_mm_init() calls qdev_set_legacy_instance_id().
> This call is only needed for backwards-compatibility of incoming
> migration data with old versions of QEMU which implemented migration
> of devices with hand-rolled code. Since this device didn't previously
> handle migration at all, then it doesn't need to set the legacy
> instance ID.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
>
> I haven't kept Alistair R-b tag from v1.
> ---
>  include/hw/char/mchp_pfsoc_mmuart.h |  12 +++-
>  hw/char/mchp_pfsoc_mmuart.c         | 105 +++++++++++++++++++++++-----
>  2 files changed, 97 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

