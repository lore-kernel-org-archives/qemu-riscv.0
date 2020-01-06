Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioaRD-0006nN-Pf
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jan 2020 17:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1ioaRA-0006lI-DJ
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 17:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1ioaR8-0000yE-74
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 17:01:24 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1ioaR7-0000WE-Mt
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 17:01:21 -0500
Received: by mail-pg1-x541.google.com with SMTP id 6so27480391pgk.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Jan 2020 14:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eIXY5MB6DFXwDUd8nfBhLukv4Uq83GqZqYlWJpk0xAI=;
 b=UPTvqpgQIfl9fkVSraGzLtyJH6ItVx5az0MwIAp6PBBro6EVzYj/1Vh/PE9i5aF/wO
 5UhdG96xsM66sIupfy4rQMupc+62QymxM3qVaCRcoI7xv1m8z7TAyWWsYPO1NHJZ93fT
 mUSGvxiRlZe9FagiL/3PGPQBI9Zsq6Hvzm2CyJoqI6yegY+0AKLgvsTwiNdMTZjL/Cux
 HlOqLEPWONJ7DjnC/Ro4RBVLNsUzIxYIinfCE52BWFRkiqyjgkxqdea9wVTb0ToVURII
 l6EAX4g2H9n+XNKqWHLMLf2mswQAXsRXUK3En+/tJdLvIt4w9gkRpfbFJGEFIoIcjdtC
 L4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eIXY5MB6DFXwDUd8nfBhLukv4Uq83GqZqYlWJpk0xAI=;
 b=P9Jh46O8/VBaYEPw5gUI+kaarhArnAdNWKUN+N7zGtU3LRFI2NvXUYmhOZO/XXSsoF
 0Z0w/jlqSe8Kzupi1/Ad93gAq4OvS3tZwVet5Eg+llB3RANIqFQ8Gr3MfvnHH9aUV+kS
 5CTnwqF2oAGLdwmPziJieVm8Wph9bAFaLbVLO01I/vVr/XaMpCIxD+aD4aO7B9jEEUW2
 ojkvc+Q8wnBi1yTfVXCGWbbgY6fZsDp+PZaKn+ECSH+LhQqH2xEPXOc+pxFznWIi6BJh
 6y1JN7lMsO8RqAsBSzKJSbcv/KsS5nGZeL78sBwwUSI+zZxUm8JIyAI4kOwTwBQtgiwb
 Lejg==
X-Gm-Message-State: APjAAAUuUHHAAlX+LKqdJdmVffOmqOpSEpF/tY0r5QEDtKDXex67/yt9
 s/jTKtHALFCs6tuqpaB7/y2mgA==
X-Google-Smtp-Source: APXvYqyxoR4WIR8JmRtKdxPWt8naeEf++uK7y/zkpeah9zErjZTFFfSLGTYPhqUcckUnSllYLnGCFg==
X-Received: by 2002:a63:4e22:: with SMTP id
 c34mr111151422pgb.214.1578348061357; 
 Mon, 06 Jan 2020 14:01:01 -0800 (PST)
Received: from [10.17.0.74] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j10sm25558164pjb.14.2020.01.06.14.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 14:01:00 -0800 (PST)
Subject: Re: [PATCH v3 3/4] RISC-V: support vector extension csr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 richard.henderson@linaro.org, chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-4-zhiwei_liu@c-sky.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <ec0fe07a-ae3d-6502-18fa-d89547d918aa@sifive.com>
Date: Mon, 6 Jan 2020 14:00:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103033347.20909-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Mon, 06 Jan 2020 22:01:26 -0000

On 1/2/20 7:33 PM, LIU Zhiwei wrote:
> Until v0.7.1 specification, vector status is still not defined for
> mstatus.

The v0.8 spec does define a VS bit in mstatus.

> @@ -107,11 +112,6 @@ static int pmp(CPURISCVState *env, int csrno)
>   /* User Floating-Point CSRs */
>   static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> -        return -1;
> -    }
> -#endif
>       *val = riscv_cpu_get_fflags(env);
>       return 0;
>   }

This allows reads of fflags when it doesn't exist, and hence does not 
make much sense.  Instead of removing the code, you should add a check 
for the vector extension, since the vector extension requires that fcsr 
exist even if the base architecture doesn't include FP support.  Ideally 
this should use the VS bit, but if you don't have it then you can just 
check to see if the vector extension was enabled as a command line option.

While the vector spec says that fcsr must exist, it doesn't specify that 
the FP fields in fcsr are necessarily readable or writable when there is 
no FP.  It also doesn't specify whether the other FP related shadows of 
fcsr exist, like fflags.  This appears to have been left unspecified.  I 
don't think that you should be making fflags reads and writes work for a 
target with vector but without float.  I think it would make more sense 
to have fcsr behave 3 different ways depending on whether we have only 
F, only V, or both F and V.  And then we can support reads and writes of 
only the valid fields.

Jim

