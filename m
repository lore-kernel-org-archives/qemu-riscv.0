Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFkr-0005Qn-70
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFkp-0005L7-5c
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:25:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFkn-00053K-G3
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:25:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id u16so342902wrn.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W7k4RtqOZy7ya1WayabP+HxNcp5Fq3Mk2ZbTc+R+8wk=;
 b=Y7PtSwX3LA3cO29hKgEQ0rkI844j3EG/DnwVbuMutIDQuUE90Uvns4x6mk4yf7B+cm
 Z6Ehutu4130di1yQJkVCvyamcRHY9V7H8+/nW9cFA4cQP7R4+86sspF6SjVkmgr6mnbK
 taRoXaEV9tG9Hfk01UC455nNMEqk+FHQaJULcihgVHUwNroTfGeteSjAaIcGVZ3lfe7k
 vWQNvEvJXomiaKpwJ4tHqL+1JgHxOaDk5BcG2O5Ba51DpymToNVYzbCqx9P90GXzyM8j
 2b3ZUyaRty9XmOwlTzWm7qEP3nm+1Lkh4CwG0qqunwT4jbB+PrEQJvI5TjsNGJMxJsoD
 DntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W7k4RtqOZy7ya1WayabP+HxNcp5Fq3Mk2ZbTc+R+8wk=;
 b=fVXu26wrhxW7+7EL361+57LDJJxzgEJYac0wygiXPEvL2bbdWoQnMoPzNw962CV2mA
 3izSZnzQsAFQ3retrjfiFVu24kMOpq+Be7F0xtVUDrkrsM4ghZSDqyzKX0vD7jDBqUxc
 kVCLPW8CEEJifeU7fY9IYYs1PC2zhgpBz+mwPN1IEh6UHKh2pNVQ3oG+rJO8MBraKP51
 ucvd+Grkyqw9PLDfEzuwMn6gJmXBlPgu8RweKggLjvYAq+NrDJxMnK2SoISSEFPdFeh+
 +yialFB94VguOrZo3boQL3sad9eISs4CZzw4MJsX0PlnBjCVjYhT/C4fgbmCqmQxkfhp
 KDCQ==
X-Gm-Message-State: AOAM533rtDtPLmbL+LeDh8GtXSKbPxSp2zB7SZHuNQik9wSHMrtAFAa9
 VUaUC1Gc8Zl+B/V5u9OzWC+W3g==
X-Google-Smtp-Source: ABdhPJy/o6kXb1fKJrZGJ7NA/+HnxHPvtkph89J5ZY0ajIZpI/IL3HlrDNTpZbKsJbsJhN5+OKI2UQ==
X-Received: by 2002:adf:d239:: with SMTP id k25mr830865wrh.314.1630700735383; 
 Fri, 03 Sep 2021 13:25:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id q13sm324320wmj.46.2021.09.03.13.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:25:35 -0700 (PDT)
Subject: Re: [PATCH v3 16/30] target/microblaze: Restrict has_work() handler
 to sysemu and TCG
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
 <20210902161543.417092-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acaab338-bc0c-3c06-37ea-dee2ba753900@linaro.org>
Date: Fri, 3 Sep 2021 22:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 20:25:39 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/microblaze/cpu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 15db277925f..74fbb5d201a 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -92,12 +92,15 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +
> +#ifdef CONFIG_TCG
>   static bool mb_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

