Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFi1-00077X-N5
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFhw-00074m-Hs
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:22:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFht-0002a8-1n
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:22:39 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so310054wms.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
 b=COG3NPL3Vxpz88wlWI3lGdCLg/LDdsQZJexfhJnrghpwFEqcukZveIdAk/fFiP0wKB
 7HNAWQIl6rmgV04BpIshszyQzk9qq0Q2NwrgljJCneyfFgOJ0xAXKUZsaU/hrF0B0/AT
 3w+VRd6HCQDmcDCjwEVjMOfRX4d+x+Lya4wftnpVkB2KXN3pr43vNkh+vseHQcZijosS
 Q3FflSz6b5FTlNEGFg6AgPTW3cZ3FSliEWoFoIHYG+zwm5ACts2RQXEeZ5OBwv2FsHiM
 zzHD5y43SWWwvU4sjxJD/8SKKcD/qNm8NbTssviVjN3cg7xbLdiiJSNeDTXPZ9eqrqkH
 KpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
 b=b5yKUrGgh2y0pNtci7CHEq9+Ga7d3UYa8hRjNZ8qTVO62ijFuC5+qHPD1EtiskaC0o
 Yi3dPwmNJTYUKtfB5U2DWa7OTBNWMzNq+RqO8L4ytOCj1y9xxn5T7pT5+/Vvw0hg5q4G
 mGVISrDOPV7QYpr0aVBp/yELBWdnfhU26A21Ef2GGxEUC9zusqZjS+Q9JfW072tHg3u7
 bgXXSEgjtdOg4zdi3jYeOe6kF7H2vsvQFUwcnVGlmT0be8n2faXgETfEJGarhc9zdaiL
 UeoEbzVcs17s6pmKlT6Ih76/xvZ4wA9OSWekJOPTDD+vwlGIQi3OkFUlhfasUui0YqCG
 MEtg==
X-Gm-Message-State: AOAM5324RXuJ04MUEwG1WFPLrVncDSAp0MRlJxUAdUTo8jsqqWePxRWF
 CDRDngkCmH+QEfFz0B2y71nrPw==
X-Google-Smtp-Source: ABdhPJxPwO0cHTUIrMGmZMtVOl8TUayc1aTCNm++vMgNkxvRpyKHD/crU8kG261DTumMzBNsNkV5GA==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr432498wmq.178.1630700555348; 
 Fri, 03 Sep 2021 13:22:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id p13sm244311wro.8.2021.09.03.13.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:22:34 -0700 (PDT)
Subject: Re: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to
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
 <20210902161543.417092-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f644d61-92e9-2161-284b-0643edd4892b@linaro.org>
Date: Fri, 3 Sep 2021 22:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 20:22:41 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/hppa/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index e8edd189bfc..cf1f656218f 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.psw_n = (tb->flags & PSW_N) != 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool hppa_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

