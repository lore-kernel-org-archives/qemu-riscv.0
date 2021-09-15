Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPF1-0000Q8-LH
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPEz-0000Ji-BP; Wed, 15 Sep 2021 03:21:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPEt-0001Zx-WC; Wed, 15 Sep 2021 03:21:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso3955146wme.4; 
 Wed, 15 Sep 2021 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t0XCTivJki9fnWZ6BB0w86GFuo4fGUBWF4o1x/Gj2FI=;
 b=Xl3Z5P1NVOhgE9NYSnyRLrwaTdisL16TapxGihVsoMc9EXL8S9uKPyTs2UoIo02f5n
 1ICNRAFoIxjXEkD/Dn4NVCi/VZ5eW37MbanUofXS0hO6VvYFHcKRVo7f+F6qRvK95uDF
 o1RHPV2rSU3ynnZguZKzsaubS4+Z/QoCdQfbzvqrSF05P9T1DQK99lzOrGy38vTOyuSa
 NjisVecVWR9A70bE692vPMl8Q/zoipGm01bCDUx54q0+WfyDCn025gYGpcj5rHOsIgHG
 QnC7pKWkvYywJ707iQBXYMglk8qOTqVrusuK9qsqFCHT0VR3qesEt0slGFPktvdNjNKW
 zCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t0XCTivJki9fnWZ6BB0w86GFuo4fGUBWF4o1x/Gj2FI=;
 b=ehvGLPpWS1t3FTROiIFoieUGDsLIHUGqmyofte+kFAuDQ0xiMd1w8sa9J/mJ9SLnx3
 84hBu9PEcLK1FH3ERK8PXU2hHxVUcnVnu6X8w7yAddRUWTPt5lnVfIL7lpfhopADzNgm
 vx/djCKM9FN2EMivtsI7cK+koQd0TIiNERD+IgkcFhhPbdopJ1k5yltPywmgx7PZ6adz
 /7yPoSVBFR0Tmo5jqVNBgfClFZiI7HwwLp4mU7pgE4SgpknYBElWvnE4Mn+h+BXBJ9dx
 ftSBNQvn4gFoZrLNnF3lJzfEvF/l4fr1cQB+lEGAuqxebFbKIqVAE+rWS2Hxf7Dpi908
 jexw==
X-Gm-Message-State: AOAM530ZkfD1cY4DYyEa2CUQlKTAsRKM+yqrHCZGSo08VNahHE3o01d+
 5grc2EK8Ge67/2tjW3VmhDs=
X-Google-Smtp-Source: ABdhPJySCkJPjHJXOLqKL2x7B/ilpWZFWdqyo0oFdr5pCjHhOi0bLBTd+SCHq7OQ1R1/Z3JlIU1oxA==
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr1030594wmq.126.1631690508964; 
 Wed, 15 Sep 2021 00:21:48 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id d70sm3410615wmd.3.2021.09.15.00.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:21:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 16/53] target/microblaze: convert to use format_state
 instead of dump_state
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-17-berrange@redhat.com>
 <21032bce-bdbb-1a0f-f5a5-71350ad79c85@amsat.org>
Message-ID: <7b38445c-5225-1d75-2b49-486af35a9e1c@amsat.org>
Date: Wed, 15 Sep 2021 09:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <21032bce-bdbb-1a0f-f5a5-71350ad79c85@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
X-List-Received-Date: Wed, 15 Sep 2021 07:21:57 -0000

On 9/15/21 9:18 AM, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  target/microblaze/cpu.c       |  2 +-
>>  target/microblaze/cpu.h       |  2 +-
>>  target/microblaze/translate.c | 45 ++++++++++++++++++-----------------
>>  3 files changed, 25 insertions(+), 24 deletions(-)
> 
>>      for (i = 0; i < 32; i++) {
>> -        qemu_fprintf(f, "r%2.2d=%08x%c",
>> -                     i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
>> +        g_string_append_printf(buf, "r%2.2d=%08x%c",
>> +                               i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
>>      }
>> -    qemu_fprintf(f, "\n");
>> +    g_string_append_printf(buf, "\n");
> 
> g_string_append_c(), otherwise:

Actually we don't need an extra newline.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>>  }
>>  
>>  void mb_tcg_init(void)
>>
> 

