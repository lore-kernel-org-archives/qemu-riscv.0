Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG38-0004Fh-Tn
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG37-0004BL-Ss
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:44:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG34-0003YK-QZ
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:44:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so396169wrn.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KQ6VNEDT2RTSrtudl0wF85JMAcGQkDFdqJ9dexlByDI=;
 b=j0YbQMDCCUEbh8WfA/4C6tjTCZz5YVgUlnkvm7vBt137y8oCJJCgceYmnd1W45xDsj
 fH2oliFfUD9c9XqutLEe1u5GTFJ6NAM0xeLY5W7fHmz3N4JrZIxA65d+kOsL2+ohTMMZ
 pz2NWVSauNgwHAR9TfxgbMUUxFdzWPsbV7R8NCfsWMr3X1UEPkWtchjxP20wvoSCi3RN
 2F0iPe5rDeOWIgYfpiwvyG9SdVoyXltSrkbqSEyUhJSapGdh1kKfq26I6utdBnwZlpAN
 hMZ0E1VMPwkZiA/nmt6T74JUpWM/2vzkg/YXgRLLDqbAk0z+L4XVz0pmGyj5wrmMUf7O
 sEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KQ6VNEDT2RTSrtudl0wF85JMAcGQkDFdqJ9dexlByDI=;
 b=fnuOGIrxtqsPZ8AG20F98uxjaqlHHucNQFfyCVb5zJBCON/DchT6Y39qjctyTKrtYr
 xQGdSzKacZyN2kapZQ4BtaeaT3Q+b34RrhNqq6eZJ3yKlvSOuExFQkmNGjwRltnf03uy
 O3uJ/atJ/TWsV3f37QVgvJ2dPsJ28QNps1qgSb57bA6NtgV1x5YjTQK/CAAGc8ESK/gt
 8ghTI9N+CGPwMTrti5xBISfWXAYWRNb7wLTaPTAXoo1/VtC2d79N/N134aHiS4FcJ6Vp
 K8NSccvXoEdyUfLRNi3QyKtpmJFf1DROxH8GexrtVMc0vplEMucAxtnjhoYPV9ti0K0/
 MDQw==
X-Gm-Message-State: AOAM530Q3gQAXDMIvkoiOm7bWE0hRSde6BJokDRZ/eC5pRlJiQRSQQHp
 Cox7fklguon5CF98lEfUx9A09w==
X-Google-Smtp-Source: ABdhPJz3eHG2XBUgqkGosMAvUqwA6yjsJz1vhZ/AXgPH+VG7PO6AKFhg7sg0B/HYBLrKSYyiTUNh5w==
X-Received: by 2002:adf:b789:: with SMTP id s9mr857553wre.315.1630701869461;
 Fri, 03 Sep 2021 13:44:29 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c24sm280794wrb.57.2021.09.03.13.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:29 -0700 (PDT)
Subject: Re: [PATCH v3 24/30] target/rx: Restrict has_work() handler to sysemu
 and TCG
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
 <20210902161543.417092-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f0e217b-2580-49b5-5cee-61d8ab41d706@linaro.org>
Date: Fri, 3 Sep 2021 22:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 20:44:34 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/rx/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 25a4aa2976d..0d0cf6f9028 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.pc = tb->pc;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool rx_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

