Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXjRT-0003Pr-Ig
	for mharc-qemu-riscv@gnu.org; Sun, 10 May 2020 06:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXjRS-0003PQ-0F; Sun, 10 May 2020 06:44:18 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXjRR-0001HI-54; Sun, 10 May 2020 06:44:17 -0400
Received: by mail-wm1-x343.google.com with SMTP id n5so505429wmd.0;
 Sun, 10 May 2020 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xxXonWqCVMIv8e8r2cY6NrxuihM3z3kRcazrSTkm8RA=;
 b=Hhxvu4ngq1uQsJWy0byeouIa/qmUw2lyg24hbkE9XpcSbAMSU5HfFfluJ7SjABkkNK
 3O3dpPopbQM7lUU2l+AvC3X2oGN+EEnO3boAmQENZJvAU3/MTDkUVea3vXUdZtHbrjgi
 8jSRSf2NtrO45j3eJVBKHFrPj9wN/t7uCp5zT5p/JT1Hv8YlsvyD47/HlKK+LiZiEbZN
 X7c/+SUZXfoydFGjO9c/Zw8x9X+zEfJFzRptu/cQ0nynkxaUfaCHZ1OUs+rZTjYQjgbM
 mkOsbSz46gch9r/Ego7ug8KhJmT7TcifguGVdwodDaDDgruspw9uBerdpEb6L/fPuWmS
 U40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xxXonWqCVMIv8e8r2cY6NrxuihM3z3kRcazrSTkm8RA=;
 b=p6/f2mdG3afj5HkEuHAA4b/+ixW3fLGMc29xOyfajpcK6ybEpJJhQhNeg8Vj2YGddM
 xrcCwHyJnOjCKgfEBUagyfh8vvg/VXirvfgabbBilGkvaZAg2HAdDX8qbtdb1J7WtsjA
 hnnaZznBfacjQ22J8TzLCXC9DG4CSdr6QsJBvsCRj/70wBJgRNLIVmWdqnELlmPZU0pL
 V//37uJZQrxHdKYJ3TCiQDAimrLp+c8H4Lx6KsVT/T6cMmliM66hdx6hlxuqcO1vMsjg
 n3/IZ6Y7CJhngDxYocKzMzUWV/i5uwWT/uHFmQ7mPcb+hEKw5a9DK5PjPa4WgmZO/gE5
 3OJg==
X-Gm-Message-State: AGi0PuZ37R8+Oapc+c13jUPeWHqWK6M9F2eWq5lA0l0i9U36YTKA6qzV
 8ITTW81MgCpBkc/36ZdLyPk=
X-Google-Smtp-Source: APiQypJiwnxEXhMEbmmFGHZaEt/WgZLbUwFcEBuqFqfKorCcdf78+iaRtlzsNsWdch082EqCfjiPIQ==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr25481489wmk.171.1589107453896; 
 Sun, 10 May 2020 03:44:13 -0700 (PDT)
Received: from [192.168.1.37] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id g15sm12287672wrp.96.2020.05.10.03.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2020 03:44:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 01/11] plugins: Restrict functions handling hwaddr to
 system-mode
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb0d835e-0603-9f76-836c-aca7fb9be525@amsat.org>
Date: Sun, 10 May 2020 12:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200509130910.26335-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 10 May 2020 10:44:18 -0000

On 5/9/20 3:09 PM, Philippe Mathieu-Daudé wrote:
> Restrict qemu_plugin_hwaddr_is_io() and
> qemu_plugin_hwaddr_device_offset() to system-mode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/qemu/qemu-plugin.h |  2 ++
>   plugins/api.c              | 17 ++---------------
>   2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 5502e112c8..06c271a107 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -326,6 +326,7 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
>   struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>                                                     uint64_t vaddr);
>   
> +#ifndef CONFIG_USER_ONLY
>   /*
>    * The following additional queries can be run on the hwaddr structure
>    * to return information about it. For non-IO accesses the device
> @@ -333,6 +334,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>    */
>   bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr);
>   uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
> +#endif /* CONFIG_USER_ONLY */
>   
>   typedef void
>   (*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
> diff --git a/plugins/api.c b/plugins/api.c
> index 53c8a73582..785ad2e45e 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -249,7 +249,8 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
>    * Virtual Memory queries
>    */
>   
> -#ifdef CONFIG_SOFTMMU
> +#ifndef CONFIG_USER_ONLY
> +
>   static __thread struct qemu_plugin_hwaddr hwaddr_info;
>   
>   struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
> @@ -267,26 +268,14 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>   
>       return &hwaddr_info;
>   }
> -#else
> -struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
> -                                                  uint64_t vaddr)
> -{
> -    return NULL;
> -}
> -#endif
>   
>   bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr)

Please disregard this patch, I misinterpreted the variable name with the 
hwaddr type.

>   {
> -#ifdef CONFIG_SOFTMMU
>       return hwaddr->is_io;
> -#else
> -    return false;
> -#endif
>   }
>   
>   uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
>   {
> -#ifdef CONFIG_SOFTMMU
>       if (haddr) {
>           if (!haddr->is_io) {
>               ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
> @@ -299,7 +288,6 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
>               return haddr->v.io.offset;
>           }
>       }
> -#endif
>       return 0;
>   }
>   
> @@ -308,7 +296,6 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
>    * will be. This helps the plugin dimension per-vcpu arrays.
>    */
>   
> -#ifndef CONFIG_USER_ONLY
>   static MachineState * get_ms(void)
>   {
>       return MACHINE(qdev_get_machine());
> 

