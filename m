Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG2q-00037o-62
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2m-00030W-9D
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:44:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2j-0003Gc-GE
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:44:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so377915wrh.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
 b=y2JE2znGpCHgDzsU2I9wK0RJ8GE2JJWPW9THeKM+zR9sq8qQv438t3kOx206Jt2Fg9
 HCBj4K5J9LrMW8VCOyReTekXa1iDDwX12LjR7w51Hp6FgTpMfV7mK57QPRaKgTN+mKSM
 c4ydaiundmZ/zqYpEcQ7fTBQRpS/g1xvCPjoSorsUTdNxikH8pbFeAJIqDRqkEeBcdOc
 o6bXO2ZIp6ZGu2T9H1FE0GxSedCTSSR2B/P/X59CRLG9yK22Gt+PLAznez/m/7vmSLM1
 nNLeBSmIfDEWuEX2lL68vLI9//wt72neSXBsIxn05T13a5hBYl9JWV1zFbdtz3FU6mYb
 fpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
 b=bWh555BBM21/KJFoR0CXBEa/JPCVlHio5t+21fyunHXFWtRAtRtT198C4AuK1LpueI
 GtTo+rufg2pa/g4tBFi+dWsEBQhNWXgMcLXNdhGP3HxB9WdF6wv4s6nDFvscZVWZfmKe
 0jIojHURLrsAynR3T6EqxQ69zmPSiYpSbUF/1o7KFHVAstnZneFGVZqP4WDTUiEtfpxF
 3uyvqqobolTdVFccnSM8faEuoSDmZz1Ws+KypJ6VqO83Wvcstn22vw4YFUJPHuBBrN3n
 +hMufWihDI6zNo4b5PgRemC4bwf4QoH/pijcxtfd+X23938clIGMnAaQDaC3kfKHcJ5m
 hMbg==
X-Gm-Message-State: AOAM533SbG1DhF2hyE61YLV7yibYRcuFNE1AHU4uWxSeUvEO3U+zYblt
 O0E5fFNIyVvQQsUyapB46qTmgg==
X-Google-Smtp-Source: ABdhPJwF66mC8rAdAxTJMbRm7Tnb/TmgI1HpOm8MMDv09XxJRL4qVfHzOz4F+luA4Rwup1L4RWjtvA==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr889163wrw.390.1630701846250;
 Fri, 03 Sep 2021 13:44:06 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id h16sm264457wre.52.2021.09.03.13.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:05 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to
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
 <20210902161543.417092-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <860bd94b-89ce-3aa1-4c8b-b53e4d83b80f@linaro.org>
Date: Fri, 3 Sep 2021 22:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 20:44:12 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

