Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFjq-0004HO-GF
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFjn-0004Dx-IG
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:24:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFjk-00046i-L9
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:24:35 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z4so334712wrr.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
 b=vzZJ3StsffaZE2XWFvvqf2xJqEy05bbfJRhtDaeaWq7QuAU52n/TB/ULQ8WeVNs54M
 UGk4VZfAumjAQ6YHZqLXwehiRMweE/3kJmX4Exi6/vcM0AbVsP9DyQ+kTZSyXOjSTQXE
 yltj+XKDtFQcrEjs98IbsnvIXwqtEH/TjR8pwEw8KEUkc8NYtmXPjP513FwOCCGUt9wr
 aStX5sxRH5/5TVq63meFggk5pkY4HjNNTzztQF0zM0dnsU7O4t2Ixsf6lRKnmGoibQxd
 a4FPgOEbY/12bxwaYsGxLbjms3hn+0Bpm8n2QXKQeM0XRr72OBCjWTcA7StsxwdGykZR
 MZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
 b=IyRfxlldO79JfnXzaaZmicP2NYP3yLDGW00MiHr9nqglb7XRfIMCuLGZU09vFjZ18i
 lLVSeJSVyU+wgCAumUdHbSHsbSOKWEUVWPxtsEUU7F75QzUzyrH+pqi2qIAZfHMNgYLD
 P5EPcPuU8JXUVmNVZ/oEIH8TPd6KE+Lq9X1tZ2Ao3sI/yom9jKLyDvVsDBXik0AJf9DH
 aJkJfOzRK30NLxj6OOd2I1QZBPl2Gnt1nc92rTqmaz0pjJxJsCs0pnb/RcCJiUgCOUvQ
 QS8oXi1h4s59Npt6dVJZ+vvMebky6YHmbywf+l5AxZDbU4KsOIlZiiXraB3LgczFfsRS
 rk7w==
X-Gm-Message-State: AOAM5328gZj56rU5ymQkQUo/8NjSvijuKvwA3ZQBt4/SUTbAPLrpnmq2
 f4nOMLt4Bk4Ps8diVt7iSLM5ew==
X-Google-Smtp-Source: ABdhPJzUsw/5kYywwKhFVX1rjFqmUKa3i/mI2bjH4AHQJ6YuS1HfmSJytNGtWbSvomY0u97BFeRM4Q==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr799125wrk.235.1630700671118;
 Fri, 03 Sep 2021 13:24:31 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l15sm315117wms.38.2021.09.03.13.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:24:30 -0700 (PDT)
Subject: Re: [PATCH v3 15/30] target/m68k: Restrict has_work() handler to
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
 <20210902161543.417092-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ac98aaa-ca63-0db6-87ce-a77193044dd1@linaro.org>
Date: Fri, 3 Sep 2021 22:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:24:36 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/m68k/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 66d22d11895..94b35cb4a50 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool m68k_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

