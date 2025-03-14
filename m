Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F954C282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:54:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt3bp-00023K-US; Fri, 14 Mar 2025 07:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tt3bl-00022X-Af
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 07:53:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tt3bj-0000HS-2P
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 07:53:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-30155bbbed9so458811a91.1
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741953219; x=1742558019; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8V5RLkWp29cBLZqVZgCSz0C29OI+viWDBaF08bWyA8=;
 b=HGa/FDaQ3HjNg8sSE8nOuu4wixpEAKjwGTD+PhYZk2cEJLZrD07UM+8cAR/cngHv51
 r12u9p+sQcI+m66IwwhV29dpVpNbvf7a+B4nKXtKK2dhrboOvbjJZ+IzuyHgaAljS/Mz
 4ap1x0HFpSUKdiYpKWSc73vmj5xoO+XE2Zor6npkHA8i26Ih59XV0h2XYGw3n2Mjp5I0
 zcDrD0iNzuSTpgr1ukyKtdguKBMy21TzCDaqxhhescDUhGBhr8eg8LQ42rUES7J2Q6FY
 JSrfX4XX5G2kN9DYDmE1RNfBQSdxWTs7pZSoTZttT9yW6a62XRMMswWKXeFXq4m/o8p8
 g+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741953219; x=1742558019;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8V5RLkWp29cBLZqVZgCSz0C29OI+viWDBaF08bWyA8=;
 b=FqLz7gqnaFqo5Kk4ItXp4wtPijEhaeoVh9v7ury1Hdx8m9FZXqdB4Ti4Qmi5O96BwN
 N8sfYJd6jfoJ3YaV+zJ4knowOXMEUdmEv9odlPmrX6Y5z4g/rMYjSx44F3Y9O3xlXlFd
 m67cm9hTgeJdp6mLL6dcfq6kTVgSwVY5fzicjtLvGruteDdgHeTP01n0fTXVUHP1x6jj
 vn7jhMiwkVOfvstCBV7KmgBn5g3L39bwyY9P7cDk/yBwyBOAM40/rlyQORms03VvgRLE
 W11naI+pojpQ5Dd8Pa1TpvBOaX40M2NL+AGQnuKDre76/jWsk1zsLCjbzaKSPYuEcU83
 jN3A==
X-Gm-Message-State: AOJu0Yw4UkR3bkS3qLmrb/3P4J5d5FjH10if0NNmFz3/hBbABHos1jGQ
 OSp6XOwYTaQCn7CoMQm63TcvhO/F2TUUbBfA2MjelWTx5x+HhUZIA+pC+3bc+ScLkBTPaDmnwpa
 x
X-Gm-Gg: ASbGnctQcqFT7FeFoeITy987zsPV+/e1VFKUgmAnitGfw2i/EERaMbacRJ2AZcs+sjO
 ppWAhKdZoDi+Hi9oy6L5af3v9SjZxm5XX5F0guuujrexvmc0LF6/fwbpRDDPFmQ0u02vFrpQ8FQ
 k7KavhY80c+63laXnOkimzF1wjeJ8shy3B0a5nI/qYvQWCH7e0yK4h6DyCeWgYvIpyHbVzQ7ape
 Hwu/hwOJZljMKQKVXEjIcpuhxMfb4r+lavBUri1FvJXCw1lnO6FgIWIbxWNcqG0b0fLL2gtgoZh
 XmjQZ/rEnlCijBHHTswasInxQkjgkwMEVR6GY/iQ5xg/v8T5TsgntAFvcMY=
X-Google-Smtp-Source: AGHT+IHdns37c8mRuqJYJi7dhGL8NPEPURvmo+iS9eu/sw5h8qBltXgKcLpG+ECSkOrBb1s+2gVMiQ==
X-Received: by 2002:a17:90b:3bc6:b0:2fe:a8b1:7d8 with SMTP id
 98e67ed59e1d1-30151d9d6f9mr2997823a91.25.1741953219419; 
 Fri, 14 Mar 2025 04:53:39 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30153afe386sm920773a91.23.2025.03.14.04.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:53:39 -0700 (PDT)
Message-ID: <255d85c2-d394-48a0-91c2-acdb8d9d2f68@ventanamicro.com>
Date: Fri, 14 Mar 2025 08:53:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: Fix test for microchi-icicle-kit
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, devel@rtems.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair23@gmail.com>
References: <20250314080148.26258-1-sebastian.huber@embedded-brains.de>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250314080148.26258-1-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

I should've been clear about what to do when I reported the bug. My
apologies.

We only want a separated fix like this if the bug is already upstream.
ATM the patches are on Alistair's riscv-to-apply.next tree only, so we
have time.

The usual way we handle this kind of situation is to send a new fixed
version of the series ([PATCH v2 0/6] Improve Microchip Polarfire SoC
customization), with this change squashed in patch 4/6. Alistair can
then just queue the fixed series.

No need for the "Reported-by" tag to be squashed in too since this issue
was detected during the review process.


Thanks,

Daniel



On 3/14/25 5:01 AM, Sebastian Huber wrote:
> Fix this test failure:
> 
>    $ QTEST_QEMU_BINARY=./build/qemu-system-riscv64 \
>      ./build/tests/qtest/qom-test
>    (...)
>    # slow test /riscv64/qom/amd-microblaze-v-generic executed in 2.28 \
>      secs
>    # starting QEMU: exec ./build/qemu-system-riscv64 -qtest
>      unix:/tmp/qtest-1361875.sock -qtest-log /dev/null -chardev \
>      socket,path=/tmp/qtest-1361875.qmp,id=char0 -mon \
>      chardev=char0,mode=control -display none -audio none -machine \
>      microchip-icicle-kit -accel qtest
>    **
>    ERROR:../hw/riscv/boot.c:164:riscv_load_firmware: assertion failed: \
>     (firmware_filename != NULL)
>    Bail out! ERROR:../hw/riscv/boot.c:164:riscv_load_firmware: \
>      assertion failed: (firmware_filename != NULL)
> 
> Use an approach similar to riscv_find_and_load_firmware().
> 
> Reported-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>   hw/riscv/microchip_pfsoc.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 9068eed780..616bb63982 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -609,12 +609,14 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>       }
>   
>       /* Load the firmware if necessary */
> +    firmware_end_addr = firmware_load_addr;
>       if (firmware_name) {
> -        const char *filename = riscv_find_firmware(firmware_name, NULL);
> -        firmware_end_addr = riscv_load_firmware(filename, &firmware_load_addr,
> -                                                NULL);
> -    } else {
> -        firmware_end_addr = firmware_load_addr;
> +        char *filename = riscv_find_firmware(firmware_name, NULL);
> +        if (filename) {
> +            firmware_end_addr = riscv_load_firmware(filename,
> +                                                    &firmware_load_addr, NULL);
> +            g_free(filename);
> +        }
>       }
>   
>       riscv_boot_info_init(&boot_info, &s->soc.u_cpus);


