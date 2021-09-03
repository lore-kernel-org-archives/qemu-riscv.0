Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFeL-0001Ag-Lj
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFeH-000197-Aq
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:18:53 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFeC-0007Su-PI
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:18:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so248621wmh.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LqQ2qGQh8nV1ZvT9x+U3BKt+BXWg+vkVFqLIEGHhpMw=;
 b=V8kfIBCEJT52V1fp3BG4eEUjASX4Rx05CBYVPUwSnXcrpvu9DyPd9YLrQ1EFixujIi
 lUO2S1zkZF5PG/5VBU6Rk3aTdfu/NohdFpDaoPBTWr2+EAlAEqDrzmgPhi1sQ9/EZI5O
 sp0T10IQyhYcG2l5hY7SahzlV5/YDV007peO7QbcQiw6uki0FNbyDs+4u092DrKL854h
 BofPE+Yc042W1WfjRNZgBmoOLdNGI5J41nf004XrJoendGTO+R9LadQCXGvxwYAslhrk
 awNCuxHsEq//V4tBYb37j34Ybdls/wwtEv1je9PRsUGuN+bp2kKIvMshhTUfobepCiRM
 Cayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LqQ2qGQh8nV1ZvT9x+U3BKt+BXWg+vkVFqLIEGHhpMw=;
 b=ukcwiprQ6Eba4h0CO7w4Ogf+oxE0/xgKhPCkmDtbmFgrG8mYhhAOslcPssCOHXzy0X
 xYsIvSatF1UBdWxWdnxDD70PtcNbvtzJjYywkuTpv8L8FAXBX/lo/BKsszlTyDODxBdN
 eyJd3zLMzQ+tkOwDy2Luswe2Eq7/OUqhhPK2WfoNwoIJouj49qfFKDMygOWZ1MLvQG/7
 tWZW6C1fyRR1LO+biQKGUXPclHbmGqQOeMeOsURhomEoP2YOnl/NcsUHSxSh7MjgNFlg
 qztWUnKkungB01GOn9CNqi2C59mykuT0EElw30vhkQgafkrKNEjSNdXx6In5kud7Yj3C
 k4QQ==
X-Gm-Message-State: AOAM532Fy3HoSHWAttvOOwTviwfJUprRBLFxhcAgikfKHLpJad5J3p8y
 tmPCgFXVhLY1efzut8qZpYF8aA==
X-Google-Smtp-Source: ABdhPJw3r9Ix8xv+Nu5+AHr+Q3zSVCPcKA2sZb2hwjS2kDrQMzRlRnU83nDo49PObR1jR+RXBXRDHg==
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr498453wmc.114.1630700327288; 
 Fri, 03 Sep 2021 13:18:47 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id e3sm292523wrv.18.2021.09.03.13.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:18:46 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
Date: Fri, 3 Sep 2021 22:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:18:53 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/alpha/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 93e16a2ffb4..32cf5a2ea9f 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool alpha_cpu_has_work(CPUState *cs)

Drop CONFIG_TCG for alpha; it's always true.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

