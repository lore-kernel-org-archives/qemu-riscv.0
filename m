Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3ir4-0006M6-1W
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ir1-0006KZ-R9; Sun, 24 Jan 2021 12:07:11 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ir0-0005wT-6u; Sun, 24 Jan 2021 12:07:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so9256467wro.11;
 Sun, 24 Jan 2021 09:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WgSB/RhaMpWj95Shc4lYqGxRZMNEwmzfGBadriMCOiI=;
 b=Twt4I4WQ5mxc3InrmfoX9wgoF52u0PL2NJz75pRscCh+a1LxRTKAyuSm/rpR44Z5LS
 SxvuO2Tflc7q9Nps2p36BoSR8Vbfk1paF/zV2+rMa9rW57Qdept7SaOTy153QT++uwQT
 s2zl3E/qottEhbDOfpJZotyvdszTfj2X1/AjkkcZopy65KKt5DhyphoiiGm4a51pU6+J
 zzaqN+MJB6+F9l48O9XZciMKNnLcIlasUbE5NO4yr3ICWDTfq0+b2+sL7CjbDR5s8lcK
 d6h4vs4tr0V6SGWPJ8uFWK1G0QZvLhacDdD/l6SdBEOS2PfGAPfBu3IdNgj520jjcdy4
 Afnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgSB/RhaMpWj95Shc4lYqGxRZMNEwmzfGBadriMCOiI=;
 b=FfPoxCdSRRSp2+CmOAj+Nyvlsm4IMDpiTKqCpsn66+O3v/RiWg/3KcV9CbOexRactC
 H5mUshNQAkzvb8qdpe0fKhcX0XSVHCInz36fDynR+SpilhIpftKH+cghwuZBcGCA4wRn
 3ZrUe6XHLR5lGqnX4IW5pIvZk20eqq1npiLItvEA/zSm4pfA7a6uKLQYtUexwNIU3+B1
 kTLYF6wlC/3fKaKs1TmkHJ8xUZqLh7NMvfefyjerJ6CjLWUwik4XfnSX4VGLEQcDKSUE
 xGi6lwD77ePbsEMN3hLJ4dI5ibilHJyiauTwW6bpWsJ0K7fWX8xeY9N3goDjcGZKqN8H
 vaxA==
X-Gm-Message-State: AOAM533lk0hKJ5exgs0qsLXBqNdNc2U5ZpiTPMBjH13XFXfGXXA2ANU8
 S15PYcQ/xL5TS1VNcJuP5XI=
X-Google-Smtp-Source: ABdhPJzLHes4UJj+x6LnEcmyFddivrAn0T+eKZ9lgVevgn7Z7tRDEC5WGgNnGvV/272P6vYBQ2hosA==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr10156126wrm.402.1611508028060; 
 Sun, 24 Jan 2021 09:07:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o14sm19336469wri.48.2021.01.24.09.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:07:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 18/25] hw/sd: ssi-sd: Bump up version ids of
 VMStateDescription
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-19-bmeng.cn@gmail.com>
 <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
Message-ID: <c4fa8c2e-4243-8fdf-219a-41312c8a0298@amsat.org>
Date: Sun, 24 Jan 2021 18:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Sun, 24 Jan 2021 17:07:12 -0000

On 1/24/21 5:59 PM, Philippe Mathieu-Daudé wrote:
> On 1/23/21 11:40 AM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> With all these fixes and improvements, there is no way for the
>> VMStateDescription to keep backward compatibility. We will have
>> to bump up version ids.
> 
> Unfortunately this breaks bisectability (think about downstream
> distributions cherry-picking patches individually).
> 
> I don't think there is a problem increasing 2 -> 3 -> 4 -> 5
> (Cc'ed David in case). Could you respin increasing the version
> on each VMState change?
> 
>>
>> The s->mode check in the post_load() hook is also updated.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v2:
>> - new patch: bump up version ids of VMStateDescription
>>
>>  hw/sd/ssi-sd.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
>> index ee4fbc3dfe..0c507f3ec5 100644
>> --- a/hw/sd/ssi-sd.c
>> +++ b/hw/sd/ssi-sd.c
>> @@ -4,6 +4,11 @@
>>   * Copyright (c) 2007-2009 CodeSourcery.
>>   * Written by Paul Brook
>>   *
>> + * Copyright (c) 2021 Wind River Systems, Inc.
>> + * Improved by Bin Meng <bin.meng@windriver.com>
>> + *
>> + * Validated with U-Boot v2021.01 and Linux v5.10 mmc_spi driver
>> + *
>>   * This code is licensed under the GNU GPL v2.
>>   *
>>   * Contributions after 2012-01-13 are licensed under the terms of the
>> @@ -319,7 +324,7 @@ static int ssi_sd_post_load(void *opaque, int version_id)
>>  {
>>      ssi_sd_state *s = (ssi_sd_state *)opaque;
>>  
>> -    if (s->mode > SSI_SD_DATA_READ) {
>> +    if (s->mode > SSI_SD_SKIP_CRC16) {

Doesn't this belong to patch #16 "Support single block write"?

>>          return -EINVAL;
>>      }
>>      if (s->mode == SSI_SD_CMDARG &&
>> @@ -337,8 +342,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
>>  
>>  static const VMStateDescription vmstate_ssi_sd = {
>>      .name = "ssi_sd",
>> -    .version_id = 2,
>> -    .minimum_version_id = 2,
>> +    .version_id = 3,
>> +    .minimum_version_id = 3,
>>      .post_load = ssi_sd_post_load,
>>      .fields = (VMStateField []) {
>>          VMSTATE_UINT32(mode, ssi_sd_state),
>>
> 

