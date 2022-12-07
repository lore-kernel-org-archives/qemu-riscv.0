Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2mC5-0006fg-J3
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mC3-0006dB-RE; Tue, 06 Dec 2022 23:38:03 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mC2-0006R4-BU; Tue, 06 Dec 2022 23:38:03 -0500
Received: by mail-ua1-x930.google.com with SMTP id n9so5651854uao.13;
 Tue, 06 Dec 2022 20:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uZZjAwR+fRzOI4Qj27/MWpqFilQASaSslqE+NK8qhCs=;
 b=oTZ1bn1E25SAG/q1oJEkp/uc06UaSeD3pDFxanU63kOuGITTYdCUVn47siTNU7CyCy
 rJGcxj+em+7m8zfLns8P5gaZoiW07iYCJ4OTJSYmmVtS/PEKCvzb/Cl4BQZCROB6DNAG
 YmVR8zcsPBMqRYBCCzWWLktAPxakOaiIyXkiYQ1UUB/FQQNM3ooiO1zZyMi0ko2RZUi4
 GTtLBgLuFUV93ikNtCjY2OUPy7MLBGNpMC6bdk2ZbqYer31N4PLRt/EKGjGFILb8w01i
 ci31cwn2FoiCFsRDno3XLNI4cW3aBLDtj9OZ8r98D7moWL8rfpVTw0O+JNie74ukCA8H
 Tppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZZjAwR+fRzOI4Qj27/MWpqFilQASaSslqE+NK8qhCs=;
 b=PPs7L1bAnZ+QFk+1rcvqs5NwXYL5J6hv5EI3WclEjgm4K7lR4cej+Ang/d1MY5V+dT
 xsju1jMAioFoA9smlVSrOpHjiuh2BFdePXecVv8VG1dzf/OdBQ7+Ddin1DfzfuPqsoca
 LWz+RQguFv2Dr7SR4f46eV+cil/rWkWZp/P+iGByJ+HCMTTYI8nB3nZ+AaidLVfSbLHr
 0+ottc0LfhtukbWf7WE1JMfwWc6qwJUjxfxomHeF1soZUyQ8kNO4m7sciEKypV31v8jF
 4eWRAwGhrLyaRtmL0/hfUKVGojPYH12ThjCOUoHebs9C+gAiL/xsF2VCqGUC9oAEL3T7
 ceOw==
X-Gm-Message-State: ANoB5pkMjvf4STlgZD1ZoMFbGoH3HkIT943hFpZEBiasThGz4Fyv3hvw
 ffi4HR+prLUYZEVY5A5LrU4xTp8D09cgLqj4N0Y=
X-Google-Smtp-Source: AA0mqf5rKRuRHfr+7CVpGxGmtOHo4iSshz7sAua7+cCWdCHMuziN9OGRepgPPUcmDYjmM8poQGfDRl3ar2Ppz3DXPf0=
X-Received: by 2002:ab0:6598:0:b0:419:2865:3ae7 with SMTP id
 v24-20020ab06598000000b0041928653ae7mr22289380uam.70.1670387880577; Tue, 06
 Dec 2022 20:38:00 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-14-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-14-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:37:34 +1000
Message-ID: <CAKmqyKOu+f8PjYMmyXRktMJCR1BnSb1qG0gAA_CaDztU=kuHxg@mail.gmail.com>
Subject: Re: [PATCH 14/15] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:38:04 -0000

On Fri, Dec 2, 2022 at 12:09 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> "hartid-base" and "priority-base" are zero by default. There is no
> need to initialize them to zero again.

What is the defaults change though? I feel like these are worth leaving in

Alistair

>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>  hw/riscv/opentitan.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index be7ff1eea0..da73aa51f5 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -165,10 +165,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>
>      /* PLIC */
>      qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
> -    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
> -    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
> --
> 2.34.1
>
>

