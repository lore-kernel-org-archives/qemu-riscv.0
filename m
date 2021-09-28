Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVCZ7-0005rW-FF
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 08:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVCYx-0005pi-3M
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 08:50:27 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVCYv-0000g2-Em
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 08:50:22 -0400
Received: by mail-qk1-x735.google.com with SMTP id p4so40567637qki.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Sep 2021 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
 b=QQ9nWeMK37xStcubx5e+t+SHBrmDrrKwfBTLAsALjR6DY5Ovu9JPPhirBPbfifK8fz
 NHDuAztWuYHEbVLtW62c2/+6COPAbNLeIIFH7l1YGntdchiD35RnsvDK7QvzqB19/6Ho
 L/GnECrVa8nyNWWAL6ffkYgS5FlMPrQdMWvgu2/MjfixA168PPKiIiqvKxj+GgY13Wh1
 DZzKBLmYWPyg03+zV3l9xfTKS7iR+eOq4fyYW1W8OGSotD/lJop0+GgutXAgLBUy+aCJ
 N8a1OQ475pkuEYpyHmYfIcvOlJcuWaKGaG2Qlek2ioKu9Ur433jNIJ8yRAljI8bBDxJt
 ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
 b=Tn36Rv4nLqiOKWTSc5yKLsVoJNqfv+l/pW3apIsPT6gSDqGBbRilbm1OtYgHOKX9FS
 ZXAwcQYaE8GFlXZwdEqr0KOIJQZhUODYZQdzAazxt+w46B1jqhDgqrduO9OALvZ2dW4V
 iVoVOQd7OqUhrqR6wYw8SgWNYwuVLLfWwvAioWLq+vOUa9g4leazqKbCN0+khwAoCRN9
 KJFZjz1447AI+kyyxv4EPJBGUDsYJmrdeypR5MOhED7Gd98q6G9dM7//Tvg1s6LJRmFG
 zl46LaD4IWbqeQ00LvXTduST17fdxo48mhzJCA98Eibk6vRsh/1upBRoyuCLa23vEXAN
 P7Pg==
X-Gm-Message-State: AOAM531/PWn0cEQMMZhEDOPTeeN3ycOSfi2vs2gxZmhnmAsNQ0YJIip2
 WLdTm9Jt0/Z6ixIQjeN6UiN7uw==
X-Google-Smtp-Source: ABdhPJxwCmNVP4ejlJqyMRRsFa/BQaGuBqPrVm4WaB55TO71/7vz+lXnPtevUz/ZWeoo6QPQ0hWAgw==
X-Received: by 2002:a37:8085:: with SMTP id b127mr4957268qkd.449.1632833419774; 
 Tue, 28 Sep 2021 05:50:19 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id y22sm14358443qkp.9.2021.09.28.05.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 05:50:19 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
 <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
 <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
Date: Tue, 28 Sep 2021 08:50:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Sep 2021 12:50:29 -0000

On 9/28/21 7:32 AM, Gerd Hoffmann wrote:
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 608d768a4371..72e4e3b5bb89 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -160,7 +160,9 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr);
>    * so this is generally safe. If more selective flushing is required
>    * use one of the other functions for efficiency.
>    */
> +#ifdef TCG_DIRECT_CALL
>   void tlb_flush(CPUState *cpu);
> +#endif

I'm pretty sure you can drop these ifdefs.  Just because there's a regular declaration for 
a function doesn't mean a subsequent inline definition does not apply.

And even if that didn't work, I'd be willing to trade inline expansion for not adding lots 
of ifdefs...

> +static inline void tlb_flush(CPUState *cpu)
> +{
> +    tcg.tlb_flush(cpu);
> +}

... these could just as well be out-of-line.


r~

