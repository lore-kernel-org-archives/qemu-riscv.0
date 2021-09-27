Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUj1o-0002XS-1i
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 01:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUj1l-0002WF-Al; Mon, 27 Sep 2021 01:18:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUj1i-0008Cv-34; Mon, 27 Sep 2021 01:18:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id c21so18982672wrb.13;
 Sun, 26 Sep 2021 22:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=GfLJHrE8lTnJllaJdS7fx78x1dKWr6q4mLQX8D4X2Yk=;
 b=GkuQjS5S7C1evRe0o5RcuK4OnBTIOp/myBCRjzGej+8ee+CqgMycprnoz0u8xFCOyF
 NeglAjNbJNOEQlHsuTGcLOjDDlXYt+CXIq5cgbjvujbhUYJHU+O7oVHX95Uhxpc/4fDG
 B+wppCPdf83f3fG8Uc0st3r9CuPq3It7dap+Mctv9ViSmaHMralmEAmEW1n6RE47semt
 SeexVTA0g310S8D/hOZj8xEcTifXyfAeV9E0bFxCusVGzOg6slE0VwZUdPZzk4ogESFz
 YdPotLtShkpMRIOMykZp9k5doWYso++Y4XwMn2co/kJI+QUjxBrF7W49czQfUyzF6fVG
 wm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=GfLJHrE8lTnJllaJdS7fx78x1dKWr6q4mLQX8D4X2Yk=;
 b=WHFBSaSYPohyVFNwBgUCmf3C06hXlTFSVAZH+rcqsYIRdPHAAklImi0+hT5C6euwIk
 /LSJrRxwTIWq3idLkbZ8N1SbUiNiL2/29WQVESxGY9/V3sDUoH9U2LKpchswOU/bPVWD
 OtbaNb55HFzcjbk0Hk1eKgo/unOZWUkWNhC5nS03dtk0JFm2i7piy4ZETCdbWXFm9stN
 nUA5zK37IgUJ/tAJbTJt6RQ+M9in+mG/kvuD0Cl3UHAw69vmWcKqcAiTM3AEIeU9TrR9
 emnITqsKGmStgdWfqjCoUHAvxEooDO60UphwWWJZ2gMek230btC96rzoMEYnhslZz2Wz
 BFsA==
X-Gm-Message-State: AOAM532E69G7Fd2qsUTXtTPTLgvMtf9TFQe76tldBGkwpPWhCRURZzE6
 waFPGJWCr2nHRzV2/KTmK0o=
X-Google-Smtp-Source: ABdhPJyqpUQLPxkumugYn4WvSN11ve1oYY3Y4ChTN9H42WHiE5OqqIyP4Y96XI6kv+HoUsyd4i/dHw==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr25374473wrv.90.1632719882568; 
 Sun, 26 Sep 2021 22:18:02 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c132sm19816174wma.22.2021.09.26.22.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 22:18:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <e370af50-dab4-6801-d491-a59b8adaad2c@amsat.org>
Date: Mon, 27 Sep 2021 07:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for
 "!!foo & bar"
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Eric Blake <eblake@redhat.com>
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
 <8a997109-92cb-675b-f872-4a07dbebe861@amsat.org>
In-Reply-To: <8a997109-92cb-675b-f872-4a07dbebe861@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
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
X-List-Received-Date: Mon, 27 Sep 2021 05:18:09 -0000

On 9/27/21 06:47, Philippe Mathieu-Daudé wrote:
> On 9/27/21 04:21, Bin Meng wrote:
>> GCC seems to be strict about processing pattern like "!!for & bar".

What GCC version btw?

>> When 'bar' is not 0 or 1, it complains with -Werror=parentheses:
>>
>>   suggest parentheses around operand of ‘!’ or change ‘&’ to ‘&&’ or ‘!’ to ‘~’ [-Werror=parentheses]
>>
>> Add a () around "foo && bar", which also improves code readability.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
>>
>>  hw/dma/sifive_pdma.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
>> index b4fd40573a..b8ec7621f3 100644
>> --- a/hw/dma/sifive_pdma.c
>> +++ b/hw/dma/sifive_pdma.c
>> @@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>>      offset &= 0xfff;
>>      switch (offset) {
>>      case DMA_CONTROL:
>> -        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
>> +        claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
> 
> AFAIK in C logical NOT has precedence over bitwise AND, so IIUC
> compilers should read the current code as:
> 
>            claimed (!!s->chan[ch].control) & CONTROL_CLAIM;
> 
> meaning this patch is doing more than "improve code readability",
> this is a logical change and likely a bug fix...
> 
> BTW GCC suggestions are:
> 
>            claimed (!!s->chan[ch].control) & CONTROL_CLAIM;
> 
>            claimed (!!s->chan[ch].control) && CONTROL_CLAIM;
>>  
>>          if (!claimed && (value & CONTROL_CLAIM)) {
>>              /* reset Next* registers */
>>
> 
> 

