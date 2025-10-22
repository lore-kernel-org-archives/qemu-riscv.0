Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8F4CCD195
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 08:10:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBTuu-0000kr-35; Wed, 22 Oct 2025 04:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBTuo-0000Zr-JB
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 04:09:50 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBTuk-00025s-Iu
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 04:09:50 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47112a73785so49503845e9.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 01:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761120585; x=1761725385; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5W3vw0dKWSTSqpjqiTpD1sBd7qgaB5sDy0DD3Bgxoo=;
 b=RE9D3i1aUxKs9ENlAdpfWxgLCOxkodNGSaeBAFd2aQ5kyq0tjo9LkmRd3TvFdVG7OX
 Q+faih/pIqP/MKDzYnG6xRIglQ6GQdY2LxTL9knV1b8KtodVMs3CU9c3geS6sLgZUn1q
 zJmN0F+7VAELztdwJdWSl9iOVsdExf3STQxrUjpYak/zxGYE6W42SdK8/jzP2vR5tKwc
 a1MxW/5lnfrty4igGCfv+6nO6CIhtcNwbiSY1CtYRChOAKcel17q7tMAZiqXSseOokVq
 buLdVo++gflIcWKQxGK6uuffWiuBzXpvx+6lm772ZgcD1crAPpkux28dcknOy1+kZoRo
 ctgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761120585; x=1761725385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5W3vw0dKWSTSqpjqiTpD1sBd7qgaB5sDy0DD3Bgxoo=;
 b=ml/zyLbi976jjJVlOJ3GXUveoQ4fcBq4891+Qj0IRSWIJYe5yENQ5cXNX852hHWZv7
 gFjxCow39RgelLulncZNiC8xjSYPp4gum1SdDdnUG55mfgUM6iMz7Y0ccvdXE+mBSwMg
 FSrhNDsfZaAEZHxYfHA0mGkqCSof/Hj+IDDeoIj42/GhyzQTVBvGs/4u+2+Blm+7YMlw
 syBT02dCXrHpw6/B4fI9L66URL7MEV1gZyYUQkes0B0NaoDo6eqW+hN2CUkiJW/6pJUv
 2KHCfcTmFRy4zF04vSUR8AhBAS32Jb5nJvOSw/ye47cpL3UeEHgg92oxw7hjIS+wisdQ
 MtGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeeSy6KjWe1HiNBfrVEfiRewHTu9jKu0hUgqKHsE4hqh3U+iPPcDmXml/R1F7z4umVqsiXNrSDq3rz@nongnu.org
X-Gm-Message-State: AOJu0YwE1rm7FJ0O3LcoI4sbLx/96YUQ/H70J1u/tm1PLTkLGcUNfwX/
 bKZKu4SE4PPYO+/WktqlWegOtKAJ3Qg5G2s7thx++O0JtLo/L1tMPh9VcQT752K9rVk=
X-Gm-Gg: ASbGncvKL7X/Kzp7J1Y105I7+TuQ+xBstmgdguGUwP0sPga2lluZCdXLBAtE5sWZjlr
 gaeUldiVXvrVxlNDbJpNY2bV6SstbudNWbCCuhUWiF/L+ZsE0aNn715PrZ4bKOSsbpjqS7EsSph
 VyS/EHSu8Qn6+wbDsd1ITYLAa4trOgizR95Wr9TE9pYnb+HT3TEHd/XIRGMYz30fS/LVqa/JQxr
 b8LDSj9LwBG6pmgHfCncsHpvK7S5NVABA/D7Bm0EZpTPnyG97NHNe7qQ6p2DekGjiP9xCCov30K
 fgivpwTaO15UNek/1nx0cn58SGof5EMEQHKrYuj2jLt86/Ni9aGoFG3RFtFwAJQacqqIn24DPJn
 2pSe9KQWPiinGJTPJ82b1TaN4GHGYTxyD3iEiKuVjKmN914OsGT3Jm+eKLoeaq5QZIi8dqPRn/y
 /ryLPm9UJlxJLo3oGdSUMTMnNXOZtQgP7KHbw6ihZyFAtL3O9QcM52TZDhxfqXyhMg
X-Google-Smtp-Source: AGHT+IG5BpeXiJ6nHMocdx8fLCUYDlkFMY0PuWuFCGQMHFAZ8n3dQ7nToTymecUtEebWDB9IZS4Cfw==
X-Received: by 2002:a05:600c:3149:b0:470:bcc4:b0a0 with SMTP id
 5b1f17b1804b1-47117925919mr168171395e9.34.1761120584565; 
 Wed, 22 Oct 2025 01:09:44 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b985esm24733044f8f.34.2025.10.22.01.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:09:43 -0700 (PDT)
Message-ID: <36b8e200-10ab-48b0-beda-9ca2c42f2b48@linaro.org>
Date: Wed, 22 Oct 2025 10:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] char: rename CharBackend->CharFrontend
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Corey Minyard <minyard@acm.org>,
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Vijai Kumar K <vijai@behindbytes.com>,
 Samuel Tardieu <sam@rfc1149.net>, Gustavo Romero
 <gustavo.romero@linaro.org>, Raphael Norwitz <raphael@enfabrica.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Zhang Chen
 <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>,
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
References: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 22/10/25 09:46, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The actual backend is "Chardev", CharBackend is the frontend side of
> it (whatever talks to the backend), let's rename it for readability.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   chardev/chardev-internal.h           |  12 +-
>   include/chardev/char-fe.h            |  67 +++++----
>   include/chardev/char.h               |   4 +-
...

> diff --git a/chardev/chardev-internal.h b/chardev/chardev-internal.h
> index 9752dd75f7..8ea10414ab 100644
> --- a/chardev/chardev-internal.h
> +++ b/chardev/chardev-internal.h
> @@ -37,9 +37,9 @@
>   struct MuxChardev {
>       Chardev parent;
>       /* Linked frontends */
> -    CharBackend *backends[MAX_MUX];
> -    /* Linked backend */
> -    CharBackend chr;
> +    CharFrontend *frontends[MAX_MUX];
> +    /* frontend of the underlying muxed chardev */
> +    CharFrontend chr;
>       unsigned long mux_bitset;
>       int focus;
>       bool term_got_escape;
> diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> index 8ef05b3dd0..7901856f95 100644
> --- a/include/chardev/char-fe.h
> +++ b/include/chardev/char-fe.h
> @@ -8,12 +8,12 @@ typedef void IOEventHandler(void *opaque, QEMUChrEvent event);
>   typedef int BackendChangeHandler(void *opaque);
>   
>   /**
> - * struct CharBackend - back end as seen by front end
> + * struct CharFrontend - Chardev as seen by front end
>    * @fe_is_open: the front end is ready for IO
>    *
>    * The actual backend is Chardev
>    */
> -struct CharBackend {
> +struct CharFrontend {
>       Chardev *chr;
>       IOEventHandler *chr_event;
>       IOCanReadHandler *chr_can_read;
> @@ -27,53 +27,52 @@ struct CharBackend {
>   /**
>    * qemu_chr_fe_init:
>    *
> - * Initializes a front end for the given CharBackend and
> - * Chardev. Call qemu_chr_fe_deinit() to remove the association and
> - * release the driver.
> + * Initializes the frontend @c for the given Chardev backend @s. Call
> + * qemu_chr_fe_deinit() to remove the association and release the backend.
>    *
>    * Returns: false on error.
>    */
> -bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp);
> +bool qemu_chr_fe_init(CharFrontend *c, Chardev *s, Error **errp);

IMO even clearer for this API would be to use:

   bool qemu_chr_fe_init(CharFrontend *fe, Chardev *be, Error **errp);

and update documentation accordingly.

>   
>   /**
>    * qemu_chr_fe_deinit:
> - * @b: a CharBackend
> + * @c: a CharFrontend
>    * @del: if true, delete the chardev backend
>   *
> - * Dissociate the CharBackend from the Chardev.
> + * Dissociate the CharFrontend from the Chardev.
>    *
>    * Safe to call without associated Chardev.
>    */
> -void qemu_chr_fe_deinit(CharBackend *b, bool del);
> +void qemu_chr_fe_deinit(CharFrontend *c, bool del);
>   
>   /**
>    * qemu_chr_fe_get_driver:
>    *
> - * Returns: the driver associated with a CharBackend or NULL if no
> + * Returns: the driver associated with a CharFrontend or NULL if no
>    * associated Chardev.
>    * Note: avoid this function as the driver should never be accessed directly,
>    *       especially by the frontends that support chardevice hotswap.
>    *       Consider qemu_chr_fe_backend_connected() to check for driver existence
>    */
> -Chardev *qemu_chr_fe_get_driver(CharBackend *be);
> +Chardev *qemu_chr_fe_get_driver(CharFrontend *c);
>   
>   /**
>    * qemu_chr_fe_backend_connected:
>    *
> - * Returns: true if there is a chardevice associated with @be.
> + * Returns: true if there is a backend associated with @c.
>    */
> -bool qemu_chr_fe_backend_connected(CharBackend *be);
> +bool qemu_chr_fe_backend_connected(CharFrontend *c);

LGTM otherwise!

