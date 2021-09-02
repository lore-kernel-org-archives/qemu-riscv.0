Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLmTD-0005Du-4f
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 09:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mLmTA-00058j-Aw
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 09:09:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mLmT8-0001jH-FT
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 09:09:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id b10so2901394wru.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
 b=XNzeVVZgMTwvaMW+hf4ZU151vXY/tds9syru115vJWY2H9xi7NvkSLiKaf12IA2hmz
 4Twf+2KjSav4TdlFitm4lyz20GrQtiikbfLSNIYfE+tALQeeymUgusxfeSVth6gQ3uX6
 S2/mAgq97r9x3T58N0MON1+gBwMJ95T3hJLwKW0v9kfgeYMkiDyBVBkCNZgt3ZDrL10V
 x+AQO8dZOJW4KNpgWEWmAkAmEqFTZQfRASG2II4Hc0vabX+EuGis/weTAS7UEXw6WjAn
 mjtM3K3OONcQPvFv6bO++KaTMt80vA00Zxrg9JxLRI505QmzbauyaXOT/enXybhA2Yea
 fEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
 b=ORxZuT7QYavnJZoiQ6MTgKVKlExtlRb13HPcEMfN4rFS6fj8t5aP+6YIHzy2q6C55j
 N82jBPz0jGfz36WsPUYcD58pT+v6L+1p5aiix3ErTQ/Wj8o3XEb8hLYJw7ILEFO0o42f
 vJ3eC5zPmOSFfRidkfmVJNzKFJJsVQZyR1QvyVG+ZCLc4qwgb0OQ+f1IzgD+AQwdPMIQ
 XGxax9yCBxt+xKsYMzsLG3pnlXmWDP6DXukueWueEXXVetJIVDl5wPQzhRMjnB4UvXH3
 tm2gwFIxIreLK+XaySPSLmdFmQvwmp8GABmaRTSEV9c3itvYkSc4Na2wN1Gyg7va7mHN
 3Q5A==
X-Gm-Message-State: AOAM531mokztu6d56qTtLZ+wfEbkVxaztPE5VBBiwRCXaQt9N1MlKNEF
 fAY4lelxXqBKAJ9ShPdRp7DB2A==
X-Google-Smtp-Source: ABdhPJw2kJqBm+YJ0W8PQQ91PAyB8vki1xITesAqGqbwujN1Yeq9boGiJSOCtAjS1XUUOw3zXsCIQg==
X-Received: by 2002:adf:8027:: with SMTP id 36mr3675503wrk.109.1630588162694; 
 Thu, 02 Sep 2021 06:09:22 -0700 (PDT)
Received: from [192.168.8.107] (61.red-176-80-253.dynamicip.rima-tde.net.
 [176.80.253.61])
 by smtp.gmail.com with ESMTPSA id f17sm1669167wmf.4.2021.09.02.06.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:09:22 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier
 <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
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
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
Date: Thu, 2 Sep 2021 15:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831121545.2874233-11-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.225,
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
X-List-Received-Date: Thu, 02 Sep 2021 13:09:28 -0000

On 8/31/21 2:15 PM, Gerd Hoffmann wrote:
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 533b29cb91b6..100add713c5d 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -103,7 +103,7 @@ void x86_cpu_set_a20(X86CPU *cpu, int a20_state)
>   
>           /* when a20 is changed, all the MMU mappings are invalid, so
>              we must flush everything */
> -        tlb_flush(cs);
> +        tcg.tlb_flush(cs);

I think this is a mistake.

(1) If tcg module is not enabled, we should be able to make a direct call.

(2) A *proper* modularization would load the target/ stuff as a module as well, at which 
point this should be a call through the PLT, not an indirect call after a couple of 
indirect pointer loads.

So IMO we want to retain the direct function call syntax in all the uses.  I think you 
want to put wrapper functions doing the indirection somewhere -- possibly tcg-module.c.


r~

