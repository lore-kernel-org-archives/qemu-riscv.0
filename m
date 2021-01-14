Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l01AX-00063o-TF
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 06:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l01AW-00061D-IT; Thu, 14 Jan 2021 06:52:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l01AU-0000WY-Ri; Thu, 14 Jan 2021 06:52:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n16so5359594wmc.0;
 Thu, 14 Jan 2021 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MqgPIqkAUXY2OzrKxPQAIVrcHI3SXbCyS+PG4pcPNuo=;
 b=R4+L51xdrZKV3tu7SO/SEhGWFTXg05w87h3Oq3qqZOXrKw5d3OnUhSyXrDfTExaw6b
 jyzr4/RWHWweg1EtmOWSOLn6dE20+NqlkezFmMW4Lz+TiPh3RULZZ7B2AZk6Pn+BKm6u
 zq2s24TqKjIQeEpH6OflH6vlFs58GoWnQm8WyyOcKfND2VXCvxjVDTEFE0ve4w+NKy1J
 xk39EcbhObJRwLkM9G/5yP+3CdAUBvnjBnvt7FmIFmvAU+DE9oTqi2kYpLcpZf12FQda
 jflD0vuuIzPYQebHvRv1SYt6RXro1ZuObKpKQ/eX2QB8CfiabMHsmW3rIbXwkOcGSQqY
 lSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MqgPIqkAUXY2OzrKxPQAIVrcHI3SXbCyS+PG4pcPNuo=;
 b=lco+OEs1vg2U1hbd3txWFRuhKszC9UDsw85+iS2sPgEB8zyU59DUnFdUXMfd078nir
 D65xePhLWluzEp5Bedc8wi8uPj6FJDSWfWWR9LXP6WJAUFojV+yceYhnquUxf+EEo3VN
 F5MFE4WDKxTX26QpxtaqiRBJWfzqrbVczDluDwbJ9brkMoN6lZRS0Je7UVWjz+/lYT4y
 1rVtxL48mEWOn3qiYh5UXvvf0hA7lB51DrA2UMD7xA1Cjm4LZPJv5HYUHszDcYNHPHiH
 kDMlcrNIP6zXHXBAuhwu2H5qboMdOi+JyS/db8itFAAcgtwaxjwOZWoSAlynHo3An59z
 p52g==
X-Gm-Message-State: AOAM5309W/hggt1ND73Y0/2iWGeKNFnEav2iucSzZlScFUEovimN+WMD
 9+YxcbAZkfhItGIPRX3ajnc=
X-Google-Smtp-Source: ABdhPJxH2HbTsC/yRBZwh1pGR7IKaH+//zCIELiTavc8IiCICRn86sCU4op9CQGkgQAB8zTjQzMqCQ==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr3514041wmj.182.1610625116602; 
 Thu, 14 Jan 2021 03:51:56 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v189sm7906371wmg.14.2021.01.14.03.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:51:55 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 05/22] hw/sd: sd: Drop sd_crc16()
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-6-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ff05273-3c27-94e7-e9da-36e5866e8330@amsat.org>
Date: Thu, 14 Jan 2021 12:51:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201231113010.27108-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
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
X-List-Received-Date: Thu, 14 Jan 2021 11:52:01 -0000

On 12/31/20 12:29 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> commit f6fb1f9b319f ("sdcard: Correct CRC16 offset in sd_function_switch()")
> changed the 16-bit CRC to be stored at offset 64. In fact, this CRC
> calculation is completely wrong.

Yeah:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg531790.html

> From the original codes, it wants
> to calculate the CRC16 of the first 64 bytes of sd->data[], however
> passing 64 as the `width` to sd_crc16() actually counts 256 bytes
> starting from the `message` for the CRC16 calculation, which is not
> what we want.
> 
> Besides that, it seems exisitng sd_crc16() algorithm does not match
> the SD spec, which says CRC16 is the CCITT one but the calculation
> does not produce expected result. It turns out the CRC16 was never
> transfered outside the sd core,

Typos "existing", "transferred".

Well, I tried by adding tests, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg531777.html
(Series:)
https://www.mail-archive.com/qemu-devel@nongnu.org/msg531768.html

> as in sd_read_byte() we see:
> 
>     if (sd->data_offset >= 64)
>         sd->state = sd_transfer_state;
> 
> Given above reaons, let's drop it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/sd.c | 18 ------------------
>  1 file changed, 18 deletions(-)

