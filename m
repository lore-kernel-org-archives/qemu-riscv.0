Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D6EC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 23:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxC4g-0006Vv-4X; Thu, 20 Aug 2026 19:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxC4c-0006Ta-BQ
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 19:21:26 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxC4Z-0008F0-Om
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 19:21:26 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38dfe910e9dso379629a91.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787268082; x=1787872882; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tgrl9FGsBX2gHKWmEW2wbhUIJuCCqzVLGOz8ZAg0z+8=;
 b=D8UVtkO4BbC0wRaU+reNVZX+PzbeARZ3y65oDGrWGz+5rtgWzz6BueQkuyMEEVEGP4
 SQcupYbwQTxmabVpCXZaHTJJBNWMwsMoZ3XdzMLiiCY3fJDmWdaW7DBsRXh/Ka3KZVRt
 Vl/jXJEmXOwlfCnZPT+83SWGv4Gg8vtbDYckYp5zxl4JP5SpUeizwQxZqSKP2ZN2Ogb/
 05eo2ZLiZ8TSD068M69hCFuE+iHL4j0bPefMhfUVl5DMvS1c4keug12ycAmEE65WSB5u
 24RoKN4Q6gVktBm3vC4SqCEuUUcwgk5VzY/NcbvcOUJnXSIbqlRX2DYSExYhQZ/b/sAt
 ppgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787268082; x=1787872882;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tgrl9FGsBX2gHKWmEW2wbhUIJuCCqzVLGOz8ZAg0z+8=;
 b=G1olmchHSktkQl3FsNygOvKHmxy536iRgDm0w0D5RVjpH9u/D54IrhJldhc1BNBl96
 NFz9AfuBgeMkHv2SwsDz6H60XRqePc4LXoqrlTFbLPQxv3/ygDPWQC4lRCpb+15dUKVm
 jAgTZJvm+aX41q43OhENMfUei5giHHYLetkX231cWZchEeCrSLzIQuMp6paoxo5xBnGv
 APzZaE8/iDz2xE7a5Dve1WI1mqrDuFVPRgGDF8bCGPJHIL1nFfYw1H9wclg7lUhqX1ax
 064gxdp1wB0vUy/tVWFlw1iYFV6y5eAuHI1TsKR4JzI/YR3+KTnxgR5DbKpZUloIv1q1
 zoig==
X-Gm-Message-State: AFuF++nQ7az2NpgZPhXkcKFKBf2Z+BMBz5Yf2Jpj8BzDywbquj8Htew1
 FSLjf9oP2r9F5M2DZbMfJnEuMBPxbmO32ouzpWChnpbq4eoovKin/Stv4CEnmCgWNbJC84DECcr
 H3/5X
X-Gm-Gg: AR+sD13y4VA0mIJY8mSL6vd8bwANSCM1asaqbt7lJ4+aBqZWh+8iUS0qNkqM/N1h1ht
 x6M0qWtwbK96QaCV6BjF0TyFodwqsAx6lJYbD8rQvUxhoc+mR4WR39pQQNEh9RxA75WG9da/kjE
 BT+As+lFsgVqKblRMbup1uDi71uwJaTDn4PAwXAKEGDWJC9PyiYWMTM7vNopI0+W6qzSi3Z2+g+
 53htAtyCRd4ur2pnk6783pF0k33R7OGFFtudqU08JnP9bDlBjGD7qdfemF6Y7PEWfk8ptpgBNFN
 /OrNWWKxxQh51vfENmrwVDij9Dr6EdHeO/jnz81rMPt57VorBv94F10b5qQ7NH+PbtP0SD+FBgG
 Cxfuc9pj3sabbxRoQd95G6lpCwhlVtmnDERlVLBVSkEejimKO6/lLh1rpro2aBy1kTiFcMTv638
 jkXQ+l1+T5596fgeYuLT/sBWmjjLJ5LmZjN/O8hzv8T1BYj9TmJZx6JROztmnt1Pjp49lBygEsE
 7F26yOCUtT3Hhc=
X-Received: by 2002:a17:90b:1b04:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-395c33406e0mr3024274a91.2.1787268082091; 
 Thu, 20 Aug 2026 16:21:22 -0700 (PDT)
Received: from [172.20.6.151] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4b635d4sm623899a91.15.2026.08.20.16.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 16:21:21 -0700 (PDT)
Message-ID: <dc581081-a65e-4946-8aac-c80085b81e80@linaro.org>
Date: Thu, 20 Aug 2026 16:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] linux-user: Uncast void pointer argument as
 Object in target_cpu_free()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Helge Deller <deller@gmx.de>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
 <20260820201356.29775-13-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260820201356.29775-13-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 8/20/26 13:13, Philippe Mathieu-Daudé wrote:
> init_main_thread() is registered as Object::free() hook, thus
> take an Object* argument. Uncast the void pointer as such.
> 
> While now cpu_env() accept any pointer type, next commit will
> restrict it to CPUState* type. QOM-cast the Object to CPU type,
> otherwise we will get:
> 
>    ../linux-user/i386/cpu_loop.c: In function ‘target_cpu_free’:
>    include/hw/core/cpu.h:604:31: error: ‘_Generic’ selector of type ‘void’ is not compatible with any association
> ../linux-user/x86_64/../i386/cpu_loop.c:331:19: note: in expansion of macro ‘cpu_env’
>    331 |     target_munmap(cpu_env(obj)->gdt.base,
>        |                   ^~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   linux-user/i386/cpu_loop.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index fe922fceb5a..a0790f3f352 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -326,9 +326,10 @@ void cpu_loop(CPUX86State *env)
>       }
>   }
>   
> -static void target_cpu_free(void *obj)
> +static void target_cpu_free(void *ptr)
>   {
> -    target_munmap(cpu_env(obj)->gdt.base,
> +    Object *obj = ptr;
> +    target_munmap(cpu_env(CPU(obj))->gdt.base,

If you're going to have any dynamic cast, you might as well use

    X86_CPU(obj)->env.gdt.base.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

