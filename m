Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E3BCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 18:28:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrMsd-0000Ap-03; Fri, 13 Oct 2023 14:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qrMsR-00009U-B9; Fri, 13 Oct 2023 14:27:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qrMsN-0002Cj-6C; Fri, 13 Oct 2023 14:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4pVf4fJ2bMdaQZKp5f/S8EyLHtuUJnUFKZUiAmTTog=; b=BEqmhqAWNRh/Lwu4r5dWa7Jjaj
 6McmjzdZVbdu3lS2eTW741j8cnwi6seN2ER5bcbUW9QE8dMoH1JgV1TDvqVGrewo1+xGy++g3iPQ7
 oQs1sRZQ6ZjBf3dqjURXzOKM10bOzkKGHA+oY2vUU81OyIYCLdBsP2FFw2jwARnPxiWsYnqglLzHc
 5RMnCr3u5NxDouVqKMHUZ42h6ouRZXbOezXhR+OKazYuluHpDv1Eyf+LayEZe6CsYIrwzy3ZqG9Ys
 f1VuX/Uij3hXI3LQcCk2qjSwH0FyrPD+cr2g6eoD0G0TIoQusOPhKunYXHfHVz5o6Om0j/WRM61hY
 gqQ1kZOp4dAYIl6Q435Lef9wpCRMXEMZ9ewmZJw0UPqBeW4sWXSvFWxXrqYXcaele75tmREO1o+Vw
 Ik2bjnL5X8wqMad29+SpYGpDcCx6OCZCjaQ+SF72k52fkomp21ecyfMf6vqrhDu4HvOy3/JnInAM6
 dFGLK8bdEnu6D2tIHABe6YosUot+VCxOJFnlf+HtuPR4cRz/xsQvKK55hIgcZ/x800tUqzQXgChJv
 TFHfuHlYNOVnomudwJ+CIgta/yZaKfYMxV+YZuNliGAi8aX5govQoiYmno2LiEVACACjxZKMUQ+4B
 NdI86tcbruRJplnUqalws0qSXlEBe4r96XHDqLC/k=;
Received: from [2a00:23c4:8baf:fd00:1033:b5d6:92a3:359f]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qrMr4-0002mm-Oh; Fri, 13 Oct 2023 19:25:50 +0100
Message-ID: <14b256ef-904a-4ba4-80a6-ca1a33ecaf8c@ilande.co.uk>
Date: Fri, 13 Oct 2023 19:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stafford Horne <shorne@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-15-philmd@linaro.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20231010092901.99189-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baf:fd00:1033:b5d6:92a3:359f
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 14/18] target/sparc: Declare CPU QOM types using
 DEFINE_TYPES() macro
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 10/10/2023 10:28, Philippe Mathieu-Daudé wrote:

> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. In
> particular because type array declared with such macro
> are easier to review.
> 
> In few commits we are going to add more types, so replace
> the type_register_static() to ease further reviews.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sparc/cpu.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 8ba96ae225..1e66413e94 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -924,17 +924,21 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>       cc->tcg_ops = &sparc_tcg_ops;
>   }
>   
> -static const TypeInfo sparc_cpu_type_info = {
> -    .name = TYPE_SPARC_CPU,
> -    .parent = TYPE_CPU,
> -    .instance_size = sizeof(SPARCCPU),
> -    .instance_align = __alignof(SPARCCPU),
> -    .instance_init = sparc_cpu_initfn,
> -    .abstract = true,
> -    .class_size = sizeof(SPARCCPUClass),
> -    .class_init = sparc_cpu_class_init,
> +static const TypeInfo sparc_cpu_types[] = {
> +    {
> +        .name           = TYPE_SPARC_CPU,
> +        .parent         = TYPE_CPU,
> +        .instance_size  = sizeof(SPARCCPU),
> +        .instance_align = __alignof(SPARCCPU),
> +        .instance_init  = sparc_cpu_initfn,
> +        .abstract       = true,
> +        .class_size     = sizeof(SPARCCPUClass),
> +        .class_init     = sparc_cpu_class_init,
> +    }
>   };
>   
> +DEFINE_TYPES(sparc_cpu_types)
> +
>   static void sparc_cpu_cpudef_class_init(ObjectClass *oc, void *data)
>   {
>       SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
> @@ -959,7 +963,6 @@ static void sparc_cpu_register_types(void)
>   {
>       int i;
>   
> -    type_register_static(&sparc_cpu_type_info);
>       for (i = 0; i < ARRAY_SIZE(sparc_defs); i++) {
>           sparc_register_cpudef_type(&sparc_defs[i]);
>       }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


