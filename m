Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jIW-0007Uf-HI
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jIL-0007Ss-HC; Sun, 24 Jan 2021 12:35:33 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jIF-0007rU-Ds; Sun, 24 Jan 2021 12:35:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id c12so9979804wrc.7;
 Sun, 24 Jan 2021 09:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zk71useDfaCqfBzGO/E0fduFTINySoq+2DjoNbHHI2s=;
 b=BU2OUIE0ESSfwQMaT+7wZijK18uaXCqL8cxgLHNFEluV20UWjuJc8YU+8eyb1Jwkpw
 xJIp+lg+nY1C+PQckdB1gQn6JpjUfMqk0JEsE3xfqWGjNlLseLzsnj/VszlUDcKXJow9
 QHsE6lVQ4WmGpSM1teTp4DrVNg+0gofBMv+9njnFJMPKj0hgSX/ZP+kMaZ1lTc1utR9k
 Jn2l0qXhkOffDW0JJrKDozW3iE4ejcguketBPuLdt3D2ldzekzvKPMR3pNqe25uwmOTN
 hDb27gfKCkyzz1ntYzcProb/+izid5ncGruyXTYjlLRIY1nrtiAM/zS0xzy1zQo8df/t
 u9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zk71useDfaCqfBzGO/E0fduFTINySoq+2DjoNbHHI2s=;
 b=CjUHGS+HRnBI/bcOvORSjZpbRW8KXGGZNm8Fwf+9nqEF/1LFl/xL8v1URe536jMrTp
 V9iewLUyKoOPN74Gi7eiuXjg739BnyDss6rEPlprdi1QdqcfbbOQqB6Cqo4gSShAKXLx
 YBRhVMyWCy/GlW2CU2UHRGCzPBZCjUaOc/4MhPGC7Bj+lciMWgplGiHuF0lOp2/eDMFf
 JgOt+kVkUDC2ARJl2RHPrYPfRvyNNAcz3oT8DSV+DoQW9/4nU8q2Q+mdyXxvJ+sU2Z2U
 24WDw7O2zohz1XuBH3kt0CWK5SKawmfRwaw/FoKJ4VZDNaZVMTsavMAXXNdnuhEMlXDI
 rfYg==
X-Gm-Message-State: AOAM533cCYSAE6bbXGlrH+LgXIIsy6uBxmuyLavMU43ymy4dF/AVPAeR
 SC+dEOM+tAS03qjbJaeeEsw=
X-Google-Smtp-Source: ABdhPJyIwLtawAggZ0IEjGouqCmjYRD3DG+xQZJq4cYo5mf2dqUIhjmCsbzkrtEPPJfZAdtmt1mdFw==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr4466626wri.77.1611509717350; 
 Sun, 24 Jan 2021 09:35:17 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i59sm21726852wri.3.2021.01.24.09.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:35:16 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 09/25] hw/sd: ssi-sd: Fix the wrong command index for
 STOP_TRANSMISSION
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-10-bmeng.cn@gmail.com>
 <13bab35c-4e0a-e92a-24a5-558f33087061@amsat.org>
Message-ID: <568c2602-35ba-529b-605b-49384dbd76e6@amsat.org>
Date: Sun, 24 Jan 2021 18:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <13bab35c-4e0a-e92a-24a5-558f33087061@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 17:35:34 -0000

On 1/24/21 6:33 PM, Philippe Mathieu-Daudé wrote:
> On 1/23/21 11:40 AM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> This fixes the wrong command index for STOP_TRANSMISSION, the
>> required command to interrupt the multiple block read command,
>> in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).
>>
>> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v2:
>> - Make this fix a separate patch from the CMD18 support
>>
>>  hw/sd/ssi-sd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
>> index 5763afeba0..9e2f13374a 100644
>> --- a/hw/sd/ssi-sd.c
>> +++ b/hw/sd/ssi-sd.c
>> @@ -83,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>>      ssi_sd_state *s = SSI_SD(dev);
>>  
>>      /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
>> -    if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
>> +    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
> 
> Patch is correct,

Forgot to amend:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> but I wonder if we couldn't improve using instead:
> 
>      if (s->mode == SSI_SD_DATA_READ && ((val & 0x3f) == 12)) {
> 
>>          s->mode = SSI_SD_CMD;
>>          /* There must be at least one byte delay before the card responds.  */
>>          s->stopping = 1;
>>
> 

