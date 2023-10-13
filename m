Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29BBCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 18:29:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrMuc-0001DG-9t; Fri, 13 Oct 2023 14:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qrMuW-0001BB-7K; Fri, 13 Oct 2023 14:29:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qrMuU-0002XZ-DA; Fri, 13 Oct 2023 14:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DOULnyGvZXY57WzISjGL9RiSmB6uXeM+PcNpnuA6Ai0=; b=MKTqEGP6haBPw+w0h7M4eBrpBw
 G/3qf7T5HD88ChSsjtcVE4mspxVaDAZoYjUJ5t25pDUSUKoy8lvHxCym4Ui/hH69e0G+Y3yX1hLq4
 9GEnF9eseJgNDtY1c7zr47SrupNaC0gGlg0nefzk3It8rEthMCXbjl8iqWjPaEsqwwqmHKzDsmiz1
 QGU+4zMsbsFixyWe9FIkYOQu4yZDQPbQcrb5ZABJlqhqOHCr1V0d/IUPztQ2v6uLdbdq3yyGE3ior
 caXUUi4MH9RaI/QcZdhR9VJTN+LUbp3fmICqWSzQP4fy5r1SS/oq0juGSlpI3GYMG9yr4+FJ44qqI
 T67GAPITQjqIihWRuvcmij+lQ4GW3XSzBzfFdEVmiStAyVH+vkV1Z58r7cqP+GtQs4CtZoIYsnrlI
 fOVsmZF1DzI6QLPGOEO0FJRA8XMrxjU7U/sYakK3chL6AEtEu6jXZZdUm87LRVGUSW+H/5hhMKz92
 whxyNn5j1ru+kZgOFfxiAV3POz2u8a+Mc+S5CKS0hAjBNFqWU3wZjalp5BsqSjPPrJ73QAsBwkG2R
 UhXDFwiWNxOHBQSd32U1ZzWLVTDP7YCx10PHihOz6rghemV2xx00arJAsENvAkFgIYJJUKgVwOtPH
 2RATYEK1eBC6F1PzlznRXyI644ly7FjjDi62x96iQ=;
Received: from [2a00:23c4:8baf:fd00:1033:b5d6:92a3:359f]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qrMtQ-0002of-7R; Fri, 13 Oct 2023 19:28:22 +0100
Message-ID: <3d47fc1b-ceb5-4f66-9b62-3f4a83052456@ilande.co.uk>
Date: Fri, 13 Oct 2023 19:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
 <20231010092901.99189-19-philmd@linaro.org>
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
In-Reply-To: <20231010092901.99189-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baf:fd00:1033:b5d6:92a3:359f
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 18/18] target/sparc: Make SPARC_CPU common to new
 SPARC32_CPU/SPARC64_CPU types
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

On 10/10/2023 10:29, Philippe Mathieu-Daudé wrote:

> "target/foo/cpu-qom.h" can not use any target specific definitions.
> 
> Currently "target/sparc/cpu-qom.h" defines TYPE_SPARC_CPU
> depending on the sparc(32)/sparc64 build type. This doesn't
> scale in a heterogeneous context where we need to access both
> types concurrently.
> 
> In order to do that, introduce the new SPARC32_CPU / SPARC64_CPU
> types, both inheriting a common TYPE_SPARC_CPU base type.
> 
> Keep the current CPU types registered in sparc_register_cpudef_type()
> as 32 or 64-bit, depending on the binary built.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sparc/cpu-qom.h |  9 ++++-----
>   target/sparc/cpu.h     |  3 +++
>   target/sparc/cpu.c     | 12 +++++++++++-
>   3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
> index 86b24a254a..d08fbd4ddc 100644
> --- a/target/sparc/cpu-qom.h
> +++ b/target/sparc/cpu-qom.h
> @@ -23,13 +23,12 @@
>   #include "hw/core/cpu.h"
>   #include "qom/object.h"
>   
> -#ifdef TARGET_SPARC64
> -#define TYPE_SPARC_CPU "sparc64-cpu"
> -#else
>   #define TYPE_SPARC_CPU "sparc-cpu"
> -#endif
> +#define TYPE_SPARC32_CPU "sparc32-cpu"
> +#define TYPE_SPARC64_CPU "sparc64-cpu"
>   
> -OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
> +OBJECT_DECLARE_CPU_TYPE(SPARC32CPU, SPARCCPUClass, SPARC32_CPU)
> +OBJECT_DECLARE_CPU_TYPE(SPARC64CPU, SPARCCPUClass, SPARC64_CPU)
>   
>   #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
>   #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 924e83b9ce..0f94e5a442 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -12,6 +12,9 @@
>   #define TARGET_DPREGS 32
>   #endif
>   
> +/* Abstract QOM SPARC CPU, not exposed to other targets */
> +OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
> +
>   /*#define EXCP_INTERRUPT 0x100*/
>   
>   /* Windowed register indexes.  */
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 1e66413e94..7d060ba488 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -934,6 +934,12 @@ static const TypeInfo sparc_cpu_types[] = {
>           .abstract       = true,
>           .class_size     = sizeof(SPARCCPUClass),
>           .class_init     = sparc_cpu_class_init,
> +    }, {
> +        .name           = TYPE_SPARC32_CPU,
> +        .parent         = TYPE_SPARC_CPU,
> +    }, {
> +        .name           = TYPE_SPARC64_CPU,
> +        .parent         = TYPE_SPARC_CPU,
>       }
>   };
>   
> @@ -950,7 +956,11 @@ static void sparc_register_cpudef_type(const struct sparc_def_t *def)
>       char *typename = sparc_cpu_type_name(def->name);
>       TypeInfo ti = {
>           .name = typename,
> -        .parent = TYPE_SPARC_CPU,
> +#ifdef TARGET_SPARC64
> +        .parent = TYPE_SPARC64_CPU,
> +#else
> +        .parent = TYPE_SPARC32_CPU,
> +#endif
>           .class_init = sparc_cpu_cpudef_class_init,
>           .class_data = (void *)def,
>       };

I do have a long-standing TODO which is to look at better separation between 32-bit 
and 64-bit SPARC, however for now:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


