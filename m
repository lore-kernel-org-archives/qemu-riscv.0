Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mahWM-0005YF-Su
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 12:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahWH-0005XX-Ch
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 12:54:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahWF-0003Aj-Kp
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 12:54:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id n11so2260271plf.4
 for <qemu-riscv@nongnu.org>; Wed, 13 Oct 2021 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MTwihn6VdL+ozLUxPgBlDNm0y1Kepq+JRx01DAi7ghY=;
 b=bjHFEEdsO6nW6YCKed33GfcAt4VhJoofAJIyMD7mnCJy9JhmPyT5iZkc6RJoTCraea
 4mNoKlt/tglz/S8NA173jbfxRSwmEDlJMtTgrmfgxJ/CJKnND8SlsKSGgIl/cJQgGKZD
 ivLiNtDBVmA4KERjTl4VSodSGDvIBqUiZNlFgTwI2bq67EvYAF14ztLkNEcTOntRLyKP
 qMoknJSLUGdZoyrCB7LwFrk/hFmJc/KSWh4eMmTHlUsSX2EOAjabUImyUYShuU5Zs4YU
 2nLyoNWkvoS+deUY3YctUrSICxRyL4CcrD/ExjMvdLikIHSnCN/9E5R5beRB6/kgrln/
 bSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MTwihn6VdL+ozLUxPgBlDNm0y1Kepq+JRx01DAi7ghY=;
 b=e3ryfEH0V69ANyDJB9i63WT3hZ6SGxNxQ55O2lMZrg7HzqO7ItfaxplGY6CBeLvCrH
 VBsM5h3dyxfo1qgJD4/y5pjCT1p6MC4SGMgpRIsRC0TVmUdvm/j5KWwDyXcdmyPb6trP
 t9K9sI/6F4g9zd9dT63teytIt9cvh5nune6w86mKmBThsA98BSLrCmAbxdThf8nWSCEK
 0TrToGsZGaX/mt9/r0Ikbl5FhIiW0giZplhnEBGMlkIMR4guLitekTUFJ4VjAe676565
 2nJimUbhYijCa4BoVtDB0bAW9xDmWa3Zpu+esHkfsxwj+i8L4tub1DHhdlnn7uSNPJEw
 Qt0Q==
X-Gm-Message-State: AOAM532hwlTEsQzyg345CZpyDihNeednCQAwmKGWBnwAY/g0g/dAAbfP
 DGQzvtd4wsLbJnIsXa2o0UnHBQ==
X-Google-Smtp-Source: ABdhPJyVHJgfmdQrRqdCzV6NCQ0YmDkP/YDS8B+ouD14kyGmsHIHvbpjRjjeBWGjWk6mQLd7cEXGTg==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr201873plr.69.1634144058129; 
 Wed, 13 Oct 2021 09:54:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o189sm61847pfd.203.2021.10.13.09.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:54:17 -0700 (PDT)
Subject: Re: [PATCH 04/13] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-5-richard.henderson@linaro.org>
 <7faa13cd-c0ed-e34e-a77a-6fedd6d01ac9@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc1e2ce3-683a-7377-dd98-366d269ffdf2@linaro.org>
Date: Wed, 13 Oct 2021 09:54:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7faa13cd-c0ed-e34e-a77a-6fedd6d01ac9@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 13 Oct 2021 16:54:21 -0000

On 10/13/21 9:46 AM, Frédéric Pétrot wrote:
> Hello,
> 
> Le 07/10/2021 à 19:47, Richard Henderson a écrit :
>> Shortly, the set of supported XL will not be just 32 and 64,
>> and representing that properly using the enumeration will be
>> imperative.
>>
>> Two places, booting and gdb, intentionally use misa_mxl_max
>> to emphasize the use of the reset value of misa.mxl, and not
>> the current cpu state.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/cpu.h            |  9 ++++++++-
>>   hw/riscv/boot.c               |  2 +-
>>   semihosting/arm-compat-semi.c |  2 +-
>>   target/riscv/cpu.c            | 24 ++++++++++++++----------
>>   target/riscv/cpu_helper.c     | 12 ++++++------
>>   target/riscv/csr.c            | 24 ++++++++++++------------
>>   target/riscv/gdbstub.c        |  2 +-
>>   target/riscv/monitor.c        |  4 ++--
>>   8 files changed, 45 insertions(+), 34 deletions(-)
> 
> 
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> @@ -522,7 +522,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>   
>>       dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
>>               ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>> -    if (riscv_cpu_is_32bit(env)) {
>> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
>>           mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>>       } else {
>>           mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> 
> I believe we miss the settings of the SXL and UXL fields that are needed
> by cpu_get_xl
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9c0753bc8b..c4a479ddd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int
> csrno,
>           mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>       } else {
>           mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> +        /* SXL and UXL fields are for now read only */
> +        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> +        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>       }
>       env->mstatus = mstatus;

Yes, I missed that.  I was relying too much on the UXL patch set which I did not 
incorporate here.  This is a good minimal addition to keep things bisectable.


r~

