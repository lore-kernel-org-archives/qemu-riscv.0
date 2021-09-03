Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFtZ-0001DZ-Mh
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMFtW-000176-Ct; Fri, 03 Sep 2021 16:34:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMFtT-0003lq-S3; Fri, 03 Sep 2021 16:34:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i6so382572wrv.2;
 Fri, 03 Sep 2021 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LFeEcrxPmiQ0y9mkjFms4J4GrCvxgbbAZyrEPk3foT8=;
 b=blhwVscSGxsnvMX9mpwF1WKnN0xyca3wo+jPJrvx7iJfDyuaVBJ0KE2ZZYoLwyB4Qb
 4ovLs/5Mxxmi9wMRp2vY8kz61AoNMdOvCCJQ1ezWt/9nx9cQ0hjn+MeBnxsE8IfF+HWm
 MRXjSCyRODB4tHb2j9tg9SRHAw9DJhbv0/cKEArMyfVM1qOCRF3s4YzT2Dln7MMoqaZq
 y6iKsF7H+hxlB36Mu4fKWpUJ5EAdcOvfMVCI3XguqcRlT/JRvp5sK6I5Rgfg+ycwLNfj
 b/WnJWkRX3vTttRdmBA7xpv8BARViFg/xzi1CERUqrSWq87BIGBc2CT5TLVm4/NdQPul
 vUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LFeEcrxPmiQ0y9mkjFms4J4GrCvxgbbAZyrEPk3foT8=;
 b=WuBxyYGqYvNu9FKdFW8Cl3b7cNAAtZRjYlK0OxOfPiztQGuF+o5MU3zs9PPU8dF8MQ
 5GOdztQTuqTjckWLrEFevQmtrlLdDX6qECKKMQtrgWg4VFTslnlMr1OJK2mWTDhX29wa
 8SnLSMWZ+riMm6+S1jfKpU7i8KNZMgud/uf6XERrw+q9uE+EsecFz0saeUhQXb2hZCdT
 gzYfrT8P8BZwm87c9Y2dr+FLYr9qhhzThFvUbm+WripdYpySvkS2L7JO3gkYvKZ+LDVy
 URGq1RKoATlVk0Nbe+rt6cDOEeAVZ4egw8ezvgt6ksMNhJJ7lbmhpDug1WTDPYBL+LKl
 pP7w==
X-Gm-Message-State: AOAM532eRLKTqLcHCGfbR3UqHqdh/yaOwWHn1l8VqQJ0rEFQ+jAwzfYT
 Ez7+z8nkt8hPqhSUi0Es3n0=
X-Google-Smtp-Source: ABdhPJzlEMbpTMPYknNobW93n1KQ+VYIJEKgvJhtzWFM57YHy480w/4A7Y7tiGaFvSIUZksLBnn7iw==
X-Received: by 2002:adf:804a:: with SMTP id 68mr886849wrk.236.1630701273190;
 Fri, 03 Sep 2021 13:34:33 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d7sm258631wrs.39.2021.09.03.13.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:34:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
 sysemu and TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-9-f4bug@amsat.org>
 <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <740a2e5c-3dad-fc7d-b54a-0c405faa605e@amsat.org>
Date: Fri, 3 Sep 2021 22:34:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:34:40 -0000

On 9/3/21 10:18 PM, Richard Henderson wrote:
> On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
>> Restrict has_work() to TCG sysemu.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/alpha/cpu.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index 93e16a2ffb4..32cf5a2ea9f 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
>>       cpu->env.pc = value;
>>   }
>>   +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>   static bool alpha_cpu_has_work(CPUState *cs)
> 
> Drop CONFIG_TCG for alpha; it's always true.

What is the rational? "Old" architectures (with no active /
official hw development) are unlikely to add hardware
acceleration, so TCG is the single one possible? Thus no
need to clutter the code with obvious #ifdef'ry?

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

