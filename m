Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVWwf-0008W8-Ti
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 06:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVWwe-0008SA-DZ
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 06:36:12 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVWwT-0003Cu-1P
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 06:36:11 -0400
Received: by mail-oi1-x231.google.com with SMTP id u22so2314236oie.5
 for <qemu-riscv@nongnu.org>; Wed, 29 Sep 2021 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=74D0ijyOzryeni2l1irFVj9koOUxhNUudc5iXqoc2MM=;
 b=GKh61Fib/Rd/XRqeo32JfJkDvt3FiZnGMjgzXuDQc3krNcisYwIyzmLRrKQWQ0z88i
 uMGKUPxW9g7077UVyB3f6V1tis77bFvWeiiUi5f01m38SAjSoPDXt02TXNnBaiYUTcjU
 3qm4NaSxg8zvbIA+RnEp+v1cIbOc4HCbdYIj+nWFF+hGn6A3+RXmKIHt9prilSinChHA
 L7Vpgem0F+3TFscAT7IWdJmDWckdAq9iQ2b3RGIOgjPTG9w1Quyg7XLjkTfaUovocsSO
 s4nYuvUceFrEQl3lNT9kki3crcSOpLPhP3im2oJQ94PmYyJTVbdRd1HGi2yz7W9Md5mX
 vDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74D0ijyOzryeni2l1irFVj9koOUxhNUudc5iXqoc2MM=;
 b=4155fW5MQx7h7edV2i3BeFU33uZyq9yHvOY9kR9CK7pjNC+q7/f+wtuWH9ztSduEMf
 rs/0Vku3CgEnKinmg8wmWESNQEV8N4sMvjM8Ej+X8WzUhRLrlTanFaTwU81V8NsAsi96
 bFM4pulj7ynfWrCPOIr6KV1d3AGBPN409o1UJo7jpwjAJAXucX1DRQppoIkaYtSFCkaz
 WtkT8L7Jk2ek3gRIH87otYlltN+VL58NRJpRqj80Pz+zDxPLsXMc2YBT5I5fzi8W9L8B
 iPgxY7pqF0gnpbBQDokyETAzjWGma8cd3sLtNZkSFxIQ3fohGCPR/j4r9yulV2+Vzqe0
 LGog==
X-Gm-Message-State: AOAM5336GuuUKqqs79p7gw8ygZG1Egz1qr7RdUDuYuyRlCw13cPTygap
 oPQbA7RCHd0vBYEenklgHI56pw==
X-Google-Smtp-Source: ABdhPJxFJaTbfKRHGpXGFOhtxmSbC/bW2lmBL6jJh8pMMApVSDXC7uM/KFgCf5Vt+BrErhTmofmp4w==
X-Received: by 2002:aca:f207:: with SMTP id q7mr7463786oih.87.1632911759185;
 Wed, 29 Sep 2021 03:35:59 -0700 (PDT)
Received: from [192.168.60.34] ([172.58.171.180])
 by smtp.gmail.com with ESMTPSA id l8sm377936oii.57.2021.09.29.03.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 03:35:57 -0700 (PDT)
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
 <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
 <20210929070944.in75jgdfwv2rd4tz@sirius.home.kraxel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75caee20-4e3d-ab04-327b-b4a1bca6eb60@linaro.org>
Date: Wed, 29 Sep 2021 06:35:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929070944.in75jgdfwv2rd4tz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Sep 2021 10:36:12 -0000

On 9/29/21 3:09 AM, Gerd Hoffmann wrote:
> TODO: Not sure whenever "check function pointer before call" or
> "function pointers to stubs" is better.  Right now the patch has both
> which clearly doesn't make sense.  Comments on that are welcome.

I guess I don't mind either way, but we do need to pick one.

> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -25,6 +25,7 @@
>   #include "exec/cpu_ldst.h"
>   #endif
>   #include "sysemu/cpu-timers.h"
> +#include "tcg/tcg-module.h"

Surely not required here.

> +/**
> + * tlb_flush:
> + * @cpu: CPU whose TLB should be flushed
> + *
> + * Flush the entire TLB for the specified CPU. Most CPU architectures
> + * allow the implementation to drop entries from the TLB at any time
> + * so this is generally safe. If more selective flushing is required
> + * use one of the other functions for efficiency.
> + */
> +void tlb_flush(CPUState *cpu);
> +
>   #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)

Going too far here, since CONFIG_USER_ONLY always uses TCG, never uses modules, and does 
not implement a softmmu tlb that requires flushing.  I think you can just change the ifdef 
to remove the CONFIG_TCG check.

Alternately, we could keep this slight inefficiency to fix...

> +
> +/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
> +void tcg_flush_softmmu_tlb(CPUState *cs)
> +{
> +#ifdef CONFIG_SOFTMMU
> +    tlb_flush(cs);
> +#endif
> +}

... this bit of silliness.


r~

