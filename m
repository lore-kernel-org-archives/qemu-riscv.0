Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNkdi-00021p-9B
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 20:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkdg-00021Z-9B; Mon, 15 Aug 2022 20:41:00 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkdY-0005CU-Vl; Mon, 15 Aug 2022 20:40:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v4so3568192pgi.10;
 Mon, 15 Aug 2022 17:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=J6f11DgnWZirsI1b7TR73AYFU7NhDmCvX40Nsg9x+mY=;
 b=ndyDnOsmK1aMZ9XAY5ooMsuhksfYB2r8LWcLhXWjAQhfQbCLykRhFHwA1RVrPei8tq
 28iJjkoQ2n/9Oq9ys9ETc3/AzZ5MwsMBGmpBu3ZeH1dX6Lyx09EPMfYtd+tcGr1U2BhA
 YvDA9AP5jNfeYMiCfDmpKT8zJatuubfSXHO2sdCScgJ0PpER10R70oYqsPKi6kiMlM8m
 TuzHuerjgDuUcp5uIzGlM70nRmmVKR8sWTRxnicHSkVecEhycpOVSJKvwXUcHkOXyIY9
 WLK7W8utOuC3H4GwGuuDNfyzBAjnsNDvQvjOgd4b85KasXPCEiN9tnh6Ct6VCxA+NE0v
 gkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=J6f11DgnWZirsI1b7TR73AYFU7NhDmCvX40Nsg9x+mY=;
 b=zDJQcNEFy45VhKC1LGRK7ksZh94HFTolQigcAGQzYajMIy/gGyqxMOuYErxDPidqmz
 LLe+QtB4FK/VHibvfGjA5BuCrMm1V2AjzVaD9d9AXv/0hRP2ikRITpx8rknQmeKMyuFc
 Y+kW/csx5+144+2O+5dxfYBzu5JJoJ54k2IWEAkFMz/fCwhFlZvdIooU0jJQFbgH0VNi
 6Lrb5FJeeEVBimVfKEnANLXdoZT2frL+18eOp4vllyCR14P02cyIlA3mBRpOeBfCTXMT
 FaahNdeA8fta2D32igF/RLyKQFVsdpW2XHsfLIBuPWNv+tdVWILj8Iv07B06weYU49ff
 SZZA==
X-Gm-Message-State: ACgBeo2+CCkvO7xLfhicDtRUCnRCo5NW6GfeZ2FTbaanAyyrsqB4ksMq
 4GDPnarWjaoT9h3tUAMcuU4=
X-Google-Smtp-Source: AA6agR4dIuMTYdJvrxN4ijTGuFNauBMmXNcN54Z1lVvEvnHNVl3PlOX4wWkLLLGVu4Zia5OTAoSVpg==
X-Received: by 2002:a63:f916:0:b0:41c:1149:3263 with SMTP id
 h22-20020a63f916000000b0041c11493263mr15474785pgi.104.1660610450086; 
 Mon, 15 Aug 2022 17:40:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170902d51100b0016d763967f8sm7648771plg.107.2022.08.15.17.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:40:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <d87035e7-2ed5-317e-2c35-daaa5f0a0cc4@amsat.org>
Date: Tue, 16 Aug 2022 02:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
Content-Language: en-US
To: Conor.Dooley@microchip.com, alistair23@gmail.com, mail@conchuod.ie
Cc: bin.meng@windriver.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>
References: <20220813135127.2971754-1-mail@conchuod.ie>
 <CAKmqyKMoQgpEcKSLuLrTT-bbeiwzySNSaeHt12Ou+wuHf7xzpQ@mail.gmail.com>
 <2dd018bb-3026-49a9-3938-3bff62a31179@microchip.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2dd018bb-3026-49a9-3938-3bff62a31179@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 16 Aug 2022 00:41:00 -0000

Hi Conor,

On 15/8/22 00:48, Conor.Dooley@microchip.com wrote:
> On 14/08/2022 23:08, Alistair Francis wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Sat, Aug 13, 2022 at 11:51 PM Conor Dooley <mail@conchuod.ie> wrote:
>>> QEMU support for PolarFire SoC seems to be fairly out of date at this
>>> point. Running with a recent HSS, U-Boot etc doesn't work, partly due
>>> to the unimplemented cache controller that the HSS tries to read from
>>> (it needs to know the ways configuration now) and the rest seems to be
>>> down to 64 bit address DMA to the sd card (not 100% on that yet).
>>> There's some patches floating around internally that supposedly fixed
>>> things for QEMU v6.something but I could not replicate & they're fairly
>>> conflicty at this point. Plan is to clean them up, but no point sitting
>>> on this patch until then as I have no ETA for that at this point.
>>
>> Awesome! It is great to see Microchip supporting open source projects
> 
> Better late than never ehh..
> As I said, no ETA yet as I don't know just how far off the sd card stuff
> is, but it's in the todo pile. In the meantime, I'll keep an eye out here
> which I am ~certain we haven't been doing so far. I've added QEMU stuff
> to my build/test scripts now that I've got the direct kernel boot working
> for me so hopefully once things get fixed, they'll stay that way.

Please Cc me and Cédric in your future posts regarding SD card, or open
a GitLab issue describing the problem.

Regards,

Phil.

