Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3KUA-0006mZ-G7
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 10:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l3KU9-0006lU-2u; Sat, 23 Jan 2021 10:05:57 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l3KU7-00047V-AH; Sat, 23 Jan 2021 10:05:56 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlfCk-1llyhz3vaU-00ioBg; Sat, 23 Jan 2021 16:05:50 +0100
Subject: Re: [PATCH v2 6/7] goldfish_rtc: re-arm the alarm after migration
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-7-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2bb1378d-1ccb-d373-1de2-9add2f5e8a23@vivier.eu>
Date: Sat, 23 Jan 2021 16:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-7-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jcfTchoR6uXclY4ce5oZeChIRPLiSNw60qtfPR17yQgQjlXFatV
 9kIRSD/lb4DQrcGD0O+lRYS5xIP9IZ43Wiq8gJ/ltLMQfDMhd27oKh2sqKfthANCQLzb7Us
 P52guzvJKYYDX2l8DAk2zyxIGFkor0jUoObTOKUz2s0788cpFoYLIEt/4K1I+NsciiIp2io
 rYMwKjY4qgksihmOXmNzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S4CcasyI6y4=:lb5TwWh4nBLSNDutE06okA
 7inH8VC5/XZsB+OVcUy4FSI2Ml9D2q++LXa7Z02QXmo9qvADmn2V96ZRIGdWK+6c5/tVwwOae
 udhnxbtQEmLOZORWR+qokMaV3pyy5HHQXCpv1zlBeVSYiT2/DM2gWHT6g39Xvbch3HQiCsCyH
 cpIwvuCHutgvUb0xO7RghkQ1qty11bi2sOKIG88M9kw5jIX052g4E3iJjxfRYWr+0i9ki0DUk
 tcmb47sNmKWGhDJxH+uHsFLibRj8fbAE6sXcZcnca9nC6pm1LlW9Hy8X7ZRelVJloYq1YYI9B
 9GfN/o7vCZSz/cu9Sf0ewB5rm0jxDUqJPrBRhZ7pRTVjcrQG7F87CkyzoYtCLjggiP+E1MfGJ
 rUIn9GBKYW6n19D4p2NZdsE936n1RWWW5ZXO2CH63NpBwj+FKEIe1iBAoRZbcDOTJJ9rPH2Wx
 mnoQRyAYtQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Jan 2021 15:05:57 -0000

Is there someone to merge this?

Thanks,
Laurent

Le 20/12/2020 à 12:26, Laurent Vivier a écrit :
> After a migration the clock offset is updated, but we also
> need to re-arm the alarm if needed.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/rtc/goldfish_rtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> index 0f4e8185a796..e07ff0164e0c 100644
> --- a/hw/rtc/goldfish_rtc.c
> +++ b/hw/rtc/goldfish_rtc.c
> @@ -211,6 +211,8 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
>              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      s->tick_offset = s->tick_offset_vmstate - delta;
>  
> +    goldfish_rtc_set_alarm(s);
> +
>      return 0;
>  }
>  
> 


