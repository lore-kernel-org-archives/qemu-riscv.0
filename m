Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCHIq-0000Ou-Tv
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 04:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHIp-0000MM-Hi; Sat, 07 Aug 2021 04:03:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHIn-0005RK-VP; Sat, 07 Aug 2021 04:03:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l18so14104531wrv.5;
 Sat, 07 Aug 2021 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D3N3nduqFPgBRWlekmjotDybCkoNoQB5jW/JLWB1u3g=;
 b=ZpbY4KBZEczacTQ9cvGOUJYHQH4qdY8Y4Ep+fsT8uWb+7V7EOU+h2oVEEApWHLzgkM
 W0KFwXEnL4uvmwts0rAm+jV3qD9u6EBfw1zWqkacf2u1YbpNM8uMgUC/4e8ZDnrpxqTV
 voxG2euU258BvJHyI9jn6Z+iUpR4OaBx+jjXpRGqhyaE0xFS7fCla5zhnL8YmBz7sxit
 iEiDx3u9Rnght+Ip8Ffxeg5uBBz3QDDupIbTwPLRlHNU6/roQcKwJa1WcBr+tlH00C2C
 x13nEU7+AIUvKLuHmsbFUC0J+fC87m5VGuH5VfDuQRcZUzxpBeCDqkkgRhFqPLQklJgn
 BaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D3N3nduqFPgBRWlekmjotDybCkoNoQB5jW/JLWB1u3g=;
 b=DDYWYID2AIpDB9oEp1m4xXR/SLDGAn6lpOThGhN2VoQFV1doME5fZyuvB/DsPPJtzV
 oePUwveTwf3Pc4vojS+TNZVwWYlFFC/jDg5kgB2hu4IbVe72WfoT8ANMsNG7zQNfX/8j
 GWtRtL3rQo8GIYa3uZWCgzPjfst6+L5LWP3bEoTR27+u6Irk6qokgrOvzTSz+xBajYhH
 tAGM4vrpplmtCow2ltWDMx3Ay0sLufAVt+8/mNwrZ2WnvcFxcgoBkmlOmJXkQgeC5cCQ
 0MmGe1fH9a5tc4kr9qlXj16OS7Zi9POJB65YmxATAcKNpzFzwXdYH5K2JLxfI0MicsQK
 GwlQ==
X-Gm-Message-State: AOAM531E2Ilou2KSx//0dWAHAd2caLGqqYIztj43ffxriPEDOCEMwVMZ
 if9MpHbcBOSa3k+dbD2xtz4=
X-Google-Smtp-Source: ABdhPJzRiOt16gIG1qx/0edC5fc+8VbpLB/LuMhT2IN0DiG5Pnx8KuiA682k2dGbdvs8Okl0gI8m4A==
X-Received: by 2002:adf:e548:: with SMTP id z8mr14742963wrm.57.1628323407521; 
 Sat, 07 Aug 2021 01:03:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t16sm12566865wmi.13.2021.08.07.01.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:03:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH for-6.2 04/12] [automated] Add struct names to typedefs
 used by QOM types
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting
 <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Vijai Kumar K <vijai@behindbytes.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-5-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <47a5d368-811c-a2ce-3729-e6592d011d8a@amsat.org>
Date: Sat, 7 Aug 2021 10:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-5-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
X-List-Received-Date: Sat, 07 Aug 2021 08:03:32 -0000

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> Anonymous structs on QOM typedefs make the code harder to convert
> to OBJECT_DEFINE* macros, as the macros expect the struct name to
> exist.
> 
> Use a codeconverter rule to automatically add names to the
> structs used in QOM typedefs.
> 
> Generated using:
> 
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=AddNamesToTypedefs $(git grep -l '' -- '*.[ch]')
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Vijai Kumar K <vijai@behindbytes.com>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-riscv@nongnu.org
> ---
>  include/hw/adc/npcm7xx_adc.h            | 2 +-
>  include/hw/char/shakti_uart.h           | 2 +-
>  include/hw/tricore/tricore_testdevice.h | 2 +-
>  chardev/char-parallel.c                 | 4 ++--
>  hw/m68k/mcf5206.c                       | 2 +-
>  hw/misc/sbsa_ec.c                       | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

