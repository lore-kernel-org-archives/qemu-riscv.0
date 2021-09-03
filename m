Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFfj-0003As-K0
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFff-00038r-IN
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:20:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFfZ-0000Gj-Tp
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:20:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id z4so322465wrr.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xsif4pme6nhSpsi7vEWmXFg/Hnrb7mhQtjIRT3kxFkM=;
 b=muTFofn/yHs0EYKIsGha4ps6z/nsFLgk7o50hQ1bBL3mlCLJN3dqh2EbQA90EnwZiK
 NECjyG+jXGItzTA4QlZoqJEuj4/2GopLUtjAu+ncqdo/FFyEUWUPbBu236/GFMudcuCK
 D9DyjDbkUkta9IAKG6+3m2r8+8jv4lYsuurqFUi0rWz/gxe73U7hLmg/mrm5hqKdTbiF
 Opmfkr9N/UDCqcJTgk0JtowcRFkQ/LeFaRp+RBrZIUFfJTbIekWq6l07SbB0VGTU8eH+
 /SKP943AfE5+gEB6opgLoUtMGZRq5vBaEZuA49fASyXmNkP+xk+3PmUF6tFbonUn2CoS
 6yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xsif4pme6nhSpsi7vEWmXFg/Hnrb7mhQtjIRT3kxFkM=;
 b=j43fCEcnVDfYP/IpILEH2tFb0yuaP0Bu7tRkaWkAy+l5dBBLxOUQ0ovVUmm5D9uAVL
 RAtZevGRbsosy6zqaUKLoA2JCknyi5Vq9yCzb8U+wrKYapq+MnOHdAb+jp0ADWVaZQv+
 xBsDSz2eqtrD7HiJX4MirEGD8PjuSvLbIFCeehytqyaJbkN5Oiz9w9JwxAHufuqCUX93
 SajA/2hyb/zupekTtWswIvxGybgMMmheCumd/XlASXKx3xJx70kJSbPF4uRzuEuslY3x
 e8jDTxFc/nKowojI3EgQWwgkwdapP5OvdMWrNTdtTA3AKVTMEKUcogBUsXn9YOktGMrr
 8Wng==
X-Gm-Message-State: AOAM533FJbHUrpxlinp33zhU+G4fLUrsFUpVMkG15jQOUC6ZbXJGk+TX
 2nNBHf1j76yvycmIHeJ3zVrZGw==
X-Google-Smtp-Source: ABdhPJxCxEUNKk9CrXrBQLK7GjqB1EVrT8+iyYBGoXf53+iVgrOG7SDx81iHjmDeuA92Igp3EWy9+w==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr825520wrm.237.1630700412182; 
 Fri, 03 Sep 2021 13:20:12 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id o8sm266012wmp.42.2021.09.03.13.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:20:11 -0700 (PDT)
Subject: Re: [PATCH v3 10/30] target/avr: Restrict has_work() handler to
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
 <20210902161543.417092-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1833210b-e250-33f5-be38-9d543539b4aa@linaro.org>
Date: Fri, 3 Sep 2021 22:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 20:20:20 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/avr/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index e9fa54c9777..6267cc6d530 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -32,6 +32,7 @@ static void avr_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc_w = value / 2; /* internally PC points to words */
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool avr_cpu_has_work(CPUState *cs)

No CONFIG_TCG or CONFIG_USER_ONLY test for avr.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

