Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p1xPJ-0001Ci-07
	for mharc-qemu-riscv@gnu.org; Sun, 04 Dec 2022 17:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xPH-0001CP-Bk; Sun, 04 Dec 2022 17:24:19 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xPF-0004xh-SO; Sun, 04 Dec 2022 17:24:19 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id i2so9519288vsc.1;
 Sun, 04 Dec 2022 14:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qRUTgFOm5E91UqCJe9TWvCZ0AFgSxSHVeEmJAlQhl/g=;
 b=NO5dprHstXEogFAMXqyovvMibTnkoeGX97rUEJ4SRKvKD/HA7xrz3iuTa6RgxutsbT
 zbjpVxjvy8+i5pZx4QIh6C9NZutVSxcNA9xuSG0fAVbRMdtOMfb9Zh8yXAOv5bLq1sFU
 oWL55mtX8B70DKb7jTvMxpIX1aCLNVDTICjOcMeMHfNqyKpLnZTWJ2EMEIg6F7/IYmtu
 uZS8LtOUOu6JWkKNqJgD8Ahy4nN8ZHU4AAYdtagAdibg2+cIVxFeyaTn7amZwMMV+9OT
 ghEuQ3q6iQgNBTUN0NBANGARhL55VuRD7rS20NgLb8Fb1tI27EoXoAzZgsVxm6/ZaOkn
 sUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRUTgFOm5E91UqCJe9TWvCZ0AFgSxSHVeEmJAlQhl/g=;
 b=VlRDVSNOKuI8K2ake3f6ugWferj/VhD+nBrATIkqjOukiLQmxCOndG0gxKlQJbgbD1
 vYwewiYF2qTk40BAPJhGl+GFIDKQERRYVOE8C4x5DFt+/SxZel2ubQph88yTCYxjo2h0
 7EioX/wOo15JY3DVkJB0VOmVH3tUvFK+kApuSOykWNc3/7zeV5hpBf/5jTKWXRMee6E2
 MWeehhj90s1uuuEwKNKP8CQxyNdgKGomFLTmu/oUtlWZtJZgxqCsYkVvcdcE1/FupWLE
 8wMyqWgKPPOIrlM0tYHi08h6YbhLsAzBhPd0SrIz1CV508nBIyhTAkmJMr2giOftvR5a
 nT9A==
X-Gm-Message-State: ANoB5pkJCwxCUe3QTMKty7XvtPbH2s1lfKQY44w4KkknD86ExvqWZILK
 nGzRXTpCfavt5rmqnpt1etqlKX1WV3CZleDVS9KBD0+ybzk=
X-Google-Smtp-Source: AA0mqf5IxK8okagxOZWR+Hei/IgQJzLsTi5tUdq1SCuim4EApzIs6XAk368tEXCbajXCpiN5DIGjyhIHH4KR2k8tkWo=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr8513702vsa.54.1670192656593; Sun, 04
 Dec 2022 14:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-3-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-3-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Dec 2022 08:23:50 +1000
Message-ID: <CAKmqyKMuVSQaH+=x=SZbsJcCGnAeeYtFXbPjZFcQ0SssY_DMVg@mail.gmail.com>
Subject: Re: [PATCH 03/15] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Sun, 04 Dec 2022 22:24:19 -0000

On Fri, Dec 2, 2022 at 12:12 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest build")
> the IBEX PLIC model was replaced with the SiFive PLIC model in the
> 'opentitan' machine but we forgot the add the dependency there.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 167dc4cca6..1e4b58024f 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -19,6 +19,7 @@ config MICROCHIP_PFSOC
>  config OPENTITAN
>      bool
>      select IBEX
> +    select SIFIVE_PLIC
>      select UNIMP
>
>  config SHAKTI_C
> --
> 2.34.1
>
>

